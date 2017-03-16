package com.netsdar.hospital.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/pageController")
public class PageController {

	
	
	@RequestMapping("/jumpPage")
	public String jumpPage(Model model, String toPageName) {
		
		return toPageName;

	}
	
	
	
}
