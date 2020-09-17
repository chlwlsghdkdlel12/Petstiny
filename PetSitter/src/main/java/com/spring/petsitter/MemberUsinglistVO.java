package com.spring.petsitter;

import org.springframework.web.multipart.MultipartFile;

public class MemberUsinglistVO {
	private int LISTCOUNT;
	private int LIST_NUM;
	private String LIST_TYPE;
	private String MEMBER_ID;
	private String PETSITTER_ID;
	private String PETSITTER_NAME;
	private String PETSITTER_NICKNAME;
	private String PETSITTER_TEL;
	private String PETSITTER_ADDRESS1;
	private double PETSITTER_SCORE;
	private MultipartFile PETSITTER_PHOTO_PROFILE;
	private String PETSITTER_PHOTO_PROFILE_FILE;
	private String LIST_START_DATE;
	private String LIST_END_DATE;
	private int LIST_PRICE;
	private String LIST_ING; // 현재 이용중, 이용 완료, 위탁 대기중
	private String LIST_COMPLETE; // 리뷰 남기기, 펫시터와의 소통, 리뷰 완료, 예약 취소
	private String MERCHANT_UID;
	private int position; // 출력 순서
	
	public int getLISTCOUNT() {
		return LISTCOUNT;
	}
	public void setLISTCOUNT(int lISTCOUNT) {
		LISTCOUNT = lISTCOUNT;
	}
	public int getLIST_NUM() {
		return LIST_NUM;
	}
	public void setLIST_NUM(int lIST_NUM) {
		LIST_NUM = lIST_NUM;
	}
	public String getLIST_TYPE() {
		return LIST_TYPE;
	}
	public void setLIST_TYPE(String lIST_TYPE) {
		LIST_TYPE = lIST_TYPE;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getPETSITTER_NAME() {
		return PETSITTER_NAME;
	}
	public void setPETSITTER_NAME(String pETSITTER_NAME) {
		PETSITTER_NAME = pETSITTER_NAME;
	}
	public String getPETSITTER_NICKNAME() {
		return PETSITTER_NICKNAME;
	}
	public void setPETSITTER_NICKNAME(String pETSITTER_NICKNAME) {
		PETSITTER_NICKNAME = pETSITTER_NICKNAME;
	}
	public String getPETSITTER_TEL() {
		return PETSITTER_TEL;
	}
	public void setPETSITTER_TEL(String pETSITTER_TEL) {
		PETSITTER_TEL = pETSITTER_TEL;
	}
	public String getPETSITTER_ADDRESS1() {
		return PETSITTER_ADDRESS1;
	}
	public void setPETSITTER_ADDRESS1(String pETSITTER_ADDRESS1) {
		PETSITTER_ADDRESS1 = pETSITTER_ADDRESS1;
	}
	public double getPETSITTER_SCORE() {
		return PETSITTER_SCORE;
	}
	public void setPETSITTER_SCORE(double pETSITTER_SCORE) {
		PETSITTER_SCORE = pETSITTER_SCORE;
	}
	public MultipartFile getPETSITTER_PHOTO_PROFILE() {
		return PETSITTER_PHOTO_PROFILE;
	}
	public void setPETSITTER_PHOTO_PROFILE(MultipartFile pETSITTER_PHOTO_PROFILE) {
		PETSITTER_PHOTO_PROFILE = pETSITTER_PHOTO_PROFILE;
	}
	public String getPETSITTER_PHOTO_PROFILE_FILE() {
		return PETSITTER_PHOTO_PROFILE_FILE;
	}
	public void setPETSITTER_PHOTO_PROFILE_FILE(String pETSITTER_PHOTO_PROFILE_FILE) {
		PETSITTER_PHOTO_PROFILE_FILE = pETSITTER_PHOTO_PROFILE_FILE;
	}
	public String getLIST_START_DATE() {
		return LIST_START_DATE;
	}
	public void setLIST_START_DATE(String lIST_START_DATE) {
		LIST_START_DATE = lIST_START_DATE;
	}
	public String getLIST_END_DATE() {
		return LIST_END_DATE;
	}
	public void setLIST_END_DATE(String lIST_END_DATE) {
		LIST_END_DATE = lIST_END_DATE;
	}
	public int getLIST_PRICE() {
		return LIST_PRICE;
	}
	public void setLIST_PRICE(int lIST_PRICE) {
		LIST_PRICE = lIST_PRICE;
	}
	public String getLIST_ING() {
		return LIST_ING;
	}
	public void setLIST_ING(String lIST_ING) {
		LIST_ING = lIST_ING;
	}
	public String getLIST_COMPLETE() {
		return LIST_COMPLETE;
	}
	public void setLIST_COMPLETE(String lIST_COMPLETE) {
		LIST_COMPLETE = lIST_COMPLETE;
	}
	public String getMERCHANT_UID() {
		return MERCHANT_UID;
	}
	public void setMERCHANT_UID(String mERCHANT_UID) {
		MERCHANT_UID = mERCHANT_UID;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	
}
