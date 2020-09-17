package com.spring.petsitter.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.MReplyMapper;
import com.spring.mapper.PQReplyMapper;

@Service("PQReplyService")
public class PQReplyServiceImpl implements PQReplyService {
	
	@Autowired
	private SqlSession sqlSession;

	
	@Override
	public int replyCount() throws Exception {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		return pqReplyMapper.replyCount();
	}
	
	@Override
	public List<PQReplyVO> readReply(int bno) throws Exception {
			PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
			return pqReplyMapper.readReply(bno);
	}

	@Override
	public int writeReply(PQReplyVO vo) throws Exception {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		return pqReplyMapper.writeReply(vo);
	}

	@Override
	public int updateReply(PQReplyVO vo) throws Exception {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		return pqReplyMapper.updateReply(vo);
	}

	@Override
	public int deleteReply(int rno) throws Exception {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		return pqReplyMapper.deleteReply(rno);
	}

	@Override
	public void checkArticle(String id, int num) {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		pqReplyMapper.checkArticle(id, num);
	}

	@Override
	public void checkArticle2(String id, int num) {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		pqReplyMapper.checkArticle2(id, num);
	}

	@Override
	public void checkReply(String bno, String rno, String id) {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		pqReplyMapper.checkReply(bno, rno, id);
	}

	@Override
	public void checkReply2(String bno, String rno, String id) {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		pqReplyMapper.checkReply2(bno, rno, id);
	}

	@Override
	public int searchIdReportReply(String id, int bno, int rno) {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		return pqReplyMapper.searchIdReportReply(id, bno, rno);
	}

	@Override
	public int searchIdReportArticle(String id, int num) {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		return pqReplyMapper.searchIdReportArticle(id, num);
	}

	@Override
	public void raDelete(String id, int num) {
		PQReplyMapper pqReplyMapper = sqlSession.getMapper(PQReplyMapper.class);
		pqReplyMapper.raDelete(id, num);
		
	}

	@Override
	public void rrDelete(String bno, String rno, String id) {
		MReplyMapper mReplyMapper = sqlSession.getMapper(MReplyMapper.class);
		mReplyMapper.rrDelete(id, bno, rno);
		
	}
}
