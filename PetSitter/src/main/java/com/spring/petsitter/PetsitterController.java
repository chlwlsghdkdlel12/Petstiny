package com.spring.petsitter;

import java.io.File;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.util.TextUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.petsitter.board.ReviewBoardVO;

@Controller
public class PetsitterController {

	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	JavaMailSender mailSender;
	
	@RequestMapping(value = "petsitterPwUpdate.me")
	public String petsitterPwUpdate(PetsitterVO vo) {
		petsitterService.petsitterPwUpdate(vo);
		return "redirect:/home.me";
	}
	
	@RequestMapping(value = "petsitterFind.bo")
	public String petsitterFind() {
		return "petsitter/petsitterFind";
	}
	
	@RequestMapping(value = "petsitterIdCheck.bo",method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String petsitterIdCheck(String PETSITTER_ID) {
		PetsitterVO petsitter = petsitterService.selectPetsitter(PETSITTER_ID);
		if(petsitter == null) {
			return "Y";
		}else {
			return "N";
		}
	}
	
	@RequestMapping(value = "petsitterPwFind.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String petsitterPwFind(PetsitterVO vo) {
		String realTEL = vo.getPETSITTER_TEL().replaceAll("-", "");
		vo.setPETSITTER_TEL(realTEL);
		int res = petsitterService.petsitterPwFind(vo);
		if(res == 1) {
			Random r = new Random();
			int num = r.nextInt(999999);
			String setfrom = "mho415@naver.com"; //본인 이메일 아이디(naver)
			String title = "비밀번호 찾기 인증 이메일 입니다.";
			String content = System.getProperty("line.separator") 
            		+"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
            		+System.getProperty("line.separator") 
            		+" 인증번호는 <" + num + "> 입니다."
            		+System.getProperty("line.separator") 
            		+"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
				
				messageHelper.setFrom(setfrom);
				messageHelper.setTo(vo.getPETSITTER_EMAIL());
				messageHelper.setSubject(title);
				messageHelper.setText(content);
				
				mailSender.send(message);
			}catch(Exception e) {
				System.out.println(e);
			}
			return String.valueOf(num);
		}else {
			return "N";
		}
	}
	
	@RequestMapping(value = "petsitterIdFind.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String petsitterIdFind(PetsitterVO vo){
		String realTEL = vo.getPETSITTER_TEL().replaceAll("-", "");
		vo.setPETSITTER_TEL(realTEL);
		String res = petsitterService.petsitterIdFind(vo);
		if(res == null) {
			return "N";
		}else {
			return res.substring(0, res.length()-3)+"***";
		}
	}
	
	@RequestMapping(value = "map_addr.bo", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public PetsitterVO[] getMap_addr(HttpServletRequest request){
		String[] polyLine = (String[]) request.getParameterValues("polyLine");
		ArrayList<PetsitterVO> list = new ArrayList<PetsitterVO>();
		list = petsitterService.petsitterList();
		PetsitterVO[] vo = new PetsitterVO[list.size()];
		for(int i = 0 ; i < list.size(); i++) {
			list.get(i).setPETISTTER_POLY(Double.parseDouble(polyLine[i]));
			vo[i] = list.get(i);
		}
		PetsitterVO temp = new PetsitterVO();
		for(int i =0;i< vo.length-1; i++) {
			for(int j = i+1; j<vo.length; j++) {
				if(vo[i].getPETISTTER_POLY() > vo[j].getPETISTTER_POLY()) {
					temp = vo[i];
					vo[i] = vo[j];
					vo[j] = temp;
				}
			}
		}
	
		return vo;
	}
	
	@RequestMapping(value = "reflyUpdate.me")
	public String reflyUpdate(HttpSession session,ReviewBoardVO vo) {
		String id = (String)session.getAttribute("id");
		vo.setPETSITTER_ID(id);
		int res = petsitterService.reflyUpdate(vo);
		if(res == 1) {
			System.out.println("리뷰 답변 작성성공");
		}else {
			System.out.println("리뷰 답변 작성실패");
		}
		return "redirect:/petsitterinfo.me";
	}
	
	@RequestMapping(value = "petsitterUpdate.me")
	public String petsitterUpdate(PetsitterUpdateVO vo)throws Exception {
		PetsitterVO petsitter = new PetsitterVO();
		petsitter.setPETSITTER_ID(vo.getPETSITTER_ID()); 
		petsitter = petsitterService.selectPetsitter(vo.getPETSITTER_ID());
		String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\";
		MultipartFile mf = vo.getPhoto();
		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
			mf.transferTo(new File(uploadPath+storedFileName));
			petsitter.setPETSITTER_PHOTO_UPFILE(storedFileName);
		}
		
		mf = vo.getProfile();
		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
			mf.transferTo(new File(uploadPath+storedFileName));
			petsitter.setPETSITTER_PHOTO_PROFILE_FILE(storedFileName);
		}
		
