package com.netsdar.hospital.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYDictMapper;
import com.netsdar.hospital.entity.YYDict;


@Service
public class DictServiceI {
	
	@Autowired
	private YYDictMapper yyDictMapper;
	
	public List<YYDict> getListDict(LinkedHashMap<String, Object> map) {
		List<YYDict> yydict = yyDictMapper.getListDict(map);
		return yydict;
	}

	public void addElement(YYDict yyDict) {
		// TODO Auto-generated method stub
		yyDictMapper.insertSelective(yyDict);
	}
	
	public int deletebyid(int id){
		return 	yyDictMapper.deleteByPrimaryKey(id);
	}

	public YYDict selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return yyDictMapper.selectByPrimaryKey(id);
	}

	public void editElement(YYDict yyDict) {
		// TODO Auto-generated method stub
		yyDictMapper.updateByPrimaryKeySelective(yyDict);
	}
	
	public YYDict getMMDById (int id){
		
		return yyDictMapper.selectByPrimaryKey(id);
	}

	public List<YYDict> selectAll() {
		// TODO Auto-generated method stub
		return yyDictMapper.selectAll();
	}
	
}
