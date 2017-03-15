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
@RequestMapping("/pageController")
public class PageController {

	
	
	@RequestMapping("/jumpPage")
	public String jumpPage(Model model, String toPageName) {
		
		return toPageName;

	}
	
	
	
}
