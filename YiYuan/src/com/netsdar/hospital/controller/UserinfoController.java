package com.netsdar.hospital.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jodd.util.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.netsdar.hospital.entity.YYRoleinfo;
import com.netsdar.hospital.entity.YYUserinfo;
import com.netsdar.hospital.service.RoleinfoServiceI;
import com.netsdar.hospital.service.UserRoleServiceI;
import com.netsdar.hospital.service.UserinfoServiceI;

@Controller
@RequestMapping("/userinfoController")
public class UserinfoController {

	@Autowired
	private UserinfoServiceI  userinfoServiceI;
	@Autowired
	private RoleinfoServiceI roleinfoServiceI;
	@Autowired
	private UserRoleServiceI userroleServiceI;
	@RequestMapping("/datagrid")
	public @ResponseBody JSONObject dictList(String searchtext, String draw, String start, String length, HttpServletRequest request){
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
		JSONObject jsonObject = new JSONObject(true);
		JSONArray jsonArray = new JSONArray();
		
		String order=request.getParameter("order[0][column]");
		String dir=request.getParameter("order[0][dir]");
		String orderColumn = request.getParameter("columns["+order+"][data]");
		map.put("searchtext", URLDecoder.decode(searchtext, "utf-8").trim());
		map.put("dir", dir);
		map.put("orderColumn", orderColumn);

		List<YYUserinfo> resultMap = new ArrayList<YYUserinfo>();// 结果集变量

		//obtain the order params {order: column number; dir: desc/asc;  orderColumn: column name
		
		if(Integer.valueOf(length) != -1){
			int page=0;
			int row= Integer.valueOf(length == null ? "10":length);
			if (null!=start && null!=length) {
				page = Integer.valueOf(start) / Integer.valueOf(length) + 1;
			} else {
				page = 1;
				row = 10;
			}
			PageHelper.startPage(page, row);
			resultMap = userinfoServiceI.getList(map);
		    Page pageInfo = (Page) resultMap;
	        jsonObject.put("recordsTotal", pageInfo.getTotal());
	        jsonObject.put("recordsFiltered",pageInfo.getTotal());
	        
		}
		
			
		
	
		for (YYUserinfo temp : resultMap) {
			JSONObject info = new JSONObject();
			// 放入页面需要展示的值
			List<YYRoleinfo> roles =roleinfoServiceI.selectByUserId(temp.getId());
			HashSet<String> set = new HashSet<String>();
			for(int i=0;i<roles.size();i++){
				set.add(roles.get(i).getRolename());
			}
			
			info.put("id", temp.getId()== null ? "" : temp.getId());
			info.put("loginname", temp.getLoginname() == null ? "" : temp.getLoginname());
			info.put("username", temp.getUsername() == null ? "" : temp.getUsername());
			info.put("roles", set.toString());
			jsonArray.add(info);
		}
		jsonObject.put("data", jsonArray);
		return jsonObject;
		
		
	}
	
	@RequestMapping("/toAddPage")
	public String toAddPage(Model model) {
		List<YYRoleinfo> rolelist  = new ArrayList<YYRoleinfo>();// 结果集变量
		rolelist = roleinfoServiceI.getListRoleinfo(null);
	
		model.addAttribute("rolelist", rolelist);
		return "system/addyhgl";

	}
	
	@RequestMapping("/addElement")
	public @ResponseBody JSONObject addElement(YYUserinfo yyUserinfo,HttpServletRequest request){
		String roleids = request.getParameter("roleids");
		JSONObject jsonObject = new JSONObject(true);
	//	dictServiceI.addElement(mmDict);
		//添加用户
		yyUserinfo.setUserinfotemp7("1");
		int state = userinfoServiceI.addElement(yyUserinfo);
		
		//添加用户角色中间表
		YYUserinfo userinfo = userinfoServiceI.selectByLoginname(yyUserinfo.getLoginname());
		int userid=userinfo.getId();
		HashMap<String,Object> map = new HashMap<String, Object>();
		if(roleids!=null && roleids != ""){
			String[] roleid = roleids.split(",");
			for(int i=0;i<roleid.length;i++){
				map.put("roleId",roleid[i] );
				map.put("userId",userid );
				userroleServiceI.insertByMap(map);
			}
		}
		if(state != 0){
			jsonObject.put("success", true);
			jsonObject.put("msg", "添加成功");
		}
		else{
			jsonObject.put("msg", "添加失败");
		}
		
		return jsonObject;
		
		
	}
	
	@RequestMapping("/deleteuser")
	public @ResponseBody JSONObject deleteuser(int id){
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
		JSONObject jsonObject = new JSONObject(true);
		int deletestate = userinfoServiceI.UpdateTemp7ById(id);
		if(deletestate!=0){
			jsonObject.put("success", true);
			jsonObject.put("msg", "删除成功");
		}
		else{
			jsonObject.put("msg", "删除失败");
		}
		
		return jsonObject;
		}
	
	@RequestMapping("/toEditPage")
	public String toEditPage(Model model, int id) {
		List<YYRoleinfo> rolelist  = new ArrayList<YYRoleinfo>();// 结果集变量
		rolelist = roleinfoServiceI.getListRoleinfo(null);
		YYUserinfo userinfo = userinfoServiceI.selectByPrimaryKey(id);
		model.addAttribute("user", userinfo);
		model.addAttribute("roleid", id);
		return "system/edityhgl";

	}
	
	
	@RequestMapping("/editElement")
	public @ResponseBody JSONObject editElement(YYUserinfo yyUserinfo,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		
		int state = userinfoServiceI.editElement(yyUserinfo);
		int userId=yyUserinfo.getId();
		//添加用户角色中间表
		String roles = request.getParameter("roleids");
		//更新前先删除
		userroleServiceI.deleteByUserId(userId);
		if(roles!=null && roles != ""){
			userroleServiceI.deleteByUserId(userId);
			String[] roleArray = roles.split(",");
			for(int i=0;i<roleArray.length;i++){
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("roleId", roleArray[i]);
				map.put("userId", userId);
				userroleServiceI.insertByMap(map);
			}
		}
		if(state!=0){
			jsonObject.put("success", true);
			jsonObject.put("msg", "修改成功");
		}
		else{
			jsonObject.put("msg", "修改失败");
		}
		
		return jsonObject;
		
	
	}
	
	/*
	 * 验证唯一性
	 */
	@RequestMapping("/verify")
	public @ResponseBody JSONObject verify(String name) {
		JSONObject jsonObject = new JSONObject(true);
		YYUserinfo userByName = userinfoServiceI.selectByLoginname(name);
		if (userByName != null) {
			jsonObject.put("msg", "用户名已存在！");
			jsonObject.put("success", true);
			jsonObject.put("username", name);
		}
		return jsonObject;
	}
		
	
}
