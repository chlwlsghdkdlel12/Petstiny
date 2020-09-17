package com.spring.petsitter.board;

import java.util.Date;

public class ProReplyVO {
/*
CREATE TABLE PROREPLY (
    "BNO" NUMBER, 
    "RNO" NUMBER, 
    "CONTENT" VARCHAR2(2000 BYTE), 
    "WRITER_ID" VARCHAR2(30 BYTE), 
    "REGDATE" DATE DEFAULT sysdate, 
    "WRITER_NICKNAME" VARCHAR2(30 BYTE),
    "B_TYPE" VARCHAR2(20) default 'PRO_BOARD' 
);
*/

		private int bno;
		private int rno;
		private String content;
		private String writer_id;
		private String writer_nickname;
		private Date regDate;
		private String b_type;
		private String report_reason;
		private int reply_count;
		
		public int getBno() {
			return bno;
		}
		public void setBno(int bno) {
			this.bno = bno;
		}
		public int getRno() {
			return rno;
		}
		public void setRno(int rno) {
			this.rno = rno;
		}
		public String getContent() {
			return content;
		}
		public void setContent(String content) {
			this.content = content;
		}
		public String getWriter_id() {
			return writer_id;
		}
		public void setWriter_id(String writer_id) {
			this.writer_id = writer_id;
		}

		public String getWriter_nickname() {
			return writer_nickname;
		}
		public void setWriter_nickname(String writer_nickname) {
			this.writer_nickname = writer_nickname;
		}
		public Date getRegDate() {
			return regDate;
		}
		public void setRegDate(Date regDate) {
			this.regDate = regDate;
		}
		public String getB_type() {
			return b_type;
		}
		public void setB_type(String b_type) {
			this.b_type = b_type;
		}
		public String getReport_reason() {
			return report_reason;
		}
		public void setReport_reason(String report_reason) {
			this.report_reason = report_reason;
		}
		public int getReply_count() {
			return reply_count;
		}
		public void setReply_count(int reply_count) {
			this.reply_count = reply_count;
		}
		
		
}
