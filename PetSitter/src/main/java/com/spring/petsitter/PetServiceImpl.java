package com.spring.petsitter;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.mapper.PetMapper;

@Service("petService")
public class PetServiceImpl implements PetService{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int petInsert(PetVO pet) {
		PetMapper petMapper = sqlSession.getMapper(PetMapper.class);
		int res = petMapper.insertPet(pet);
		return res;
	}
	
	@Override
	public ArrayList<PetVO> selectPet(String id) {
		PetMapper petMapper = sqlSession.getMapper(PetMapper.class);
		ArrayList<PetVO> list = petMapper.selectPet(id);
		return list;
	}

	@Override
	public PetVO selectPet2(String id, String name) {
		PetMapper petMapper = sqlSession.getMapper(PetMapper.class);
		PetVO vo = petMapper.selectPet2(id, name);
		return vo;
	}
	
	@Override
	public void updatePet(PetVO petvo) {
		PetMapper petMapper = sqlSession.getMapper(PetMapper.class);
		petMapper.updatePet(petvo);
	}
	
	@Override
	public void deletePet(String id, String name) {
		PetMapper petMapper = sqlSession.getMapper(PetMapper.class);
		petMapper.deletePet(id, name);
	}
	
}
