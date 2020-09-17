// 만드는중

package com.spring.petsitter.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ReviewBoardMapper;

@Service("ReviewBoardService")
public class ReviewBoardServiceImpl implements ReviewBoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertReview(ReviewBoardVO vo) {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		reviewMapper.insertReview(vo);
	}
	
	@Override
	public List<ReviewBoardVO> getReviewList() {
		List<ReviewBoardVO> review_list = null;
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		review_list = reviewMapper.getReviewList();
		return review_list;
	}

	@Override
	public List<ReviewBoardVO> updateLike_count(ReviewBoardVO vo) {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		String before_id = reviewMapper.before_id(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("before_id",before_id);
		map.put("LIKE_ID",vo.getLIKE_ID());
		map.put("LIST_NUM",vo.getLIST_NUM());
		map.put("LIKE_COUNT",vo.getLIKE_COUNT());
		reviewMapper.updateLike_count(map);
		reviewMapper.updateLike_count2(map);
		
		List<ReviewBoardVO> review_list = null;
		review_list = reviewMapper.getLikeSelect(map);
		return review_list;
	}
	
	@Override
	public List<ReviewBoardVO> updateLike_count2(ReviewBoardVO vo) {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		String before_id = reviewMapper.before_id(vo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("before_id",before_id);
		map.put("LIKE_ID",vo.getLIKE_ID());
		map.put("LIST_NUM",vo.getLIST_NUM());
		map.put("LIKE_COUNT",vo.getLIKE_COUNT());
		reviewMapper.updateLike_count(map);
		reviewMapper.updateLike_count3(map);
		
		List<ReviewBoardVO> review_list = null;
		review_list = reviewMapper.getLikeSelect(map);
		return review_list;
	}

	@Override
	public ArrayList<Integer> usinglist_num_List_member(String id) {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		ArrayList<Integer> usinglist_num_List = reviewMapper.usinglist_num_List_member(id);
		return usinglist_num_List;
	}

	@Override
	public int getReviewListCount_member(String id) {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		int review_count = reviewMapper.getReviewListCount_member(id);
		return review_count;
	}

	@Override
	public int getReviewReportCountCheck(HashMap<String, Object> hashmap) throws Exception {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);
		int count = reviewMapper.getReviewReportCountCheck(hashmap);
		return count;
	}	
	
	@Override
	public List<ReviewBoardVO> getReviewReportForm(int num){
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);	
		List<ReviewBoardVO> boardlist = reviewMapper.getReviewDetail(num);
		return boardlist;
	}

	@Override
	public void reviwReportInsert(ReviewBoardVO vo) throws Exception {
		ReviewBoardMapper reviewMapper =  sqlSession.getMapper(ReviewBoardMapper.class);		
		reviewMapper.reviwReportInsert(vo);
		return;
	}

}
