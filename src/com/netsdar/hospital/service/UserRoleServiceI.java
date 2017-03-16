package com.netsdar.hospital.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYUserroleMapper;

@Service
public class UserRoleServiceI {

		@Autowired
		YYUserroleMapper yyUserroleMapper;

		public void insertByMap(HashMap<String, Object> map) {
			// TODO Auto-generated method stub
			yyUserroleMapper.insertByMap(map);
		}

		public void deleteByUserId(Integer id) {
			// TODO Auto-generated method stub
			yyUserroleMapper.deleteByUserId(id);
		}

		public void deleteByRoleId(int id) {
			// TODO Auto-generated method stub
			yyUserroleMapper.deleteByRoleId(id);
		}


}
