package com.netsdar.hospital.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.netsdar.hospital.entity.YYOrginfo;
import com.netsdar.hospital.entity.YYUserinfo;
import com.netsdar.hospital.entity.YYUserorg;
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
@RequestMapping("/renYuanDaController")
public class RenYuanDaController {


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
	private GzjlServiceI gzjlServiceI;
	@Autowired
	private JkdaServiceI jkdaServiceI;
	
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
		model.addAttribute("porgid", id);
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
		String porgid = req.getParameter("porgid");
		String pporgid = req.getParameter("pporgid");
		model.addAttribute("orgid", orgid);
		model.addAttribute("porgid", porgid);
		model.addAttribute("pporgid", pporgid);
		return "yiyuan/renyuanda_add";//使用编辑页面做新增页面

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
	public  String addElement( YYUserinfo yyUserinfo,HttpServletRequest request,Model model){
		String birthdaystr = yyUserinfo.getBirthdaystr();
		if(!StringUtil.IsBlank(birthdaystr)){
			yyUserinfo.setBirthday(StringUtil.StrToDate(birthdaystr));
		}
		userinfoServiceI.insertSelective(yyUserinfo);
		
		YYUserinfo user = userinfoServiceI.selectByLoginname(yyUserinfo.getLoginname());
		//表示添加人员级的科，组，岗级的组织编号
		String pporgid =user.getUserinfotemp2();
		String porgid =user.getUserinfotemp3();
		String orgid =user.getUserinfotemp4();
		model.addAttribute("orgid", orgid);
		model.addAttribute("porgid", porgid);
		model.addAttribute("pporgid", pporgid);
		int id=0;
		if(StringUtil.IsBlank(orgid)){
			model.addAttribute("gopage", "yiyuan/renyuanda_ld");
			id=Integer.valueOf(pporgid);
		}else{
			model.addAttribute("gopage", "yiyuan/renyuanda_gw_ry");
			model.addAttribute("backpage", "yiyuan/renyuanda_gw");
			id=Integer.valueOf(orgid);
		}
		//判断中间表中没有数据再加入数据，添加组织结构和user表的中间表
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("userId",user.getId() );
		map.put("orgId", pporgid);
		map.put("userorgtemp3", "1");
		List<YYUserorg> userorgs =userOrgServiceI.findByUserIdOrgId(map);
		if(userorgs.size()==0 && pporgid!=null && !"".equals(pporgid)){
			userOrgServiceI.addByMap(map);
		}
		
		HashMap<String,Object> map1 = new HashMap<String, Object>();
		map1.put("userId",user.getId() );
		map1.put("orgId", porgid);
		map1.put("userorgtemp3", "1");
		List<YYUserorg> userorg1 =userOrgServiceI.findByUserIdOrgId(map1);
		if(userorg1.size()==0 && porgid!=null && !"".equals(porgid)){
		userOrgServiceI.addByMap(map1);
		}
		
		HashMap<String,Object> map2 = new HashMap<String, Object>();
		map2.put("userId",user.getId() );
		map2.put("orgId", orgid);
		map2.put("userorgtemp3", "1");
		List<YYUserorg> userorg2 =userOrgServiceI.findByUserIdOrgId(map2);
		if(userorg2.size()==0 && orgid!=null && !"".equals(orgid)){
		userOrgServiceI.addByMap(map2);
		}
		return GetUsersByOrgid(model, id, request);
		
	}
	/**
	 * 和orgController里面的GetUsersByOrgid方法区分
	 * 这个方法专门用来在某个岗下添加人员
	 */
	@RequestMapping("/GetUsersByOrgid")
	public String GetUsersByOrgid(Model model ,int id,HttpServletRequest req){
		Map<String, Object> mod = model.asMap();
		String gopage = (String) mod.get("gopage");//
		String backpage = (String) mod.get("backpage");//
		String orgid = (String) mod.get("orgid");
		String porgid = (String) mod.get("porgid");
		String pporgid = (String) mod.get("pporgid");
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
			if("主任".equals(leads.get(i).getZhiwu())){
				zhurens.add(leads.get(i));
			}else if("副主任".equals(leads.get(i).getZhiwu())){
				fuzhurens.add(leads.get(i));
			}else if("组长".equals(leads.get(i).getZhiwu())){
				zhuzhangs.add(leads.get(i));
			}else if("副组长".equals(leads.get(i).getZhiwu())){
				fuzhuzhangs.add(leads.get(i));
			}else{
				GWrenyuans.add(leads.get(i));
			}
			
		}
		//这个id是岗位id,方便详情页返回岗位页
		model.addAttribute("orgid", id);
		model.addAttribute("porgid", porgid);
		model.addAttribute("pporgid", pporgid);
		model.addAttribute("backpage", backpage);
		model.addAttribute("zhurens", zhurens);  
		model.addAttribute("fuzhurens", fuzhurens);
		model.addAttribute("zhuzhangs", zhuzhangs);
		model.addAttribute("fuzhuzhangs", fuzhuzhangs);
		model.addAttribute("users", GWrenyuans); //岗位人员
		return gopage;
		
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
	public String editElement(Model model ,YYUserinfo yyUserinfo,HttpServletRequest request){
		//带 这个信息是为了后面方便返回
		String orgid = request.getParameter("orgid");
		String porgid = request.getParameter("porgid");
		String pporgid = request.getParameter("pporgid");
		String gopage = request.getParameter("gopage");
		String backpage = request.getParameter("backpage");
		model.addAttribute("orgid", orgid);
		model.addAttribute("porgid", porgid);
		model.addAttribute("pporgid", pporgid);
		model.addAttribute("gopage", gopage);
		model.addAttribute("backpage", backpage);
			String birthdaystr = yyUserinfo.getBirthdaystr();
			if(!StringUtil.IsBlank(birthdaystr)){
				yyUserinfo.setBirthday(StringUtil.StrToDate(birthdaystr));
			}
		userinfoServiceI.editElement(yyUserinfo);
		
		Integer id = yyUserinfo.getId();
		return renYuanXQ(model, id, request);
		
		
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
	/**
	 * pporgid，porgid，orgid:分别对应科的，组的，岗的组织机构id
	 * @param model
	 * @param req
	 * @return
	 */
	@RequestMapping("/ToRenyuandaGwRy")
	public String  toRenyuandaGwRy(Model model,HttpServletRequest req){
		Integer orgid =Integer.valueOf(req.getParameter("orgid")) ;
		YYOrginfo orginfo = orgServiceI.selectByPrimaryKey(orgid);
		List<YYUserinfo> users = userinfoServiceI.GetUsersByOrgid(orgid);
		YYOrginfo orginfo1 = orgServiceI.selectByPrimaryKey(orginfo.getPid());
		model.addAttribute("pporgid", orginfo1.getPid());
		model.addAttribute("porgid", orginfo.getPid());
		model.addAttribute("orgid", orgid);
		model.addAttribute("users", users);
		
		return "yiyuan/renyuanda_gw_ry";
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
		String orgid = req.getParameter("orgid");
		String porgid = req.getParameter("porgid");
		String pporgid = req.getParameter("pporgid");
		String gopage = req.getParameter("gopage");
		String backpage = req.getParameter("backpage");
		String userid = req.getParameter("userid");
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
		model.addAttribute("userid", id);
		model.addAttribute("orgid", orgid);
		model.addAttribute("porgid", porgid);
		model.addAttribute("pporgid", pporgid);
		model.addAttribute("backpage", backpage);
		model.addAttribute("userid", userid);
		return gopage;
		
	}
	/**
	 * 找出所有的组
	 * @param model
	 * @return  
	 */
	@RequestMapping("/getZu")
	public @ResponseBody JSONObject getZu(){
		JSONObject jsonObject = new JSONObject(true);
		List<YYOrginfo> resultMap =orgServiceI.getZu();
		jsonObject.put("zus", resultMap);
		jsonObject.put("msg", "添加成功");
		jsonObject.put("success", true);
		return jsonObject;
		
	}
	/**
	 * 删除指定岗位人员
	 * @param model
	 * @return  
	 */
	@RequestMapping("/delElement")
	public @ResponseBody JSONObject delElement(YYUserorg userorg ,HttpServletRequest req){
		//在用户表中记录离职时间
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String deltTime = format.format(date);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userorg.getUserId());
		map.put("orgId", userorg.getOrgId());
		List<YYUserorg> userorgs =userOrgServiceI.findByUserIdOrgId(map);
		
		userorg.setUserorgtemp2(deltTime);
		userorg.setUserorgtemp3("2");
		userorg.setId(userorgs.get(0).getId());
		userOrgServiceI.updateByPrimaryKeySelective(userorg);
		
		JSONObject jsonObject = new JSONObject(true);
		jsonObject.put("success", true);
		return jsonObject;
	}
	/**
	 * 去人员调动的页面
	 * 
	 */
	@RequestMapping("/ToRyddPage")
	public String ToRyddPage(Model model ,HttpServletRequest req){
		int orgid = Integer.valueOf(req.getParameter("orgid"));
		List<YYUserinfo> users =userinfoServiceI.GetUsersNotInOrg(orgid);
		model.addAttribute("users", users);
		return "yiyuan/jypx_rydd";
	}
	/**
	 * 跳转到增加学习经历页面
	 */
	 @RequestMapping("/ToAdxuexijl")
		public String ToAdxuexijl(Model model ,HttpServletRequest req){
		 String userid = req.getParameter("userid");
		 model.addAttribute("userid", userid);
			return "yiyuan/ryxq_adxuexijl";
		}
	 
	  /**
	   * 跳转到增加履历经历页面
	   */
	   @RequestMapping("/ToAdlvli")
	   public String ToAdlvli(Model model ,HttpServletRequest req){
		   String userid = req.getParameter("userid");
			 model.addAttribute("userid", userid);
		   return "yiyuan/ryxq_adlvli";
	   }
	   /**
	    * 跳转到增加健康档案页面
	    */
	    @RequestMapping("/ToAdjkda")
	    public String ToAdjkda(Model model ,HttpServletRequest req){
	    	 String userid = req.getParameter("userid");
			 model.addAttribute("userid", userid);
	    	return "yiyuan/ryxq_adjkda";
	    }
}
