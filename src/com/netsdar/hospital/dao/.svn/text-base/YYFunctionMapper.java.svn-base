package com.netsdar.hospital.dao;

import java.util.LinkedHashMap;
import java.util.List;

import com.netsdar.hospital.entity.YYFunction;

public interface YYFunctionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYFunction record);

    int insertSelective(YYFunction record);

    YYFunction selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYFunction record);

    int updateByPrimaryKey(YYFunction record);
    
    List<YYFunction> getListFunction(LinkedHashMap<String, Object> map);
    
    List<YYFunction> getAll();
    
    List<YYFunction> selectAll();

	List<YYFunction> allTreeNodeByUser(Integer valueOf);
    
}