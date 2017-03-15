package com.netsdar.hospital.dao;

import java.util.LinkedHashMap;
import java.util.List;

import com.netsdar.hospital.entity.YYDict;

public interface YYDictMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYDict record);

    int insertSelective(YYDict record);

    YYDict selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYDict record);

    int updateByPrimaryKey(YYDict record);

	List<YYDict> selectAll();

	List<YYDict> getListDict(LinkedHashMap<String, Object> map);
}