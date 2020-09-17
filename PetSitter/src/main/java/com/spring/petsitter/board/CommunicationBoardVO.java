package com.spring.petsitter.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

/*
-- 펫시터와의 소통 게시판
create table COMMUNICATION_BOARD(
	BOARD_NUM number(10) PRIMARY KEY, -- 회원 게시판 글 번호
    USINGLIST_NUM number(10), -- 이용 내역 번호
    BOARD_WRITER varchar2(30), -- 작성자(일반 회원 닉네임 or 펫시터 닉네임)
	MEMBER_ID varchar2(30), -- 일반 회원 아이디
	PETSITTER_ID varchar2(30), -- 펫시터 회원 아이디
	BOARD_SUBJECT varchar2(100), -- 제목
	BOARD_CONTENT varchar2(4000), -- 내용
	BOARD_DATE date default sysdate, -- 작성일
	BOARD_CONDITION varchar2(10) default '답변 예정', -- 답변예정/답변완료
	BOARD_TYPE varchar2(10) -- 글 구분(스케줄/기타)
);

-- 펫시터와의 소통 사진 게시판(하루에 3장 업로드 가능)
create table COMMUNICATION_PHOTO_LIST(
    USINGLIST_NUM number(10),
    COMMUNICATION_PHOTO_FILE varchar2(100) default 'N', -- 업로드된 사진 파일
    UPLOAD_DATE date default sysdate, -- 업로드 일자
    PETSITTER_ID varchar2(30) -- 펫시터 회원 아이디
);
*/
public class CommunicationBoardVO {
	private int BOARD_NUM;
	private int USINGLIST_NUM;
	private String BOARD_WRITER;
	private String MEMBER_ID;
	private String PETSITTER_ID;
	private String BOARD_SUBJECT;
	private String BOARD_CONTENT;
	private Date BOARD_DATE;
	private String BOARD_REALDATE;
	private String BOARD_CONDITION;
	private String BOARD_TYPE;
	private MultipartFile[] COMMUNICATION_PHOTO_LIST;
	private String COMMUNICATION_PHOTO_FILE;
	
	public int getBOARD_NUM() {
		return BOARD_NUM;
	}
	public void setBOARD_NUM(int bOARD_NUM) {
		BOARD_NUM = bOARD_NUM;
	}
	public int getUSINGLIST_NUM() {
		return USINGLIST_NUM;
	}
	public void setUSINGLIST_NUM(int uSINGLIST_NUM) {
		USINGLIST_NUM = uSINGLIST_NUM;
	}
	public String getBOARD_WRITER() {
		return BOARD_WRITER;
	}
	public void setBOARD_WRITER(String bOARD_WRITER) {
		BOARD_WRITER = bOARD_WRITER;
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
	public String getBOARD_SUBJECT() {
		return BOARD_SUBJECT;
	}
	public void setBOARD_SUBJECT(String bOARD_SUBJECT) {
		BOARD_SUBJECT = bOARD_SUBJECT;
	}
	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String bOARD_CONTENT) {
		BOARD_CONTENT = bOARD_CONTENT;
	}
	public Date getBOARD_DATE() {
		return BOARD_DATE;
	}
	public void setBOARD_DATE(Date bOARD_DATE) {
		BOARD_DATE = bOARD_DATE;
	}
	public String getBOARD_REALDATE() {
		return BOARD_REALDATE;
	}
	public void setBOARD_REALDATE(String bOARD_REALDATE) {
		BOARD_REALDATE = bOARD_REALDATE;
	}
	public String getBOARD_CONDITION() {
		return BOARD_CONDITION;
	}
	public void setBOARD_CONDITION(String bOARD_CONDITION) {
		BOARD_CONDITION = bOARD_CONDITION;
	}
	public String getBOARD_TYPE() {
		return BOARD_TYPE;
	}
	public void setBOARD_TYPE(String bOARD_TYPE) {
		BOARD_TYPE = bOARD_TYPE;
	}
	public MultipartFile[] getCOMMUNICATION_PHOTO_LIST() {
		return COMMUNICATION_PHOTO_LIST;
	}
	public void setCOMMUNICATION_PHOTO_LIST(MultipartFile[] cOMMUNICATION_FILE) {
		COMMUNICATION_PHOTO_LIST = cOMMUNICATION_FILE;
	}
	public String getCOMMUNICATION_PHOTO_FILE() {
		return COMMUNICATION_PHOTO_FILE;
	}
	public void setCOMMUNICATION_PHOTO_FILE(String cOMMUNICATION_UPLOAD_FILE) {
		COMMUNICATION_PHOTO_FILE = cOMMUNICATION_UPLOAD_FILE;
	}
}
