package com.netsdar.hospital.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.netsdar.hospital.dao.YYUserinfoMapper;
import com.netsdar.hospital.entity.YYUserinfo;
import com.netsdar.hospital.utils.StringUtil;

@Service
public class UserinfoServiceI {

		@Autowired
		YYUserinfoMapper yyUserinfoMapper;
		public int insertSelective(YYUserinfo  yyUserinfo){
			return yyUserinfoMapper.insertSelective(yyUserinfo);
		}
		public List<YYUserinfo> getList(LinkedHashMap<String, Object> map) {
			// TODO Auto-generated method stub
			return yyUserinfoMapper.getListUserinfo( map);
		}
		public int addElement(YYUserinfo yyUserinfo) {
			// TODO Auto-generated method stub
			if(yyUserinfo.getPassword() != null && yyUserinfo.getPassword() != ""){
				String pass = StringUtil.EncoderByMd5(yyUserinfo.getPassword());
				yyUserinfo.setPassword(pass);
			}
			return yyUserinfoMapper.insert(yyUserinfo);
		}
		public int UpdateTemp7ById(int id) {
			// TODO Auto-generated method stub
			return yyUserinfoMapper.UpdateTemp7ById(id);
		}
		public YYUserinfo selectByPrimaryKey(int id) {
			// TODO Auto-generated method stub
			return yyUserinfoMapper.selectByPrimaryKey(id);
		}
		public int editElement(YYUserinfo yyUserinfo) {
			// TODO Auto-generated method stub
			if(yyUserinfo.getPassword() != null && yyUserinfo.getPassword() != ""){
				String pass = StringUtil.EncoderByMd5(yyUserinfo.getPassword());
				yyUserinfo.setPassword(pass);
			}
			return yyUserinfoMapper.updateByPrimaryKeySelective(yyUserinfo);
		}
		public YYUserinfo selectByname(String name) {
			// TODO Auto-generated method stub
			return yyUserinfoMapper.selectByname(name);
		}
		/**
		 * 根据组织机构编码得到用户
		 * @param id
		 * @return
		 */
		public List<YYUserinfo> GetUsersByOrgid(int id) {
			// TODO Auto-generated method stub
			List<YYUserinfo> leads =yyUserinfoMapper.GetUsersByOrgid(id);
			return leads;
		}
		
}
