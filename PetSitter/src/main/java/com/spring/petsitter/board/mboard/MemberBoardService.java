package com.spring.petsitter.board.mboard;

import java.util.HashMap;
import java.util.List;


public interface MemberBoardService {
	public List<MemberBoardVO> getBoardList(HashMap<String, Integer> hashmap);
	public int getListCount();
	public MemberBoardVO getDetail(int num);
	public int boardInsert(MemberBoardVO board);
	public MemberBoardVO boardModifyForm(int num);
	public int boardModify(MemberBoardVO modifyboard);
	public int boardDelete(HashMap<String, String> hashmap);
	public int reportInsert(ReportArticleVO report);
	public int reportReply(ReportReplyVO report);
	public List<ReportArticleVO> getReportArticleList(ReportArticleVO report);
	public List<ReportReplyVO> getReportReplyList(ReportReplyVO report);
}
