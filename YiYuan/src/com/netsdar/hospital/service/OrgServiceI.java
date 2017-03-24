package com.netsdar.hospital.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYOrginfoMapper;
import com.netsdar.hospital.entity.YYDict;
import com.netsdar.hospital.entity.YYOrginfo;


@Service
public class OrgServiceI {
	
	@Autowired
	private YYOrginfoMapper yyOrginfoMapper;
	
	public List<YYOrginfo> selectAll() {
		// TODO Auto-generated method stub
		return yyOrginfoMapper.selectAll();
	}

	public List<YYOrginfo> selectOrgListByPid(int pid) {
		// TODO Auto-generated method stub
		return yyOrginfoMapper.selectOrgListByPid(pid);
	}

	public YYOrginfo selectByPrimaryKey(int id) {
		return yyOrginfoMapper.selectByPrimaryKey(id);
	}

	public void addElement(YYOrginfo yYOrginfo) {
		// TODO Auto-generated method stub
		yyOrginfoMapper.insertSelective(yYOrginfo);
	}
	
	public void editElement(YYOrginfo yYOrginfo) {
		// TODO Auto-generated method stub
		yyOrginfoMapper.updateByPrimaryKeySelective(yYOrginfo);
	}

	//递归删除所有组织机构，及其所有子节点
	public void deletebyId(int id) {
		// TODO Auto-generated method stub
		List<YYOrginfo> orgList= yyOrginfoMapper.selectOrgListByPid(id);
		if(orgList!=null&&orgList.isEmpty()!=true)
		{
			for(int i=0;i<orgList.size();i++)
			{
				deletebyId(orgList.get(i).getId());
			}
		}
		yyOrginfoMapper.deleteByPrimaryKey(id);
		
		
	}
	/**
	 * 找到所有的组
	 * @return
	 */
	public List<YYOrginfo> getZu() {
		// TODO Auto-generated method stub
		return yyOrginfoMapper.getZu();
	}
	
	
	/*public List<YYDict> getListDict(LinkedHashMap<String, Object> map) {
		List<YYDict> yydict = yyOrginfoMapper.getListDict(map);
		return yydict;
	}

	public void addElement(YYDict yyDict) {
		// TODO Auto-generated method stub
		yyOrginfoMapper.insertSelective(yyDict);
	}
	
	public int deletebyid(int id){
		return 	yyOrginfoMapper.deleteByPrimaryKey(id);
	}

	public YYDict selectByPrimaryKey(int id) {
		// TODO Auto-generated method stub
		return yyOrginfoMapper.selectByPrimaryKey(id);
	}

	public void editElement(YYDict yyDict) {
		// TODO Auto-generated method stub
		yyOrginfoMapper.updateByPrimaryKeySelective(yyDict);
	}
	
	public YYDict getMMDById (int id){
		
		return yyOrginfoMapper.selectByPrimaryKey(id);
	}

	public List<YYDict> selectAll() {
		// TODO Auto-generated method stub
		return yyOrginfoMapper.selectAll();
	}*/
	
}
