package com.ecit.entity;

public class UserType {
	private Integer id;
	private String name;
	private Integer withOut = 0;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getWithOut() {
		return withOut;
	}
	public void setWithOut(Integer withOut) {
		this.withOut = withOut;
	}
	
}
