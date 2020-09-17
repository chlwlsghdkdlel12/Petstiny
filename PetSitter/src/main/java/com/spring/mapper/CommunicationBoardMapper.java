package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.board.CommunicationBoardVO;

public interface CommunicationBoardMapper {
	public int boardInsert(CommunicationBoardVO boardvo);
	public ArrayList<CommunicationBoardVO> getQuesionList(@Param(value = "MEMBER_ID") String member, 
														@Param(value = "PETSITTER_ID") String petsitter, 
														@Param(value = "USINGLIST_NUM") int usinglist_num,
														@Param(value = "startrow")int startrow, 
														@Param(value = "endrow") int endrow);
	public int getListCount(@Param(value = "MEMBER_ID") String member, @Param(value = "PETSITTER_ID") String petsitter, @Param(value = "USINGLIST_NUM") int usinglist_num);
	public String getUsingList_Member(int usinglist_num);
	public ArrayList<String> getPhotoList(int usinglist_num);
	public void uploadPhoto(CommunicationBoardVO boardvo);
}
