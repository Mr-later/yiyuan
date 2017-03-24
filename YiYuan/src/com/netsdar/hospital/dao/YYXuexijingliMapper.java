package com.netsdar.hospital.dao;

import java.util.List;

import com.netsdar.hospital.entity.YYXuexijingli;

public interface YYXuexijingliMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYXuexijingli record);

    int insertSelective(YYXuexijingli record);

    YYXuexijingli selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYXuexijingli record);

    int updateByPrimaryKey(YYXuexijingli record);

	List<YYXuexijingli> getListByUserId(int id);
}