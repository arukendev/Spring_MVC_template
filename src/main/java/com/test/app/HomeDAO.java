package com.test.app;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

@Service
public class HomeDAO {

	@Autowired
	private SqlSession ss;

	@Autowired
	private ServletContext sc;

	public String getAllMembers(Model model) {

		model.addAttribute("members", ss.getMapper(HomeMapper.class).getAllMembers());

		return "home";

	}

	public String getMember(String id, Model model, boolean isUpdate) {

		model.addAttribute("member", ss.getMapper(HomeMapper.class).getMember(id));

		return isUpdate ? "update" : "detail";

	}

	public String insertMember(MemberDTO memberDTO, Model model) throws IOException, IllegalStateException {

		MultipartFile file = memberDTO.getFile_img();
		System.out.println(file);
		String uploadFolder = sc.getRealPath("resources/upload");

		String fileRealName = file.getOriginalFilename(); // 파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); // 파일 사이즈

		System.out.println("파일명 : " + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		// 서버에 저장할 파일이름 fileextension으로 .jsp이런식의 확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."), fileRealName.length());
		String uniqueName = UUID.randomUUID().toString().split("-")[0];
		System.out.println("생성된 고유문자열 : " + uniqueName);
		System.out.println("확장자명 : " + fileExtension);
		System.out.println("업로드 폴더 : " + uploadFolder);

		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전

		String fileName = uniqueName + fileExtension;
		File saveFile = new File(uploadFolder + "/" + fileName); // 적용 후

		file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)

		memberDTO.setTest_img(fileName);

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
