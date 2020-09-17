package com.spring.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.spring.petsitter.PetVO;

public interface PetMapper {
	public int insertPet(PetVO pet);
	public ArrayList<PetVO> selectPet(String id);
	public PetVO selectPet2(@Param("id")String id,@Param("name") String name);
	public void updatePet(PetVO petvo);
	public void deletePet(@Param("id")String id, @Param("name") String name);
}
