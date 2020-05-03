package com.bw.service;

import java.util.List;

import com.bw.bean.House;
import com.bw.bean.HouseOwner;
import com.bw.bean.SysUser;

public interface HouseSeriver {

	SysUser login(SysUser u);

	List<House> getList(House h);

	List<HouseOwner>  getOlist();

	void addh(House h, Integer[] oids);

	House getOneById(int hid);

	List<Integer> getOidsByHid(int hid);

	void updateHoues(House h, Integer[] oids);
	
	void say();
}
