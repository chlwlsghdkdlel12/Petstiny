package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PetsitterQnaBoardMapper;

@Service("PetsitterQnaBoardService")
public class PetsitterQnaBoardServiceImpl implements PetsitterQnaBoardService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int pqboardInsert(PetsitterQnaBoardVO board) {
		PetsitterQnaBoardMapper petsitterQnaBoardMapper = sqlSession.getMapper(PetsitterQnaBoardMapper.class);
		int res = petsitterQnaBoardMapper.pqboardInsert(board);
		
		return res;
	}

	@Override
	public PetsitterQnaBoardVO getDetail(int num) {
		PetsitterQnaBoardMapper petsitterQnaBoardMapper = sqlSession.getMapper(PetsitterQnaBoardMapper.class);
		PetsitterQnaBoardVO petsitterQnaBoard = petsitterQnaBoardMapper.getDetail(num);
		
		return petsitterQnaBoard;
	}

	@Override
	public int getListCount() {
		PetsitterQnaBoardMapper petsitterQnaBoardMapper = sqlSession.getMapper(PetsitterQnaBoardMapper.class);
		int res = petsitterQnaBoardMapper.getListCount();
		
		return res;
	}

	@Override
	public List<PetsitterQnaBoardVO> getpqBoardList(HashMap<String, Integer> hashmap) {
		PetsitterQnaBoardMapper petsitterQnaBoardMapper = sqlSession.getMapper(PetsitterQnaBoardMapper.class);
		
		List<PetsitterQnaBoardVO> petsitterQnaBoardList = petsitterQnaBoardMapper.getpqBoardList(hashmap);
		return petsitterQnaBoardList;
	}

}
