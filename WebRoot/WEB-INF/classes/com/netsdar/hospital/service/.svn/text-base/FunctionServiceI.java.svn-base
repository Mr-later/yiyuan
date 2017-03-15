package com.netsdar.hospital.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYFunctionMapper;
import com.netsdar.hospital.entity.YYFunction;
@Service
public class FunctionServiceI {

		@Autowired
		YYFunctionMapper yyFunctionMapper;
	public List<YYFunction> getListFunction(LinkedHashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<YYFunction> list = yyFunctionMapper.getListFunction(map);
		return list;
	}

	public void addElement(YYFunction yyFunction) {
		// TODO Auto-generated method stub
		yyFunctionMapper.insert(yyFunction);
	}

	public void editElement(YYFunction yyFunction) {
		// TODO Auto-generated method stub
		yyFunctionMapper.updateByPrimaryKeySelective(yyFunction);
	}

	public YYFunction selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		YYFunction function = yyFunctionMapper.selectByPrimaryKey(id);
		return function;
	}

	public int deletebyid(int id) {
		// TODO Auto-generated method stub
		int i = yyFunctionMapper.deleteByPrimaryKey(id);
		return i;
	}

	public List<YYFunction> getAll() {
		// TODO Auto-generated method stub
		List<YYFunction> all = yyFunctionMapper.getAll();
		return all;
	}

	public List<YYFunction> selectAll() {
		// TODO Auto-generated method stub
		List<YYFunction> all = yyFunctionMapper.selectAll();
		return all;
	}

	public List<YYFunction> allTreeNodeByUser(Integer valueOf) {
		// TODO Auto-generated method stub
		return yyFunctionMapper.allTreeNodeByUser(valueOf);
	}


}
