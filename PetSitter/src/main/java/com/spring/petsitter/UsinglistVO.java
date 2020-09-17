package com.spring.petsitter;

import java.util.Date;

/*
create table USINGLIST(
    LIST_NUM number(10) primary key,
    PETSITTER_ID varchar2(30),
    PETSITTER_ADDR varchar2(100),
    MEMBER_ID varchar2(30),
    LIST_PRICE number(8),
    LIST_START_DATE date,
    LIST_END_DATE date,
    LIST_TYPE varchar2(10),
    MERCHANT_UID varchar2(10) -- 거래 고유 아이디
);
*/

public class UsinglistVO {
	private int LIST_NUM;
	private String PETSITTER_ID;
	private String MEMBER_ID;
	private String PETSITTER_ADDR;
	private int LIST_PRICE;
	private Date LIST_START_DATE;
	private Date LIST_END_DATE;
	private String STRING_STARTDATE;
	private String STRING_ENDDATE;
	private int LIST_SCORE;
	private String LIST_TYPE;
	private String MERCHANT_UID;
	private int PAGE;
	private int LIMIT;
	private int START_NUMBER;
	private int END_NUMBER;
	private int MAXPAGE;
	private int STARTPAGE;
	private int ENDPAGE;
	private int LISTNUMBER;
	private int NUMBER;
	
	
	
	public String getPETSITTER_ADDR() {
		return PETSITTER_ADDR;
	}
	public void setPETSITTER_ADDR(String pETSITTER_ADDR) {
		PETSITTER_ADDR = pETSITTER_ADDR;
	}
	public int getNUMBER() {
		return NUMBER;
	}
	public void setNUMBER(int nUMBER) {
		NUMBER = nUMBER;
	}
	public int getLISTNUMBER() {
		return LISTNUMBER;
	}
	public void setLISTNUMBER(int lISTNUMBER) {
		LISTNUMBER = lISTNUMBER;
	}
	public int getMAXPAGE() {
		return MAXPAGE;
	}
	public void setMAXPAGE(int mAXPAGE) {
		MAXPAGE = mAXPAGE;
	}
	public int getSTARTPAGE() {
		return STARTPAGE;
	}
	public void setSTARTPAGE(int sTARTPAGE) {
		STARTPAGE = sTARTPAGE;
	}
	public int getENDPAGE() {
		return ENDPAGE;
	}
	public void setENDPAGE(int eNDPAGE) {
		ENDPAGE = eNDPAGE;
	}
	public int getSTART_NUMBER() {
		return START_NUMBER;
	}
	public void setSTART_NUMBER(int sTART_NUMBER) {
		START_NUMBER = sTART_NUMBER;
	}
	public int getEND_NUMBER() {
		return END_NUMBER;
	}
	public void setEND_NUMBER(int eND_NUMBER) {
		END_NUMBER = eND_NUMBER;
	}
	public int getLIMIT() {
		return LIMIT;
	}
	public void setLIMIT(int lIMIT) {
		LIMIT = lIMIT;
	}
	public int getPAGE() {
		return PAGE;
	}
	public void setPAGE(int pAGE) {
		PAGE = pAGE;
	}
	public String getSTRING_STARTDATE() {
		return STRING_STARTDATE;
	}
	public void setSTRING_STARTDATE(String sTRING_STARTDATE) {
		STRING_STARTDATE = sTRING_STARTDATE;
	}
	public String getSTRING_ENDDATE() {
		return STRING_ENDDATE;
	}
	public void setSTRING_ENDDATE(String sTRING_ENDDATE) {
		STRING_ENDDATE = sTRING_ENDDATE;
	}
	public int getLIST_NUM() {
		return LIST_NUM;
	}
	public void setLIST_NUM(int lIST_NUM) {
		LIST_NUM = lIST_NUM;
	}
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public int getLIST_PRICE() {
		return LIST_PRICE;
	}
	public void setLIST_PRICE(int lIST_PRICE) {
		LIST_PRICE = lIST_PRICE;
	}
	public Date getLIST_START_DATE() {
		return LIST_START_DATE;
	}
	public void setLIST_START_DATE(Date lIST_START_DATE) {
		LIST_START_DATE = lIST_START_DATE;
	}
	public Date getLIST_END_DATE() {
		return LIST_END_DATE;
	}
	public void setLIST_END_DATE(Date lIST_END_DATE) {
		LIST_END_DATE = lIST_END_DATE;
	}
	public int getLIST_SCORE() {
		return LIST_SCORE;
	}
	public void setLIST_SCORE(int lIST_SCORE) {
		LIST_SCORE = lIST_SCORE;
	}
	public String getLIST_TYPE() {
		return LIST_TYPE;
	}
	public void setLIST_TYPE(String lIST_TYPE) {
		LIST_TYPE = lIST_TYPE;
	}
	public String getMERCHANT_UID() {
		return MERCHANT_UID;
	}
	public void setMERCHANT_UID(String mERCHANT_UID) {
		MERCHANT_UID = mERCHANT_UID;
	}
	
}
