package com.spring.petsitter.board;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.petsitter.MemberService;

@Controller
public class PetsitterQnaBoardController {

	@Autowired
	private PetsitterQnaBoardService petsitterQnaBoardService;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/pqboardlist.me")
	public String pqboard(Model model, 
			@RequestParam(value = "page", required = false, defaultValue = "1") int page) {
		
		int limit = 10;
		
		int listcount = petsitterQnaBoardService.getListCount();
		
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		List<PetsitterQnaBoardVO> pqboard_list = petsitterQnaBoardService.getpqBoardList(hashmap);
		
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("pqboard_list", pqboard_list);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		return "board/pqboard";
	}
	
	@RequestMapping(value = "/pqboardlist2.bo", produces="application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterQnaBoardVO> getBoardList2(@RequestParam(value = "page", required = false,
	defaultValue = "1") int page) {
		
		int limit = 10;
		
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd");
		
		int listcount = petsitterQnaBoardService.getListCount();
				
		int startrow = (page - 1) * 10 + 1;
		int endrow = startrow + limit - 1;
		HashMap<String, Integer> hashmap = new HashMap<String, Integer>();
		hashmap.put("startrow", startrow);
		hashmap.put("endrow", endrow);
		
		List<PetsitterQnaBoardVO> pqboard_list = petsitterQnaBoardService.getpqBoardList(hashmap);
		System.out.println(pqboard_list.size());
		
		for(int i = 0; i < pqboard_list.size(); i++) {
		pqboard_list.get(i).setREAL_DATE(new_Format.format(pqboard_list.get(i).getPETSITTER_QNA_DATE()));
		}
		
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		for(int i = 1 ; i < pqboard_list.size(); i++) {
			pqboard_list.get(i).setPage2(0);
			pqboard_list.get(i).setListcount2(0);
			pqboard_list.get(i).setMaxpage2(0);
			pqboard_list.get(i).setStartpage2(0);
			pqboard_list.get(i).setEndpage2(0);
		}
		
		return pqboard_list;
	}
	
	@RequestMapping("/pqboardwriteform.me")
	public String pqboardInsertForm(HttpSession session, Model model) {
		String nickname = memberService.selectMember((String)session.getAttribute("id")).getMEMBER_NICKNAME();
		model.addAttribute("nickname", nickname);
		return "board/pqboard_write";
	}	
	
	@RequestMapping("/pqboardwrite.me")
	public String pqboardInsert(PetsitterQnaBoardVO vo) throws Exception {
		
		System.out.println("vo.getPETSITTER_ID() : " + vo.getPETSITTER_ID());
		System.out.println("vo.getPETSITTER_NICKNAME() : " + vo.getPETSITTER_NICKNAME());
		
		petsitterQnaBoardService.pqboardInsert(vo);
		
		return "redirect:/pqboardlist.me";
	}
	
	@RequestMapping("/pqboarddetail.me")
	public String getpqDetail(@RequestParam(value = "bno", required = true) int bno, Model model) throws Exception {
		PetsitterQnaBoardVO vo = petsitterQnaBoardService.getDetail(bno);
		model.addAttribute("vo", vo);
		
		return "board/pqboard_view";
	}
}
