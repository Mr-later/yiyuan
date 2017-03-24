package com.netsdar.hospital.controller;

import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.netsdar.hospital.entity.YYButtoninfo;
import com.netsdar.hospital.entity.YYZhengshu;
import com.netsdar.hospital.service.ZhengshuServiceI;
import com.netsdar.hospital.utils.StringUtil;

@Controller
@RequestMapping("/ZhengShuController")
public class ZhengShuController {

		@Autowired
		ZhengshuServiceI zhengshuServiceI;
		@RequestMapping("/addElement")
		public @ResponseBody JSONObject addElement(YYZhengshu zhengshu,HttpServletRequest request){
			JSONObject jsonObject = new JSONObject(true);
			
			String Btime = zhengshu.getPeixunkaishishijianstr();
			String Etime = zhengshu.getPeixunjieshushijianstr();
			if(!StringUtil.IsBlank(Btime)){
				zhengshu.setPeixunkaishishijian(StringUtil.StrToDate(Btime));
			}
			if(!StringUtil.IsBlank(Etime)){
				zhengshu.setPeixunjieshushijian(StringUtil.StrToDate(Etime));
			}
			zhengshuServiceI.addElement(zhengshu);
			jsonObject.put("msg", "添加成功");
			jsonObject.put("success", true);
			return jsonObject;
			
		}
		@RequestMapping("/deleteElement")
		public @ResponseBody JSONObject deletedict(int id){
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
			JSONObject jsonObject = new JSONObject(true);
			int deletestate = buttoninfoServiceI.deleteByPrimaryKey(id);
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
}
