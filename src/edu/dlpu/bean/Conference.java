package edu.dlpu.bean;

public class Conference {

	private Integer confId;
	private Integer riskId;
	private Integer applyId;
	private Integer signId;
	private String confName;
	private String confPerson;
	private String confTime;
	private String confLocation;
	private String confLength;
	private String confLocationImg;
	private Integer confMaxPerson;
	private String confDevice;
	private Integer adminId;
	private String confIntro;
	private String confType;
	// 连接查询
	private String applyTime;
	private String signTime;

	public Integer getConfId() {
		return confId;
	}

	public void setConfId(Integer confId) {
		this.confId = confId;
	}

	public Integer getRiskId() {
		return riskId;
	}

	public void setRiskId(Integer riskId) {
		this.riskId = riskId;
	}

	public Integer getApplyId() {
		return applyId;
	}

	public void setApplyId(Integer applyId) {
		this.applyId = applyId;
	}

	public Integer getSignId() {
		return signId;
	}

	public void setSignId(Integer signId) {
		this.signId = signId;
	}

	public String getConfName() {
		return confName;
	}

	public void setConfName(String confName) {
		this.confName = confName;
	}

	public String getConfPerson() {
		return confPerson;
	}

	public void setConfPerson(String confPerson) {
		this.confPerson = confPerson;
	}

	public String getConfTime() {
		return confTime;
	}

	public void setConfTime(String confTime) {
		this.confTime = confTime;
	}

	public String getConfLocation() {
		return confLocation;
	}

	public void setConfLocation(String confLocation) {
		this.confLocation = confLocation;
	}

	public String getConfLength() {
		return confLength;
	}

	public void setConfLength(String confLength) {
		this.confLength = confLength;
	}

	public String getConfLocationImg() {
		return confLocationImg;
	}

	public void setConfLocationImg(String confLocationImg) {
		this.confLocationImg = confLocationImg;
	}

	public Integer getConfMaxPerson() {
		return confMaxPerson;
	}

	public void setConfMaxPerson(Integer confMaxPerson) {
		this.confMaxPerson = confMaxPerson;
	}

	public String getConfDevice() {
		return confDevice;
	}

	public void setConfDevice(String confDevice) {
		this.confDevice = confDevice;
	}

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public String getConfIntro() {
		return confIntro;
	}

	public void setConfIntro(String confIntro) {
		this.confIntro = confIntro;
	}

	public String getConfType() {
		return confType;
	}

	public void setConfType(String confType) {
		this.confType = confType;
	}

	public String getApplyTime() {
		return applyTime;
	}

	public void setApplyTime(String applyTime) {
		this.applyTime = applyTime;
	}

	public String getSignTime() {
		return signTime;
	}

	public void setSignTime(String signTime) {
		this.signTime = signTime;
	}

	@Override
	public String toString() {
		return "Conference [confId=" + confId + ", riskId=" + riskId + ", applyId=" + applyId + ", signId=" + signId
				+ ", confName=" + confName + ", confPerson=" + confPerson + ", confTime=" + confTime + ", confLocation="
				+ confLocation + ", confLength=" + confLength + ", confLocationImg=" + confLocationImg
				+ ", confMaxPerson=" + confMaxPerson + ", confDevice=" + confDevice + ", adminId=" + adminId
				+ ", confIntro=" + confIntro + ", confType=" + confType + ", applyTime=" + applyTime + ", signTime="
				+ signTime + "]";
	}

}
