package com.spring.petsitter.board;

import java.util.ArrayList;

public interface CommunicationBoardService {
	public int boardInsert(CommunicationBoardVO boardvo);
	public int getListCount(String member, String petsitter, int usinglist_num);
	public ArrayList<CommunicationBoardVO> getQuesionList(String member, String petsitter, int usinglist_num, int page, int limit);
	public String getUsingList_Member(int usinglist_num);
	public ArrayList<String> getPhotoList(int usinglist_num);
	public void uploadPhoto(CommunicationBoardVO boardvo);
}
