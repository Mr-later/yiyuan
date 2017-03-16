package com.netsdar.hospital.controller;

import java.util.ArrayList;
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
import com.netsdar.hospital.entity.YYFunction;
import com.netsdar.hospital.service.FunctionServiceI;

@Controller
@RequestMapping("/functionController")
public class FunctionController {

		@Autowired
		FunctionServiceI functionServiceI;
		@RequestMapping("/datagrid")
		public @ResponseBody JSONObject FunctionList(String searchtext, String draw, String start, String length, HttpServletRequest request){
			LinkedHashMap<String,Object> map = new LinkedHashMap<String, Object>();
			JSONObject jsonObject = new JSONObject();
			JSONArray jsonArray = new JSONArray();
			String order=request.getParameter("order[0][column]");
			String dir=request.getParameter("order[0][dir]");
			String orderColumn = request.getParameter("columns["+order+"][data]");
			map.put("searchtext", URLDecoder.decode(searchtext, "utf-8").trim());
			map.put("dir", dir);
			map.put("orderColumn", orderColumn);
			
			List<YYFunction> resultMap = new ArrayList<YYFunction>();// 结果集变量
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
				resultMap = functionServiceI.getListFunction(map);
			    Page pageInfo = (Page) resultMap;
		        jsonObject.put("recordsTotal", pageInfo.getTotal());
		        jsonObject.put("recordsFiltered",pageInfo.getTotal());
		        
			}
			

