package com.okkyclone.domain;

import java.util.Date;
import java.util.List;

public class MemberVO {
	
    private String userId;      
    private String userPw;     
    private String userName;
    private String nickname;   
    private String job;
    private String bio;
    private String userImg;     
    private int userPoint;     
    private int userRank;       
    private String emailAuth;   
    private String socialType; 
    private Date regdate;
    private Date updatedate;
    private String profileImg;
    private String adAgree;
    private String pushAgree;
    private int enabled;
    public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	private List<AuthVO> authList;
    
    
    
	public List<AuthVO> getAuthList() {
		return authList;
	}

	public void setAuthList(List<AuthVO> authList) {
		this.authList = authList;
	}

	@Override
	public String toString() {
	    return "MemberVO [userid=" + userId + ", userName=" + userName + ", nickname=" + nickname + "]";
	}
	
    public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getAdAgree() {
		return adAgree;
	}
	public void setAdAgree(String adAgree) {
		this.adAgree = adAgree;
	}
	public String getPushAgree() {
		return pushAgree;
	}
	public void setPushAgree(String pushAgree) {
		this.pushAgree = pushAgree;
	}
	public String getProfileImg() { return profileImg; }
    public void setProfileImg(String profileImg) { this.profileImg = profileImg; }
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getUserImg() {
		return userImg;
	}
	public void setUserImg(String userImg) {
		this.userImg = userImg;
	}
	public int getUserPoint() {
		return userPoint;
	}
	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}
	public int getUserRank() {
		return userRank;
	}
	public void setUserRank(int userRank) {
		this.userRank = userRank;
	}
	public String getEmailAuth() {
		return emailAuth;
	}
	public void setEmailAuth(String emailAuth) {
		this.emailAuth = emailAuth;
	}
	public String getSocialType() {
		return socialType;
	}
	public void setSocialType(String socialType) {
		this.socialType = socialType;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Date getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(Date updatedate) {
		this.updatedate = updatedate;
	}
}