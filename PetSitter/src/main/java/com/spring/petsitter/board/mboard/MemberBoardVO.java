package com.spring.petsitter.board.mboard;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/* */

/*
  CREATE TABLE MEMBER_BOARD
   (	MEMBER_NUM NUMBER(10,0), -- 회원 게시판 글 번호
	MEMBER_ID VARCHAR2(20 BYTE), -- 회원 아이디
	MEMBER_SUBJECT VARCHAR2(100 BYTE), -- 글 제목
	MEMBER_CONTENT VARCHAR2(4000 BYTE), -- 글 내용
	MEMBER_ORG_FILE VARCHAR2(100 BYTE), -- 원본 파일
	MEMBER_UP_FILE VARCHAR2(100 BYTE), -- 업로드 파일 
	MEMBER_READCOUNT NUMBER, -- 조회 수
	MEMBER_DATE DATE, -- 작성일자
	MEMBER_LIKECOUNT NUMBER, -- 좋아요 수
	MEMBER_NAME VARCHAR2(20 BYTE), -- 회원 닉네임
	MEMBER_SECRET VARCHAR2(2 BYTE) DEFAULT 'N' -- 비밀 글
   ) ;
*/
public class MemberBoardVO {
	private int MEMBER_NUM;
	private String MEMBER_ID;
	private String MEMBER_NICKNAME;
	private String MEMBER_SUBJECT;
	private String MEMBER_CONTENT;
	private MultipartFile MEMBER_FILE;
	private String MEMBER_ORG_FILE;
	private String MEMBER_UP_FILE;
	private int MEMBER_READCOUNT;
	private Date MEMBER_DATE;
	private int MEMBER_LIKECOUNT;
	private String MEMBER_SECRET;
	
	public String getMEMBER_SECRET() {
		return MEMBER_SECRET;
	}
	public void setMEMBER_SECRET(String mEMBER_SECRET) {
		MEMBER_SECRET = mEMBER_SECRET;
	}
	public int getMEMBER_NUM() {
		return MEMBER_NUM;
	}
	public void setMEMBER_NUM(int MEMBER_NUM) {
		this.MEMBER_NUM = MEMBER_NUM;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getMEMBER_SUBJECT() {
		return MEMBER_SUBJECT;
	}
	public void setMEMBER_SUBJECT(String MEMBER_SUBJECT) {
		this.MEMBER_SUBJECT = MEMBER_SUBJECT;
	}
	public String getMEMBER_CONTENT() {
		return MEMBER_CONTENT;
	}
	public void setMEMBER_CONTENT(String MEMBER_CONTENT) {
		this.MEMBER_CONTENT = MEMBER_CONTENT;
	}
	public MultipartFile getMEMBER_FILE() {
		return MEMBER_FILE;
	}
	public void setMEMBER_FILE(MultipartFile mEMBER_FILE) {
		MEMBER_FILE = mEMBER_FILE;
	}
	public String getMEMBER_ORG_FILE() {
		return MEMBER_ORG_FILE;
	}
	public void setMEMBER_ORG_FILE(String mEMBER_ORG_FILE) {
		MEMBER_ORG_FILE = mEMBER_ORG_FILE;
	}
	public String getMEMBER_UP_FILE() {
		return MEMBER_UP_FILE;
	}
	public void setMEMBER_UP_FILE(String mEMBER_UP_FILE) {
		MEMBER_UP_FILE = mEMBER_UP_FILE;
	}
	public int getMEMBER_READCOUNT() {
		return MEMBER_READCOUNT;
	}
	public void setMEMBER_READCOUNT(int MEMBER_READCOUNT) {
		this.MEMBER_READCOUNT = MEMBER_READCOUNT;
	}
	public Date getMEMBER_DATE() {
		return MEMBER_DATE;
	}
	public void setMEMBER_DATE(Date MEMBER_DATE) {
		this.MEMBER_DATE = MEMBER_DATE;
	}
	public int getMEMBER_LIKECOUNT() {
		return MEMBER_LIKECOUNT;
	}
	public void setMEMBER_LIKECOUNT(int mEMBER_LIKECOUNT) {
		MEMBER_LIKECOUNT = mEMBER_LIKECOUNT;
	}
	public String getMEMBER_NICKNAME() {
		return MEMBER_NICKNAME;
	}
	public void setMEMBER_NAME(String mEMBER_NICKNAME) {
		MEMBER_NICKNAME = mEMBER_NICKNAME;
	}
	
}
