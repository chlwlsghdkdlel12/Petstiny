package com.spring.petsitter;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.spring.petsitter.board.CommunicationBoardVO;
import com.spring.petsitter.board.ReviewBoardVO;

public interface PetsitterService {
	public ArrayList<PetsitterVO> getSchedule(PetsitterVO petsitter);
	public int petsitterPwUpdate(PetsitterVO petsitter);
	public String petsitterIdFind(PetsitterVO petsitter);
	public int petsitterPwFind(PetsitterVO petsitter);
	public int petsitterSchedule(PetsitterScheduleVO petsitterSchedule);
	public void deleteschedule(PetsitterScheduleVO petsitterschedule);
	public int petsitterInsert(PetsitterVO petsitter);
	public int petsitterCheck(PetsitterVO petsitter);
	public ArrayList<PetsitterVO> petsitterList();
	public PetsitterVO selectPetsitter(String id);
	public int petsitterApproval(PetsitterVO petsitter);
	public int petsitterRefusal(PetsitterVO petsitter);
	public void petsitterscoreupdate(String id, double score);
	public void petsitterCountRank(PetsitterVO petsitter);
	public int petsitterUpdate(PetsitterVO petsitter);
	public int reflyUpdate(ReviewBoardVO vo);
	public int petsitterNicknameCheck(PetsitterVO petsitter);
	public PetsitterVO this_month_countAmount(String id); // 이번달 돌봄횟수, 매출
	
	// 신규 추천 펫시터 
	public ArrayList<PetsitterVO> petsitterList_date();
	// 이달의 펫시터
	public PetsitterVO petsitter_thisMonth();
	// 이달의 평점왕
	public PetsitterVO petsitter_thisMonth_score();
	// 이달의 실적왕
	public PetsitterVO petsitter_thisMonth_count();
	//언택 추가
	//위탁 펫시터 목록
	public List<PetsitterVO> petsitterList_We(String btn1, String btn2, String btn3, String btn4, 
			String btn_a, String btn_b, String btn_c, String btn_g, String btn_type); 
	public List<PetsitterVO> timeDate(String btn1, String btn2);

	//갤러리 및 후기 (start)
	public List<ReviewBoardVO> getReviewRating(HashMap<String, String> hashmap);
	public List<ReviewBoardVO> reviewList(String petsitterid);
	public int write_ReviewReply(ReviewBoardVO reply) throws Exception;
	public List<CommunicationBoardVO> galleryList(String petsitterid);
	public List<ReviewBoardVO> readReviewLikeCount(int reviewListNum) throws Exception;
	//갤러리 및 후기 (end)
}
