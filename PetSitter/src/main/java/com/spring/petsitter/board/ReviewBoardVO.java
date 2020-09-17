package com.spring.petsitter.board;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

// 후기 게시판 VO
/*reviewBoard
create table REVIEW_BOARD(
    LIST_NUM number(10) primary key, -- 리뷰 번호
    USINGLIST_NUM number(10), --이용내역 번호
    MEMBER_ID varchar2(30), -- 회원 아이디
    PETSITTER_ID varchar2(30), -- 펫시터 아이디
    REVIEW_CONTENT varchar2(250), -- 리뷰 내용
    REVIEW_SCORE number(2,1), -- 리뷰 평점
    REVIEW_UP_PHOTO varchar2(200) default 'N', -- 업로드된 리뷰 사진
    REVIEW_DATE date default sysdate, -- 리뷰 작성일
    LIKE_COUNT number(6), -- 좋아요 수
    BOARD_TYPE VARCHAR2(20) default 'REIVIEW_BOARD', -- 게시판 타입
    REVIEW_REFLY VARCHAR2(250) DEFAULT 'N'--후기게시판 답변
);

CREATE TABLE LIKE_COUNT(
    LIKE_NUM NUMBER primary key, --좋아요 번호
    LIKE_ID varchar2(2000), -- 좋아요 아이디
    LIKE_TYPE varchar2(20) default 'REIVIEW_BOARD' -- 좋아요 타입
);

/
--트리거(REVIEW_BOARD, LIKE_COUNT 트리거)
CREATE OR REPLACE TRIGGER REVIEW_LIKE_INSERT_TRG1
BEFORE INSERT ON REVIEW_BOARD
BEGIN
INSERT into LIKE_COUNT
VALUES ((SELECT NVL(MAX(LIST_NUM),0)+1 FROM REVIEW_BOARD),'N','REVIEW_BOARD');
END;
/

create table COMMUNICATION_PHOTO_LIST(
   USINGLIST_NUM number(10),
   COMMUNICATION_PHOTO_FILE varchar2(2000) default 'N', -- 업로드된 사진 파일
   UPLOAD_DATE date default sysdate, -- 업로드 일자
   PETSITTER_ID varchar2(30) -- 펫시터 회원 아이디
); 
  
 
*/

public class ReviewBoardVO {
	private int LIST_NUM;
	private int USINGLIST_NUM;
	private String MEMBER_ID;
	private String PETSITTER_ID;
	private String REVIEW_CONTENT;
	private double REVIEW_SCORE;
	private MultipartFile[] REVIEW_PHOTO;
	private String REVIEW_UP_PHOTO;
	private Date REVIEW_DATE;
	private String REAL_DATE;	
	private int LIKE_COUNT;
	private String BOARD_TYPE;
	private String MEMBER_NICKNAME;
	private String MEMBER_PHOTO_FILE;
	private String PETSITTER_NICKNAME;
	private String PETSITTER_ADDRESS;
	private String PETSITTER_PHOTO_PROFILE_FILE;
	private String LIKE_ID;
	
	private int LIKE_NUM;
	private String LIKE_TYPE;
	private String REVIEW_REFLY;
	
	private String REPORT_REASON;
	
	private String AVG_REVIEW_SCORE;
	
