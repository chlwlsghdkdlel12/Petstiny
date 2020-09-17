package com.spring.petsitter.board;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.ProBoardMapper;

@Service("ProrBoardService")
public class ProBoardServiceImpl implements ProBoardService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getProListCount(HashMap<String, Object> hashmap) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		int res = boardMapper.getProListCount(hashmap);
		return res;
	}

	@Override
	public List<ProBoardVO> getProBoardList(HashMap<String, Object> hashmap) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		List<ProBoardVO> boardlist = boardMapper.getProBoardList(hashmap);
		return boardlist;
	}

	@Override
	public void proboardInsert(ProBoardVO board) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		board.setMEMBER_NICKNAME(boardMapper.nicknameFind(board));
		boardMapper.proboardInsert(board);
		
		return;
	}

	@Override
	public List<ProBoardVO> getProDetail(int num) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		boardMapper.setProReadCountUpdate(num);
		List<ProBoardVO> boardlist = boardMapper.getProDetail(num);
		return boardlist;
	}

	@Override
	public ProBoardVO getProModifyForm(int num) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);		
		ProBoardVO board = boardMapper.getProModifyForm(num);
		return board;
	}

	@Override
	public void proModifyUpdate(ProBoardVO board) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		board.setMEMBER_NICKNAME(boardMapper.nicknameFind(board));
		boardMapper.proModifyUpdate(board);
		
		return;
	}

	@Override
	public void proboardDelete(HashMap<String, String> hashmap) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		int res =  boardMapper.isProBoardWriter(hashmap);
		int num = Integer.parseInt(hashmap.get("num"));
		if (res == 1) {
			boardMapper.proLikeDelete(num);
			boardMapper.proBoardDelete(num);
		}
		return;
	}	
	

	@Override
	public int getProReportCountCheck(HashMap<String, Object> hashmap)throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);		
		int count = boardMapper.getProReportCountCheck(hashmap);
		return count;
	}	
	
	@Override
	public List<ProBoardVO> getProReportForm(int num) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);		
		List<ProBoardVO> boardlist = boardMapper.getProDetail(num);
		return boardlist;
	}


	@Override
	public void proReportInsert(ProBoardVO board) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		boardMapper.proReportInsert(board);
		return;
	}
	
	@Override
	public int getProReportReplyCountCheck(ProReplyVO vo)throws Exception{
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);		
		int count = boardMapper.getProReportReplyCountCheck(vo);
		return count;
	}
	
	
	
	@Override
	public List<ProReplyVO> getProReportReplyForm(ProReplyVO vo) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);	
		List<ProReplyVO> boardlist = boardMapper.getProReportReplyForm(vo);
		return boardlist;
	}
	
	@Override
	public void proReportReplyInsert(ProReplyVO vo) {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		boardMapper.proReportReplyInsert(vo);
		return;	
	}
	
	
	//하단부터 댓글 ServiceImpl 부분 	
	@Override
	public List<ProReplyVO> readProReply(int bno) throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		List<ProReplyVO> list = boardMapper.readProReply(bno);
		
		return list;
	}

	@Override
	public int writeProReply(ProReplyVO vo) throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		String gid = vo.getWriter_id();
		String nic = boardMapper.nicknameFind02(gid);
		vo.setWriter_nickname(nic);
		if(nic == null) {
			nic = boardMapper.nicknameFind03(gid);
			vo.setWriter_nickname(nic);
		}
		return boardMapper.writeProReply(vo);
	}

	@Override
	public int updateProReply(ProReplyVO vo) throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		return boardMapper.updateProReply(vo);
	}

	@Override
	public int deleteProReply(ProReplyVO vo) throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		return boardMapper.deleteProReply(vo);
	}

	@Override
	public List<ProReplyVO> proReplyCount(int bno) throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		List<ProReplyVO> replycount = boardMapper.proReplyCount(bno);
		return replycount;
	}

	@Override
	public List<ProBoardVO> read_ProLikeCount(int bno) throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		List<ProBoardVO> list = boardMapper.read_ProLikeCount(bno);
		return list;
	}

	@Override
	public List<ProBoardVO> update_Pro_LikeCount(ProBoardVO vo) throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		String before_id = boardMapper.before_id(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("before_id",before_id);
		map.put("LIKE_ID",vo.getLIKE_ID());
		map.put("PRO_NUM",vo.getPRO_NUM());
		map.put("PRO_LIKECOUNT",vo.getPRO_LIKECOUNT());
		boardMapper.update_Pro_LikeCount1(map);
		boardMapper.update_Pro_LikeCount2(map);
		List<ProBoardVO> list = boardMapper.read_ProLikeCount(vo.getPRO_NUM());
		
		return list;
	}

	@Override
	public List<ProBoardVO> downdate_Pro_LikeCount(ProBoardVO vo) throws Exception {
		ProBoardMapper boardMapper = sqlSession.getMapper(ProBoardMapper.class);
		String before_id = boardMapper.before_id(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("before_id",before_id);
		map.put("LIKE_ID",vo.getLIKE_ID());
		map.put("PRO_NUM",vo.getPRO_NUM());
		map.put("PRO_LIKECOUNT",vo.getPRO_LIKECOUNT());
		boardMapper.update_Pro_LikeCount1(map);
		boardMapper.update_Pro_LikeCount3(map);
		List<ProBoardVO> list = boardMapper.read_ProLikeCount(vo.getPRO_NUM());
		
		return list;
	}

	
}
