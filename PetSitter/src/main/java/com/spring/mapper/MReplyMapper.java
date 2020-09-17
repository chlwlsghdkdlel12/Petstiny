package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.board.mboard.MReplyVO;

public interface MReplyMapper {
	public int replyCount() throws Exception;
	public List<MReplyVO> readReply(int bno) throws Exception; // ��� �б�
	public int writeReply(MReplyVO vo) throws Exception;  // ��� �ۼ�
	public int updateReply(MReplyVO vo) throws Exception; // ��� ����
	public int deleteReply(int rno) throws Exception; // ��� ����
	public void checkArticle(@Param("id")String id, @Param("num")int num);
	public void checkArticle2(@Param("id")String id, @Param("num")int num);
	public void checkReply(@Param("bno")String bno, @Param("rno")String rno, @Param("id")String id);
	public void checkReply2(@Param("bno")String bno, @Param("rno")String rno, @Param("id")String id);
	public int searchIdReportReply(@Param("id")String id, @Param("bno")int bno, @Param("rno")int rno);
	public int searchIdReportArticle(@Param("id")String id, @Param("num")int num);
	public void raDelete(@Param("id")String id, @Param("num")int num);
	public void rrDelete(@Param("bno")String bno, @Param("rno")String rno, @Param("id")String id);
}
