package com.spring.petsitter;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.petsitter.board.ReviewBoardVO;
import com.spring.petsitter.pay.PayService;

@RestController
public class UsinglistController {
	
	
	@Autowired
	private UsinglistService usinglistService;
	
	@Autowired
	private PetsitterService petsitterService;
	
	@Autowired
	private PayService payService;
	
	@RequestMapping(value = "/nickname_check.bo",produces="application/json;charset=UTF-8")
	public int nickname_check(PetsitterVO vo) {
		System.out.println(vo.getPETSITTER_NICKNAME());
		int res = petsitterService.petsitterNicknameCheck(vo);
		return res;
	}
	
	@RequestMapping(value = "/review_refly.bo",produces="application/json;charset=UTF-8")
	public ArrayList<ReviewBoardVO> selectReview(HttpSession session, UsinglistVO vo) {
		String id = (String)session.getAttribute("id");
		vo.setPETSITTER_ID(id);
		System.out.println(vo.getPETSITTER_ID());
		System.out.println(vo.getNUMBER());
		ArrayList<ReviewBoardVO> list = new ArrayList<ReviewBoardVO>();
		ReviewBoardVO review = usinglistService.review_refly_select(vo);
		list.add(review);
		System.out.println(review.getMEMBER_NICKNAME());
		return list;
	}
	
