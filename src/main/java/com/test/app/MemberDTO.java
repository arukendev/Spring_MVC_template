package com.test.app;

import org.springframework.web.multipart.MultipartFile;

public class MemberDTO {

	private int test_id;
	private String test_name;
	private int test_age;
	private MultipartFile file_img;
	private String test_img;

	public MemberDTO() {
	}

	public MemberDTO(int test_id, String test_name, int test_age, MultipartFile file_img, String test_img) {
		this.test_id = test_id;
		this.test_name = test_name;
		this.test_age = test_age;
		this.file_img = file_img;
		this.test_img = test_img;
	}

	public int getTest_id() {
		return test_id;
	}

	public void setTest_id(int test_id) {
		this.test_id = test_id;
	}

	public String getTest_name() {
		return test_name;
	}

	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}

	public int getTest_age() {
		return test_age;
	}

	public void setTest_age(int test_age) {
		this.test_age = test_age;
	}

	public MultipartFile getFile_img() {
		return file_img;
	}

	public void setFile_img(MultipartFile file_img) {
		this.file_img = file_img;
	}

	public String getTest_img() {
		return test_img;
	}

	public void setTest_img(String test_img) {
		this.test_img = test_img;
	}

	@Override
	public String toString() {
		return "MemberDTO [test_id=" + test_id + ", test_name=" + test_name + ", test_age=" + test_age + ", file_img="
				+ file_img + ", test_img=" + test_img + "]";
	}

}
