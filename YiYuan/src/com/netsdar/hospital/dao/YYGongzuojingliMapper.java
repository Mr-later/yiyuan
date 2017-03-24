package com.netsdar.hospital.dao;

import java.util.List;

import com.netsdar.hospital.entity.YYGongzuojingli;

public interface YYGongzuojingliMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYGongzuojingli record);

    int insertSelective(YYGongzuojingli record);

    YYGongzuojingli selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYGongzuojingli record);

    int updateByPrimaryKey(YYGongzuojingli record);

	List<YYGongzuojingli> getListByUserId(int id);
}