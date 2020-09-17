package com.spring.petsitter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PetsitterMapper;
import com.spring.petsitter.board.CommunicationBoardVO;
import com.spring.petsitter.board.ReviewBoardVO;
import com.spring.mapper.ReservationMapper;

@Service("petsitterService")
public class PetsitterServiceImpl implements PetsitterService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int petsitterPwUpdate(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterPwUpdate(petsitter);
		return res;
	}

	@Override
	public ArrayList<PetsitterVO> getSchedule(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		
		return petsitterMapper.getSchedule(petsitter);
	}

	@Override
	public String petsitterIdFind(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		String res = petsitterMapper.petsitterIdFind(petsitter);
		return res;
	}

	@Override
	public int petsitterPwFind(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterPwFind(petsitter);
		return res;
	}

	@Override
	public int petsitterNicknameCheck(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterNicknameCheck(petsitter);
		return res;
	}

	@Override
	public int reflyUpdate(ReviewBoardVO vo) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res =petsitterMapper.reflyUpdate(vo);
		return res;
	}

	@Override
	public int petsitterUpdate(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterUpdate(petsitter);
		return res;
	}

	@Override
	public int petsitterSchedule(PetsitterScheduleVO petsitterSchedule) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterSchedule(petsitterSchedule);
		
		return res;
	}
	
	@Override
	public void deleteschedule(PetsitterScheduleVO petsitterschedule) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		petsitterMapper.deleteschedule(petsitterschedule);
	}
	
	@Override
	public int petsitterInsert(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.insertPetsitter(petsitter);
		return res;
	}

	@Override
	public int petsitterCheck(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		int res = petsitterMapper.petsitterCheck(petsitter);
		return res;
	}

	@Override
	public ArrayList<PetsitterVO> petsitterList() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		ArrayList<PetsitterVO> petsitter_list = petsitterMapper.petsitterList();
		return petsitter_list;
	}

	@Override
	public PetsitterVO selectPetsitter(String id) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		PetsitterVO vo = new PetsitterVO();
		vo = petsitterMapper.selectPetsitter(id);
		return vo;
	}

	@Override
	public int petsitterApproval(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		int res = petsitterMapper.petsitterApproval(petsitter);
		return res;
	}

	@Override
	public int petsitterRefusal(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		int res = petsitterMapper.petsitterRefusal(petsitter);
		return res;
	}
	
	@Override
	public void petsitterCountRank(PetsitterVO petsitter) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		petsitterMapper.petsitterCountRank(petsitter);
	}
	
	// 위탁 펫시터 목록
	@Override
	public List<PetsitterVO> petsitterList_We(String btn1, String btn2, String btn3, String btn4, 
											  String btn_a, String btn_b, String btn_c, String btn_g, String btn_type) {
		ReservationMapper reservationMapper = sqlSession.getMapper(ReservationMapper.class);
		List<PetsitterVO> petsitter_list = reservationMapper.petsitterList_We(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
		return petsitter_list;
	}
	@Override
	public List<PetsitterVO> timeDate(String btn1, String btn2) {
		ReservationMapper reservationMapper = sqlSession.getMapper(ReservationMapper.class);
		List<PetsitterVO> timeDate = reservationMapper.timeDate(btn1, btn2);
		return timeDate;
	}
	
	// 리뷰 등록 후 펫시터 평점 수정
	@Override
	public void petsitterscoreupdate(String id, double score) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class); 
		petsitterMapper.petsitterscoreupdate(id, score);
	}

	// 가장 최근에 가입한 펫시터
	@Override
	public ArrayList<PetsitterVO> petsitterList_date() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		ArrayList<PetsitterVO> petsitter_list = petsitterMapper.petsitterList_date();
		return petsitter_list;
	}
	
	@Override
	public PetsitterVO petsitter_thisMonth() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		PetsitterVO petsitter = petsitterMapper.petsitter_thisMonth();
		return petsitter;
	}

	@Override
	public PetsitterVO petsitter_thisMonth_score() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		PetsitterVO petsitter = petsitterMapper.petsitter_thisMonth_score();
		return petsitter;
	}

	@Override
	public PetsitterVO petsitter_thisMonth_count() {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		PetsitterVO petsitter = petsitterMapper.petsitter_thisMonth_count();
		return petsitter;
	}

	@Override
	public PetsitterVO this_month_countAmount(String id) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		PetsitterVO petsitter = petsitterMapper.this_month_countAmount(id);
		return petsitter;
	}
	
	//갤러리 및 후기 (start)
	@Override
	public List<ReviewBoardVO> getReviewRating(HashMap<String, String> hashmap) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<ReviewBoardVO> reviewRating = petsitterMapper.getReviewRating(hashmap);
		return reviewRating;
	}
	
	@Override
	public List<ReviewBoardVO> reviewList(String petsitterid) {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<ReviewBoardVO> list = petsitterMapper.reviewList(petsitterid);	
		return list;
	}
	@Override
	public int write_ReviewReply(ReviewBoardVO reply) throws Exception {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		return petsitterMapper.write_ReviewReply(reply);
	}
	
	@Override	
	public List<CommunicationBoardVO> galleryList(String petsitterid){
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<CommunicationBoardVO> list = petsitterMapper.galleryList(petsitterid);
		return list;		
	}	

	@Override
	public List<ReviewBoardVO> readReviewLikeCount(int reviewListNum) throws Exception {
		PetsitterMapper petsitterMapper = sqlSession.getMapper(PetsitterMapper.class);
		List<ReviewBoardVO> list = petsitterMapper.readReviewLikeCount(reviewListNum);	
		return list;
	}
	//갤러리 및 후기 (end)	
}
