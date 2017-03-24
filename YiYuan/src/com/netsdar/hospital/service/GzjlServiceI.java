package com.netsdar.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYGongzuojingliMapper;
import com.netsdar.hospital.entity.YYGongzuojingli;

@Service
public class GzjlServiceI {
	
	@Autowired
	YYGongzuojingliMapper gzjlMap;

	public void addElement(YYGongzuojingli gzjl) {
		// TODO Auto-generated method stub
		gzjlMap.insert(gzjl);
	}

	public List<YYGongzuojingli> getListByUserId(int id) {
		// TODO Auto-generated method stub
		return gzjlMap.getListByUserId(id);
	}

	public int deleteByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return gzjlMap.deleteByPrimaryKey(id);
	}

	public YYGongzuojingli selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return gzjlMap.selectByPrimaryKey(id);
	}

	public void editElement(YYGongzuojingli yyGongzuojingli) {
		// TODO Auto-generated method stub
		gzjlMap.updateByPrimaryKeySelective(yyGongzuojingli);
	}
}
