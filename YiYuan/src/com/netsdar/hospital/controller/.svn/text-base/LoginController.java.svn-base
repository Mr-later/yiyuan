package com.netsdar.hospital.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.netsdar.hospital.utils.CookieUtil;

@Controller
public class LoginController {

//	@Autowired
//	LoginServiceI loginServiceI;
	/*
	 * @author Administrator 登录信息
	 * **/
	@RequestMapping("/ajaxLogin")
	public String ajaxLogin(Model model, HttpServletRequest request,
			HttpServletResponse response) throws IOException {
//		String loginName = request.getParameter("loginName");
//		String pwd = request.getParameter("password");
//		HashMap<String, String> msg = new HashMap<String, String>();
//		if (null == loginName || null == pwd || "".equals(loginName)
//				|| "".equals(pwd)) {
//			msg.put("msg", "用户名密码不能为空，请重新输入");
//		} else {
//			MMUser mmuer = checkLogin(request, response,
//					StringUtil.EncoderByMd5(pwd), loginName);
//			if (null != mmuer) {
//				if (null != request.getParameter("checkbox")) {
//					// cookie储存时间
//					int maxAge = 60 * 60 * 24 * 7;
//					CookieUtil.addCookie(response, "userLoginName", null, null,
//							maxAge, loginName);
//					CookieUtil.addCookie(response, "userPwd", null, null,
//							maxAge, StringUtil.EncoderByMd5(pwd));
//				}
//				/** 存儲權限菜單菜單 **/
//				 List<MMFunction> function=loginServiceI.allTreeNodeByUser(mmuer.getRoleid());
//				 model.addAttribute("function",function);
//				 request.getSession().setAttribute("function", function);
//				return "index";
//			} else {
//				msg.put("msg", "用户名密码不正确，请重新填写");
//			}
//		}
//		model.addAttribute("msg", msg.get("msg"));
//		return "login";
		return "index";
	}

	@RequestMapping("/")
	public String login(HttpServletRequest request,
			HttpServletResponse response, Model model) {
//		// 获取cookie
//		String userLoginName = null;
//		String userPwd = null;
//		// 不同浏览器调用会抛异常--cookie无法共用
//		try {
//			userLoginName = CookieUtil.getCookieValue(request, "userLoginName",
//					null, null);
//			userPwd = CookieUtil.getCookieValue(request, "userPwd", null, null);
//		} catch (Exception e) {
//			System.out.println("读取cookie发生异常 ..");
//		}
//		if (null != userLoginName && null != userPwd) {
//			// 使用cookie进行验证
//			MMUser mmu = checkLogin(request, response, StringUtil.EncoderByMd5(userPwd), userLoginName);
//			if (null != mmu) {
//				/*
//				 * List<Ts_Function> function
//				 * =menuService.allTreeNodeByUser(t_user.getRoleId());
//				 * model.addAttribute("function",function);
//				 */
//				return "index";
//			}
//		}
		return "login";
	}
//
//	private MMUser checkLogin(HttpServletRequest request,
//			HttpServletResponse response, String pwd, String loginName) {
////		MMUser mmu = null;
////		MMRole mmr = null;
////		HashMap<String, String> parameter = new HashMap<String, String>();
////		parameter.put("name", loginName);
////		parameter.put("pwd", pwd);
////		try {
////			mmu = loginServiceI.queryUserAccess(parameter);
////			mmr = loginServiceI.queryRoleByUser(mmu.getRoleid());
////			if (null != mmu) {
////				// 缓存用户信息
////				request.getSession().setAttribute("userAccess", mmu);
////				request.getSession().setAttribute("roleAccess", mmr);
////			}
////		} catch (Exception e) {
////			e.printStackTrace();
////			System.out.println("********====********>>>" + e);
////		}
//		return mmu;
//	}

	/**
	 * 退出
	 * 
	 * @return
	 */
	
	 @RequestMapping("/logout") 
	 public String logout(HttpServletRequest request,HttpServletResponse response) { // 清除cookie
	  CookieUtil.addCookie(response, "userLoginName", null, null, 0, "");
	  CookieUtil.addCookie(response, "userPwd", null, null, 0, "");
	  request.getSession().invalidate();
	  return "login"; 
	  }
	 
}
