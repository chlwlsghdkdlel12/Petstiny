package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.NoticeBoardMapper;

@Service("NoticeBoardService")
public class NoticeBoardServiceImpl implements NoticeBoardService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int getListCount() {
		NoticeBoardMapper noticeboardMapper = sqlSession.getMapper(NoticeBoardMapper.class);
		int res = noticeboardMapper.getListCount();
		return res;
	}
	
	@Override
	public List<NoticeBoardVO> getBoardList(HashMap<String, Integer> hashmap) {
		NoticeBoardMapper noticeboardMapper = sqlSession.getMapper(NoticeBoardMapper.class);
		
		List<NoticeBoardVO> noticeboardlist = noticeboardMapper.getBoardList(hashmap);
		return noticeboardlist;
	}

	@Override
	public NoticeBoardVO getDetail(int num) {
		NoticeBoardMapper noticeboardMapper = sqlSession.getMapper(NoticeBoardMapper.class);
		noticeboardMapper.setReadCountUpdate(num);
		NoticeBoardVO noticeboard = noticeboardMapper.getDetail(num);
		return noticeboard;
	}

	@Override
	public int boardInsert(NoticeBoardVO board) {
		NoticeBoardMapper noticeboardMapper = sqlSession.getMapper(NoticeBoardMapper.class);
		int res = noticeboardMapper.boardInsert(board);
		
		return res;
	}
	
	@Override
	public NoticeBoardVO boardModifyForm(int num) {
		NoticeBoardMapper noticeboardMapper = sqlSession.getMapper(NoticeBoardMapper.class);
		NoticeBoardVO noticeboard = noticeboardMapper.getDetail(num);
		return noticeboard;
	}	


	@Override
	public int boardModify(NoticeBoardVO modifyboard) {
		NoticeBoardMapper noticeboardMapper = sqlSession.getMapper(NoticeBoardMapper.class);
		int res = noticeboardMapper.boardModify(modifyboard);		
		
		return res;
	}

	@Override
	public int boardDelete(HashMap<String, String> hashmap) {
		NoticeBoardMapper noticeboardMapper = sqlSession.getMapper(NoticeBoardMapper.class);
		int res = noticeboardMapper.isBoardWriter(hashmap);
		int num = Integer.parseInt(hashmap.get("notice_num"));
		if (res == 1) {
			res = noticeboardMapper.boardDelete(num);
		}
		return res;
	}
}
