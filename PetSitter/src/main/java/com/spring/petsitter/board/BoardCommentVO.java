package com.spring.petsitter.board;

import java.util.Date;
// 게시판 코멘트 VO
/*
CREATE TABLE BOARD_COMMENT (
    COMMENT_NUM NUMBER,
    COMMENT_BOARD_TYPE VARCHAR2(20),
    COMMENT_BOARD_NUM NUMBER,
    COMMENT_CONTENT VARCHAR2(500),
    COMMENT_WRITER VARCHAR2(20),
    COMMENT_DATE DATE,
    COMMENT_LIKECOUNT NUMBER
);
*/
public class BoardCommentVO {
	private int COMMENT_NUM;
	private String COMMENT_BOARD_TYPE;
	private int COMMENT_BOARD_NUM;
	private String COMMENT_CONTENT;
	private String COMMENT_WRITER;
	private Date COMMENT_DATE;
	private int COMMENT_LIKECOUNT;
	
	public int getCOMMENT_NUM() {
		return COMMENT_NUM;
	}
	public void setCOMMENT_NUM(int cOMMENT_NUM) {
		COMMENT_NUM = cOMMENT_NUM;
	}
	public String getCOMMENT_BOARD_TYPE() {
		return COMMENT_BOARD_TYPE;
	}
	public void setCOMMENT_BOARD_TYPE(String cOMMENT_BOARD_TYPE) {
		COMMENT_BOARD_TYPE = cOMMENT_BOARD_TYPE;
	}
	public int getCOMMENT_BOARD_NUM() {
		return COMMENT_BOARD_NUM;
	}
	public void setCOMMENT_BOARD_NUM(int cOMMENT_BOARD_NUM) {
		COMMENT_BOARD_NUM = cOMMENT_BOARD_NUM;
	}
	public String getCOMMENT_CONTENT() {
		return COMMENT_CONTENT;
	}
	public void setCOMMENT_CONTENT(String cOMMENT_CONTENT) {
		COMMENT_CONTENT = cOMMENT_CONTENT;
	}
	public String getCOMMENT_WRITER() {
		return COMMENT_WRITER;
	}
	public void setCOMMENT_WRITER(String cOMMENT_WRITER) {
		COMMENT_WRITER = cOMMENT_WRITER;
	}
	public Date getCOMMENT_DATE() {
		return COMMENT_DATE;
	}
	public void setCOMMENT_DATE(Date cOMMENT_DATE) {
		COMMENT_DATE = cOMMENT_DATE;
	}
	public int getCOMMENT_LIKECOUNT() {
		return COMMENT_LIKECOUNT;
	}
	public void setCOMMENT_LIKECOUNT(int cOMMENT_LIKECOUNT) {
		COMMENT_LIKECOUNT = cOMMENT_LIKECOUNT;
	}
}
