package com.netsdar.hospital.dao;

import com.netsdar.hospital.entity.YYUserorg;

public interface YYUserorgMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYUserorg record);

    int insertSelective(YYUserorg record);

    YYUserorg selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYUserorg record);

    int updateByPrimaryKey(YYUserorg record);
}