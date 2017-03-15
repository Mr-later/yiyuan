package com.netsdar.hospital.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYRolefunctionMapper;
import com.netsdar.hospital.dao.YYRoleinfoMapper;
@Service
public class RoleFunctionServiceI {

		@Autowired
		YYRolefunctionMapper yyRolefunctionMapper;
	public  void insertByMap(Map map) {
		// TODO Auto-generated method stub
		yyRolefunctionMapper.insertByMap(map);
	}
	public void deleteByRoleId(Integer id) {
		// TODO Auto-generated method stub
		yyRolefunctionMapper.deleteByRoleId(id);
	}

}
