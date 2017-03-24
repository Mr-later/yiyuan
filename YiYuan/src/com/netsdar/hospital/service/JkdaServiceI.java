package com.netsdar.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYJiankangdanganMapper;
import com.netsdar.hospital.entity.YYJiankangdangan;

@Service
public class JkdaServiceI {

		@Autowired
		YYJiankangdanganMapper  jkdaMap;

		public void addElement(YYJiankangdangan jkda) {
			// TODO Auto-generated method stub
			jkdaMap.insert(jkda);
		}

		public List<YYJiankangdangan> getListByUserId(int id) {
			// TODO Auto-generated method stub
			return jkdaMap.getListByUserId(id);
		}
}
