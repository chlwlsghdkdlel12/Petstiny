package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

public interface ProBoardService {
	public int getProListCount(HashMap<String, Object> hashmap);
	public List<ProBoardVO> getProBoardList(HashMap<String, Object> hashmap);
	public void proboardInsert(ProBoardVO board);
	public List<ProBoardVO> getProDetail(int num);
	public ProBoardVO getProModifyForm(int num);
	public void proModifyUpdate(ProBoardVO board);
	public void proboardDelete(HashMap<String, String> hashmap);
	
	
	public int getProReportCountCheck(HashMap<String, Object> hashmap)throws Exception;
	public List<ProBoardVO> getProReportForm(int num);
	public int getProReportReplyCountCheck(ProReplyVO vo)throws Exception;
	public void proReportInsert(ProBoardVO board);
	public List<ProReplyVO> getProReportReplyForm(ProReplyVO vo);
	public void proReportReplyInsert(ProReplyVO vo);
	
	
	//댓글 Service 시작
	public List<ProReplyVO> readProReply(int bno) throws Exception;
	public int writeProReply(ProReplyVO vo) throws Exception;	
	public int updateProReply(ProReplyVO vo) throws Exception;
	public int deleteProReply(ProReplyVO vo) throws Exception;	
	public List<ProReplyVO> proReplyCount(int bno) throws Exception;
	//댓글 Service 종료	
	
	//좋아요 기능 시작
	public List<ProBoardVO> read_ProLikeCount(int bno) throws Exception;
	public List<ProBoardVO> update_Pro_LikeCount(ProBoardVO vo) throws Exception;
	public List<ProBoardVO> downdate_Pro_LikeCount(ProBoardVO vo) throws Exception;
}
