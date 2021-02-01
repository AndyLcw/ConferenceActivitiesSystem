package edu.dlpu.bean;

import java.util.Date;

public class Sign {
	private Integer signId;
	private Integer riskId;
	private Integer confId;
	private String signInfo;
	private Integer userId;
	private Date signTime;

	public Integer getSignId() {
		return signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	public Integer getRiskId() {
		return riskId;
	}

	public void setRiskId(Integer riskId) {
		this.riskId = riskId;
	}

	public Integer getConfId() {
		return confId;
	}

	public void setConfId(Integer confId) {
		this.confId = confId;
	}

	public String getSignInfo() {
		return signInfo;
	}

	public void setSignInfo(String signInfo) {
		this.signInfo = signInfo;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Date getSignTime() {
		return signTime;
	}

	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}

	@Override
	public String toString() {
		return "Sign [signId=" + signId + ", riskId=" + riskId + ", confId=" + confId + ", signInfo=" + signInfo
				+ ", userId=" + userId + ", signTime=" + signTime + "]";
	}

}
