package com.netsdar.hospital.dao;

import java.util.HashMap;
import java.util.List;

import com.netsdar.hospital.entity.YYUserinfo;
import com.netsdar.hospital.entity.YYUserorg;

public interface YYUserorgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYUserorg record);

    int insertSelective(YYUserorg record);

    YYUserorg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYUserorg record);

    int updateByPrimaryKey(YYUserorg record);

	void addByMap(HashMap<String, Object> map);

	List<YYUserorg> findByUserIdOrgId(HashMap<String, Object> map);

	void delTimeMark(HashMap<String, Object> map);


}