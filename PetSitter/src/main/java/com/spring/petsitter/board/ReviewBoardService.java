// 만드는중

package com.spring.petsitter.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface ReviewBoardService {
	public void insertReview(ReviewBoardVO vo);
	public int getReviewListCount_member(String id);
	public List<ReviewBoardVO> getReviewList();
	public List<ReviewBoardVO> updateLike_count(ReviewBoardVO vo);
	public List<ReviewBoardVO> updateLike_count2(ReviewBoardVO vo);
	public ArrayList<Integer> usinglist_num_List_member(String id);
	
	public int getReviewReportCountCheck(HashMap<String, Object> hashmap)throws Exception;
	public List<ReviewBoardVO> getReviewReportForm(int num);
	public void reviwReportInsert(ReviewBoardVO vo) throws Exception;
}
