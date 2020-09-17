package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.PetsitterVO;

public interface ReservationMapper {

	//위탁 펫시터 목록
	public List<PetsitterVO> petsitterList_We(@Param(value="btn1") String btn1, @Param(value="btn2") String btn2, 
	  @Param(value="btn3") String btn3, @Param(value="btn4") String btn4,
	  @Param(value="btn_a") String btn_a,@Param(value="btn_b") String btn_b,
	  @Param(value="btn_c") String btn_c,@Param(value="btn_g")String btn_g,
	  @Param(value="btn_type") String btn_type); 
	public List<PetsitterVO> timeDate(@Param(value="btn1") String btn1, @Param(value="btn2") String btn2);
	
}
