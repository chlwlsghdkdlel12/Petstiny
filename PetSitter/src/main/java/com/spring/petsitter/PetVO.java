package com.spring.petsitter;

import org.springframework.web.multipart.MultipartFile;

/*
create table PET(
	MEMBER_ID varchar2(30),
	PET_CATEGORY varchar2(20), 
	PET_KIND varchar2(20), 
	PET_NAME varchar2(20), 
	PET_PHOTO varchar2(150), 
	PET_WEIGHT number(3), 
	PET_SIZE varchar2(5), 
	PET_GENDER varchar2(6), 
	PET_BIRTH date, 
	PET_NEUTERED varchar2(10),
	PET_POTTYTRAN varchar2(10), 
	PET_VAOONE varchar2(10),
	PET_QUESTION varchar2(30), 
	PET_ETC varchar2(200),
	PET_DATE date 
);
*/

public class PetVO {

	private String MEMBER_ID;
	private String PET_CATEGORY;
	private String PET_KIND;
	private String PET_NAME;
	private MultipartFile PET_PHOTO_PROFILE;
	private String PET_PHOTO;
	private int PET_WEIGHT;
	private String PET_SIZE;
	private String PET_GENDER;
	private String PET_BIRTH;
	private String PET_NEUTERED;
	private String PET_POTTYTRAN;
	private String PET_VAOONE;
	private String PET_QUESTION;
	private String PET_ETC;
	private String PET_DATE;
	
	
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getPET_CATEGORY() {
		return PET_CATEGORY;
	}
	public void setPET_CATEGORY(String pET_CATEGORY) {
		PET_CATEGORY = pET_CATEGORY;
	}
	public String getPET_KIND() {
		return PET_KIND;
	}
	public void setPET_KIND(String pET_KIND) {
		PET_KIND = pET_KIND;
	}
	public String getPET_NAME() {
		return PET_NAME;
	}
	public void setPET_NAME(String pET_NAME) {
		PET_NAME = pET_NAME;
	}
	public MultipartFile getPET_PHOTO_PROFILE() {
		return PET_PHOTO_PROFILE;
	}
	public void setPET_PHOTO_PROFILE(MultipartFile pET_PHOTO_PROFILE) {
		PET_PHOTO_PROFILE = pET_PHOTO_PROFILE;
	}
	public String getPET_PHOTO() {
		return PET_PHOTO;
	}
	public void setPET_PHOTO(String pET_PHOTO) {
		PET_PHOTO = pET_PHOTO;
	}
	public int getPET_WEIGHT() {
		return PET_WEIGHT;
	}
	public void setPET_WEIGHT(int pET_WEIGHT) {
		PET_WEIGHT = pET_WEIGHT;
	}
	public String getPET_SIZE() {
		return PET_SIZE;
	}
	public void setPET_SIZE(String pET_SIZE) {
		PET_SIZE = pET_SIZE;
	}
	public String getPET_GENDER() {
		return PET_GENDER;
	}
	public void setPET_GENDER(String pET_GENDER) {
		PET_GENDER = pET_GENDER;
	}
	public String getPET_BIRTH() {
		return PET_BIRTH;
	}
	public void setPET_BIRTH(String pET_BIRTH) {
		PET_BIRTH = pET_BIRTH;
	}
	public String getPET_NEUTERED() {
		return PET_NEUTERED;
	}
	public void setPET_NEUTERED(String pET_NEUTERED) {
		PET_NEUTERED = pET_NEUTERED;
	}
	public String getPET_POTTYTRAN() {
		return PET_POTTYTRAN;
	}
	public void setPET_POTTYTRAN(String pET_POTTYTRAN) {
		PET_POTTYTRAN = pET_POTTYTRAN;
	}
	public String getPET_VAOONE() {
		return PET_VAOONE;
	}
	public void setPET_VAOONE(String pET_VAOONE) {
		PET_VAOONE = pET_VAOONE;
	}
	public String getPET_QUESTION() {
		return PET_QUESTION;
	}
	public void setPET_QUESTION(String pET_QUESTION) {
		PET_QUESTION = pET_QUESTION;
	}
	public String getPET_ETC() {
		return PET_ETC;
	}
	public void setPET_ETC(String pET_ETC) {
		PET_ETC = pET_ETC;
	}
	public String getPET_DATE() {
		return PET_DATE;
	}
	public void setPET_DATE(String pET_DATE) {
		PET_DATE = pET_DATE;
	}
	
}
