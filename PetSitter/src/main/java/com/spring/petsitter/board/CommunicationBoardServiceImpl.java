package com.spring.petsitter.board;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.CommunicationBoardMapper;

@Service("CommunicationBoardService")
public class CommunicationBoardServiceImpl implements CommunicationBoardService {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public ArrayList<String> getPhotoList(int usinglist_num) {
		CommunicationBoardMapper boardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		ArrayList<String> list = boardMapper.getPhotoList(usinglist_num);
		if(list.size() == 0) {
			list.add("N");
		}
		return list;
	}
	
	@Override
	public int getListCount(String member, String petsitter, int usinglist_num) {
		CommunicationBoardMapper boardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int cnt = boardMapper.getListCount(member, petsitter, usinglist_num);
		return cnt;
	}
	
	@Override
	public ArrayList<CommunicationBoardVO> getQuesionList(String member, String petsitter, int usinglist_num, int page, int limit) {
		CommunicationBoardMapper boardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int startrow = (page - 1) * 5 + 1;
		int endrow = startrow + limit - 1;
		ArrayList<CommunicationBoardVO> boardList = boardMapper.getQuesionList(member, petsitter, usinglist_num, startrow, endrow);
		return boardList;
	}
	
	@Override
	public int boardInsert(CommunicationBoardVO boardvo) {
		CommunicationBoardMapper communicationboardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		int res = communicationboardMapper.boardInsert(boardvo);
		
		return res;
	}

	@Override
	public String getUsingList_Member(int usinglist_num) {
		CommunicationBoardMapper communicationboardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		String petsitter_id = communicationboardMapper.getUsingList_Member(usinglist_num);
		return petsitter_id;
	}

	@Override
	public void uploadPhoto(CommunicationBoardVO boardvo) {
		CommunicationBoardMapper communicationboardMapper = sqlSession.getMapper(CommunicationBoardMapper.class);
		communicationboardMapper.uploadPhoto(boardvo);
	}

}
