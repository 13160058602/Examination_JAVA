package com.ecit.entity;

import java.util.Date;

public class ClassMessage {
	private Integer id;
	private String name;
	private String nameLike;
	private Integer userId;
	private String realName;
	private Integer classTypeId;
	private String classTypeName;
	private Integer classLevelId;
	private String classLevelName;
	private Integer totalScore;
	private Integer passingGrade;
	private Date createTime;
	private Date updateTime;
	private Integer cycle;
	private Integer idDelete = 0;
	
	private Integer index;
	private Integer size;
	
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
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Integer getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(Integer totalScore) {
		this.totalScore = totalScore;
	}
	public Integer getPassingGrade() {
		return passingGrade;
	}
	public void setPassingGrade(Integer passingGrade) {
		this.passingGrade = passingGrade;
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
	public Integer getCycle() {
		return cycle;
	}
	public void setCycle(Integer cycle) {
		this.cycle = cycle;
	}
	public Integer getIdDelete() {
		return idDelete;
	}
	public void setIdDelete(Integer idDelete) {
		this.idDelete = idDelete;
	}
	public Integer getClassTypeId() {
		return classTypeId;
	}
	public void setClassTypeId(Integer classTypeId) {
		this.classTypeId = classTypeId;
	}
	public String getClassTypeName() {
		return classTypeName;
	}
	public void setClassTypeName(String classTypeName) {
		this.classTypeName = classTypeName;
	}
	public Integer getClassLevelId() {
		return classLevelId;
	}
	public void setClassLevelId(Integer classLevelId) {
		this.classLevelId = classLevelId;
	}
	public String getClassLevelName() {
		return classLevelName;
	}
	public void setClassLevelName(String classLevelName) {
		this.classLevelName = classLevelName;
	}
	public String getNameLike() {
		return nameLike;
	}
	public void setNameLike(String nameLike) {
		this.nameLike = nameLike;
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
	
}
