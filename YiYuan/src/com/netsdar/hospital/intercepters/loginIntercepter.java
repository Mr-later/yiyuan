package com.netsdar.hospital.intercepters;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/*
 *
 * 拦截所有未登录用户
 */
public class loginIntercepter implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session=request.getSession();
//		String uri = request.getRequestURI();
//		Ts_User ts_user = (Ts_User) session.getAttribute("userAccess");
//		
//		if(null==ts_user){
//			   PrintWriter out = response.getWriter();  
//               StringBuilder builder = new StringBuilder();  
//               builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");  
//               builder.append("alert(\"页面过期，请重新登录\");");  
//               builder.append("window.top.location.href=\"");  
//               builder.append("http://localhost:8080/ajaxLogin");  
//               builder.append("\";</script>");  
//               out.print(builder.toString());  
//               out.close();  
//			return false;
//		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
