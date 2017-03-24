package com.netsdar.hospital.dao;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import com.netsdar.hospital.entity.YYUserinfo;

public interface YYUserinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYUserinfo record);

    int insertSelective(YYUserinfo record);

    YYUserinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYUserinfo record);

    int updateByPrimaryKey(YYUserinfo record);

    //获得所有在职用户
	List<YYUserinfo> getListUserinfo(LinkedHashMap<String, Object> map);

	YYUserinfo selectByLoginname(String name);

	int UpdateTemp7ById(int id);

	List<YYUserinfo> GetUsersByOrgid(int id);


	List<YYUserinfo> GetUsersNotInOrg(int orgid);
}