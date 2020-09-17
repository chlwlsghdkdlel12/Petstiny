package com.spring.petsitter.board;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.petsitter.MemberService;
import com.spring.petsitter.MemberVO;
import com.spring.petsitter.PetService;
import com.spring.petsitter.PetVO;
import com.spring.petsitter.PetsitterService;
import com.spring.petsitter.PetsitterVO;

@Controller
public class ReviewBoardController {
	
	@Autowired
	private ReviewBoardService ReviewboardService;	
	
	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PetsitterQnaBoardService petsitterQnaBoardService;
	
	@RequestMapping(value = "insertReview.me")
	public String insertReview(ReviewBoardVO vo) throws Exception {
		String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\";
		
		ArrayList<String> review_up_photolist = new ArrayList<String>();
		for(int i = 0; i < vo.getREVIEW_PHOTO().length; i++) {
		MultipartFile mf = vo.getREVIEW_PHOTO()[i];
			if(!(mf.getOriginalFilename().equals(""))) {
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension;
				
				if(mf.getSize() != 0) {
					mf.transferTo(new File(uploadPath + storedFileName));
				}
				
				review_up_photolist.add(storedFileName);
			}
		}
		vo.setREVIEW_UP_PHOTO(String.join(",", review_up_photolist));
		
		double petsitter_score = vo.getREVIEW_SCORE();
		PetsitterVO petsitter = petsitterService.selectPetsitter(vo.getPETSITTER_ID());
		if(petsitter.getPETSITTER_SCORE() == 0) {
			petsitter.setPETSITTER_SCORE(petsitter_score);
			petsitterService.petsitterscoreupdate(petsitter.getPETSITTER_ID(), petsitter_score);
		} else {
			double org_petsitter_score = petsitter.getPETSITTER_SCORE();
			double result_score = (petsitter_score + org_petsitter_score) / 2.0;
			petsitter.setPETSITTER_SCORE(Math.round(result_score * 10.0) / 10.0);
			
			petsitterService.petsitterscoreupdate(petsitter.getPETSITTER_ID(), Math.round(result_score * 10.0) / 10.0);
		}
		ReviewboardService.insertReview(vo);
		
		return "redirect:/memberinfo.me";
	}
	
	@RequestMapping(value = "review_board.bo", method = RequestMethod.GET)
	public String postscript_board() {
				
		return "board/review_board";
	}

