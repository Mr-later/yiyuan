package com.netsdar.hospital.dao;

import java.util.List;

import com.netsdar.hospital.entity.YYZhengshu;

public interface YYZhengshuMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYZhengshu record);

    int insertSelective(YYZhengshu record);

    YYZhengshu selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYZhengshu record);

    int updateByPrimaryKey(YYZhengshu record);

	List<YYZhengshu> getListByUserId(int id);
}