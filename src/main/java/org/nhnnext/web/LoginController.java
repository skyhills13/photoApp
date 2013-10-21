package org.nhnnext.web;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller 

public class LoginController {

	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping("/login")
	public String form(HttpSession session) {
		 return "login";
	}
	


	@RequestMapping(value="/login_check", method=RequestMethod.POST)
	public String login(String userId, String password, HttpSession session) {
			// TODO userId에 해당하는 사용를 데이터베이스에서 조회
			// TODO 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인 model.addAttribute("userId", userId);
		User user = userRepository.findOne(userId);
		
		if(!user.matchPassword(password)){
			System.out.println("wrong password");
			return "redirect:/login";
		}
		
		System.out.println("You are" + userId);
		session.setAttribute("userId", userId);
		return "redirect:/";
		} 
	
	@RequestMapping(value= "/logout")
	public String logout(HttpSession session){
		session.removeAttribute("userId");
		return "redirect:/";
	}
}

