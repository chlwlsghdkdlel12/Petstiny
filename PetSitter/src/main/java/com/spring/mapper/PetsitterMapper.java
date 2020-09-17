package com.spring.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.PetsitterScheduleVO;
import com.spring.petsitter.PetsitterVO;
import com.spring.petsitter.board.CommunicationBoardVO;
import com.spring.petsitter.board.ReviewBoardVO;

public interface PetsitterMapper {
	public ArrayList<PetsitterVO> getSchedule(PetsitterVO petsitter);
	public int petsitterPwUpdate(PetsitterVO petsitter);
	public String petsitterIdFind(PetsitterVO petsitter);
	public int petsitterPwFind(PetsitterVO petsitter);
	public int insertPetsitter(PetsitterVO petsitter); //펫시터 회원가입 insert
	public int petsitterCheck(PetsitterVO petsitter); //펫시터 회원 확인
	public ArrayList<PetsitterVO> petsitterList(); //펫시터 목록
	public PetsitterVO selectPetsitter(String id); //ID로 펫시터 정보 select
	public int petsitterApproval(PetsitterVO petsitter); //펫시터 신청허가시 업데이트
	public int petsitterRefusal(PetsitterVO petsitter); //펫시터 신청거절시 업데이트
	public void petsitterscoreupdate(@Param(value="PETSITTER_ID") String id, @Param(value="PETSITTER_SCORE") double score); // 리뷰 작성 후 펫시터 평점 수정
	public void petsitterCountRank(PetsitterVO petsitter); // 펫시터 돌봄 횟수, 등급 업데이트
	public int petsitterSchedule(PetsitterScheduleVO petsitterSchedule); //펫시터 스케줄 추가
	public void deleteschedule(PetsitterScheduleVO petsitterschedule); // 결제 취소로 인한 스케줄 취소
	public int petsitterUpdate(PetsitterVO petsitter); //펫시터 정보변경
	public int reflyUpdate(ReviewBoardVO vo); //리뷰 답변
	public int petsitterNicknameCheck(PetsitterVO petsitter);
	public PetsitterVO this_month_countAmount(String id); // 이번달 돌봄횟수, 금액
	
	// 신규 추천 펫시터 
	public ArrayList<PetsitterVO> petsitterList_date();
	// 이달의 펫시터
	public PetsitterVO petsitter_thisMonth();
	// 이달의 평점왕
	public PetsitterVO petsitter_thisMonth_score();
	// 이달의 실적왕
	public PetsitterVO petsitter_thisMonth_count();
	
	//갤러리 및 후기 (start)
	public List<ReviewBoardVO> getReviewRating(HashMap<String, String> hashmap);
	public List<ReviewBoardVO> reviewList(String petsitterid);
	public int write_ReviewReply(ReviewBoardVO reply) throws Exception;
	public List<CommunicationBoardVO> galleryList(String petsitterid);
	public List<ReviewBoardVO> readReviewLikeCount(int reviewListNum) throws Exception;
	//갤러리 및 후기 (end)	
}
