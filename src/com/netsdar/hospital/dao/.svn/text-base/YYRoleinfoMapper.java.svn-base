package com.netsdar.hospital.dao;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import com.netsdar.hospital.entity.YYRoleinfo;

public interface YYRoleinfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYRoleinfo record);

    int insertSelective(YYRoleinfo record);

    YYRoleinfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYRoleinfo record);

    int updateByPrimaryKey(YYRoleinfo record);
    
    List<YYRoleinfo> selectAll();
    
    List<YYRoleinfo> getListRoleinfo(LinkedHashMap<String, Object> map);

	void insertAndGetId(YYRoleinfo yyRoleinfo);

	void insertByMap(Map map);


	List<YYRoleinfo> allTreeNodeByUser(Integer valueOf);

	List<YYRoleinfo> selectByUserId(Integer id);

}