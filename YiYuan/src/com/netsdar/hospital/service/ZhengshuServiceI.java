package com.netsdar.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYZhengshuMapper;
import com.netsdar.hospital.entity.YYZhengshu;

@Service
public class ZhengshuServiceI {

		@Autowired
		YYZhengshuMapper zhengshuMap;

		public void addElement(YYZhengshu zhengshu) {
			// TODO Auto-generated method stub
			zhengshuMap.insert(zhengshu);
		}

		public List<YYZhengshu> getListByUserId(int id) {
			// TODO Auto-generated method stub
			return zhengshuMap.getListByUserId(id);
		}
}
