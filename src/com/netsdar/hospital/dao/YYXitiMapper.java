package com.netsdar.hospital.dao;

import com.netsdar.hospital.entity.YYXiti;

public interface YYXitiMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYXiti record);

    int insertSelective(YYXiti record);

    YYXiti selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYXiti record);

    int updateByPrimaryKey(YYXiti record);
}