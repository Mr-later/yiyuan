package com.netsdar.hospital.dao;

import com.netsdar.hospital.entity.YYUserfile;

public interface YYUserfileMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYUserfile record);

    int insertSelective(YYUserfile record);

    YYUserfile selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYUserfile record);

    int updateByPrimaryKey(YYUserfile record);
}