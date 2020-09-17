package com.spring.petsitter.board;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class PQReplyController {

	@Autowired
	PQReplyService pqReplyService;
	
	/* 댓글 기능 컨트롤러 */
	
	@RequestMapping(value="/read_pqReply.bo", produces="application/json; charset=UTF-8") 
	private List<PQReplyVO> mCommentServiceList(@RequestParam int bno) throws Exception{
  	List<PQReplyVO> pqReplyList = pqReplyService.readReply(bno);
  	System.out.println(pqReplyList.size());
    return pqReplyList;
  }
	
	@RequestMapping(value="/write_pqReply.bo", produces="application/json; charset=UTF-8")
  private int writeReply(PQReplyVO comment, HttpSession session) throws Exception{
      comment.setWriter_name((String)session.getAttribute("name"));
      comment.setWriter_id((String)session.getAttribute("id"));
      comment.setWriter_rank((String)session.getAttribute("rank"));
      
      return pqReplyService.writeReply(comment);
  }
  
  @RequestMapping(value="/update_pqReply.bo", produces="application/json; charset=UTF-8") //��� ����)
   private int updateReply(@RequestParam int rno,  @RequestParam String content) throws Exception{
  	PQReplyVO comment = new PQReplyVO();
  	comment.setRno(rno);
  	comment.setContent(content);
  	
  	return pqReplyService.updateReply(comment);
  }
  
  @RequestMapping(value="/delete_pqReply.bo",  produces="application/json; charset=UTF-8") //��� ����
  private int deleteReply(@RequestParam(value="rno") int rno) throws Exception {
  	return pqReplyService.deleteReply(rno);
  }
	
	/* 여기까지 */
}
