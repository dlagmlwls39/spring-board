package com.exem.web.backend.vo;

public class User {

	private String userId;         
	private String password;
	private String nickname;
	private String birth;
	private int isWithdrawal;

	public int getIsWithdrawal() {
		return isWithdrawal;
	}
	public void setIsWithdrawal(int isWithdrawal) {
		this.isWithdrawal = isWithdrawal;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	} 

} 