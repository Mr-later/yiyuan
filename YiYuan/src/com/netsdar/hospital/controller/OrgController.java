package com.netsdar.hospital.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
@RequestMapping("/orgController")
public class OrgController {

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
		
		model.addAttribute("parentOrg", parentOrg);
		model.addAttribute("yyOrginfoList", resultMap);
		return "yiyuan/zuzzjg_gw";
	}
	
	
	
	@RequestMapping("/toIndexPage")
	public String toIndexPage(Model model) {
		
		return "index_v1";

	}
	
	@RequestMapping("/toAddPage")
	public String toAddPage(Model model) {

		List<YYOrginfo> resultMap = new ArrayList<YYOrginfo>();// 结果集变量
		// 查询所有根节点
		resultMap = orgServiceI.selectOrgListByPid(0);
		YYOrginfo orgParent = resultMap.get(0);
		model.addAttribute("orgParent", orgParent);

		return "yiyuan/zzjg_add";

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
		return "yiyuan/zzjg_edit";

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
	
	/*@RequestMapping("/datagrid")
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

		List<YYDict> resultMap = new ArrayList<YYDict>();// 结果集变量

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
			resultMap = orgServiceI.getListDict(map);
		    Page pageInfo = (Page) resultMap;
	        jsonObject.put("recordsTotal", pageInfo.getTotal());
	        jsonObject.put("recordsFiltered",pageInfo.getTotal());
	        
		}
		
		
		for (YYDict temp : resultMap) {
			JSONObject info = new JSONObject();
			// 放入页面需要展示的值
			info.put("id", temp.getId() == null ? "" : temp.getId());
			info.put("key", temp.getDictkey() == null ? "" : temp.getDictkey());
			info.put("value", temp.getDictvalue() == null ? "" : temp.getDictvalue());
			info.put("group", temp.getDictgroup() == null ? "" : temp.getDictgroup());
			info.put("description", temp.getDescription() == null ? "" :  temp.getDescription());
			jsonArray.add(info);
		}
		jsonObject.put("data", jsonArray);
		return jsonObject;
		
		
	}
	
	@RequestMapping("/addElement")
	public @ResponseBody JSONObject addElement(YYDict yyDict,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		orgServiceI.addElement(yyDict);
		jsonObject.put("msg", "添加成功");
		jsonObject.put("success", true);
		return jsonObject;
		
		
	}
	
	@RequestMapping("/deleteElement")
	public @ResponseBody JSONObject deletedict(int id){
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
		JSONObject jsonObject = new JSONObject(true);
		int deletestate = orgServiceI.deletebyid(id);
		if(deletestate != 0){
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
		YYDict yyDict=orgServiceI.selectByPrimaryKey(id);
	
		model.addAttribute("yyDict", yyDict);
		return "system/editsjzd";

	}
	
	
	@RequestMapping("/editElement")
	public @ResponseBody JSONObject editElement(YYDict yyDict,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		orgServiceI.editElement(yyDict);
		jsonObject.put("msg", "修改成功");
		jsonObject.put("success", true);
		return jsonObject;
		
		
	}*/
	/**
	 * 根据科的orgid找出科下面的领导主任，副主任,组长，副组长,以及普通职员
	 */
	@RequestMapping("/GetUsersByOrgid")
	public String GetUsersByOrgid(Model model ,int id,HttpServletRequest req){
		String gopage = req.getParameter("gopage");
		YYOrginfo parentOrg=orgServiceI.selectByPrimaryKey(id);
		model.addAttribute("parentOrg", parentOrg);
		
		//查找开始
		List<YYUserinfo> leads =userinfoServiceI.GetUsersByOrgid(id);
		ArrayList<YYUserinfo> zhurens = new ArrayList<YYUserinfo>();
		ArrayList<YYUserinfo> fuzhurens = new ArrayList<YYUserinfo>();
		ArrayList<YYUserinfo> zhuzhangs = new ArrayList<YYUserinfo>();
		ArrayList<YYUserinfo> fuzhuzhangs = new ArrayList<YYUserinfo>();
		ArrayList<YYUserinfo> GWrenyuans = new ArrayList<YYUserinfo>();
		
		//遍历，使得不同的职务放不同的list，便于在前台遍历
		for(int i=0;i<leads.size();i++){
			if(leads.get(i).getZhiwu()!=null && !"主任".equals(leads.get(i).getZhiwu())){
				zhurens.add(leads.get(i));
			}else if(leads.get(i).getZhiwu()!=null && !"副主任".equals(leads.get(i).getZhiwu())){
				fuzhurens.add(leads.get(i));
			}else if(leads.get(i).getZhiwu()!=null && !"组长".equals(leads.get(i).getZhiwu())){
				zhuzhangs.add(leads.get(i));
			}else if(leads.get(i).getZhiwu()!=null && !"副组长".equals(leads.get(i).getZhiwu())){
				fuzhuzhangs.add(leads.get(i));
			}else{
				GWrenyuans.add(leads.get(i));
			}
			
		}
		model.addAttribute("zhurens", zhurens);  
		model.addAttribute("fuzhurens", fuzhurens);
		model.addAttribute("zhuzhangs", zhuzhangs);
		model.addAttribute("fuzhuzhangs", fuzhuzhangs);
		model.addAttribute("GWrenyuans", GWrenyuans); //岗位人员
		return gopage;
		
	}
	@RequestMapping("/GetUsersOrgByOrgid")
	public String GetUsersOrgByOrgid(Model model,int id,HttpServletRequest req){
		String gopage = req.getParameter("gopage");
		ArrayList<YYUserinfo> zhuzhangs = new ArrayList<YYUserinfo>();
		ArrayList<YYUserinfo> fuzhuzhangs = new ArrayList<YYUserinfo>();
		
		////查找本组下的组长，副组长
		List<YYUserinfo> leads =userinfoServiceI.GetUsersByOrgid(id);
		for(int i=0;i<leads.size();i++){
		if(leads.get(i).getZhiwu()!=null && !"组长".equals(leads.get(i).getZhiwu())){
			zhuzhangs.add(leads.get(i));
		}else if(leads.get(i).getZhiwu()!=null && !"副组长".equals(leads.get(i).getZhiwu())){
			fuzhuzhangs.add(leads.get(i));
		}
		}
		
		//首先查岗位下的职务
		//根据职务查对应的人
		//将职务信息、人员信息，返回到页面
		YYOrginfo parentOrg=orgServiceI.selectByPrimaryKey(id);
		model.addAttribute("parentOrg", parentOrg);
		
		//查找本组下的岗位
		List<YYOrginfo> resultMap = new ArrayList<YYOrginfo>();// 结果集变量
		resultMap=orgServiceI.selectOrgListByPid(id);
		model.addAttribute("zhuzhangs", zhuzhangs);
		model.addAttribute("fuzhuzhangs", fuzhuzhangs);
		model.addAttribute("yyOrginfoList", resultMap);
		return gopage;
		
	}
}
