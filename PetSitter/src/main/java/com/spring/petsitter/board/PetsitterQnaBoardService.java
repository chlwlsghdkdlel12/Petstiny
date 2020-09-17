package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

public interface PetsitterQnaBoardService {
	public int pqboardInsert(PetsitterQnaBoardVO board);
	public PetsitterQnaBoardVO getDetail(int num);
	public int getListCount();
	public List<PetsitterQnaBoardVO> getpqBoardList(HashMap<String, Integer> hashmap);
}
