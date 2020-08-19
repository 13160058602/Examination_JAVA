package com.ecit.entity;

import java.util.Date;

public class User {
	private Integer id;
	private String userNameLike;
	private String userName;
	private String passWord;
	private Integer sex;
	private Integer age;
	private String phone;
	private String idCard;
	private Integer userTypeId;
	private String userTypeName;
	private Date createTime;
	private Date updateTime;
	private Integer isDelete = 0;
	private Integer stuts = 0;
	private String realName;
	private Integer withOut=0;
	private Integer index;//£¨µ±Ç°Ò³-1£©*size
	private Integer size;//
	
	
	
	public User() {
		super();
	}

	public User(Integer id) {
		super();
		this.id = id;
	}
	
	public String getUserNameLike() {
		return userNameLike;
	}
	public void setUserNameLike(String userNameLike) {
		this.userNameLike = userNameLike;
	}
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getWithOut() {
		return withOut;
	}
	public void setWithOut(Integer withOut) {
		this.withOut = withOut;
	}
	public Integer getStuts() {
		return stuts;
	}
	public void setStuts(Integer stuts) {
		this.stuts = stuts;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getIdCard() {
		return idCard;
	}
	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}
	public Integer getUserTypeId() {
		return userTypeId;
	}
	public void setUserTypeId(Integer userTypeId) {
		this.userTypeId = userTypeId;
	}
	public String getUserTypeName() {
		return userTypeName;
	}
	public void setUserTypeName(String userTypeName) {
		this.userTypeName = userTypeName;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	@Override
	public String toString() {
		return "User [age=" + age + ", createTime=" + createTime + ", id=" + id
				+ ", idCard=" + idCard + ", isDelete=" + isDelete
				+ ", passWord=" + passWord + ", phone=" + phone + ", sex="
				+ sex + ", updateTime=" + updateTime + ", userName=" + userName
				+ ", userTypeId=" + userTypeId + ", userTypeName="
				+ userTypeName + "]";
	}
	
}
