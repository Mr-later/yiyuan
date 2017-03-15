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
import com.netsdar.hospital.entity.YYDict;
import com.netsdar.hospital.service.DictServiceI;


@Controller
@RequestMapping("/dictController")
public class DictController {

	@Autowired
	private DictServiceI  dictServiceI;
	
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
			resultMap = dictServiceI.getListDict(map);
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
		dictServiceI.addElement(yyDict);
		jsonObject.put("msg", "添加成功");
		jsonObject.put("success", true);
		return jsonObject;
		
	}
	
	@RequestMapping("/deleteElement")
	public @ResponseBody JSONObject deletedict(int id){
		LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
		JSONObject jsonObject = new JSONObject(true);
		int deletestate = dictServiceI.deletebyid(id);
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
		YYDict yyDict=dictServiceI.selectByPrimaryKey(id);
	
		model.addAttribute("yyDict", yyDict);
		return "system/editsjzd";

	}
	
	
	@RequestMapping("/editElement")
	public @ResponseBody JSONObject editElement(YYDict yyDict,HttpServletRequest request){
		JSONObject jsonObject = new JSONObject(true);
		dictServiceI.editElement(yyDict);
		jsonObject.put("msg", "修改成功");
		jsonObject.put("success", true);
		return jsonObject;
		
		
	}
	
}
