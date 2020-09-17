package com.spring.petsitter.board.mboard;

import java.util.List;

public interface MReplyService {
	public int replyCount() throws Exception;
	public List<MReplyVO> readReply(int bno) throws Exception;
	public int writeReply(MReplyVO vo) throws Exception;	
  public int updateReply(MReplyVO vo) throws Exception;
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
