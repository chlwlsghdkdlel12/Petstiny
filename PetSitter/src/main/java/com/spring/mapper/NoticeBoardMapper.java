package com.spring.mapper;

import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.NoticeBoardVO;
import com.spring.petsitter.board.mboard.ReportArticleVO;
import com.spring.petsitter.board.mboard.ReportReplyVO;

public interface NoticeBoardMapper {
	public List<NoticeBoardVO> getBoardList(HashMap<String, Integer> hashmap);
	public int getListCount();
	public NoticeBoardVO getDetail(int num);
	public int boardInsert(NoticeBoardVO board);
	public int boardModify(NoticeBoardVO modifyboard);
	public int boardDelete(int num);
	public void setReadCountUpdate(int num);
	public int isBoardWriter(HashMap<String, String> hashmap);
	public String getMemberName(String member_id);
	public int reportInsert(ReportArticleVO report);
	public int reportReply(ReportReplyVO report);
}
