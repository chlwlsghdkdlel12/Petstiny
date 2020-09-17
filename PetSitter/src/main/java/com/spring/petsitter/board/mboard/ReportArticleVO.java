package com.spring.petsitter.board.mboard;

public class ReportArticleVO {
	/*
	 create table report_article (
    member_num number,
    report_reason varchar2(4000),
    member_id varchar2(30),
    btype varchar2(100),
    processing varchar2(10)
	);
	 */
	
	private int MEMBER_NUM;
	private String REPORT_REASON;
	private String MEMBER_ID;
	private String BTYPE;
	private String PROCESSING;
	
	public int getMEMBER_NUM() {
		return MEMBER_NUM;
	}
	public void setMEMBER_NUM(int mEMBER_NUM) {
		MEMBER_NUM = mEMBER_NUM;
	}
	public String getREPORT_REASON() {
		return REPORT_REASON;
	}
	public void setREPORT_REASON(String rEPORT_REASON) {
		REPORT_REASON = rEPORT_REASON;
	}
	public String getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(String mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public String getBTYPE() {
		return BTYPE;
	}
	public void setBTYPE(String bTYPE) {
		BTYPE = bTYPE;
	}
	public String getPROCESSING() {
		return PROCESSING;
	}
	public void setPROCESSING(String pROCESSING) {
		PROCESSING = pROCESSING;
	}

}
