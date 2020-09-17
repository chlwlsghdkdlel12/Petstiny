package com.spring.petsitter.board.mboard;

import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;



@Controller
public class MemberBoardController {
	
	@Autowired
	private MemberBoardService memberboardService;	 
	
	@Autowired 
	private MReplyService mReplyService;
		
	@RequestMapping(value = "/mboardlist.me")
	public String memberboard(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) throws Exception{

		int limit = 10;

		int listcount = memberboardService.getListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<MemberBoardVO> mboard_list = memberboardService.getBoardList(hashmap); 

		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("mboard_list", mboard_list);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "board/memberboard";
	}	
	
	@RequestMapping("/mboardwriteform.me")
	public String boardInsertForm() {

		return "board/memberboard_write";
	}
	
	@RequestMapping("/mboardwrite.me")
	public String boardInsert(MemberBoardVO vo) throws Exception {
		System.out.println("vo.getMEMBER_ID() = " + vo.getMEMBER_ID());
		System.out.println("vo.getMEMBER_NICKNAME() = " + vo.getMEMBER_NICKNAME());
		System.out.println("vo.getMEMBER_FILE() = " + vo.getMEMBER_FILE());
		System.out.println("vo.getMEMBER_SECRET() = " + vo.getMEMBER_SECRET());
				
		if(vo.getMEMBER_SECRET() == null) {
			System.out.println("vo.getMEMBER_SECRET is null");
			vo.setMEMBER_SECRET("N");
		}
		else {
			System.out.println("vo.getMEMBER_SECRET is not null");
		}
				
		MultipartFile mf = vo.getMEMBER_FILE();
		System.out.println("mf.getSize() : " + mf.getSize());
		String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\";
				
		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename();
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			mf.transferTo(new File(uploadPath + storedFileName));
			vo.setMEMBER_ORG_FILE(mf.getOriginalFilename());
			vo.setMEMBER_UP_FILE(storedFileName);
		} else {
			vo.setMEMBER_ORG_FILE("");
			vo.setMEMBER_UP_FILE("");
		}
		
		memberboardService.boardInsert(vo);

		return "redirect:/mboardlist.me";
	}

	@RequestMapping("/mboarddetail.me")
	public String getDetail(@RequestParam(value = "num", required = true) int num, Model model) throws Exception {
		MemberBoardVO vo = memberboardService.getDetail(num);
		model.addAttribute("vo", vo);
		
		return "board/memberboard_view";
	}
	
	@RequestMapping("/mboardmodifyform.me")
	public String getModifyForm(@RequestParam(value = "num", required = true) int num, Model model) {
		MemberBoardVO vo = memberboardService.getDetail(num);
		
		model.addAttribute("vo", vo);
		
		return "board/memberboard_modify";
	}
	
	@RequestMapping("/mboardmodify.me")
	public String boardModify(MemberBoardVO vo) {
		
		memberboardService.boardModify(vo);
		
		return "redirect:/mboarddetail.me?num=" + vo.getMEMBER_NUM();
	}
	
	// 삭제
	@RequestMapping("/mboardDelete.me")
	public String boardDelete(@RequestParam(value="num", required=true) int num, HttpSession session, HttpServletResponse response) throws Exception {
		String id = (String)session.getAttribute("id");
				
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("member_num", Integer.toString(num));
		hashmap.put("member_id", id);
		int res = memberboardService.boardDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1)
		{
			writer.write("<script>alert('delete success');"
					+ "location.href='./mboardlist.me';</script>");
		}
		else
		{
			writer.write("<script>alert('delete failed');"
					+ "location.href='./mboardlist.me';</script>");
		}
		return null;
	}

	// 글 신고하기
	@RequestMapping("/reportArticle.me")
	public String reportInsert(ReportArticleVO report) throws Exception {
		
		int cnt = mReplyService.searchIdReportArticle(report.getMEMBER_ID(), report.getMEMBER_NUM());
		
		System.out.println(report.getMEMBER_ID() + "의 신고 횟수 : " + cnt);
		
		if (cnt < 1) {
		System.out.println("신고자 : " + report.getMEMBER_ID());
		System.out.println("신고 글 번호 : " + report.getMEMBER_NUM());
		System.out.println("신고 사유 : " + report.getREPORT_REASON());
		System.out.println("신고 게시판 : " + report.getBTYPE());
		memberboardService.reportInsert(report);
		return "redirect:/mboarddetail.me?num=" + report.getMEMBER_NUM();
		} else {
			System.out.println("이미 신고한 사용자입니다.");
			return "redirect:/mboarddetail.me?num=" + report.getMEMBER_NUM();
		}
	}
	
	// 댓글 신고하기
	@RequestMapping("/reportReply.me")
	public String reportReply(ReportReplyVO report) throws Exception {		
		
		int cnt = mReplyService.searchIdReportReply(report.getMEMBER_ID(), report.getBNO(), report.getRNO());
		
		System.out.println("신고 횟수 : " + cnt);
		
		if(cnt < 1) {		
			System.out.println("신고자 : " + report.getMEMBER_ID());
			System.out.println("신고 글 번호 : " + report.getBNO());
			System.out.println("신고 리플 번호 : " + report.getRNO());
			System.out.println("신고 사유 : " + report.getREPORT_REASON());
			System.out.println("신고 게시판 : " + report.getBTYPE());
			memberboardService.reportReply(report);
			return "redirect:/mboarddetail.me?num=" + report.getBNO();
		} else {
			System.out.println("이미 신고한 사용자입니다.");
			return "redirect:/mboarddetail.me?num=" + report.getBNO();
		}
	}

	@RequestMapping("/filedownload.bo")
  public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception{
  	response.setCharacterEncoding("utf-8");
  	
    String of = request.getParameter("of"); // 서버에 업로드된 변경된 실제 파일명
    String of2 = request.getParameter("of2"); // 오리지날 파일명
      
     /* //웹사이트 루트디렉토리의 실제 디스크상의 경로 알아내기.
     String uploadPath = request.getSession().getServletContext().getRealPath("/upload");
     String fullPath = uploadPath+"/"+of; 
     */
     String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\"; // 직접 경로 지정
     String fullPath = uploadPath + of;
     File downloadFile = new File(fullPath);
     
     //파일 다운로드를 위해 컨텐츠 타입을 application/download 설정
     response.setContentType("application/download; charset=UTF-8");
     //파일 사이즈 지정
     response.setContentLength((int)downloadFile.length());
     //다운로드 창을 띄우기 위한 헤더 조작
     response.setHeader("Content-Disposition", "attachment;filename="
                                      + new String(of2.getBytes(), "ISO8859_1"));
     response.setHeader("Content-Transfer-Encoding","binary");
     
     System.out.println("downloadFile : " + downloadFile);
     
     FileInputStream fin = new FileInputStream(downloadFile);
     ServletOutputStream sout = response.getOutputStream();

     byte[] buf = new byte[1024];
     int size = -1;
     while ((size = fin.read(buf, 0, buf.length)) != -1) {
        sout.write(buf, 0, size);
     }
     fin.close();
     sout.close();
  }
}
