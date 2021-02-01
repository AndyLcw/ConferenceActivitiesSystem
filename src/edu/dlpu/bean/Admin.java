package edu.dlpu.bean;

public class Admin {

	private Integer adminId;
	private String adminName;
	private String adminPasswd;
	private String adminIcon;

	public Integer getAdminId() {
		return adminId;
	}

	public void setAdminId(Integer adminId) {
		this.adminId = adminId;
	}

	public String getAdminName() {
		return adminName;
	}

	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}

	public String getAdminPasswd() {
		return adminPasswd;
	}

	public void setAdminPasswd(String adminPasswd) {
		this.adminPasswd = adminPasswd;
	}

	public String getAdminIcon() {
		return adminIcon;
	}

	public void setAdminIcon(String adminIcon) {
		this.adminIcon = adminIcon;
	}

	@Override
	public String toString() {
		return "Admin [adminId=" + adminId + ", adminName=" + adminName + ", adminPasswd=" + adminPasswd
				+ ", adminIcon=" + adminIcon + "]";
	}

}
