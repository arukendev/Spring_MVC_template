package com.test.app;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {

	@Autowired
	private HomeDAO homeDAO;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		return homeDAO.getAllMembers(model);

	}

	@RequestMapping(value = "/detail/{id}", method = RequestMethod.GET)
	public String detail(@PathVariable String id, Model model) {

		return homeDAO.getMember(id, model, false);

	}

	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert() {

		return "insert";

	}

	@RequestMapping(value = "/insert/set", method = RequestMethod.POST)
	public String setInsert(MemberDTO memberDTO, Model model) throws IOException, IllegalStateException {

		return homeDAO.insertMember(memberDTO, model);

	}

	@RequestMapping(value = "/detail/update/{id}", method = RequestMethod.GET)
	public String getUpdate(@PathVariable String id, Model model) {

		return homeDAO.getMember(id, model, true);

	}

	@RequestMapping(value = "/detail/update/{id}", method = RequestMethod.PUT)
	public String setUpdate(@PathVariable String id, MemberDTO memberDTO, Model model) {

		return homeDAO.updateMember(id, memberDTO, model);

	}

	@RequestMapping(value = "/detail/delete/{id}", method = RequestMethod.DELETE)
	public String delete(@PathVariable String id, Model model) {

		return homeDAO.deleteMember(id, model);

	}

}
