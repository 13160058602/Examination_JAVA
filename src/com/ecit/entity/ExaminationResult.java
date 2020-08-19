package com.ecit.entity;

import java.util.Date;

public class ExaminationResult {
	private Integer id;
	private Integer emId;
	private Date realStartTime;
	private Date realEndTime;
	private Integer score;
	private Integer isPass;
	private Integer index;
	
	
	
	public Integer getIndex() {
		return index;
	}
	public void setIndex(Integer index) {
		this.index = index;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getEmId() {
		return emId;
	}
	public void setEmId(Integer emId) {
		this.emId = emId;
	}
	public Date getRealStartTime() {
		return realStartTime;
	}
	public void setRealStartTime(Date realStartTime) {
		this.realStartTime = realStartTime;
	}
	public Date getRealEndTime() {
		return realEndTime;
	}
	public void setRealEndTime(Date realEndTime) {
		this.realEndTime = realEndTime;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	public Integer getIsPass() {
		return isPass;
	}
	public void setIsPass(Integer isPass) {
		this.isPass = isPass;
	}
}
