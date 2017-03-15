package com.netsdar.hospital.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import jodd.util.URLDecoder;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.netsdar.hospital.entity.YYButtoninfo;
import com.netsdar.hospital.entity.YYFunction;
import com.netsdar.hospital.service.ButtoninfoServiceI;

@Controller
@RequestMapping("/buttoninfoController")
public class ButtoninfoController {

		@Autowired 
		private ButtoninfoServiceI buttoninfoServiceI;
		@RequestMapping("/datagrid")
		public @ResponseBody JSONObject buttoninfoList(String searchtext, String draw, String start, String length, HttpServletRequest request){
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
			JSONObject jsonObject = new JSONObject(true);
			JSONArray jsonArray = new JSONArray();

			String order=request.getParameter("order[0][column]");
			String dir=request.getParameter("order[0][dir]");
			String orderColumn = request.getParameter("columns["+order+"][data]");
			map.put("searchtext", URLDecoder.decode(searchtext, "utf-8").trim());
			map.put("dir", dir);
			map.put("orderColumn", orderColumn);
			
			List<YYButtoninfo> resultMap = new ArrayList<YYButtoninfo>();// 结果集变量
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
				resultMap = buttoninfoServiceI.getListButtoninfo(map);
			    Page pageInfo = (Page) resultMap;
		        jsonObject.put("recordsTotal", pageInfo.getTotal());
		        jsonObject.put("recordsFiltered",pageInfo.getTotal());
		        
			}
			

			for (YYButtoninfo temp : resultMap) {
				JSONObject info = new JSONObject();
				// 放入页面需要展示的值
				info.put("id", temp.getId() == null ? "" : temp.getId());
				info.put("buttonname", temp.getButtonname() == null ? "" : temp.getButtonname());
				info.put("buttonpage", temp.getButtonpage() == null ? "" : temp.getButtonpage());
				info.put("buttonpageid", temp.getButtonpageid() == null ? "" : temp.getButtonpageid());
				info.put("buttonpagename", temp.getButtonpagename() == null ? "" :  temp.getButtonpagename());
				jsonArray.add(info);
			}
			jsonObject.put("data", jsonArray);
			return jsonObject;
			
		}
		
		
		@RequestMapping("/addElement")
		public @ResponseBody JSONObject addElement(YYButtoninfo yyButtoninfo,HttpServletRequest request){
			JSONObject jsonObject = new JSONObject(true);
			buttoninfoServiceI.addElement(yyButtoninfo);
			jsonObject.put("msg", "添加成功");
			jsonObject.put("success", true);
			return jsonObject;
			
		}
		
		@RequestMapping("/deleteElement")
		public @ResponseBody JSONObject deletedict(int id){
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
			JSONObject jsonObject = new JSONObject(true);
			int deletestate = buttoninfoServiceI.deletebyid(id);
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
		YYButtoninfo yyButtoninfo=buttoninfoServiceI.selectByPrimaryKey(id);
		
			model.addAttribute("yyButtoninfo", yyButtoninfo);
			return "system/editangl";

		}
		
		
		@RequestMapping("/editElement")
		public @ResponseBody JSONObject editElement(YYButtoninfo yyButtoninfo,HttpServletRequest request){
			JSONObject jsonObject = new JSONObject(true);
			buttoninfoServiceI.editElement(yyButtoninfo);
			jsonObject.put("msg", "修改成功");
			jsonObject.put("success", true);
			return jsonObject;
			
		}
		
		@RequestMapping("/getTree")
		public @ResponseBody JSONArray getTree(YYButtoninfo yyButtoninfo,HttpServletRequest request){
			JSONArray jsonArray = new JSONArray();
			List<YYButtoninfo> yyButtoninfoList = buttoninfoServiceI.selectAll();
			for (int i = 0; i < yyButtoninfoList.size(); i++) {
				JSONObject jsonObject = new JSONObject(true);
					jsonObject.put("id", yyButtoninfoList.get(i).getId());
					jsonObject.put("text", yyButtoninfoList.get(i).getButtonname());
//					JSONObject stateJson = new JSONObject(true);
//					stateJson.put("opened", true);
//					stateJson.put("selected", true);
//					jsonObject.put("state", stateJson);
					jsonArray.add(jsonObject);
				}
			return jsonArray;
		}
		

		@RequestMapping("/getTreeSelect")
		public @ResponseBody
		JSONArray getTreeSelect(String roleid, HttpServletRequest request) {
			JSONArray jsonArray = new JSONArray();
			List<YYButtoninfo> yyButtoninfoList = buttoninfoServiceI.selectAll();
			List<YYButtoninfo> yyButtoninfoCheckList = buttoninfoServiceI.allTreeNodeByUser(Integer.valueOf(roleid)); // 可操作的菜单集合
			List<String> temp = new ArrayList<String>();

			for (int j = 0; j < yyButtoninfoCheckList.size(); j++) {
				yyButtoninfoCheckList.get(j).setButtoninfotemp16(1);
				temp.add(yyButtoninfoCheckList.get(j).getId().toString());
			}
			for (int k = 0; k < yyButtoninfoList.size(); k++) {
				if (!temp.contains(yyButtoninfoList.get(k).getId().toString())) {
					yyButtoninfoList.get(k).setButtoninfotemp16(0);
					yyButtoninfoCheckList.add(yyButtoninfoList.get(k));
				}
			}
			yyButtoninfoList = yyButtoninfoCheckList;

					for (int j = 0; j < yyButtoninfoList.size(); j++) {
							JSONObject json = new JSONObject(true);
							json.put("id", yyButtoninfoList.get(j).getId());
							json.put("text", yyButtoninfoList.get(j).getButtonname());
							if(yyButtoninfoList.get(j).getButtoninfotemp16()==1)
							{
								 JSONObject stateJsonchild = new JSONObject(true);
								 stateJsonchild.put("opened", true);
								 stateJsonchild.put("selected", true);
								 json.put("state", stateJsonchild);
							}
							
							jsonArray.add(json);
						}
			return jsonArray;
		}
		
}