			for (YYFunction temp : resultMap) {
				JSONObject info = new JSONObject();
				// 放入页面需要展示的值
				info.put("id", temp.getId() == null ? "" : temp.getId());
				info.put("pid", temp.getFunctiontemp1() == null ? "根节点" : temp.getFunctiontemp1());
				info.put("functionname", temp.getFunctionname() == null ? "" : temp.getFunctionname());
				info.put("functionurl", temp.getFunctionurl() == null ? "" : temp.getFunctionurl());
				info.put("miaoshu", temp.getMiaoshu() == null ? "" :  temp.getMiaoshu());
				info.put("functiontubiao", temp.getFunctiontubiao() == null ? "" :  temp.getFunctiontubiao());
				info.put("shouyelujing", temp.getShouyelujing() == null ? "" :  temp.getShouyelujing());
				info.put("beijingyanse", temp.getBeijingyanse() == null ? "" :  temp.getBeijingyanse());
				jsonArray.add(info);
			}
			jsonObject.put("data", jsonArray);
			return jsonObject;
			
		}
		
		

		
		@RequestMapping("/addElement")
		public @ResponseBody JSONObject addElement(YYFunction yyFunction,HttpServletRequest request){
			JSONObject jsonObject = new JSONObject(true);
			functionServiceI.addElement(yyFunction);
			jsonObject.put("msg", "添加成功");
			jsonObject.put("success", true);
			return jsonObject;
			
		}
		
		@RequestMapping("/deleteElement")
		public @ResponseBody JSONObject deletedict(int id){
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
			JSONObject jsonObject = new JSONObject(true);
			int deletestate = functionServiceI.deletebyid(id);
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
		YYFunction yyFunction=functionServiceI.selectByPrimaryKey(id);
		List<YYFunction> pids = functionServiceI.getAll();
			model.addAttribute("yyFunction", yyFunction);
			model.addAttribute("pids", pids);
		
			model.addAttribute("pid", yyFunction.getPid());
			return "system/editcdgl";

		}
		
		
		@RequestMapping("/editElement")
		public @ResponseBody JSONObject editElement(YYFunction yyFunction,HttpServletRequest request){
			JSONObject jsonObject = new JSONObject(true);
			functionServiceI.editElement(yyFunction);
			jsonObject.put("msg", "修改成功");
			jsonObject.put("success", true);
			return jsonObject;
			
		}
			
		@RequestMapping("/getPids")
		public String getPids(Model model,HttpServletRequest request){
			List<YYFunction> resultMap = new ArrayList<YYFunction>();
			JSONArray jsonArray = new JSONArray();
			
			resultMap =functionServiceI.getAll();
			for (YYFunction temp : resultMap) {
				JSONObject info = new JSONObject();
				// 放入页面需要展示的值
				info.put("id", temp.getId() == null ? "" : temp.getId());
				info.put("functionname", temp.getFunctionname() == null ? "根节点" : temp.getFunctionname());
				jsonArray.add(info);
			}
			model.addAttribute("pids", jsonArray);
			return "system/addcdgl";
		}
		
		//只支持两级目录
		@RequestMapping("/getTree")
		public @ResponseBody JSONArray getTree(YYFunction yyFunction,HttpServletRequest request){
			JSONArray jsonArray = new JSONArray();
			List<YYFunction> yyFunctionList = functionServiceI.selectAll();
			for (int i = 0; i < yyFunctionList.size(); i++) {
				JSONObject jsonObject = new JSONObject(true);
				JSONArray childrenBtnArr = new JSONArray();
				if (yyFunctionList.get(i).getPid() == 0) {
					jsonObject.put("id", yyFunctionList.get(i).getId());
					jsonObject.put("text", yyFunctionList.get(i).getFunctionname());
//					JSONObject stateJson = new JSONObject(true);
//					stateJson.put("opened", true);
//					stateJson.put("selected", true);
//					jsonObject.put("state", stateJson);
					
					for (int j = 0; j < yyFunctionList.size(); j++) {
						if (yyFunctionList.get(i).getId().equals(yyFunctionList.get(j).getPid())) {
							JSONObject childrenBtnObj = new JSONObject(true);
							childrenBtnObj.put("id", yyFunctionList.get(j).getId());
							childrenBtnObj.put("text", yyFunctionList.get(j).getFunctionname());
//							JSONObject stateJsonchild = new JSONObject(true);
//							stateJsonchild.put("opened", true);
//							stateJsonchild.put("selected", true);
//							childrenBtnObj.put("state", stateJsonchild);
							childrenBtnArr.add(childrenBtnObj);
						}
					}
					jsonObject.put("children", childrenBtnArr);
					jsonArray.add(jsonObject);
				}
			}
			return jsonArray;
		}
		
		

		@RequestMapping("/getTreeSelect")
		public @ResponseBody
		JSONArray getTreeSelect(String roleid, HttpServletRequest request) {
			JSONArray jsonArray = new JSONArray();
			List<YYFunction> mmFunctionList = functionServiceI.selectAll();
			Integer valueOf = Integer.valueOf(roleid);
			List<YYFunction> mmFunctionCheckList = functionServiceI.allTreeNodeByUser(valueOf); // 可操作的菜单集合
			List<String> temp = new ArrayList<String>();

			for (int j = 0; j < mmFunctionCheckList.size(); j++) {
				mmFunctionCheckList.get(j).setFunctiontemp16(1);
				temp.add(mmFunctionCheckList.get(j).getId().toString());
			}
			for (int k = 0; k < mmFunctionList.size(); k++) {
				if (!temp.contains(mmFunctionList.get(k).getId().toString())) {
					mmFunctionList.get(k).setFunctiontemp16(0);
					mmFunctionCheckList.add(mmFunctionList.get(k));
				}
			}

			mmFunctionList = mmFunctionCheckList;

			for (int i = 0; i < mmFunctionList.size(); i++) {
				JSONObject jsonObject = new JSONObject(true);
				JSONArray childrenBtnArr = new JSONArray();
				if (mmFunctionList.get(i).getPid() == 0) {
					jsonObject.put("id", mmFunctionList.get(i).getId());
					jsonObject.put("text", mmFunctionList.get(i).getFunctionname());

					for (int j = 0; j < mmFunctionList.size(); j++) {
						if (mmFunctionList.get(i).getId()
								.equals(mmFunctionList.get(j).getPid())) {
							JSONObject childrenBtnObj = new JSONObject(true);
							childrenBtnObj.put("id", mmFunctionList.get(j).getId());
							childrenBtnObj.put("text", mmFunctionList.get(j).getFunctionname());
							if(mmFunctionList.get(j).getFunctiontemp16()==1)
							{
								 JSONObject stateJsonchild = new JSONObject(true);
								 stateJsonchild.put("opened", true);
								 stateJsonchild.put("selected", true);
								 childrenBtnObj.put("state", stateJsonchild);
							}
							
							childrenBtnArr.add(childrenBtnObj);
						}
					}
					jsonObject.put("children", childrenBtnArr);
					jsonArray.add(jsonObject);
				}
			}
			return jsonArray;
		}
		
		
		
		
		
		
		
}
