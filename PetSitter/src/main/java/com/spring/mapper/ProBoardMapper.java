package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.*;

public interface ProBoardMapper {
	public int getProListCount(HashMap<String, Object> hashmap);
	public List<ProBoardVO> getProBoardList(HashMap<String, Object> hashmap);
	public String nicknameFind(ProBoardVO board);
	public void proboardInsert(ProBoardVO board);
	public List<ProBoardVO> getProDetail(int num);
	public void setProReadCountUpdate(int num);
	public ProBoardVO getProModifyForm(int num);	
	public void proModifyUpdate(ProBoardVO board);	
	public int isProBoardWriter(HashMap<String, String> hashmap);	
	public void proBoardDelete(int num);
	public void proLikeDelete(int num);	
	
	public int getProReportCountCheck(HashMap<String, Object> hashmap);
	public void proReportInsert(ProBoardVO board);
	public int getProReportReplyCountCheck(ProReplyVO vo)throws Exception;
	public List<ProReplyVO> getProReportReplyForm(ProReplyVO vo);
	public void proReportReplyInsert(ProReplyVO vo);
	
	
	//댓글  mapper.java 시작
	public String nicknameFind02(String gid);
	public String nicknameFind03(String gid);
	public List<ProReplyVO> readProReply(int bno) throws Exception;
	public int writeProReply(ProReplyVO vo) throws Exception;
	public int updateProReply(ProReplyVO vo) throws Exception;
	public int deleteProReply(ProReplyVO vo) throws Exception;
	public List<ProReplyVO> proReplyCount(int bno) throws Exception;
	//댓글  mapper.java 종료	

	//좋아요  mapper.java 시작	
	public List<ProBoardVO> read_ProLikeCount(int bno) throws Exception;
	public String before_id(ProBoardVO vo);
	void update_Pro_LikeCount1(HashMap<String, Object> map);
	void update_Pro_LikeCount2(HashMap<String, Object> map);
	void update_Pro_LikeCount3(HashMap<String, Object> map);
	//좋아요 mapper.java 종료		
}
