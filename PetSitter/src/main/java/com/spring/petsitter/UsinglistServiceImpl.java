package com.spring.petsitter;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.UsinglistMapper;
import com.spring.petsitter.board.ReviewBoardVO;

@Service("usinglistService")
public class UsinglistServiceImpl implements UsinglistService{

	@Autowired
	private SqlSession sqlSession;


	
	@Override
	public int review_refly_N(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.review_refly_N(Usinglist);
	}


	@Override
	public ReviewBoardVO review_refly_select(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.review_refly_select(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount_7d(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount_7d(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount_1m(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount_1m(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount_3m(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount_3m(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount_select(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount_select(Usinglist);
	}


	@Override
	public int petsitterSelectUsinglistCount(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsinglistCount(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_select(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsingList_select(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		
		return usinglistMapper.petsitterSelectUsingList(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_7d(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsingList_7d(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_1m(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsingList_1m(Usinglist);
	}


	@Override
	public ArrayList<PetsitterUsinglistVO> petsitterSelectUsingList_3m(UsinglistVO Usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.petsitterSelectUsingList_3m(Usinglist);
	}

	// 이용 내역 추가
	@Override
	public int insertUsinglist(UsinglistVO usinglist) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		usinglistMapper.defaultphoto(usinglist);
		return usinglistMapper.insertUsinglist(usinglist);
	}

	@Override
	public List<UsinglistVO> getUsinglistList(UsinglistVO uvo) {
		UsinglistMapper usinglistMapper = sqlSession.getMapper(UsinglistMapper.class);
		return usinglistMapper.getUsinglistList();
	}
	
}
