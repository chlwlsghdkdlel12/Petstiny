package com.spring.petsitter;

import org.springframework.web.multipart.MultipartFile;

public class PetsitterUpdateVO {
	private String PETSITTER_ID;
	private String nickname;
	private String pw;
	private double addrX;
	private double addrY;
	private String gender;
	private String[] email;
	private String address;
	private String safeaddr;
	private String tel;
	private String introduce;
	private String[] certName;
	private String[] certState;
	private String[] homeState;
	private String[] AppealState;
	private String[] type;
	private String price60m;
	private String price30m;
	private String[] servicelist;
	private MultipartFile[] certFile;
	private MultipartFile profile;
	private MultipartFile photo;
	private MultipartFile[] photoHome;
	private MultipartFile[] photoAppeal;

	
	
	
	public String getSafeaddr() {
		return safeaddr;
	}
	public void setSafeaddr(String safeaddr) {
		this.safeaddr = safeaddr;
	}
	public double getAddrX() {
		return addrX;
	}
	public void setAddrX(double addrX) {
		this.addrX = addrX;
	}
	public double getAddrY() {
		return addrY;
	}
	public void setAddrY(double addrY) {
		this.addrY = addrY;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	public MultipartFile[] getCertFile() {
		return certFile;
	}
	public void setCertFile(MultipartFile[] certFile) {
		this.certFile = certFile;
	}
	public MultipartFile[] getPhotoHome() {
		return photoHome;
	}
	public void setPhotoHome(MultipartFile[] photoHome) {
		this.photoHome = photoHome;
	}
	public MultipartFile[] getPhotoAppeal() {
		return photoAppeal;
	}
	public void setPhotoAppeal(MultipartFile[] photoAppeal) {
		this.photoAppeal = photoAppeal;
	}
	public String[] getHomeState() {
		return homeState;
	}
	public void setHomeState(String[] homeState) {
		this.homeState = homeState;
	}
	public String[] getAppealState() {
		return AppealState;
	}
	public void setAppealState(String[] appealState) {
		AppealState = appealState;
	}
	public String[] getCertState() {
		return certState;
	}
	public void setCertState(String[] certState) {
		this.certState = certState;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String[] getType() {
		return type;
	}
	public void setType(String[] type) {
		this.type = type;
	}
	public String getPrice60m() {
		return price60m;
	}
	public void setPrice60m(String price60m) {
		this.price60m = price60m;
	}
	public String getPrice30m() {
		return price30m;
	}
	public void setPrice30m(String price30m) {
		this.price30m = price30m;
	}
	public String[] getServicelist() {
		return servicelist;
	}
	public void setServicelist(String[] servicelist) {
		this.servicelist = servicelist;
	}
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String[] getEmail() {
		return email;
	}
	public void setEmail(String[] email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String[] getCertName() {
		return certName;
	}
	public void setCertName(String[] certName) {
		this.certName = certName;
	}
	public MultipartFile getProfile() {
		return profile;
	}
	public void setProfile(MultipartFile profile) {
		this.profile = profile;
	}
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	
	
}
