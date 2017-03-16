package com.netsdar.hospital.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYButtoninfoMapper;
import com.netsdar.hospital.entity.YYButtoninfo;
import com.netsdar.hospital.entity.YYDict;
@Service
public class ButtoninfoServiceI {

	@Autowired
	private YYButtoninfoMapper yyButtonifoMapper;
	public List<YYButtoninfo> getListButtoninfo(LinkedHashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<YYButtoninfo> yyButtoninfos = yyButtonifoMapper.getListButtoninfo(map);
		return yyButtoninfos;
	}

	public void addElement(YYButtoninfo yyButtoninfo) {
		// TODO Auto-generated method stub
		yyButtonifoMapper.insert(yyButtoninfo);
	}

	public int deletebyid(int id) {
		// TODO Auto-generated method stub
		int key = yyButtonifoMapper.deleteByPrimaryKey(id);
		return key;
	}

	public YYButtoninfo selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		YYButtoninfo yyButtoninfo = yyButtonifoMapper.selectByPrimaryKey(id);
		return yyButtoninfo;
	}

	public void editElement(YYButtoninfo yyButtoninfo) {
		// TODO Auto-generated method stub
		yyButtonifoMapper.updateByPrimaryKeySelective(yyButtoninfo);
	}
	
	public List<YYButtoninfo> selectAll() {
		// TODO Auto-generated method stub
		return yyButtonifoMapper.selectAll();
	}

	public List<YYButtoninfo> allTreeNodeByUser(Integer valueOf) {
		// TODO Auto-generated method stub
		return yyButtonifoMapper.allTreeNodeByUser(valueOf);
	} 

}
