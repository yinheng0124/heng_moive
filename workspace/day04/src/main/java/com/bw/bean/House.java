package com.bw.bean;

public class House {
	private Integer house_id;
	private String house_address;
	private  String  house_use;
	private  Double  house_area;
	private  String  house_pec;
	
	
	private String  hname; //列表显示房主姓名（通过 group by实现，把房主姓名进行拼接）


	/**
	 * @return the house_id
	 */
	public Integer getHouse_id() {
		return house_id;
	}


	/**
	 * @param house_id the house_id to set
	 */
	public void setHouse_id(Integer house_id) {
		this.house_id = house_id;
	}


	/**
	 * @return the house_address
	 */
	public String getHouse_address() {
		return house_address;
	}


	/**
	 * @param house_address the house_address to set
	 */
	public void setHouse_address(String house_address) {
		this.house_address = house_address;
	}


	/**
	 * @return the house_use
	 */
	public String getHouse_use() {
		return house_use;
	}


	/**
	 * @param house_use the house_use to set
	 */
	public void setHouse_use(String house_use) {
		this.house_use = house_use;
	}


	/**
	 * @return the house_area
	 */
	public Double getHouse_area() {
		return house_area;
	}


	/**
	 * @param house_area the house_area to set
	 */
	public void setHouse_area(Double house_area) {
		this.house_area = house_area;
	}


	/**
	 * @return the house_pec
	 */
	public String getHouse_pec() {
		return house_pec;
	}


	/**
	 * @param house_pec the house_pec to set
	 */
	public void setHouse_pec(String house_pec) {
		this.house_pec = house_pec;
	}


	/**
	 * @return the hname
	 */
	public String getHname() {
		return hname;
	}


	/**
	 * @param hname the hname to set
	 */
	public void setHname(String hname) {
		this.hname = hname;
	}
	

	
	

}
