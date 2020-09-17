package com.spring.petsitter.pay;

import java.util.Date;

/*
create table pay(
    PAY_ID varchar2(30), -- 회원 아이디
    PAY_AMOUNT number, -- 예약 금액
    PETSITTER_ID varchar2(30), -- 이용 펫시터 아이디
    MERCHANT_UID varchar2(20), -- 결제 번호
    PAY_DATE date default sysdate, -- 결제일
    PAY_TYPE varchar2(10), -- 위탁 or 방문
    START_DATE date, -- 이용 시작 날짜
    END_DATE date, -- 이용 종료 날짜
    PAY_STATUS varchar2(10) default '결제 완료', -- 결제 완료 or 결제 취소
    PAY_POINT number -- 결제 사용 포인트
);
*/
public class PayVO {
	private String PAY_ID; 
	private int PAY_AMOUNT;
	private String PETSITTER_ID;
	private String MERCHANT_UID;
	private Date PAY_DATE;
	private String PAY_TYPE;
	private String START_DATE;
	private String END_DATE;
	private String PAY_STATUS;
	private int PAY_POINT;
	
	public String getPAY_ID() {
		return PAY_ID;
	}
	public void setPAY_ID(String pAY_ID) {
		PAY_ID = pAY_ID;
	}
	public int getPAY_AMOUNT() {
		return PAY_AMOUNT;
	}
	public void setPAY_AMOUNT(int pAY_AMOUNT) {
		PAY_AMOUNT = pAY_AMOUNT;
	}
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getMERCHANT_UID() {
		return MERCHANT_UID;
	}
	public void setMERCHANT_UID(String mERCHANT_UID) {
		MERCHANT_UID = mERCHANT_UID;
	}
	public Date getPAY_DATE() {
		return PAY_DATE;
	}
	public void setPAY_DATE(Date pAY_DATE) {
		PAY_DATE = pAY_DATE;
	}
	public String getPAY_TYPE() {
		return PAY_TYPE;
	}
	public void setPAY_TYPE(String pAY_TYPE) {
		PAY_TYPE = pAY_TYPE;
	}
	public String getSTART_DATE() {
		return START_DATE;
	}
	public void setSTART_DATE(String sTART_DATE) {
		START_DATE = sTART_DATE;
	}
	public String getEND_DATE() {
		return END_DATE;
	}
	public void setEND_DATE(String eND_DATE) {
		END_DATE = eND_DATE;
	}
	public String getPAY_STATUS() {
		return PAY_STATUS;
	}
	public void setPAY_STATUS(String pAY_STATUS) {
		PAY_STATUS = pAY_STATUS;
	}
	public int getPAY_POINT() {
		return PAY_POINT;
	}
	public void setPAY_POINT(int pAY_POINT) {
		PAY_POINT = pAY_POINT;
	}
	
}
