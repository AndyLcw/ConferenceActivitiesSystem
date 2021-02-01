package edu.dlpu.bean;

public class Feedback {
	private Integer fbId;
	private Integer userId;
	private String userCall;
	private String fbSubject;
	private String fbContact;
	private String fbContent;

	public Integer getFbId() {
		return fbId;
	}

	public void setFbId(Integer fbId) {
		this.fbId = fbId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserCall() {
		return userCall;
	}

	public void setUserCall(String userCall) {
		this.userCall = userCall;
	}

	public String getFbSubject() {
		return fbSubject;
	}

	public void setFbSubject(String fbSubject) {
		this.fbSubject = fbSubject;
	}

	public String getFbContact() {
		return fbContact;
	}

	public void setFbContact(String fbContact) {
		this.fbContact = fbContact;
	}

	public String getFbContent() {
		return fbContent;
	}

	public void setFbContent(String fbContent) {
		this.fbContent = fbContent;
	}

}
