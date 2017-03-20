package com.netsdar.hospital.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.netsdar.hospital.entity.YYOrginfo;
import com.netsdar.hospital.entity.YYUserinfo;
import com.netsdar.hospital.service.OrgServiceI;
import com.netsdar.hospital.service.UserinfoServiceI;

@Controller
@RequestMapping("/renYuanDaController")
public class RenYuanDaController {


	@Autowired
	private OrgServiceI  orgServiceI;
	@Autowired
	private UserinfoServiceI userinfoServiceI;
	
	@RequestMapping("/orgList")
	public @ResponseBody JSONObject orgList(HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		
		List<YYOrginfo> resultMap = new ArrayList<YYOrginfo>();// 结果集变量
		resultMap=orgServiceI.selectAll();
		
		jsonObject.put("data", resultMap);
		return jsonObject;
		
		
	}

	//跳转到 组织结构-岗位 一级
	@RequestMapping("/listByPid")
	public String listByPid(Model model, int id) {
		List<YYOrginfo> resultMap = new ArrayList<YYOrginfo>();// 结果集变量
		resultMap=orgServiceI.selectOrgListByPid(id);
		YYOrginfo parentOrg=orgServiceI.selectByPrimaryKey(id);
		
		//首先查岗位下的职务
		//根据职务查对应的人
		//将职务信息、人员信息，返回到页面
		List<YYUserinfo> users = userinfoServiceI.GetUsersByOrgid(id);
		ArrayList<YYUserinfo> zuzhangs = new ArrayList<YYUserinfo>();
		ArrayList<YYUserinfo> fuzuzhangs = new ArrayList<YYUserinfo>();
		for(int i =0;i<users.size();i++){
			if(users.get(i).getZhiwu()!=null && "组长".equals(users.get(i).getZhiwu())){
				zuzhangs.add(users.get(i));
			}else if(users.get(i).getZhiwu()!=null && "副组长".equals(users.get(i).getZhiwu())){
				fuzuzhangs.add(users.get(i));
			}
		}
		model.addAttribute("zuzhangs", zuzhangs);
		model.addAttribute("fuzuzhangs", fuzuzhangs);
		model.addAttribute("parentOrg", parentOrg);
		model.addAttribute("yyOrginfoList", resultMap);
		return "yiyuan/renyuanda_gw";
	}
	
	
	@RequestMapping("/toIndexPage")
	public String toIndexPage(Model model) {
		
		return "index_v1";

	}
	
	@RequestMapping("/toAddPage")
	public String toAddPage(Model model,HttpServletRequest req) {
		String orgid = req.getParameter("orgid");
		model.addAttribute("orgid", orgid);
		
		return "yiyuan/renyuanda_add";

	}
	
	@RequestMapping("/toAddPageGw")
	public String toAddPageGw(Model model,int pid) {

		YYOrginfo orgParent=orgServiceI.selectByPrimaryKey(pid);
		model.addAttribute("orgParent", orgParent);
		return "yiyuan/zzjg_gw_add";

	}
	
	/*@RequestMapping("/addElement")
	public @ResponseBody JSONObject addElement(YYOrginfo YYOrginfo,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		orgServiceI.addElement(YYOrginfo);
		jsonObject.put("msg", "添加成功");
		jsonObject.put("success", true);
		return jsonObject;
		
		
	}*/
	
	@RequestMapping("/addElement")
	public String addElement(YYOrginfo YYOrginfo,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		orgServiceI.addElement(YYOrginfo);
		jsonObject.put("msg", "添加成功");
		jsonObject.put("success", true);
		return "yiyuan/zuzhijiegou";
//		return "yiyuan/zzjg_add";
		
	}
	
	@RequestMapping("/addElementGw")
	public String addElementGw(Model model,YYOrginfo YYOrginfo,HttpServletRequest request){
		orgServiceI.addElement(YYOrginfo);
		
		return listByPid(model,YYOrginfo.getPid());
		/*List<YYOrginfo> resultMap = new ArrayList<YYOrginfo>();// 结果集变量
		resultMap=orgServiceI.selectOrgListByPid(YYOrginfo.getPid());
		YYOrginfo parentOrg=orgServiceI.selectByPrimaryKey(YYOrginfo.getPid());
		
		//首先查岗位下的职务
		//根据职务查对应的人
		//将职务信息、人员信息，返回到页面
		
		model.addAttribute("parentOrg", parentOrg);
		model.addAttribute("yyOrginfoList", resultMap);
		
		
		jsonObject.put("msg", "添加成功");
		jsonObject.put("success", true);
		return "yiyuan/zuzzjg_gw";*/
		
	}
	
	@RequestMapping("/toEditPage")
	public String toEditPage(Model model, int id) {
		YYOrginfo YYOrginfo=orgServiceI.selectByPrimaryKey(id);
	
		model.addAttribute("YYOrginfo", YYOrginfo);
		return "yiyuan/renyuanda_edit";

	}
	
	@RequestMapping("/toEditPageGw")
	public String toEditPageGw(Model model, int id) {
		YYOrginfo YYOrginfo=orgServiceI.selectByPrimaryKey(id);
	
		model.addAttribute("YYOrginfo", YYOrginfo);
		return "yiyuan/zzjg_gw_edit";

	}
	
	@RequestMapping("/editElement")
	public String editElement(YYOrginfo yYOrginfo,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		orgServiceI.editElement(yYOrginfo);
		jsonObject.put("msg", "修改成功");
		jsonObject.put("success", true);
		return "yiyuan/zuzhijiegou";
		
		
	}
	@RequestMapping("/editElementGw")
	public String editElementGw(Model model,YYOrginfo yYOrginfo,HttpServletRequest request){
		orgServiceI.editElement(yYOrginfo);
		return listByPid(model,yYOrginfo.getPid());
	}
	
	
	@RequestMapping("/passwordConform")
	public @ResponseBody JSONObject passwordConform(String pw,int id,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		
		//密码验证部分逻辑，有待补充（此处直接返回验证成功）,并执行后台删除操作
		if(true){
			//执行组织机构删除，删除时，若该组织有下属组织，将一起删除
			orgServiceI.deletebyId(id);
			jsonObject.put("msg", "修改成功");
			jsonObject.put("success", true);
		}
		else{
			jsonObject.put("msg", "密码验证失败");
			jsonObject.put("success", false);
		}
		return jsonObject;
		
		
	}
	
	@RequestMapping("/ToRenyuandaGwRy")
	public String  toRenyuandaGwRy(Model model,HttpServletRequest req){
		Integer id =Integer.valueOf(req.getParameter("id")) ;
		YYOrginfo orginfo = orgServiceI.selectByPrimaryKey(id);
		List<YYUserinfo> users = userinfoServiceI.GetUsersByOrgid(id);
		model.addAttribute("pid", orginfo.getPid());
		model.addAttribute("id", id);
		model.addAttribute("users", users);
		
		return "yiyuan/renyuanda_gw_ry";
	}

	@RequestMapping("/selectByPrimaryKey")
	public String selectByPrimaryKey(Model model ,int id){
		
		YYUserinfo userinfo = userinfoServiceI.selectByPrimaryKey(id);
		model.addAttribute("user", userinfo);
		return "yiyuan/zuzzjg_gw_ryxq";
		
	}
	
}
