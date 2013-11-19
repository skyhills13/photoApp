package org.nhnnext.web;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterController {
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping(value = "/register")
	public String register(){
		return "register";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(User user){
		userRepository.save(user);
		return "redirect:/";
	}

}
