package com.spring.petsitter.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
// 전문가 상담 게시판 VO
/*
-- 전문가 상담 게시판 DB
create table PRO_BOARD(
    PRO_NUM number(6) primary key, -- 글 번호  
    MEMBER_ID varchar2(30), -- 아이디
    MEMBER_NICKNAME varchar2(30) DEFAULT 'N', --닉네임  
    PRO_SUBJECT varchar2(100), -- 제목
    PRO_CONTENT varchar2(3000), -- 내용
    PRO_ORG_FILE varchar2(100), -- 파일이름
    PRO_UP_FILE varchar2(100), -- 업로드된 파일이름
    PRO_READCOUNT number, -- 조회수
    PRO_DATE date default sysdate, -- 작성일
    PRO_LIKECOUNT number, -- 좋아요 수
    BOARD_TYPE VARCHAR2(20) default 'PRO_BOARD', -- 게시판 타입 
    SECRET_CHECK VARCHAR2(4) default 'N' -- 비밀게시판 확인 
);

-- 프로보드 좋아요 테이블
CREATE TABLE PRO_LIKE_COUNT(
    LIKE_NUM NUMBER primary key, --좋아요 번호
    LIKE_ID varchar2(4000) DEFAULT 'N' -- 좋아요 아이디
);

-- 프로보드 좋아요 트리거
CREATE OR REPLACE TRIGGER PRO_LIKE_INSERT_TRG1
BEFORE INSERT ON PRO_BOARD
BEGIN
INSERT into PRO_LIKE_COUNT
VALUES ((SELECT NVL(MAX(PRO_NUM),0)+1 FROM PRO_BOARD),'N');
END;
/

-- 글신고 테이블
create table report_article (
    member_num number,
    report_reason varchar2(4000),
    member_id varchar2(30),
    btype varchar2(100),
    processing varchar2(10) default 'N'
);
 
-- 댓글 신고 테이블    
create table report_reply (
    bno number,
    rno number,
    report_reason varchar2(4000),
    member_id varchar2(30),
    btype varchar2(100),
    processing varchar2(10) default 'N'
); 
*/
public class ProBoardVO {

	private int PRO_NUM;
	private String MEMBER_ID;
	private String MEMBER_NICKNAME;
	private String PRO_SUBJECT;
	private String PRO_CONTENT;
	private MultipartFile PRO_FILE;
	private MultipartFile PRO_FILE02;
	private String PRO_ORG_FILE;
	private String PRO_UP_FILE;
	private int PRO_READCOUNT;
	private Date PRO_DATE;
	private String REAL_DATE;
	private int PRO_LIKECOUNT;
	private String BOARD_TYPE;
	
	private String searchType;
	private String keyword;
	
	private int page2;
	private int listcount2;
	private int maxpage2;
	private int startpage2;
	private int endpage2;
	
	private String SECRET_CHECK;
	private String REPORT_REASON;
	private String PHOTO_CHECK01;
	private String PHOTO_CHECK02;

	private String LIKE_ID;
	private int LIKE_NUM;

	
	
	public int getPRO_NUM() {
		return PRO_NUM;
	}
	public void setPRO_NUM(int pRO_NUM) {
		PRO_NUM = pRO_NUM;
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
	public String getPRO_SUBJECT() {
		return PRO_SUBJECT;
	}
	public void setPRO_SUBJECT(String pRO_SUBJECT) {
		PRO_SUBJECT = pRO_SUBJECT;
	}
	public String getPRO_CONTENT() {
		return PRO_CONTENT;
	}
	public void setPRO_CONTENT(String pRO_CONTENT) {
		PRO_CONTENT = pRO_CONTENT;
	}
	public MultipartFile getPRO_FILE() {
		return PRO_FILE;
	}
	public void setPRO_FILE(MultipartFile pRO_FILE) {
		PRO_FILE = pRO_FILE;
	}
	
	public MultipartFile getPRO_FILE02() {
		return PRO_FILE02;
	}
	public void setPRO_FILE02(MultipartFile pRO_FILE02) {
		PRO_FILE02 = pRO_FILE02;
	}
	public String getPRO_ORG_FILE() {
		return PRO_ORG_FILE;
	}
	public void setPRO_ORG_FILE(String pRO_ORG_FILE) {
		PRO_ORG_FILE = pRO_ORG_FILE;
	}
	public String getPRO_UP_FILE() {
		return PRO_UP_FILE;
	}
	public void setPRO_UP_FILE(String pRO_UP_FILE) {
		PRO_UP_FILE = pRO_UP_FILE;
	}
	public int getPRO_READCOUNT() {
		return PRO_READCOUNT;
	}
	public void setPRO_READCOUNT(int pRO_READCOUNT) {
		PRO_READCOUNT = pRO_READCOUNT;
	}
	public Date getPRO_DATE() {
		return PRO_DATE;
	}
	public void setPRO_DATE(Date pRO_DATE) {
		PRO_DATE = pRO_DATE;
	}
	public String getREAL_DATE() {
		return REAL_DATE;
	}
	public void setREAL_DATE(String rEAL_DATE) {
		REAL_DATE = rEAL_DATE;
	}
	public int getPRO_LIKECOUNT() {
		return PRO_LIKECOUNT;
	}
	public void setPRO_LIKECOUNT(int pRO_LIKECOUNT) {
		PRO_LIKECOUNT = pRO_LIKECOUNT;
	}
	public String getBOARD_TYPE() {
		return BOARD_TYPE;
	}
	public void setBOARD_TYPE(String bOARD_TYPE) {
		BOARD_TYPE = bOARD_TYPE;
	}
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	public String getSECRET_CHECK() {
		return SECRET_CHECK;
	}
	public void setSECRET_CHECK(String sECRET_CHECK) {
		SECRET_CHECK = sECRET_CHECK;
	}
	public int getEndpage2() {
		return endpage2;
	}
	public void setEndpage2(int endpage2) {
		this.endpage2 = endpage2;
	}
	public String getREPORT_REASON() {
		return REPORT_REASON;
	}
	public void setREPORT_REASON(String rEPORT_REASON) {
		REPORT_REASON = rEPORT_REASON;
	}
	public String getPHOTO_CHECK01() {
		return PHOTO_CHECK01;
	}
	public void setPHOTO_CHECK01(String pHOTO_CHECK01) {
		PHOTO_CHECK01 = pHOTO_CHECK01;
	}
	public String getPHOTO_CHECK02() {
		return PHOTO_CHECK02;
	}
	public void setPHOTO_CHECK02(String pHOTO_CHECK02) {
		PHOTO_CHECK02 = pHOTO_CHECK02;
	}
	public String getLIKE_ID() {
		return LIKE_ID;
	}
	public void setLIKE_ID(String lIKE_ID) {
		LIKE_ID = lIKE_ID;
	}
	public int getLIKE_NUM() {
		return LIKE_NUM;
	}
	public void setLIKE_NUM(int lIKE_NUM) {
		LIKE_NUM = lIKE_NUM;
	}


	


}
