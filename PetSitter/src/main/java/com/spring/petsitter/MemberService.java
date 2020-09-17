package com.spring.petsitter;

import java.util.ArrayList;
import java.util.List;

public interface MemberService {
	public int memberPwUpdate(MemberVO member);
	public String memberIdFind(MemberVO member);
	public int memberPwFind(MemberVO member);
	public int memberInsert(MemberVO member);
	public int memberCheck(MemberVO member);
	public ArrayList<MemberVO> memberList();
	public MemberVO selectMember(String id);
	public void updateMember(MemberVO membervo);
	public void updateMemberRank(MemberVO membervo);
	public void deleteMember(String id);
	
	public int getListCount(String id);
	public ArrayList<UsinglistVO> getUsingList_Member(String id);
	public List<MemberUsinglistVO> getUsingList_Member_ajax(String id);
	
	public ArrayList<UsinglistVO> getUsingList_Member_month(String id, int month);
	public List<MemberUsinglistVO> getUsingList_Member_ajax_month(String id, int month);
	
	public ArrayList<UsinglistVO> getUsingList_Member_calendar(String id, String startdate, String enddate);
	public List<MemberUsinglistVO> getUsingList_Member_ajax_calendar(String id, String startdate, String enddate);

	public void suspendedMember(String id);
	public void rollbackMember(String id);
	List<MemberVO> changeMember(String rank, String id);
}