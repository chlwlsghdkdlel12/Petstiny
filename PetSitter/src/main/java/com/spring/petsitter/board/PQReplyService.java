package com.spring.petsitter.board;

import java.util.List;

public interface PQReplyService {
	public int replyCount() throws Exception;
	public List<PQReplyVO> readReply(int bno) throws Exception;
	public int writeReply(PQReplyVO vo) throws Exception;	
  public int updateReply(PQReplyVO vo) throws Exception;
  public int deleteReply(int rno) throws Exception;
	public void checkArticle(String id, int num);
	public void checkArticle2(String id, int num);
	public void checkReply(String bno, String rno, String id);
	public void checkReply2(String bno, String rno, String id);
	public int searchIdReportReply(String id, int bno, int rno);
	public int searchIdReportArticle(String id, int num);
	public void raDelete(String id, int num);
	public void rrDelete(String bno, String rno, String id);
}
