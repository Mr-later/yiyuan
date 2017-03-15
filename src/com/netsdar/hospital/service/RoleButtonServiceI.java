package com.netsdar.hospital.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYRolebuttonMapper;

@Service
public class RoleButtonServiceI {

		@Autowired
		YYRolebuttonMapper yyRolebuttonMapper;
	public  void insertByMap(Map map) {
		// TODO Auto-generated method stub
		yyRolebuttonMapper.insertByMap(map);
	}
	public void deleteByRoleId(int roleId) {
		// TODO Auto-generated method stub
		yyRolebuttonMapper.deleteByRoleId(roleId);
	}

}