	@RequestMapping(value="/getReviewBoardJSON.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	// jsp와 같은 뷰를 전달 하는게 아닌 데이터를 전달 하기 위해 사용 
	public List<ReviewBoardVO> getReviewBoardJSONGET() {
		List<ReviewBoardVO> review_list = ReviewboardService.getReviewList();

        return review_list;
	}
	
	@RequestMapping(value="/updateLike_count.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<ReviewBoardVO>updateLike_count(ReviewBoardVO vo) {
		
		List<ReviewBoardVO> review_list = ReviewboardService.updateLike_count(vo);
		return review_list;
	}
	
	@RequestMapping(value="/updateLike_count2.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	public List<ReviewBoardVO>updateLike_count2(ReviewBoardVO vo) {
		List<ReviewBoardVO> review_list = ReviewboardService.updateLike_count2(vo);
	    
		return review_list;
	}
	
	/*신고 controller 시작*/
	@RequestMapping("/reviewreportform.bo") 
	@ResponseBody	
	public List<ReviewBoardVO> getReviewReportForm(
			@RequestParam(value="num", required=true) int num,
			@RequestParam(value="sessionid", required=true) String sessionid,
			@RequestParam(value="boardType", required=true) String boardType) throws Exception {
		HashMap<String, Object> hashmap = new HashMap<String, Object>();
		hashmap.put("num", num);
		hashmap.put("sessionid", sessionid);
		hashmap.put("boardType", boardType);
		int count = ReviewboardService.getReviewReportCountCheck(hashmap);
		
		List<ReviewBoardVO> boardlist = ReviewboardService.getReviewReportForm(num);
		if(count != 0) {
			boardlist.get(0).setREVIEW_CONTENT("NN");
		}
		return boardlist;
	}	

	@RequestMapping("/reviewreportinsert.bo") 
	public String reviwReportInsert(ReviewBoardVO vo) throws Exception {
		ReviewboardService.reviwReportInsert(vo);
		return "redirect:/review_board.bo";
	}	

	@RequestMapping("/reviewreportinsert2.bo") 
	public String reviwReportInsert2(ReviewBoardVO vo,Model model, HttpSession session) throws Exception {
		ReviewboardService.reviwReportInsert(vo);
		String id = (String)session.getAttribute("id");
		if(id == null) {
			id="N";
		}
		int point = 0;
		ArrayList<PetVO> list = petService.selectPet(id);
		MemberVO member = memberService.selectMember(id);
		if(member != null) {
			point = member.getMEMBER_POINT();
		}
		model.addAttribute("point" , point);
		PetsitterVO petsitter = petsitterService.selectPetsitter(vo.getPETSITTER_ID());
		ArrayList<PetsitterVO> schedule = petsitterService.getSchedule(petsitter);
		
		String startdate = "";
		String enddate = "";
		if(!(schedule == null)) {
			for(int i = 0; i <schedule.size(); i++) {
				startdate += schedule.get(i).getSTART_DATE().substring(0,10)+",";
				enddate += schedule.get(i).getEND_DATE().substring(0,10)+",";
			}
			petsitter.setSTART_DATE(startdate);
			petsitter.setEND_DATE(enddate);
			
			if(!petsitter.getPETSITTER_ADDRESS().equals("N")) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter.setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(!petsitter.getPETSITTER_SERVICE_LIST().equals("N")) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter.setPETSITTER_SERVICE(petsitter_service);
			}
			
			
		}

		String radio_basic;
		String[] type = petsitter.getPETSITTER_TYPE().split(",");
		if(type[0].equals("위탁")) {
			radio_basic = "we";
		}else {
			radio_basic = "bang";
		}
		String[] address = petsitter.getPETSITTER_ADDRESS().split(" ");
		String[] homephoto = petsitter.getPETSITTER_PHOTO_HOME_FILE().split(",");
		String[] certphoto = petsitter.getPETSITTER_PHOTO_CERT_FILE().split(",");
		model.addAttribute("startdate", startdate);
		model.addAttribute("start_date", "Check In Date");
		model.addAttribute("end_date", "Check In Date");
		model.addAttribute("start_time","Check In Time");
		model.addAttribute("end_time","Check In Time");
		System.out.println("startdate11=" + startdate);
		model.addAttribute("enddate", enddate);
		model.addAttribute("address", address[0]+" "+address[1]);
		model.addAttribute("addr", petsitter.getPETSITTER_ADDRESS());
		model.addAttribute("safeaddr", petsitter.getPETSITTER_SAFEADDR());
		System.out.println(petsitter.getPETSITTER_SAFEADDR());
		model.addAttribute("home_photo1","N");
		model.addAttribute("home_photo2","N");
		model.addAttribute("home_photo3","N");
		model.addAttribute("cert_photo1","N");
		model.addAttribute("cert_photo2","N");
		model.addAttribute("cert_photo3","N");
		
		for(int j = 0; j < homephoto.length; j++) {
		model.addAttribute("home_photo"+(j+1), homephoto[j]);
		}
		for(int j = 0; j < certphoto.length; j++) {
		model.addAttribute("cert_photo"+(j+1), certphoto[j]);
		}
		if(!petsitter.getPETSITTER_PRICE_60M().equals("N")) {
		model.addAttribute("price24", 24*Integer.parseInt(petsitter.getPETSITTER_PRICE_60M()));
		model.addAttribute("bigPrice", 1000 +Integer.parseInt(petsitter.getPETSITTER_PRICE_60M()));
		}else {
		model.addAttribute("price24", 0);
		model.addAttribute("bigPrice",0);
		}
		if(!petsitter.getPETSITTER_PRICE_30M().equals("N")) {
		model.addAttribute("price60", 2*Integer.parseInt(petsitter.getPETSITTER_PRICE_30M()));
		model.addAttribute("bigPrice2", 1000 +Integer.parseInt(petsitter.getPETSITTER_PRICE_30M()));
		}else {
			model.addAttribute("price60", 0);
			model.addAttribute("bigPrice2", 0);
		}
		model.addAttribute("rank",petsitter.getPETSITTER_RANK());
		model.addAttribute("nickname",petsitter.getPETSITTER_NICKNAME());
		model.addAttribute("petsitter_id",petsitter.getPETSITTER_ID());
		model.addAttribute("review_count",petsitter.getPETSITTER_REVIEWCOUNT());
		model.addAttribute("cert_list",petsitter.getPETSITTER_CERT_LIST());
		model.addAttribute("introduce",petsitter.getPETSITTER_INTRODUCE());
		model.addAttribute("service",petsitter.getPETSITTER_SERVICE_LIST());
		model.addAttribute("price",petsitter.getPETSITTER_PRICE_60M());
		model.addAttribute("price2",petsitter.getPETSITTER_PRICE_30M());
		model.addAttribute("profile",petsitter.getPETSITTER_PHOTO_PROFILE_FILE());
		model.addAttribute("photo_upfile",petsitter.getPETSITTER_PHOTO_UPFILE());
		model.addAttribute("radio_basic",radio_basic);
		model.addAttribute("list", list);

		String cert_count = "";
		if(certphoto[0].equals("N")) {
			cert_count = "0";
		}else {
			cert_count = String.valueOf(certphoto.length);
		}
		model.addAttribute("cert_count", cert_count);
		
		int limit = 20;
		int page = 1;
		
		int listcount = petsitterQnaBoardService.getListCount();
		int maxpage = (int) ((double) listcount / limit + 0.95);
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		model.addAttribute("page", page);
		model.addAttribute("listcount", listcount);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		
		
		return "foster_view";
	}	
}
