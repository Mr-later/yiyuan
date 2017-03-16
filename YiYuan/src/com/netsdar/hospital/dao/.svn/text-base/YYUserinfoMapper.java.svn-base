package com.netsdar.hospital.dao;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.netsdar.hospital.entity.YYUserinfo;

public interface YYUserinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYUserinfo record);

    int insertSelective(YYUserinfo record);

    YYUserinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYUserinfo record);

    int updateByPrimaryKey(YYUserinfo record);

	List<YYUserinfo> getListUserinfo(LinkedHashMap<String, Object> map);

	YYUserinfo selectByname(String name);

	int deleteUpdate(int id);
}