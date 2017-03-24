package com.netsdar.hospital.dao;

import java.util.List;

import com.netsdar.hospital.entity.YYOrginfo;

public interface YYOrginfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(YYOrginfo record);

    int insertSelective(YYOrginfo record);

    YYOrginfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(YYOrginfo record);

    int updateByPrimaryKey(YYOrginfo record);

	List<YYOrginfo> selectAll();

	List<YYOrginfo> selectOrgListByPid(int pid);

	List<YYOrginfo> getZu();

}