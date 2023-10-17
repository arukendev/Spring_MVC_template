package com.test.app;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class HomeDAO {
	
	@Autowired
	private SqlSession ss;
	
	public String getAllMembers(Model model) {
		
		model.addAttribute("members", ss.getMapper(HomeMapper.class).getAllMembers());
		
		return "home";
		
	}
	
	public String getMember(String id, Model model, boolean isUpdate) {
		
		model.addAttribute("member", ss.getMapper(HomeMapper.class).getMember(id));
		
		return isUpdate ? "update" : "detail";
		
	}

	public String insertMember(MemberDTO memberDTO, Model model) {
		
		if (ss.getMapper(HomeMapper.class).insertMember(memberDTO) != 1) { 
			model.addAttribute("alert", "insert failed...");
			return "forward:/insert";
		}
		
		return "redirect:/";
		
	}

	public String updateMember(String id, MemberDTO memberDTO, Model model) {
		
		memberDTO.setTest_id(Integer.parseInt(id));
		
		if (ss.getMapper(HomeMapper.class).updateMember(memberDTO) != 1) { 
			model.addAttribute("alert", "update failed...");
			return "forward:/detail/" + id;
		}
		
		return "redirect:/detail/" + id;
		
	}
	
	public String deleteMember(String id, Model model) {
		
		if (ss.getMapper(HomeMapper.class).deleteMember(id) != 1) { 
			model.addAttribute("alert", "delete failed...");
			return "forward:/detail/" + id;
		}
		
		return "redirect:/";
		
	}

}
