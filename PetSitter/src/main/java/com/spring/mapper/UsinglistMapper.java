package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import com.spring.petsitter.PetsitterUsinglistVO;
import com.spring.petsitter.UsinglistVO;
import com.spring.petsitter.board.ReviewBoardVO;

public interface UsinglistMapper {
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList(UsinglistVO Usinglist);
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_7d(UsinglistVO Usinglist);
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_1m(UsinglistVO Usinglist);
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_3m(UsinglistVO Usinglist);
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_select(UsinglistVO Usinglist);
	public ReviewBoardVO review_refly_select(UsinglistVO Usinglist);
	public int review_refly_N(UsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount(UsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount_7d(UsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount_1m(UsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount_3m(UsinglistVO Usinglist);
	public int petsitterSelectUsinglistCount_select(UsinglistVO Usinglist);
	
	// 이용 내역 추가
	public int insertUsinglist(UsinglistVO usinglist);
	public void defaultphoto(UsinglistVO usinglist);
	public List<UsinglistVO> getUsinglistList();
}
