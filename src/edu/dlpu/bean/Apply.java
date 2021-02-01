package edu.dlpu.bean;

import java.util.Date;

public class Apply {

	private Integer applyId;
	private Integer confId;
	private String applyInfo;
	// 关系表
	private Integer userId;
	private Date applyTime;

	public Integer getApplyId() {
		return applyId;
	}

	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}

	public Integer getConfId() {
		return confId;
	}

	public void setConfId(Integer confId) {
		this.confId = confId;
	}

	public String getApplyInfo() {
		return applyInfo;
	}

	public void setApplyInfo(String applyInfo) {
		this.applyInfo = applyInfo;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(Date applyTime) {
		this.applyTime = applyTime;
	}

	@Override
	public String toString() {
		return "Apply [applyId=" + applyId + ", confId=" + confId + ", applyInfo=" + applyInfo + ", userId=" + userId
				+ ", applyTime=" + applyTime + "]";
	}

}
