package com.bw.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.bw.bean.House;
import com.bw.bean.HouseOwner;
import com.bw.bean.SysUser;

public interface HouseDao {

	@Select("select  *  from sysuser where user_name=#{user_name} and user_password=#{user_password}")
	SysUser login(SysUser u);

	List<House> getList(House h);

	@Select("select  *  from  houseowner")
	List<HouseOwner> getOlist();

	void addhouse(@Param("h")House h);

	void addCenter(@Param("hid")Integer house_id, @Param("oids")Integer[] oids);

	@Select("select  *  from house where house_id =#{hid}")
	House getOneById(@Param("hid")int hid);

	@Select("select owner_id from center where house_id =#{hid} ")
	List<Integer> getOidsByHid(@Param("hid")int hid);


	void updateHoues(@Param("h")House h);

	@Delete("delete from  center where house_id =#{hid}")
	void delCenter(@Param("hid")Integer house_id);

}