	public int getLIST_NUM() {
		return LIST_NUM;
	}
	public void setLIST_NUM(int lIST_NUM) {
		LIST_NUM = lIST_NUM;
	}
	public int getUSINGLIST_NUM() {
		return USINGLIST_NUM;
	}
	public void setUSINGLIST_NUM(int uSINGLIST_NUM) {
		USINGLIST_NUM = uSINGLIST_NUM;
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
	public String getREVIEW_CONTENT() {
		return REVIEW_CONTENT;
	}
	public void setREVIEW_CONTENT(String rEVIEW_CONTENT) {
		REVIEW_CONTENT = rEVIEW_CONTENT;
	}
	public double getREVIEW_SCORE() {
		return REVIEW_SCORE;
	}
	public void setREVIEW_SCORE(double rEVIEW_SCORE) {
		REVIEW_SCORE = rEVIEW_SCORE;
	}
	public MultipartFile[] getREVIEW_PHOTO() {
		return REVIEW_PHOTO;
	}
	public void setREVIEW_PHOTO(MultipartFile[] rEVIEW_PHOTO) {
		REVIEW_PHOTO = rEVIEW_PHOTO;
	}
	public String getREVIEW_UP_PHOTO() {
		return REVIEW_UP_PHOTO;
	}
	public void setREVIEW_UP_PHOTO(String rEVIEW_UP_PHOTO) {
		REVIEW_UP_PHOTO = rEVIEW_UP_PHOTO;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date rEVIEW_DATE) {
		REVIEW_DATE = rEVIEW_DATE;
	}
	public String getREAL_DATE() {
		return REAL_DATE;
	}
	public void setREAL_DATE(String rEAL_DATE) {
		REAL_DATE = rEAL_DATE;
	}
	public int getLIKE_COUNT() {
		return LIKE_COUNT;
	}
	public void setLIKE_COUNT(int lIKE_COUNT) {
		LIKE_COUNT = lIKE_COUNT;
	}
	public String getBOARD_TYPE() {
		return BOARD_TYPE;
	}
	public void setBOARD_TYPE(String bOARD_TYPE) {
		BOARD_TYPE = bOARD_TYPE;
	}
	public String getMEMBER_NICKNAME() {
		return MEMBER_NICKNAME;
	}
	public void setMEMBER_NICKNAME(String mEMBER_NICKNAME) {
		MEMBER_NICKNAME = mEMBER_NICKNAME;
	}
	public String getMEMBER_PHOTO_FILE() {
		return MEMBER_PHOTO_FILE;
	}
	public void setMEMBER_PHOTO_FILE(String mEMBER_PHOTO_FILE) {
		MEMBER_PHOTO_FILE = mEMBER_PHOTO_FILE;
	}
	public String getPETSITTER_NICKNAME() {
		return PETSITTER_NICKNAME;
	}
	public void setPETSITTER_NICKNAME(String pETSITTER_NICKNAME) {
		PETSITTER_NICKNAME = pETSITTER_NICKNAME;
	}
	public String getPETSITTER_ADDRESS() {
		return PETSITTER_ADDRESS;
	}
	public void setPETSITTER_ADDRESS(String pETSITTER_ADDRESS) {
		PETSITTER_ADDRESS = pETSITTER_ADDRESS;
	}
	public String getPETSITTER_PHOTO_PROFILE_FILE() {
		return PETSITTER_PHOTO_PROFILE_FILE;
	}
	public void setPETSITTER_PHOTO_PROFILE_FILE(String pETSITTER_PHOTO_PROFILE_FILE) {
		PETSITTER_PHOTO_PROFILE_FILE = pETSITTER_PHOTO_PROFILE_FILE;
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
	public String getLIKE_TYPE() {
		return LIKE_TYPE;
	}
	public void setLIKE_TYPE(String lIKE_TYPE) {
		LIKE_TYPE = lIKE_TYPE;
	}
	public String getREVIEW_REFLY() {
		return REVIEW_REFLY;
	}
	public void setREVIEW_REFLY(String rEVIEW_REFLY) {
		REVIEW_REFLY = rEVIEW_REFLY;
	}
	public String getREPORT_REASON() {
		return REPORT_REASON;
	}
	public void setREPORT_REASON(String rEPORT_REASON) {
		REPORT_REASON = rEPORT_REASON;
	}
	public String getAVG_REVIEW_SCORE() {
		return AVG_REVIEW_SCORE;
	}
	public void setAVG_REVIEW_SCORE(String aVG_REVIEW_SCORE) {
		AVG_REVIEW_SCORE = aVG_REVIEW_SCORE;
	}
	
}