		String CertState="";
		String CertNames = "";
		for(int i = 0; i < 3; i++) {
			if(vo.getCertState()[i].equals("파일선택")) {
				break;
			}else if(vo.getCertState()[i].equals("파일변경")) {
				CertState += petsitter.getPETSITTER_PHOTO_CERT_FILE().split(",")[i]+",";
				CertNames += petsitter.getPETSITTER_CERT_LIST().split(",")[i]+",";
			}else {
				mf = vo.getCertFile()[i];
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
				mf.transferTo(new File(uploadPath+storedFileName));
				CertState += storedFileName+",";
				CertNames += vo.getCertName()[i]+",";
			}
		}
		
		if(!CertState.equals("")) {
			if(CertState.substring(CertState.length()-1, CertState.length()).equals(",")) {
				CertState = CertState.substring(0,CertState.length()-1);
			}
			petsitter.setPETSITTER_PHOTO_CERT_FILE(CertState);
		}else {
			petsitter.setPETSITTER_PHOTO_CERT_FILE("N");
		}
		
		if(!CertNames.equals("")) {
			if(CertNames.substring(CertNames.length()-1, CertNames.length()).equals(",")) {
				CertNames = CertNames.substring(0,CertNames.length()-1);
			}
			petsitter.setPETSITTER_CERT_LIST(CertNames);
		}else {
			petsitter.setPETSITTER_CERT_LIST("N");
		}
		
		String homeState="";
		for(int i = 0; i < 3; i++) {
			if(vo.getHomeState()[i].equals("파일선택")) {
				break;
			}else if(vo.getHomeState()[i].equals("파일변경")) {
				homeState += petsitter.getPETSITTER_PHOTO_HOME_FILE().split(",")[i]+",";
			}else {
				mf = vo.getPhotoHome()[i];
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
				mf.transferTo(new File(uploadPath+storedFileName));
				homeState += storedFileName+",";
			}
		}
		
		
		
		if(!homeState.equals("")) {
			if(homeState.substring(homeState.length()-1, homeState.length()).equals(",")) {
				homeState = homeState.substring(0,homeState.length()-1);
			}
			petsitter.setPETSITTER_PHOTO_HOME_FILE(homeState);
		}else {
			petsitter.setPETSITTER_PHOTO_HOME_FILE("N");
		}
		
		String appealState="";
		for(int i = 0; i < 3; i++) {
			if(vo.getAppealState()[i].equals("파일선택")) {
				break;
			}else if(vo.getAppealState()[i].equals("파일변경")) {
				appealState += petsitter.getPETSITTER_PHOTO_APPEAL().split(",")[i]+",";
			}else {
				mf = vo.getPhotoAppeal()[i];
				String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
				mf.transferTo(new File(uploadPath+storedFileName));
				appealState += storedFileName+",";
			}
		}
		
		if(!appealState.equals("")) {
			if(appealState.substring(appealState.length()-1, appealState.length()).equals(",")) {
				appealState = appealState.substring(0,appealState.length()-1);
			}
			petsitter.setPETSITTER_PHOTO_APPEAL(appealState);
		}else {
			petsitter.setPETSITTER_PHOTO_APPEAL("N");
		}
		
