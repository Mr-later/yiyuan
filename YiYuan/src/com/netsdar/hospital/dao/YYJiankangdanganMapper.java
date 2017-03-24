package com.netsdar.hospital.dao;

import java.util.List;

import com.netsdar.hospital.entity.YYJiankangdangan;

public interface YYJiankangdanganMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYJiankangdangan record);

    int insertSelective(YYJiankangdangan record);

    YYJiankangdangan selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYJiankangdangan record);

    int updateByPrimaryKey(YYJiankangdangan record);

	List<YYJiankangdangan> getListByUserId(int id);
}