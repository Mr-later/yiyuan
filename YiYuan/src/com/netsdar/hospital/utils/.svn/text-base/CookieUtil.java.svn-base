package com.netsdar.hospital.utils;



import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;


public class CookieUtil {
	
	//protected static HttpServletRequest request;
	//protected static HttpServletResponse response;
	/**
	 * 增加Cookie ： key、value必须
	 * @param key
	 * @param domain
	 * @param path
	 * @param maxAge
	 * @param value
	 * @return
	 */
	public static boolean addCookie(HttpServletResponse response,String key,String domain,String path,Integer maxAge,String value){
		Cookie cookie = null;
		try {
			cookie = new Cookie(key, URLEncoder.encode(value, "UTF-8"));
			if (null != domain){
				cookie.setDomain(domain);
			}
			if (null != path){
				cookie.setPath(path);
			}
			if (null != maxAge){
				cookie.setMaxAge(maxAge);
			}
			response.addCookie(cookie);
		} catch (UnsupportedEncodingException e) {
			return false;
		}
		return true;
	}
	
	/**
	 * 跟据Key获取Cookie ： key 必须
	 * @param key
	 * @param domain
	 * @param path
	 * @return
	 */
	protected static Cookie getCookie(HttpServletRequest request,String key,String domain,String path){
		Cookie[] cookies = request.getCookies();
		if (null != cookies){
			for (Cookie c:cookies){
				if (c.getName().equalsIgnoreCase(key)){
					if (null != domain && !c.getDomain().equalsIgnoreCase(domain)){
						continue;
					}else if (null != path && !c.getPath().equalsIgnoreCase(path)){
						continue;
					}
					return c;
				}
			}
		}
		return null;
	}
	
	/**
	 * 根据Key获取Value ： Key必须
	 * @param key
	 * @param domain
	 * @param path
	 * @return
	 */
	public static String getCookieValue(HttpServletRequest request,String key,String domain,String path){
		Cookie c = CookieUtil.getCookie( request,key, domain, path);
		if (null != c){
			try {
				return new String(URLDecoder.decode(c.getValue(), "UTF-8"));
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * 根据Key删除Cookie
	 * @param key
	 * @param domain
	 * @param path
	 */
	protected void removeCookie(HttpServletRequest request,HttpServletResponse response,String key,String domain,String path){
		Cookie c = this.getCookie(request,key, domain, path);
		if (null != c){
			c.setValue("");
			c.setMaxAge(0);
			response.addCookie(c);
		}
	}
 	 
	private static void outString(HttpServletResponse response,String str) {
		PrintWriter out = null;
		try {
			response.setContentType("text/javascript;charset=UTF-8");
			out = response.getWriter();
			out.write(str);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (null != out) {
				out.flush();
				out.close();
			}
		}
	}

	/**
	 * 输出JSON格式字符串
	 * 
	 * @param str
	 */
	public static void outJsonString(HttpServletResponse response,String str) {
		outString(response,str);
	}

	/**
	 * 格式化对象为JSON格式
	 * 
	 * @param obj
	 * @return
	 */
	public String outJson(Object obj) {
		return JSONObject.toJSONString(obj);
	}

	/**
	 * 格式化对象为JSON格式
	 * 
	 * @param array
	 * @return
	 */
	public String outJsonArray(Object array) {
		return JSONArray.toJSONString(array);
	}
	
}
