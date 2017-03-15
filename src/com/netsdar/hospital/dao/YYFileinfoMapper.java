package com.netsdar.hospital.dao;

import com.netsdar.hospital.entity.YYFileinfo;

public interface YYFileinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYFileinfo record);

    int insertSelective(YYFileinfo record);

    YYFileinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYFileinfo record);

    int updateByPrimaryKey(YYFileinfo record);
}