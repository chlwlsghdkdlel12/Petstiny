package com.spring.petsitter;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.petsitter.board.CommunicationBoardVO;
import com.spring.petsitter.board.PetsitterQnaBoardService;
import com.spring.petsitter.board.ReviewBoardVO;

@Controller
public class ReservationController {
		
	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	private PetService petService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PetsitterQnaBoardService petsitterQnaBoardService;
	// 위탁 돌봄 예약 페이지 이동
	@RequestMapping(value = "reservation1.br")
	public String reservation1() {
		
		return "reservation";
	}
	
	// 방문 돌봄 예약 페이지 이동
	@RequestMapping(value = "reservation2.br")
	public String reservation2() {
		
		return "reservation2";
	}
	
	// ajax와 맞춤조건을 이용한 펫시터목록 뿌려주기
	@RequestMapping(value = "getPetsitterList_We.br", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public List<PetsitterVO> getPetsitterList_We( String btn1, String btn2, String btn3, String btn4, 
												  String btn_a, String btn_b, String btn_c, String btn_g, String btn_type)
	{
		List<PetsitterVO> petsitter_list = petsitterService.petsitterList_We(btn1, btn2, btn3, btn4, btn_a, btn_b, btn_c, btn_g, btn_type);
	
		for(int i = 0; i < petsitter_list.size(); i++) {
			PetsitterVO petsitter = petsitter_list.get(i);
			ArrayList<PetsitterVO> vo = petsitterService.getSchedule(petsitter);
			String startdate = "";
			String enddate = "";
			if(!(vo == null)) {
			for(int j = 0; j <vo.size(); j++) {
				startdate += vo.get(j).getSTART_DATE().substring(0,10)+",";
				enddate += vo.get(j).getEND_DATE().substring(0,10)+",";
			}
			petsitter_list.get(i).setSTART_DATE(startdate);
			petsitter_list.get(i).setEND_DATE(enddate);
			}
			if(!petsitter.getPETSITTER_ADDRESS().equals("N")) {
				String[] petsitter_address = petsitter.getPETSITTER_ADDRESS().split(",");
				petsitter_list.get(i).setPETSITTER_ADDRESS(petsitter_address[1]);
			}
			
			if(!petsitter.getPETSITTER_SERVICE_LIST().equals("N")) {
				String[] petsitter_service = petsitter.getPETSITTER_SERVICE_LIST().split(",");
				petsitter_list.get(i).setPETSITTER_SERVICE(petsitter_service);
			}
		}
		return petsitter_list;
	}
	
	@RequestMapping(value = "mapfoster_view.me")
	public String mapfoster_view(PetsitterVO vo, Model model, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
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
		ArrayList<PetsitterVO> schedule = petsitterService.getSchedule(vo);
		
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

	@RequestMapping(value = "foster_view.me", method = RequestMethod.POST)
	public String foster_view(HttpSession session, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String id = (String)session.getAttribute("id");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		ArrayList<PetVO> list = new ArrayList<PetVO>();
		int point = 0;
		if(session.getAttribute("id") != null) {
		MemberVO member = memberService.selectMember(id);
		list = petService.selectPet(id);
		if(member != null) {
			point = member.getMEMBER_POINT();
		}
		}
		model.addAttribute("list", list);
		System.out.println("222222");
		model.addAttribute("point", point);
		model.addAttribute("petsitter_id",request.getParameter("petsitter_id"));
		model.addAttribute("addr",request.getParameter("addr"));
		model.addAttribute("startdate",request.getParameter("startdate"));
		model.addAttribute("enddate",request.getParameter("enddate"));
		model.addAttribute("safeaddr",request.getParameter("safeaddr"));
		model.addAttribute("address",request.getParameter("address"));
		model.addAttribute("nickname",request.getParameter("nickname"));
		model.addAttribute("rank",request.getParameter("rank"));
		String rc= (String)request.getParameter("review_count");
		int review_count = Integer.parseInt(rc);
		model.addAttribute("review_count",review_count);
		model.addAttribute("cert_list",request.getParameter("cert_list"));
		model.addAttribute("introduce",request.getParameter("introduce"));
		model.addAttribute("service",request.getParameter("service"));
		model.addAttribute("price",request.getParameter("price"));
		model.addAttribute("price2",request.getParameter("price2"));
		model.addAttribute("profile",request.getParameter("profile"));
		model.addAttribute("home_photo1",request.getParameter("home_photo1"));
		model.addAttribute("home_photo2",request.getParameter("home_photo2"));
		model.addAttribute("home_photo3",request.getParameter("home_photo3"));
		model.addAttribute("cert_photo1",request.getParameter("cert_photo1"));
		model.addAttribute("cert_photo2",request.getParameter("cert_photo2"));
		model.addAttribute("cert_photo3",request.getParameter("cert_photo3"));
		model.addAttribute("photo_upfile",request.getParameter("photo_upfile"));
		model.addAttribute("start_date",request.getParameter("start_date"));
		model.addAttribute("end_date",request.getParameter("end_date"));
		model.addAttribute("start_time",request.getParameter("start_time"));
		model.addAttribute("end_time",request.getParameter("end_time"));
		model.addAttribute("radio_basic",request.getParameter("radio_basic"));
		model.addAttribute("cert_count", request.getParameter("cert_count"));
		String pr24 = (String)request.getParameter("price24");
		int price24 = Integer.parseInt(pr24);
		model.addAttribute("price24",price24);
		String bp = (String)request.getParameter("bigPrice");
		int bigPrice = Integer.parseInt(bp);
		model.addAttribute("bigPrice",bigPrice);
		String pr60 = (String)request.getParameter("price60");
		int price60 = Integer.parseInt(pr60);
		model.addAttribute("price60",price60);
		String bp2 = (String)request.getParameter("bigPrice2");
		int bigPrice2 = Integer.parseInt(bp2);
		model.addAttribute("bigPrice2",bigPrice2);
		int limit = 10;
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
		if(id == null) {
			id = "N";
		}
		
		return "foster_view";
	}
	
	//예약페이지 갤러리 및 후기(start).
	@RequestMapping(value="getReviewRating.bo", produces="application/json;charset=UTF-8")
	@ResponseBody
	public List<ReviewBoardVO> getReviewRating(String petsitterid) { 
		//소수점 두자리수 제한
		DecimalFormat doubleForm = new DecimalFormat("#.##");
		HashMap<String, String> hashmap = new HashMap<String, String>();
		hashmap.put("PETSITTER_ID", petsitterid);
		List<ReviewBoardVO> reviewRating = petsitterService.getReviewRating(hashmap);
		
		int reviewCount = reviewRating.size();
		double tot = 0;
		if(reviewRating.size() != 0) {
			for(int i = 0; i < reviewCount; i++) {
				tot = tot + reviewRating.get(i).getREVIEW_SCORE();
			}
			double avg = tot / reviewCount;
			//JSP 파일에서 avgFNI는 소수점 두자리까지 표현, avg는 if 조건문에 이용
			String avgFNI = doubleForm.format(avg);
			reviewRating.get(0).setREVIEW_SCORE(avg);
			reviewRating.get(0).setAVG_REVIEW_SCORE(avgFNI);
			
		}
		return reviewRating;
	}
	
	
	@RequestMapping(value="reviewList.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	// jsp와 같은 뷰를 전달 하는게 아닌 데이터를 전달 하기 위해 사용 
	public List<ReviewBoardVO> reviewList(String petsitterid) {
		List<ReviewBoardVO> list = petsitterService.reviewList(petsitterid);
		SimpleDateFormat new_Format = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0; i < list.size(); i++) {
		list.get(i).setREAL_DATE(new_Format.format(list.get(i).getREVIEW_DATE()));
		}	
        return list;
	}

	@RequestMapping(value="/write_ReviewReply.bo", produces="application/json; charset=UTF-8") //댓글 작성 
	@ResponseBody
	public int write_ReviewReply(ReviewBoardVO reply) throws Exception{
		return petsitterService.write_ReviewReply(reply);
	 }
	
	@RequestMapping(value="galleryList.bo", produces="application/json;charset=UTF-8")
	@ResponseBody 
	// jsp와 같은 뷰를 전달 하는게 아닌 데이터를 전달 하기 위해 사용 
	public List<CommunicationBoardVO> galleryList(String petsitterid) {
		List<CommunicationBoardVO> list = petsitterService.galleryList(petsitterid);
        return list;
	}	

	/*좋아요 기능 시작*/
	@RequestMapping(value="/readReviewLikeCount.bo", produces="application/json; charset=UTF-8")
	@ResponseBody	
	private List<ReviewBoardVO> readReviewLikeCount(int reviewListNum) throws Exception{
	  	List<ReviewBoardVO> reviewLikeCount = petsitterService.readReviewLikeCount(reviewListNum);
	  	
	  	return reviewLikeCount;
	}	
	
	//갤러리 및 후기 (end)

}