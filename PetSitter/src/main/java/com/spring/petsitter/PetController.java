package com.spring.petsitter;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class PetController {
	
	@Autowired
	private PetService petService;
	
	
	@RequestMapping(value = "myPet.me")
	public String myPet(HttpSession session, Model model) {
		String id = (String)session.getAttribute("id");
		ArrayList<PetVO> list = petService.selectPet(id);
		model.addAttribute("list", list);
		return "pet/myPet";
	}


	@RequestMapping(value = "petRegister.me")
	public String petRegister() {
		return "pet/petRegister";
	}
	
	@RequestMapping(value = "petRegister2.me", method = RequestMethod.POST)
	public String petRegister2(PetVO vo, @RequestParam("PET_PHOTO_PROFILE") MultipartFile mf) {
		String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\";

		if(mf.getSize() != 0) {
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
			try {
				mf.transferTo(new File(uploadPath+storedFileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vo.setPET_PHOTO(storedFileName);
		} else {
			vo.setPET_PHOTO("N");
		}
		int res = petService.petInsert(vo);
		if(res != 0) {
			System.out.println("Pet Insert Complete!");
		}
		return "pet/petRegister2";
	}
	
	@RequestMapping(value = "petDelete.me")
	public String petDelete(PetVO vo, HttpSession session, @RequestParam("name") String name) {
		String id = (String)session.getAttribute("id");
		petService.deletePet(id, name);
		return "redirect:/myPet.me";
	}
	
	
	@RequestMapping(value = "petSelect.me")
	public String petUpdate(HttpSession session, @RequestParam(value = "name") String name, Model model) {
		String id = (String)session.getAttribute("id");

		PetVO vo = petService.selectPet2(id, name);
		model.addAttribute("vo", vo);
		return "pet/petUpdate";
	}
	

	@RequestMapping(value = "petUpdate.me", method = RequestMethod.POST)
	public String petUpdate2(PetVO vo, HttpSession session, @RequestParam("PET_PHOTO_PROFILE") MultipartFile mf) {
		String uploadPath = "C:\\Project156\\Spring_Source\\Petsitter\\upload\\";
		if(mf.getSize() != 0) {
			System.out.println("이게 뜬다면 113은 넘어감");
			String originalFileExtension = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf("."));
			String storedFileName = UUID.randomUUID().toString().replaceAll("-", "")+ originalFileExtension;
			try {
				mf.transferTo(new File(uploadPath+storedFileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			vo.setPET_PHOTO(storedFileName);
		} else {
			vo.setPET_PHOTO("N");
		}
		
		petService.updatePet(vo);
		return "redirect:/myPet.me";
	}
}
