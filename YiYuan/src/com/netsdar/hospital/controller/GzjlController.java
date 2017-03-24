package com.netsdar.hospital.controller;

import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.netsdar.hospital.entity.YYGongzuojingli;
import com.netsdar.hospital.entity.YYJiankangdangan;
import com.netsdar.hospital.entity.YYUserinfo;
import com.netsdar.hospital.entity.YYXuexijingli;
import com.netsdar.hospital.entity.YYZhengshu;
import com.netsdar.hospital.service.GzjlServiceI;
import com.netsdar.hospital.service.JkdaServiceI;
import com.netsdar.hospital.service.OrgServiceI;
import com.netsdar.hospital.service.UserOrgServiceI;
import com.netsdar.hospital.service.UserinfoServiceI;
import com.netsdar.hospital.service.XuexijlServiceI;
import com.netsdar.hospital.service.ZhengshuServiceI;
import com.netsdar.hospital.utils.StringUtil;


@Controller
@RequestMapping("/GzjlController")
public class GzjlController {

		@Autowired
		GzjlServiceI gzjlServiceI;
		@Autowired
		private OrgServiceI  orgServiceI;
		@Autowired
		private UserinfoServiceI userinfoServiceI;
		@Autowired
		private UserOrgServiceI userOrgServiceI;
		@Autowired
		private XuexijlServiceI xuexijlServiceI;
		@Autowired
		private ZhengshuServiceI zhengshuServiceI;
		@Autowired
		private JkdaServiceI jkdaServiceI;
		@RequestMapping("/addElement")
		public String addElement(Model model ,YYGongzuojingli gzjl,HttpServletRequest req){
			putIntoModel(model, req);
			JSONObject jsonObject = new JSONObject(true);
			String Btime = gzjl.getShijianbeginstr();
			String Etime = gzjl.getShijianendstr();
			if(!StringUtil.IsBlank(Btime)){
				Date btime = StringUtil.StrToDate(Btime);
					gzjl.setShijianbegin(btime);
			}
			if(!StringUtil.IsBlank(Etime)){
				Date etime = StringUtil.StrToDate(Etime);
				gzjl.setShijianbegin(etime);
			}
			gzjlServiceI.addElement(gzjl);
			int userid = Integer.valueOf(req.getParameter("userid"));
			 return renYuanXQ(model, userid, req);
			
		}
		@RequestMapping("/deleteElement")
		public @ResponseBody JSONObject deleteJkda(int id,HttpServletRequest req,Model model){
			putIntoModel(model, req);
			LinkedHashMap<String, Object> map = new LinkedHashMap<String, Object>();// 条件存储
			JSONObject jsonObject = new JSONObject(true);
			int deletestate = gzjlServiceI.deleteByPrimaryKey(id);
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
		public String toEditPage(Model model, int id,HttpServletRequest req) {
			putIntoModel(model, req);
		YYGongzuojingli yyGongzuojingli=gzjlServiceI.selectByPrimaryKey(id);
			putIntoModel(model, req);
			model.addAttribute("yyGongzuojingli", yyGongzuojingli);
			return "yiyuan/ryxq_edgzjl";

		}
		
		
		@RequestMapping("/editElement")
		public String editElement(Model model ,YYGongzuojingli yyGongzuojingli,HttpServletRequest req){
			putIntoModel(model, req);
			gzjlServiceI.editElement(yyGongzuojingli);
			int userid = Integer.valueOf(req.getParameter("userid"));
			return renYuanXQ(model, userid, req);
			
		}
		private void putIntoModel(Model model, HttpServletRequest req) {
			String orgid = req.getParameter("orgid");
			String porgid = req.getParameter("porgid");
			String pporgid = req.getParameter("pporgid");
			String userid = req.getParameter("userid");
			model.addAttribute("orgid", orgid);
			model.addAttribute("porgid", porgid);
			model.addAttribute("pporgid", pporgid);
			model.addAttribute("userid", userid);
			if(!StringUtil.IsBlank(pporgid) && StringUtil.IsBlank(porgid)){
				model.addAttribute("gopage", "yiyuan/renyuanda_ld");
			}else if(!StringUtil.IsBlank(porgid)  && StringUtil.IsBlank(orgid)){
				model.addAttribute("gopage", "yiyuan/renyuanda_gw");
				model.addAttribute("backpage", "yiyuan/renyuanda");
			}else if(!StringUtil.IsBlank(porgid) && !StringUtil.IsBlank(orgid)){
				model.addAttribute("gopage", "yiyuan/zuzzjg_gw_ryxq");
				model.addAttribute("backpage", "yiyuan/zuzzjg_gw_ry");
			}
		}
		/**
		 * 人员详情页，包括工作经历，学习经历，证书，健康档案
		 * @param model
		 * @param id
		 * @param req
		 * @return
		 */
			@RequestMapping("/renYuanXQ")
			public String renYuanXQ(Model model ,int id,HttpServletRequest req){
				
				YYUserinfo userinfo = userinfoServiceI.selectByPrimaryKey(id);
				List<YYXuexijingli> xuexijinglis =xuexijlServiceI.getListByUserId(id);
				List<YYGongzuojingli> gzjls =gzjlServiceI.getListByUserId(id);
				List<YYJiankangdangan> jkdas =jkdaServiceI.getListByUserId(id);
				List<YYZhengshu> zhengshus =zhengshuServiceI.getListByUserId(id);
				model.addAttribute("xuexijinglis", xuexijinglis);
				model.addAttribute("gzjls", gzjls);
				model.addAttribute("jkdas", jkdas);
				model.addAttribute("zhengshus", zhengshus);
				model.addAttribute("user", userinfo);
				String gopage = (String)model.asMap().get("gopage");
				return gopage;
				
			}
			/**
			  * 跳转到增加工作经历页面
			  */
			  @RequestMapping("/ToAdgzjl")
			  public String ToAdgzjl(Model model ,HttpServletRequest req){
				  putIntoModel(model, req);
				  return "yiyuan/ryxq_adgzjl";
			  }
}
