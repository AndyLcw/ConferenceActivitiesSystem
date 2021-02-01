package edu.dlpu.bean;

import java.util.Date;

public class Risk {
	private Integer riskId;
	private Integer confId;
	private Integer signId;
	private Integer adminId;
	private String riskName;
	private String riskIntro;
	private Date riskOpenTime;
	private Date riskEndTime;
	private String riskState;
	// 连接查询需要
	private Date signTime;

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

	public Integer getSignId() {
		return signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public String getRiskName() {
		return riskName;
	}

	public void setRiskName(String riskName) {
		this.riskName = riskName;
	}

	public String getRiskIntro() {
		return riskIntro;
	}

	public void setRiskIntro(String riskIntro) {
		this.riskIntro = riskIntro;
	}

	public Date getRiskOpenTime() {
		return riskOpenTime;
	}

	public void setRiskOpenTime(Date riskOpenTime) {
		this.riskOpenTime = riskOpenTime;
	}

	public Date getRiskEndTime() {
		return riskEndTime;
	}

	public void setRiskEndTime(Date riskEndTime) {
		this.riskEndTime = riskEndTime;
	}

	public String getRiskState() {
		return riskState;
	}

	public void setRiskState(String riskState) {
		this.riskState = riskState;
	}

	public Date getSignTime() {
		return signTime;
	}

	public void setSignTime(Date signTime) {
		this.signTime = signTime;
	}

	@Override
	public String toString() {
		return "Risk [riskId=" + riskId + ", confId=" + confId + ", signId=" + signId + ", adminId=" + adminId
				+ ", riskName=" + riskName + ", riskIntro=" + riskIntro + ", riskOpenTime=" + riskOpenTime
				+ ", riskEndTime=" + riskEndTime + ", riskState=" + riskState + "]";
	}

}
