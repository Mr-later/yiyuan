package com.netsdar.hospital.dao;

import java.util.LinkedHashMap;
import java.util.List;

import com.netsdar.hospital.entity.YYButtoninfo;

public interface YYButtoninfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYButtoninfo record);

    int insertSelective(YYButtoninfo record);

    YYButtoninfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYButtoninfo record);

    int updateByPrimaryKey(YYButtoninfo record);

    List<YYButtoninfo> selectAll();

	List<YYButtoninfo> getListButtoninfo(LinkedHashMap<String, Object> map);
	
	List<YYButtoninfo> allTreeNodeByUser(Integer id);
}