	@RequestMapping(value = "/search_data.bo",produces="application/json;charset=UTF-8")
	public ArrayList<PetsitterUsinglistVO> selectList(HttpSession session, UsinglistVO vo){
		String id = (String)session.getAttribute("id");
		vo.setPETSITTER_ID(id);
		int limit = 5;
		int listcount = usinglistService.petsitterSelectUsinglistCount_select(vo);
		if(vo.getPAGE() == 0) {
			vo.setPAGE(1);
			vo.setSTART_NUMBER(1);
			vo.setEND_NUMBER(5);
		}else {
			vo.setSTART_NUMBER(((vo.getPAGE()-1)*5)+1);
			vo.setEND_NUMBER(vo.getPAGE()*5);
		}
		System.out.println(vo.getPAGE());
		vo.setMAXPAGE((int)((double)listcount/limit+0.95));
		vo.setSTARTPAGE((((int)((double)vo.getPAGE() / 10 + 0.9)) - 1) * 10 + 1);
		vo.setENDPAGE(vo.getMAXPAGE());
		if(vo.getENDPAGE()>vo.getSTARTPAGE()+10-1) {
			vo.setENDPAGE(vo.getSTARTPAGE()+10-1);
		}
		ArrayList<PetsitterUsinglistVO> list = new ArrayList<PetsitterUsinglistVO>();
		list = usinglistService.petsitterSelectUsingList_select(vo);
		
		SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		  Date today = new Date();
		  
		  for(int i = 0 ; i < list.size();i++){ 
			list.get(i).setLIMIT(vo.getLIMIT());
			list.get(i).setLISTNUMBER(listcount);
			list.get(i).setMAXPAGE(vo.getMAXPAGE());
			list.get(i).setSTARTPAGE(vo.getSTARTPAGE());
			list.get(i).setENDPAGE(vo.getENDPAGE());
		  	String start_date = new_format.format(list.get(i).getLIST_START_DATE());
		  	String end_date = new_format.format(list.get(i).getLIST_END_DATE());
		  	list.get(i).setLIST_STRING_START_DATE(start_date);
		  	list.get(i).setLIST_STRING_END_DATE(end_date);
		  	if(today.after(list.get(i).getLIST_END_DATE())) {
		  		list.get(i).setLIST_STATE("돌봄 완료");
		  		vo.setLIST_NUM(list.get(i).getLIST_NUM());
		  		if(usinglistService.review_refly_N(vo) == 1) {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='pet_talk mybtn' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기'>");
		  		}else {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='middle_bt1' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기' disabled> ");
		  		}
		  	}else if(today.before(list.get(i).getLIST_START_DATE())) {
		  		if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 완료")) {
			  		list.get(i).setLIST_STATE("돌봄 대기 중");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='돌봄 대기중' disabled='true' onmouseover='normal'>");
		  		}else if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 취소")) {
		  			list.get(i).setLIST_STATE("예약 취소");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='예약 취소' disabled='true' onmouseover='normal'>");
		  		}
		  	}
		  	else{
		  		list.get(i).setLIST_STATE("현재 돌봄 중");
		  		list.get(i).setLIST_COMMUNICATION("<a href = 'communication_petsitter.bo?usinglist_num=" + list.get(i).getLIST_NUM() + "'" + "><input type='button' class='pet_talk mybtn' value='고객과의 소통'>");
		  	}
		  }

		return list;
	}
	
	@RequestMapping(value = "/getList.bo", produces="application/json;charset=UTF-8")
	public ArrayList<PetsitterUsinglistVO> getList(HttpSession session,UsinglistVO vo) {
		String id = (String)session.getAttribute("id");
		vo.setPETSITTER_ID(id);
		int limit = 5;
		int listcount = usinglistService.petsitterSelectUsinglistCount(vo);
		if(vo.getPAGE() == 0) {
			vo.setPAGE(1);
			vo.setSTART_NUMBER(1);
			vo.setEND_NUMBER(5);
		}else {
			vo.setSTART_NUMBER(((vo.getPAGE()-1)*5)+1);
			vo.setEND_NUMBER(vo.getPAGE()*5);
		}
		System.out.println(vo.getPAGE());
		vo.setMAXPAGE((int)((double)listcount/limit+0.95));
		vo.setSTARTPAGE((((int)((double)vo.getPAGE() / 10 + 0.9)) - 1) * 10 + 1);
		vo.setENDPAGE(vo.getMAXPAGE());
		if(vo.getENDPAGE()>vo.getSTARTPAGE()+10-1) {
			vo.setENDPAGE(vo.getSTARTPAGE()+10-1);
		}
		ArrayList<PetsitterUsinglistVO> list = new ArrayList<PetsitterUsinglistVO>();
		list = usinglistService.petsitterSelectUsingList(vo);
		SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		  Date today = new Date();

		  int count = 0; // 돌본 횟수 카운트
		  for(int i = 0 ; i < list.size();i++){ 
			list.get(i).setLIMIT(vo.getLIMIT());
			list.get(i).setLISTNUMBER(listcount);
			list.get(i).setMAXPAGE(vo.getMAXPAGE());
			list.get(i).setSTARTPAGE(vo.getSTARTPAGE());
			list.get(i).setENDPAGE(vo.getENDPAGE());
		  	String start_date = new_format.format(list.get(i).getLIST_START_DATE());
		  	String end_date = new_format.format(list.get(i).getLIST_END_DATE());
		  	list.get(i).setLIST_STRING_START_DATE(start_date);
		  	list.get(i).setLIST_STRING_END_DATE(end_date);
		  	if(today.after(list.get(i).getLIST_END_DATE())) {
		  		list.get(i).setLIST_STATE("돌봄 완료");
		  		count++;
		  		vo.setLIST_NUM(list.get(i).getLIST_NUM());
		  		if(usinglistService.review_refly_N(vo) == 1) {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='pet_talk mybtn' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기'>");
		  		}else {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='middle_bt1' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기' disabled> ");
		  		}
		  	}else if(today.before(list.get(i).getLIST_START_DATE())) {
		  		if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 완료")) {
			  		list.get(i).setLIST_STATE("돌봄 대기 중");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='돌봄 대기중' disabled='true' onmouseover='normal'>");
		  		}else if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 취소")) {
		  			list.get(i).setLIST_STATE("예약 취소");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='예약 취소' disabled='true' onmouseover='normal'>");
		  		}
		  	}
		  	else{
		  		list.get(i).setLIST_STATE("현재 돌봄 중");
		  		count++;
		  		list.get(i).setLIST_COMMUNICATION("<a href = 'communication_petsitter.bo?usinglist_num=" + list.get(i).getLIST_NUM() + "'" + "><input type='button' class='pet_talk mybtn' value='고객과의 소통'>");
		  	}
		  	
		  }
		  PetsitterVO petsitter = petsitterService.selectPetsitter(id);
		  petsitter.setPETSITTER_COUNT(count);
		  if(petsitter.getPETSITTER_RANK().equals("N")) {
			  petsitter.setPETSITTER_RANK("N");
		  } else if(count == 0 && count < 20) {
			  petsitter.setPETSITTER_RANK("Pro");
		  } else if(count >= 20) {
			  petsitter.setPETSITTER_RANK("GoldPro");
		  }
		  petsitterService.petsitterCountRank(petsitter);

		return list;
	}
	
	@RequestMapping(value = "/getList_7d.bo",produces="application/json;charset=UTF-8")
	public ArrayList<PetsitterUsinglistVO> getList_7d(HttpSession session,UsinglistVO vo){
		String id = (String)session.getAttribute("id");
		vo.setPETSITTER_ID(id);
		int limit = 5;
		int listcount = usinglistService.petsitterSelectUsinglistCount_7d(vo);
		if(vo.getPAGE() == 0) {
			vo.setPAGE(1);
			vo.setSTART_NUMBER(1);
			vo.setEND_NUMBER(5);
		}else {
			vo.setSTART_NUMBER(((vo.getPAGE()-1)*5)+1);
			vo.setEND_NUMBER(vo.getPAGE()*5);
		}
		System.out.println(vo.getPAGE());
		vo.setMAXPAGE((int)((double)listcount/limit+0.95));
		vo.setSTARTPAGE((((int)((double)vo.getPAGE() / 10 + 0.9)) - 1) * 10 + 1);
		vo.setENDPAGE(vo.getMAXPAGE());
		if(vo.getENDPAGE()>vo.getSTARTPAGE()+10-1) {
			vo.setENDPAGE(vo.getSTARTPAGE()+10-1);
		}
		ArrayList<PetsitterUsinglistVO> list = new ArrayList<PetsitterUsinglistVO>();
		list = usinglistService.petsitterSelectUsingList_7d(vo);
		
		SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		  Date today = new Date();
		  
		  for(int i = 0 ; i < list.size();i++){ 
			list.get(i).setLIMIT(vo.getLIMIT());
			list.get(i).setLISTNUMBER(listcount);
			list.get(i).setMAXPAGE(vo.getMAXPAGE());
			list.get(i).setSTARTPAGE(vo.getSTARTPAGE());
			list.get(i).setENDPAGE(vo.getENDPAGE());
		  	String start_date = new_format.format(list.get(i).getLIST_START_DATE());
		  	String end_date = new_format.format(list.get(i).getLIST_END_DATE());
		  	list.get(i).setLIST_STRING_START_DATE(start_date);
		  	list.get(i).setLIST_STRING_END_DATE(end_date);
		  	if(today.after(list.get(i).getLIST_END_DATE())) {
		  		list.get(i).setLIST_STATE("돌봄 완료");
		  		vo.setLIST_NUM(list.get(i).getLIST_NUM());
		  		if(usinglistService.review_refly_N(vo) == 1) {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='pet_talk mybtn' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기'>");
		  		}else {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='middle_bt1' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기' disabled> ");
		  		}
		  	}else if(today.before(list.get(i).getLIST_START_DATE())) {
		  		if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 완료")) {
			  		list.get(i).setLIST_STATE("돌봄 대기 중");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='돌봄 대기중' disabled='true' onmouseover='normal'>");
		  		}else if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 취소")) {
		  			list.get(i).setLIST_STATE("예약 취소");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='예약 취소' disabled='true' onmouseover='normal'>");
		  		}
		  	}
		  	else{
		  		list.get(i).setLIST_STATE("현재 돌봄 중");
		  		list.get(i).setLIST_COMMUNICATION("<a href = 'communication_petsitter.bo?usinglist_num=" + list.get(i).getLIST_NUM() + "'" + "><input type='button' class='pet_talk mybtn' value='고객과의 소통'>");
		  	}
		  }
		  
		return list;
	}
	
	@RequestMapping(value = "/getList_1m.bo",produces="application/json;charset=UTF-8")
	public ArrayList<PetsitterUsinglistVO> getList_1m(HttpSession session,UsinglistVO vo){
		String id = (String)session.getAttribute("id");
		vo.setPETSITTER_ID(id);
		int limit = 5;
		int listcount = usinglistService.petsitterSelectUsinglistCount_1m(vo);
		if(vo.getPAGE() == 0) {
			vo.setPAGE(1);
			vo.setSTART_NUMBER(1);
			vo.setEND_NUMBER(5);
		}else {
			vo.setSTART_NUMBER(((vo.getPAGE()-1)*5)+1);
			vo.setEND_NUMBER(vo.getPAGE()*5);
		}
		System.out.println(vo.getPAGE());
		vo.setMAXPAGE((int)((double)listcount/limit+0.95));
		vo.setSTARTPAGE((((int)((double)vo.getPAGE() / 10 + 0.9)) - 1) * 10 + 1);
		vo.setENDPAGE(vo.getMAXPAGE());
		if(vo.getENDPAGE()>vo.getSTARTPAGE()+10-1) {
			vo.setENDPAGE(vo.getSTARTPAGE()+10-1);
		}
		ArrayList<PetsitterUsinglistVO> list = new ArrayList<PetsitterUsinglistVO>();
		list = usinglistService.petsitterSelectUsingList_1m(vo);
		
		SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		  Date today = new Date();
		  
		  for(int i = 0 ; i < list.size();i++){ 
			list.get(i).setLIMIT(vo.getLIMIT());
			list.get(i).setLISTNUMBER(listcount);
			list.get(i).setMAXPAGE(vo.getMAXPAGE());
			list.get(i).setSTARTPAGE(vo.getSTARTPAGE());
			list.get(i).setENDPAGE(vo.getENDPAGE());
		  	String start_date = new_format.format(list.get(i).getLIST_START_DATE());
		  	String end_date = new_format.format(list.get(i).getLIST_END_DATE());
		  	list.get(i).setLIST_STRING_START_DATE(start_date);
		  	list.get(i).setLIST_STRING_END_DATE(end_date);
		  	if(today.after(list.get(i).getLIST_END_DATE())) {
		  		list.get(i).setLIST_STATE("돌봄 완료");
		  		vo.setLIST_NUM(list.get(i).getLIST_NUM());
		  		if(usinglistService.review_refly_N(vo) == 1) {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='pet_talk mybtn' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기'>");
		  		}else {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='middle_bt1' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기' disabled> ");
		  		}
		  	}else if(today.before(list.get(i).getLIST_START_DATE())) {
		  		if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 완료")) {
			  		list.get(i).setLIST_STATE("돌봄 대기 중");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='돌봄 대기중' disabled='true' onmouseover='normal'>");
		  		}else if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 취소")) {
		  			list.get(i).setLIST_STATE("예약 취소");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='예약 취소' disabled='true' onmouseover='normal'>");
		  		}
		  	}
		  	else{
		  		list.get(i).setLIST_STATE("현재 돌봄 중");
		  		list.get(i).setLIST_COMMUNICATION("<a href = 'communication_petsitter.bo?usinglist_num=" + list.get(i).getLIST_NUM() + "'" + "><input type='button' class='pet_talk mybtn' value='고객과의 소통'>");
		  	}
		  }

		return list;
	}
	
	@RequestMapping(value = "/getList_3m.bo",produces="application/json;charset=UTF-8")
	public ArrayList<PetsitterUsinglistVO> getList_3m(HttpSession session,UsinglistVO vo){
		String id = (String)session.getAttribute("id");
		vo.setPETSITTER_ID(id);
		int limit = 5;
		int listcount = usinglistService.petsitterSelectUsinglistCount_3m(vo);
		if(vo.getPAGE() == 0) {
			vo.setPAGE(1);
			vo.setSTART_NUMBER(1);
			vo.setEND_NUMBER(5);
		}else {
			vo.setSTART_NUMBER(((vo.getPAGE()-1)*5)+1);
			vo.setEND_NUMBER(vo.getPAGE()*5);
		}
		System.out.println(vo.getPAGE());
		vo.setMAXPAGE((int)((double)listcount/limit+0.95));
		vo.setSTARTPAGE((((int)((double)vo.getPAGE() / 10 + 0.9)) - 1) * 10 + 1);
		vo.setENDPAGE(vo.getMAXPAGE());
		if(vo.getENDPAGE()>vo.getSTARTPAGE()+10-1) {
			vo.setENDPAGE(vo.getSTARTPAGE()+10-1);
		}
		ArrayList<PetsitterUsinglistVO> list = new ArrayList<PetsitterUsinglistVO>();
		list = usinglistService.petsitterSelectUsingList_3m(vo);
		
		SimpleDateFormat new_format = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		  Date today = new Date();
		  
		  for(int i = 0 ; i < list.size();i++){ 
			list.get(i).setLIMIT(vo.getLIMIT());
			list.get(i).setLISTNUMBER(listcount);
			list.get(i).setMAXPAGE(vo.getMAXPAGE());
			list.get(i).setSTARTPAGE(vo.getSTARTPAGE());
			list.get(i).setENDPAGE(vo.getENDPAGE());
		  	String start_date = new_format.format(list.get(i).getLIST_START_DATE());
		  	String end_date = new_format.format(list.get(i).getLIST_END_DATE());
		  	list.get(i).setLIST_STRING_START_DATE(start_date);
		  	list.get(i).setLIST_STRING_END_DATE(end_date);
		  	if(today.after(list.get(i).getLIST_END_DATE())) {
		  		list.get(i).setLIST_STATE("돌봄 완료");
		  		vo.setLIST_NUM(list.get(i).getLIST_NUM());
		  		if(usinglistService.review_refly_N(vo) == 1) {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='pet_talk mybtn' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기'>");
		  		}else {
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' id="+list.get(i).getLIST_NUM()+" onclick='button_modal(this.id);' class='middle_bt1' data-toggle='modal' data-target='#staticBackdrop02' value='답글 남기기' disabled> ");
		  		}
		  	}else if(today.before(list.get(i).getLIST_START_DATE())) {
		  		if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 완료")) {
			  		list.get(i).setLIST_STATE("돌봄 대기 중");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='돌봄 대기중' disabled='true' onmouseover='normal'>");
		  		}else if(payService.selectPay(list.get(i).getMERCHANT_UID()).getPAY_STATUS().equals("결제 취소")) {
		  			list.get(i).setLIST_STATE("예약 취소");
			  		list.get(i).setLIST_COMMUNICATION("<input type='button' class='pet_talk mybtn' value='예약 취소' disabled='true' onmouseover='normal'>");
		  		}
		  	}
		  	else{
		  		list.get(i).setLIST_STATE("현재 돌봄 중");
		  		list.get(i).setLIST_COMMUNICATION("<a href = 'communication_petsitter.bo?usinglist_num=" + list.get(i).getLIST_NUM() + "'" + "><input type='button' class='pet_talk mybtn' value='고객과의 소통'>");
		  	}
		  }

		return list;
	}
}
