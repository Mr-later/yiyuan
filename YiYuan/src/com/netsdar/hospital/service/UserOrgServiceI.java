package com.netsdar.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYUserorgMapper;
import com.netsdar.hospital.entity.YYUserinfo;

@Service
public class UserOrgServiceI {

	@Autowired
	YYUserorgMapper yyUserorgMapper;
		
}
