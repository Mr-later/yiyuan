package com.netsdar.hospital.dao;

import com.netsdar.hospital.entity.YYXuexijingli;

public interface YYXuexijingliMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYXuexijingli record);

    int insertSelective(YYXuexijingli record);

    YYXuexijingli selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYXuexijingli record);

    int updateByPrimaryKey(YYXuexijingli record);
}