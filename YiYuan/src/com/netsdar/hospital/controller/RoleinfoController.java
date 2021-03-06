package com.netsdar.hospital.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

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
import com.netsdar.hospital.entity.YYFunction;
import com.netsdar.hospital.entity.YYRoleinfo;
import com.netsdar.hospital.service.FunctionServiceI;
import com.netsdar.hospital.service.OrgRoleServiceI;
import com.netsdar.hospital.service.RoleButtonServiceI;
import com.netsdar.hospital.service.RoleFunctionServiceI;
import com.netsdar.hospital.service.RoleinfoServiceI;
import com.netsdar.hospital.service.UserRoleServiceI;

@Controller
@RequestMapping("/roleinfoController")
public class RoleinfoController {

		@Autowired
		RoleinfoServiceI roleinfoServiceI;
		@Autowired
		FunctionServiceI functionServiceI;
		@Autowired
		RoleFunctionServiceI roleFunctionServiceI;
		@Autowired
		RoleButtonServiceI roleButtonServiceI;
		@Autowired
		UserRoleServiceI userroleServiceI;
		@Autowired
		OrgRoleServiceI  orgRoleServiceI;
		@RequestMapping("/datagrid")
		public @ResponseBody JSONObject roleinfoList(String searchtext, String draw, String start, String length, HttpServletRequest request){
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
			JSONObject jsonObject = new JSONObject(true);
			JSONArray jsonArray = new JSONArray();

			String order=request.getParameter("order[0][column]");
			String dir=request.getParameter("order[0][dir]");
			String orderColumn = request.getParameter("columns["+order+"][data]");
			map.put("searchtext", URLDecoder.decode(searchtext, "utf-8").trim());
			map.put("dir", dir);
			map.put("orderColumn", orderColumn);
			
			List<YYRoleinfo> resultMap = new ArrayList<YYRoleinfo>();// 结果集变量
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
				resultMap = roleinfoServiceI.getListRoleinfo(map);
			    Page pageInfo = (Page) resultMap;
		        jsonObject.put("recordsTotal", pageInfo.getTotal());
		        jsonObject.put("recordsFiltered",pageInfo.getTotal());
		        
			}
			

