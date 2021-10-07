package com.jinw0909.portfolio.members;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.jinw0909.portfolio.members.bo.MembersBO;
import com.jinw0909.portfolio.members.model.Request;

@RequestMapping("/members")
@Controller
public class MembersController {

	@Autowired
	private MembersBO membersBO;
	
	@GetMapping("/request_view")
	public String requestView(
			Model model
			, HttpServletRequest request) {
		HttpSession session = request.getSession();
		int pokemonId = (Integer)session.getAttribute("pokemonId");
		List<Request> requestList = membersBO.getRequestById(pokemonId);
		for (Request elem: requestList) {
			String representor = "없음";
			String[] patients = elem.getPatients().split(",");
			for (int i = 0; i < patients.length; i++) {
				if (!patients[i].equals("")) {
					representor = patients[i];
					break;
				}
			}
			elem.setPatients(representor);
		}
		model.addAttribute(requestList);
		return "members/requestView";
	}
	
	@GetMapping("/request_create_view")
	public String requestCreateView() {
		return "members/requestCreateView";
	}

}
