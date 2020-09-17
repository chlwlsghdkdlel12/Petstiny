package com.spring.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.*;

public interface MemberMapper {
	public int memberPwUpdate(MemberVO member);
	public String memberIdFind(MemberVO member);
	public int memberPwFind(MemberVO member);
	public int insertMember(MemberVO member);
	public int memberCheck(MemberVO member);
	public ArrayList<MemberVO> memberList();
	public MemberVO selectMember(String id);
	public void updateMember(MemberVO membervo);
	public void updateMemberRank(MemberVO membervo);
	public void deleteMember(String id);
	public int getListCount(String id);
	public ArrayList<UsinglistVO> getUsingList_Member(@Param("MEMBER_ID") String id);
	public List<MemberUsinglistVO> getUsingList_Member_ajax(@Param("MEMBER_ID") String id);

	public ArrayList<UsinglistVO> getUsingList_Member_month(@Param("MEMBER_ID") String id, @Param("month") int month);
	public List<MemberUsinglistVO> getUsingList_Member_ajax_month(@Param("MEMBER_ID") String id, @Param("month") int month);
	
	public ArrayList<UsinglistVO> getUsingList_Member_calendar(@Param("MEMBER_ID")String id, @Param("startdate") String startdate, @Param("enddate") String enddate);
	public List<MemberUsinglistVO> getUsingList_Member_ajax_calendar(@Param("MEMBER_ID")String id, @Param("startdate") String startdate, @Param("enddate") String enddate);

	public void suspendedMember(String id);
	public void rollbackMember(String id);
	public List<MemberVO> changeMember(@Param("RANK")String rank, @Param("MEMBER_ID")String id);

}