package com.netsdar.hospital.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYRoleinfoMapper;
import com.netsdar.hospital.entity.YYRoleinfo;
@Service
public class RoleinfoServiceI {

		@Autowired
		YYRoleinfoMapper yyRoleinfoMapper;
	public List<YYRoleinfo> getListRoleinfo(LinkedHashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return yyRoleinfoMapper.getListRoleinfo(map);
	}

	public void addElement(YYRoleinfo yyRoleinfo) {
		// TODO Auto-generated method stub
		yyRoleinfoMapper.insert(yyRoleinfo);
	}

	public int deletebyid(int id) {
		// TODO Auto-generated method stub
		return yyRoleinfoMapper.deleteByPrimaryKey(id);
	}

	public YYRoleinfo selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return yyRoleinfoMapper.selectByPrimaryKey(id);
	}

	public void editElement(YYRoleinfo yyRoleinfo) {
		// TODO Auto-generated method stub
		yyRoleinfoMapper.updateByPrimaryKey(yyRoleinfo);
	}

	public void insertAndGetId(YYRoleinfo yyRoleinfo) {
		// TODO Auto-generated method stub
		yyRoleinfoMapper.insertAndGetId(yyRoleinfo);
	}

	

	public List<YYRoleinfo> allTreeNodeByUser(Integer valueOf) {
		// TODO Auto-generated method stub
		return yyRoleinfoMapper.allTreeNodeByUser(valueOf);
	}

	public List<YYRoleinfo> selectByUserId(Integer id) {
		// TODO Auto-generated method stub
		return yyRoleinfoMapper.selectByUserId(id);
	}

}
