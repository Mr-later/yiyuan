package com.netsdar.hospital.dao;

import java.util.HashMap;

import com.netsdar.hospital.entity.YYUserrole;

public interface YYUserroleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYUserrole record);

    int insertSelective(YYUserrole record);

    YYUserrole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYUserrole record);

    int updateByPrimaryKey(YYUserrole record);

	void insertByMap(HashMap<String, Object> map);

	void deleteByUserId(Integer id);

	void deleteByRoleId(int id);

}