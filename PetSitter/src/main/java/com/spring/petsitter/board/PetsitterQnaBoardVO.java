package com.spring.petsitter.board;

import java.util.Date;

/*
CREATE TABLE petsitter_qna_board (
    petsitter_id           VARCHAR2(30),
    petsitter_nickname      VARCHAR2(30),
    member_id              VARCHAR2(30),
    member_nickname        VARCHAR2(30),
    petsitter_qna_subject  VARCHAR2(100),
    petsitter_qna_content  VARCHAR2(4000),
    petsitter_qna_date     DATE,
    petsitter_qna_bno      NUMBER
);
 * 
 */

public class PetsitterQnaBoardVO {
	private String PETSITTER_ID;
	private String PETSITTER_NICKNAME;
	private String MEMBER_ID;
	private String MEMBER_NICKNAME;
	private String PETSITTER_QNA_SUBJECT;
	private String PETSITTER_QNA_CONTENT;
	private Date PETSITTER_QNA_DATE;
	private String REAL_DATE;
	private int PETSITTER_QNA_BNO;
	private int page2;
	private int listcount2;
	private int maxpage2;
	private int startpage2;
	private int endpage2;
	
	public String getPETSITTER_ID() {
		return PETSITTER_ID;
	}
	public void setPETSITTER_ID(String pETSITTER_ID) {
		PETSITTER_ID = pETSITTER_ID;
	}
	public String getPETSITTER_NICKNAME() {
		return PETSITTER_NICKNAME;
	}
	public void setPETSITTER_NICKNAME(String pETSITTER_NICKNAME) {
		PETSITTER_NICKNAME = pETSITTER_NICKNAME;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_NICKNAME() {
		return MEMBER_NICKNAME;
	}
	public void setMEMBER_NICKNAME(String mEMBER_NICKNAME) {
		MEMBER_NICKNAME = mEMBER_NICKNAME;
	}
	public String getPETSITTER_QNA_SUBJECT() {
		return PETSITTER_QNA_SUBJECT;
	}
	public void setPETSITTER_QNA_SUBJECT(String pETSITTER_QNA_SUBJECT) {
		PETSITTER_QNA_SUBJECT = pETSITTER_QNA_SUBJECT;
	}
	public String getPETSITTER_QNA_CONTENT() {
		return PETSITTER_QNA_CONTENT;
	}
	public void setPETSITTER_QNA_CONTENT(String pETSITTER_QNA_CONTENT) {
		PETSITTER_QNA_CONTENT = pETSITTER_QNA_CONTENT;
	}
	public Date getPETSITTER_QNA_DATE() {
		return PETSITTER_QNA_DATE;
	}
	public void setPETSITTER_QNA_DATE(Date pETSITTER_QNA_DATE) {
		PETSITTER_QNA_DATE = pETSITTER_QNA_DATE;
	}
	public int getPETSITTER_QNA_BNO() {
		return PETSITTER_QNA_BNO;
	}
	public void setPETSITTER_QNA_BNO(int pETSITTER_QNA_BNO) {
		PETSITTER_QNA_BNO = pETSITTER_QNA_BNO;
	}
	public int getPage2() {
		return page2;
	}
	public void setPage2(int page2) {
		this.page2 = page2;
	}
	public int getListcount2() {
		return listcount2;
	}
	public void setListcount2(int listcount2) {
		this.listcount2 = listcount2;
	}
	public int getMaxpage2() {
		return maxpage2;
	}
	public void setMaxpage2(int maxpage2) {
		this.maxpage2 = maxpage2;
	}
	public int getStartpage2() {
		return startpage2;
	}
	public void setStartpage2(int startpage2) {
		this.startpage2 = startpage2;
	}
	public int getEndpage2() {
		return endpage2;
	}
	public void setEndpage2(int endpage2) {
		this.endpage2 = endpage2;
	}
	public String getREAL_DATE() {
		return REAL_DATE;
	}
	public void setREAL_DATE(String rEAL_DATE) {
		REAL_DATE = rEAL_DATE;
	}
	
	
}
