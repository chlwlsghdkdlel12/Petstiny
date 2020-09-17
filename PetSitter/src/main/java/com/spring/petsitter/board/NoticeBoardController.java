package com.spring.petsitter.board;

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
public class NoticeBoardController {
	
	@Autowired
	private NoticeBoardService noticeboardService;		
			
	@RequestMapping(value = "/noticeboardlist.me")
	public String memberboard(Model model,
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		int limit = 10;

		int listcount = noticeboardService.getListCount();

		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<NoticeBoardVO> nboard_list = noticeboardService.getBoardList(hashmap); 

		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("nboard_list", nboard_list);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);

		return "board/noticeboard";
	}	
	
	@RequestMapping("/noticeboardwriteform.me")
	public String boardInsertForm() {

		return "board/noticeboard_write";
	}
	
	@RequestMapping("/noticeboardwrite.me")
	public String boardInsert(NoticeBoardVO vo) throws Exception {
		System.out.println("vo.getNOTICE_ID() = " + vo.getNOTICE_ID());
		System.out.println("vo.getNOTICE_NICKNAME() = " + vo.getNOTICE_NICKNAME());
		System.out.println("vo.getNOTICE_FILE() = " + vo.getNOTICE_FILE());
		System.out.println("vo.getNOTI() = " + vo.getNOTI());
		
		if(vo.getNOTI() == null) {
			System.out.println("vo.getNOTI is off");
			vo.setNOTI("N");
		} else {
			System.out.println("vo.getNOTI is on");
			vo.setNOTI("Y");
		}
		
				
		MultipartFile mf = vo.getNOTICE_FILE();
		System.out.println("mf.getSize() : " + mf.getSize());
		String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\";
				
		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename();
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
			mf.transferTo(new File(uploadPath + storedFileName));
			vo.setNOTICE_ORG_FILE(mf.getOriginalFilename());
			vo.setNOTICE_UP_FILE(storedFileName);
		} else {
			vo.setNOTICE_ORG_FILE("");
			vo.setNOTICE_UP_FILE("");
		}
		
		noticeboardService.boardInsert(vo);

		return "redirect:/noticeboardlist.me";
	}

	@RequestMapping("/noticeboarddetail.me")
	public String getDetail(@RequestParam(value = "num", required = true) int num, Model model) throws Exception {
		NoticeBoardVO vo = noticeboardService.getDetail(num);
		model.addAttribute("vo", vo);
		
		return "board/noticeboard_view";
	}
	
	@RequestMapping("/noticeboardmodifyform.me")
	public String getModifyForm(@RequestParam(value = "num", required = true) int num, Model model) {
		NoticeBoardVO vo = noticeboardService.getDetail(num);
		
		model.addAttribute("vo", vo);
		
		return "board/noticeboard_modify";
	}
	
	@RequestMapping("/noticeboardmodify.me")
	public String boardModify(NoticeBoardVO vo) {
		
		noticeboardService.boardModify(vo);
		
		return "redirect:/noticeboarddetail.me?num=" + vo.getNOTICE_NUM();
	}
	
	// 삭제
	@RequestMapping("/noticeboardDelete.me")
	public String boardDelete(@RequestParam(value="num", required=true) int num, HttpSession session, HttpServletResponse response) throws Exception {
		String id = (String)session.getAttribute("id");
				
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("notice_num", Integer.toString(num));
		hashmap.put("notice_id", id);
		int res = noticeboardService.boardDelete(hashmap);
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		if (res == 1)
		{
			writer.write("<script>alert('delete success');"
					+ "location.href='./noticeboardlist.me';</script>");
		}
		else
		{
			writer.write("<script>alert('delete failed');"
					+ "location.href='./noticeboardlist.me';</script>");
		}
		return null;
	}
	
	@RequestMapping("/filedownload2.bo")
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
