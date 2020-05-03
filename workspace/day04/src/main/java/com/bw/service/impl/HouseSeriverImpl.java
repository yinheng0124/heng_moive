package com.bw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bw.bean.House;
import com.bw.bean.HouseOwner;
import com.bw.bean.SysUser;
import com.bw.dao.HouseDao;
import com.bw.service.HouseSeriver;

@Service
@Transactional(isolation=Isolation.DEFAULT,propagation=Propagation.REQUIRED)
public class HouseSeriverImpl implements HouseSeriver {
	
	@Autowired
	private HouseDao  dao;

	@Override
	public SysUser login(SysUser u) {
		// TODO Auto-generated method stub
		return dao.login(u);
	}
	
	
	@Override
	public List<House> getList(House h) {
		// TODO Auto-generated method stub
		return dao.getList(h);
	}
	
	@Override
	public List<HouseOwner> getOlist() {
		// TODO Auto-generated method stub
		return dao.getOlist();
	}

	
	@Override
	public void addh(House h, Integer[] oids) {
		//添加房屋信息
		dao.addhouse(h);
		
		//添加房屋对应的房主 建立关系（操作中间表进行关联）
		dao.addCenter(h.getHouse_id(),oids);
	}
	@Override
	public House getOneById(int hid) {
		return dao.getOneById(hid);
	}
	
	
	
	@Override
	public List<Integer> getOidsByHid(int hid) {
		return dao.getOidsByHid(hid);
	}
	
	@Override
	public void updateHoues(House h, Integer[] oids) {
		dao.updateHoues(h); //修改基本信息
		dao.delCenter(h.getHouse_id()); //删除该房子以前的房主
		//添加房屋对应的房主 建立关系（操作中间表进行关联）
		dao.addCenter(h.getHouse_id(),oids);
		
		
	}
}
