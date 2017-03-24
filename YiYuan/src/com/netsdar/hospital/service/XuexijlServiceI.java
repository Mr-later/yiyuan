package com.netsdar.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYXuexijingliMapper;
import com.netsdar.hospital.entity.YYXuexijingli;

@Service
public class XuexijlServiceI {

		@Autowired
		YYXuexijingliMapper  xuexijlMap;

		public void addElement(YYXuexijingli xuexijl) {
			// TODO Auto-generated method stub
			xuexijlMap.insert(xuexijl);
		}

		public List<YYXuexijingli> getListByUserId(int id) {
			// TODO Auto-generated method stub
			return xuexijlMap.getListByUserId(id);
		}
}
