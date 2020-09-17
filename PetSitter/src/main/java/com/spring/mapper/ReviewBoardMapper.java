package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.ReviewBoardVO;

public interface ReviewBoardMapper {
	public int getReviewListCount();
	public int getReviewListCount_member(String id);
	public void insertReview(ReviewBoardVO vo);
	public List<ReviewBoardVO> getReviewList();
	public String before_id(ReviewBoardVO vo);
	void updateLike_count(HashMap<String, Object> map);
	void updateLike_count2(HashMap<String, Object> map);
	void updateLike_count3(HashMap<String, Object> map);
	public List<ReviewBoardVO> getLikeSelect(HashMap<String, Object> map);
	public ArrayList<Integer> usinglist_num_List_member(String id);
	
	public int getReviewReportCountCheck(HashMap<String, Object> hashmap) throws Exception;
	public List<ReviewBoardVO> getReviewDetail(int num);
	public void reviwReportInsert(ReviewBoardVO vo);
}