		petsitter.setPETSITTER_PW(vo.getPw());
		if(TextUtils.isEmpty(vo.getGender())){
			petsitter.setPETSITTER_GENDER("N");
		}else {
			petsitter.setPETSITTER_GENDER(vo.getGender());
		}
		if(TextUtils.isEmpty(vo.getNickname())) {
			petsitter.setPETSITTER_NICKNAME("N");
		}else {
			petsitter.setPETSITTER_NICKNAME(vo.getNickname());
		}
		String email = String.join("@",vo.getEmail());
		petsitter.setPETSITTER_EMAIL(email);
		petsitter.setPETSITTER_ADDRESS(vo.getAddress());
		petsitter.setPETSITTER_TEL(vo.getTel());
		String type = String.join(",", vo.getType());
		petsitter.setPETSITTER_TYPE(type);
		petsitter.setPETSITTER_PRICE_60M(vo.getPrice60m());
		petsitter.setPETSITTER_PRICE_30M(vo.getPrice30m());
		String service = "N";;
		if(vo.getServicelist() != null) {
			service = String.join(",", vo.getServicelist());
		}
		petsitter.setPETSITTER_SERVICE_LIST(service);
		petsitter.setPETSITTER_INTRODUCE(vo.getIntroduce());
		petsitter.setPETSITTER_ADDRX(vo.getAddrX());
		petsitter.setPETSITTER_ADDRY(vo.getAddrY());
		if(vo.getSafeaddr().equals(",")) {
			petsitter.setPETSITTER_SAFEADDR("N");
		}else {
			petsitter.setPETSITTER_SAFEADDR(vo.getSafeaddr());
		}
		int res = petsitterService.petsitterUpdate(petsitter);
		if(res == 1) {
			System.out.println("업데이트 성공");
		}else {
			System.out.println("업데이트 실패");
		}
		return "redirect:/petsitterinfo.me";
	}

	@RequestMapping(value = "petsitterSchedule.me")
	public String petsitterSchedule(PetsitterScheduleVO vo) {
		int res = petsitterService.petsitterSchedule(vo);
		if (res == 1) {
			System.out.println("스케줄 추가 성공");
		}
		return "redirect:/petsitterinfo.me";
	}

	@RequestMapping(value = "petsitterinfo.me")
	public String petsitterinfo(HttpSession session, Model model, HttpServletResponse response) throws Exception {
		String id = (String) session.getAttribute("id");
		
		PrintWriter writer = response.getWriter();
		if(id != null) {
			PetsitterVO vo = petsitterService.selectPetsitter(id);
			PetsitterVO petsitter = petsitterService.this_month_countAmount(id);
			int m_count = petsitter.getM_count();
			int m_amount = petsitter.getM_amount();
			UsinglistVO usinglist = new UsinglistVO();
			usinglist.setPETSITTER_ID(id);
			model.addAttribute("vo", vo);
			model.addAttribute("m_count", m_count); // 이번달 돌봄 수
			model.addAttribute("m_amount", m_amount); // 이번달 돌봄 금액
			return "petsitter/petsitterinfo";
		} else {
			writer.write("<script>");
			writer.write("alert('로그인 시간이 만료되어 자동 로그아웃 됩니다.')");
			writer.write("location.href='loginform.me'");
			writer.write("</script>");
			return null;
		}
	}
	
	@RequestMapping(value = "petsitter_refusal.me")
	public String petsitterRefusal(PetsitterVO vo) {
		int res = petsitterService.petsitterRefusal(vo);
		if(res == 1) {
			System.out.println(vo.getPETSITTER_ID() + " 회원 거절 완료");
		}		
		return "redirect:/admin_petsitterApply.me";
	}
	
	@RequestMapping(value = "petsitter_approval.me")
	public String petsitterApproval(PetsitterVO vo) {
		int res = petsitterService.petsitterApproval(vo);
		if(res == 1) {
			System.out.println(vo.getPETSITTER_ID() + " 회원 임시승인 완료");
		}		
		return "redirect:/admin_petsitterApply.me";
	}

	@RequestMapping(value = "petsitter_login.me")
	public String petsiiterLogin(PetsitterVO vo, HttpSession session) {
		int res = petsitterService.petsitterCheck(vo);

		vo = petsitterService.selectPetsitter(vo.getPETSITTER_ID());
		if (res == 1) {
			session.setAttribute("id", vo.getPETSITTER_ID());
			session.setAttribute("name", vo.getPETSITTER_NAME());
			session.setAttribute("rank", vo.getPETSITTER_RANK());
			System.out.println(vo.getPETSITTER_RANK());
			System.out.println("로그인 성공");

			return "redirect:/home.me";
		} else {
			return "loginform";
		}
	}

	@RequestMapping(value = "petsitter_join.me")
	public String petsitter_join(PetsitterVO vo) throws Exception {
		vo.setPETSITTER_SERVICE_LIST("");
		vo.setPETSITTER_PHOTO_HOME_FILE("");
		vo.setPETSITTER_PHOTO_CERT_FILE("");
		vo.setPETSITTER_PHOTO_UPFILE("");
		vo.setPETSITTER_PHOTO_PROFILE_FILE("");
		vo.setPETSITTER_CERT_LIST("");
		
		MultipartFile mf = vo.getPETSITTER_PHOTO();
		String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\";

		if (mf.getSize() != 0) {
			String originalFileExtension1 = mf.getOriginalFilename()
					.substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName1 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension1;
			mf.transferTo(new File(uploadPath + storedFileName1));
			vo.setPETSITTER_PHOTO_UPFILE(storedFileName1);
		}

		mf = vo.getPETSITTER_PHOTO_PROFILE();

		if (mf.getSize() != 0) {
			String originalFileExtension2 = mf.getOriginalFilename()
					.substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName2 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension2;
			mf.transferTo(new File(uploadPath + storedFileName2));
			vo.setPETSITTER_PHOTO_PROFILE_FILE(storedFileName2);
		}

		ArrayList<String> CERT_PHOTO = new ArrayList<String>();
		for (int i = 0; i < vo.getPETSITTER_PHOTO_CERT().length; i++) {
			mf = vo.getPETSITTER_PHOTO_CERT()[i];
			if (mf.getSize() != 0) {
				String originalFileExtension3 = mf.getOriginalFilename()
						.substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName3 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension3;

				mf.transferTo(new File(uploadPath + storedFileName3));
				CERT_PHOTO.add(storedFileName3);
			}
		}
		vo.setPETSITTER_PHOTO_CERT_FILE(String.join(",", CERT_PHOTO));

		ArrayList<String> HOME_PHOTO = new ArrayList<String>();
		for (int i = 0; i < vo.getPETSITTER_PHOTO_HOME().length; i++) {
			mf = vo.getPETSITTER_PHOTO_HOME()[i];
			if (mf.getSize() != 0) {
				String originalFileExtension4 = mf.getOriginalFilename()
						.substring(mf.getOriginalFilename().lastIndexOf("."));
				String storedFileName4 = UUID.randomUUID().toString().replaceAll("-", "") + originalFileExtension4;

				mf.transferTo(new File(uploadPath + storedFileName4));
				HOME_PHOTO.add(storedFileName4);
			}
		}

		vo.setPETSITTER_PHOTO_HOME_FILE(String.join(",", HOME_PHOTO));

		ArrayList<String> CERT_LIST = new ArrayList<String>();
		for (int i = 0; i < vo.getPETSITTER_CERT().length; i++) {
			if (!(vo.getPETSITTER_CERT()[i].equals(""))) {
				CERT_LIST.add(vo.getPETSITTER_CERT()[i]);
			}
		}
		vo.setPETSITTER_CERT_LIST(String.join(",", CERT_LIST));

		if (vo.getPETSITTER_SERVICE() != null) {
			vo.setPETSITTER_SERVICE_LIST(String.join(",", vo.getPETSITTER_SERVICE()));
		} else {
			vo.setPETSITTER_SERVICE_LIST("N");
		}

		if (vo.getPETSITTER_TYPE_LIST() != null) {
			vo.setPETSITTER_TYPE(String.join(",", vo.getPETSITTER_TYPE_LIST()));
		} else {
			vo.setPETSITTER_TYPE("N");
		}

	
		if (vo.getPETSITTER_PHOTO_HOME_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_HOME_FILE("N");
		}
		if (vo.getPETSITTER_PHOTO_CERT_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_CERT_FILE("N");
		}
		if (vo.getPETSITTER_CERT_LIST().equals("")) {
			vo.setPETSITTER_CERT_LIST("N");
		}
		if (vo.getPETSITTER_PRICE_30M().equals("")) {
			vo.setPETSITTER_PRICE_30M("N");
		}
		if (vo.getPETSITTER_PRICE_60M().equals("")) {
			vo.setPETSITTER_PRICE_60M("N");
		}
		if (vo.getPETSITTER_PHOTO_UPFILE().equals("")) {
			vo.setPETSITTER_PHOTO_UPFILE("N");
		}
		if (vo.getPETSITTER_PHOTO_PROFILE_FILE().equals("")) {
			vo.setPETSITTER_PHOTO_PROFILE_FILE("N");
		}
		
		String realTEL = vo.getPETSITTER_TEL().replaceAll("-", "");
		vo.setPETSITTER_TEL(realTEL);
		int res = petsitterService.petsitterInsert(vo);

		if (res == 1) {
			System.out.println("회원가입 성공");
		}

		return "redirect:/home.me";
	}
}