			for (YYRoleinfo temp : resultMap) {
				JSONObject info = new JSONObject();
				// 放入页面需要展示的值
				info.put("id", temp.getId() == null ? "" : temp.getId());
				info.put("miaoshu", temp.getMiaoshu() == null ? "" : temp.getMiaoshu());
				info.put("rolename", temp.getRolename() == null ? "" : temp.getRolename());
				jsonArray.add(info);
			}
			jsonObject.put("data", jsonArray);
			return jsonObject;
			
		}
		
		
		@RequestMapping("/addElement")
		public @ResponseBody JSONObject addElement(String functionids,String buttonids,YYRoleinfo yyRoleinfo,HttpServletRequest request){
			JSONObject jsonObject = new JSONObject(true);
			roleinfoServiceI.insertAndGetId(yyRoleinfo);
			
			Integer id = yyRoleinfo.getId();
			Map map = new HashMap();
			
			
			//给role_function表里添加数据
			if (functionids != null&& functionids!="") {
				Set<String> set = new TreeSet<String>();
				String resource[] = functionids.split(",");
				for (int i = 0; i < resource.length; i++) {
					set.add(resource[i]);
				}
				String resourcePids = "";
				for (int i = 0; i < resource.length; i++) {
					resourcePids += resource[i] + ",";
					 YYFunction function = functionServiceI.selectByPrimaryKey(Integer
							.valueOf(resource[i]));
					while (function.getPid() != 0) {
						resourcePids += function.getPid() + ",";
						function= functionServiceI.selectByPrimaryKey(function.getPid());
						if (function == null) {
							break;
						}
					}
				}

				String resourcePid[] = resourcePids.split(",");

				int len = resourcePid.length;
				for (int i = 0; i < len; i++) {
					set.add(resourcePid[i]);// 将所有字符串添加到Set
				}
				resourcePid = (String[]) set.toArray(new String[0]);

				for (int i = 0; i < resourcePid.length; i++) {
					map.put("functionid", Integer.valueOf(resourcePid[i]));
					map.put("roleid", id);
					roleFunctionServiceI.insertByMap(map);
				}
			}
			//给role_button表中添加数据
			if (buttonids != null&& buttonids!="") {
				String resource1[] = buttonids.split(",");
				for (int i = 0; i < resource1.length; i++) {
					map.put("buttonid", Integer.valueOf(resource1[i]));
					map.put("roleid", id);
					roleButtonServiceI.insertByMap(map);
				}
			}
			
			
			jsonObject.put("msg", "添加成功");
			jsonObject.put("success", true);
			return jsonObject;
			
		}
		
		@RequestMapping("/deleteElement")
		public @ResponseBody JSONObject deletedict(int id){
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
			JSONObject jsonObject = new JSONObject(true);
			if (id == 1) {
				jsonObject.put("success", true);
				jsonObject.put("msg", "高级管理员不允许删除,如需删除请联系管理员");
			} else {
				
				//删除用户角色中间表
				userroleServiceI.deleteByRoleId(id);
				//删除角色权限中间表
				roleFunctionServiceI.deleteByRoleId(id);
				//删除角色按钮中间表
				roleButtonServiceI.deleteByRoleId(id);
				//删除角色机构中间表
				orgRoleServiceI.deleteByRoleId(id);
				int deletestate = roleinfoServiceI.deletebyid(id);
				if (deletestate == 1) {
					jsonObject.put("success", true);
					jsonObject.put("msg", "删除成功");
				} else {
					jsonObject.put("msg", "删除失败");
				}
			}

			return jsonObject;
		}
		
		@RequestMapping("/toEditPage")
		public String toEditPage(Model model, int id) {
		YYRoleinfo yyRoleinfo=roleinfoServiceI.selectByPrimaryKey(id);
		
			model.addAttribute("yyRoleinfo", yyRoleinfo);
			return "system/editqxgl";

		}
		
		
		@RequestMapping("/editElement")
		public @ResponseBody JSONObject editElement(Integer id,String functionids,String buttonids, YYRoleinfo yyRoleinfo,HttpServletRequest request){
			JSONObject jsonObject = new JSONObject(true);
			
			yyRoleinfo.setId(Integer.valueOf(id));
			int roleId = yyRoleinfo.getId();
			//更新前，先进行删除
			roleFunctionServiceI.deleteByRoleId(roleId);
			roleButtonServiceI.deleteByRoleId(roleId);
			//qxglServiceI.insertAndGetId(mmRole);
			//修改角色表
			roleinfoServiceI.editElement(yyRoleinfo);
			//修改角色功能中间表
			Map map = new HashMap();
			
			if (functionids != null && functionids!="") {
				Set<String> set = new TreeSet<String>();
				String resource[] = functionids.split(",");
				for (int i = 0; i < resource.length; i++) {
					set.add(resource[i]);
				}
				YYFunction temp = new YYFunction();
				String resourcePids = "";
				for (int i = 0; i < resource.length; i++) {
					resourcePids += resource[i] + ",";
					temp = functionServiceI.selectByPrimaryKey(Integer
							.valueOf(resource[i]));
					while (temp.getPid() != 0) {
						resourcePids += temp.getPid() + ",";
						temp = functionServiceI.selectByPrimaryKey(temp.getPid());
						if (temp == null) {
							break;
						}
					}
				}

				String resourcePid[] = resourcePids.split(",");

				int len = resourcePid.length;
				for (int i = 0; i < len; i++) {
					set.add(resourcePid[i]);// 将所有字符串添加到Set
				}
				resourcePid = (String[]) set.toArray(new String[0]);

				for (int i = 0; i < resourcePid.length; i++) {
					map.put("functionid", Integer.valueOf(resourcePid[i]));
					map.put("roleid", roleId);
					roleFunctionServiceI.insertByMap(map);
				}
			}
			//修改角色按钮中间表
			
			if (buttonids != null&& buttonids!="") {
				String resource1[] = buttonids.split(",");
				for (int i = 0; i < resource1.length; i++) {
					map.put("buttonid", Integer.valueOf(resource1[i]));
					map.put("roleid", id);
					roleButtonServiceI.insertByMap(map);
				}
			}
			jsonObject.put("msg", "修改成功");
			jsonObject.put("success", true);
			return jsonObject;
			
		}
		
		
		@RequestMapping("/getTree")
		public @ResponseBody JSONArray getTree(YYRoleinfo yyRoleinfo,HttpServletRequest request){
			JSONArray jsonArray = new JSONArray();
			List<YYRoleinfo> yyRoleinfoList = roleinfoServiceI.getListRoleinfo(null);
			for (int i = 0; i < yyRoleinfoList.size(); i++) {
				JSONObject jsonObject = new JSONObject(true);
					jsonObject.put("id", yyRoleinfoList.get(i).getId());
					jsonObject.put("text", yyRoleinfoList.get(i).getRolename());
					
					jsonArray.add(jsonObject);
				}
			return jsonArray;
		}
		
		

		@RequestMapping("/getTreeSelect")
		public @ResponseBody
		JSONArray getTreeSelect(String roleid, HttpServletRequest request) {
			JSONArray jsonArray = new JSONArray();
			List<YYRoleinfo> yyRoleinfoList = roleinfoServiceI.getListRoleinfo(null);
			Integer valueOf = Integer.valueOf(roleid);
			List<YYRoleinfo> yyRoleinfoCheckList = roleinfoServiceI.allTreeNodeByUser(valueOf); // 可操作的菜单集合
			List<String> temp = new ArrayList<String>();

			for (int j = 0; j < yyRoleinfoCheckList.size(); j++) {
				yyRoleinfoCheckList.get(j).setRoleinfotemp16(1);
				temp.add(yyRoleinfoCheckList.get(j).getId().toString());
			}
			for (int k = 0; k < yyRoleinfoList.size(); k++) {
				if (!temp.contains(yyRoleinfoList.get(k).getId().toString())) {
					yyRoleinfoList.get(k).setRoleinfotemp16(0);
					yyRoleinfoCheckList.add(yyRoleinfoList.get(k));
				}
			}

			yyRoleinfoList = yyRoleinfoCheckList;

			for (int i = 0; i < yyRoleinfoList.size(); i++) {
				    JSONObject jsonObject = new JSONObject(true);
					jsonObject.put("id", yyRoleinfoList.get(i).getId());
					jsonObject.put("text", yyRoleinfoList.get(i).getRolename());

					if(yyRoleinfoList.get(i).getRoleinfotemp16()==1)
					{
						 JSONObject stateJsonchild = new JSONObject(true);
						 stateJsonchild.put("opened", true);
						 stateJsonchild.put("selected", true);
						 jsonObject.put("state", stateJsonchild);
					}
					
					jsonArray.add(jsonObject);
					}
			return jsonArray;
		}
		
		
		
		
		
		
		
}
