package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

public interface NoticeBoardService {
	public List<NoticeBoardVO> getBoardList(HashMap<String, Integer> hashmap);
	public int getListCount();
	public NoticeBoardVO getDetail(int num);
	public int boardInsert(NoticeBoardVO board);
	public NoticeBoardVO boardModifyForm(int num);
	public int boardModify(NoticeBoardVO modifyboard);
	public int boardDelete(HashMap<String, String> hashmap);	
}
