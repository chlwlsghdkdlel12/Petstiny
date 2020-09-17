package com.spring.petsitter.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/*
CREATE TABLE NOTICE_BOARD (
    NOTICE_NUM        NUMBER, -- 회원 게시판 글 번호
    NOTICE_ID         VARCHAR2(30), -- 회원 아이디
    NOTICE_SUBJECT    VARCHAR2(100), -- 글 제목
    NOTICE_CONTENT    VARCHAR2(4000), -- 글 내용
    NOTICE_ORG_FILE   VARCHAR2(100), -- 원본 파일
    NOTICE_UP_FILE    VARCHAR2(100), -- 업로드 파일 
    NOTICE_READCOUNT  NUMBER, -- 조회 수
    NOTICE_DATE       DATE, -- 작성일자
    NOTICE_NICKNAME   VARCHAR2(30),
    NOTI			  VARCHAR2(10) -- 상단 고정 여부
);
*/
public class NoticeBoardVO {
	private int NOTICE_NUM;
	private String NOTICE_ID;
	private String NOTICE_NICKNAME;
	private String NOTICE_SUBJECT;
	private String NOTICE_CONTENT;
	private MultipartFile NOTICE_FILE;
	private String NOTICE_ORG_FILE;
	private String NOTICE_UP_FILE;
	private int NOTICE_READCOUNT;
	private Date NOTICE_DATE;
	private String NOTI;
	
	public int getNOTICE_NUM() {
		return NOTICE_NUM;
	}
	public void setNOTICE_NUM(int nOTICE_NUM) {
		NOTICE_NUM = nOTICE_NUM;
	}
	public String getNOTICE_ID() {
		return NOTICE_ID;
	}
	public void setNOTICE_ID(String nOTICE_ID) {
		NOTICE_ID = nOTICE_ID;
	}
	public String getNOTICE_NICKNAME() {
		return NOTICE_NICKNAME;
	}
	public void setNOTICE_NICKNAME(String nOTICE_NICKNAME) {
		NOTICE_NICKNAME = nOTICE_NICKNAME;
	}
	public String getNOTICE_SUBJECT() {
		return NOTICE_SUBJECT;
	}
	public void setNOTICE_SUBJECT(String nOTICE_SUBJECT) {
		NOTICE_SUBJECT = nOTICE_SUBJECT;
	}
	public String getNOTICE_CONTENT() {
		return NOTICE_CONTENT;
	}
	public void setNOTICE_CONTENT(String nOTICE_CONTENT) {
		NOTICE_CONTENT = nOTICE_CONTENT;
	}
	public MultipartFile getNOTICE_FILE() {
		return NOTICE_FILE;
	}
	public void setNOTICE_FILE(MultipartFile nOTICE_FILE) {
		NOTICE_FILE = nOTICE_FILE;
	}
	public String getNOTICE_ORG_FILE() {
		return NOTICE_ORG_FILE;
	}
	public void setNOTICE_ORG_FILE(String nOTICE_ORG_FILE) {
		NOTICE_ORG_FILE = nOTICE_ORG_FILE;
	}
	public String getNOTICE_UP_FILE() {
		return NOTICE_UP_FILE;
	}
	public void setNOTICE_UP_FILE(String nOTICE_UP_FILE) {
		NOTICE_UP_FILE = nOTICE_UP_FILE;
	}
	public int getNOTICE_READCOUNT() {
		return NOTICE_READCOUNT;
	}
	public void setNOTICE_READCOUNT(int nOTICE_READCOUNT) {
		NOTICE_READCOUNT = nOTICE_READCOUNT;
	}
	public Date getNOTICE_DATE() {
		return NOTICE_DATE;
	}
	public void setNOTICE_DATE(Date nOTICE_DATE) {
		NOTICE_DATE = nOTICE_DATE;
	}
	public String getNOTI() {
		return NOTI;
	}
	public void setNOTI(String nOTI) {
		NOTI = nOTI;
	}

}
