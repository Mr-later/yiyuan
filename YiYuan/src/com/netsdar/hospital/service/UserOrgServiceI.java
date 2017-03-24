package com.netsdar.hospital.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYUserorgMapper;
import com.netsdar.hospital.entity.YYUserorg;

@Service
public class UserOrgServiceI {

	@Autowired
	YYUserorgMapper yyUserorgMapper;

	public void addByMap(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		yyUserorgMapper.addByMap(map);
	}
	
	public void deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		yyUserorgMapper.deleteByPrimaryKey(id);
	}
/**
 * 根据用户id组织机构id 去userorg表中查询数据
 * @param map
 * @return
 */
	public List<YYUserorg> findByUserIdOrgId(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return yyUserorgMapper.findByUserIdOrgId(map);
	}

	public void delTimeMark(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		yyUserorgMapper.delTimeMark(map);
	}

	public void updateByPrimaryKeySelective(YYUserorg userorg) {
		// TODO Auto-generated method stub
		yyUserorgMapper.updateByPrimaryKeySelective(userorg);
	}


		
}
