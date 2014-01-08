package org.nhnnext.web;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.nhnnext.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

@Controller
public class LoginController {

	@Autowired
	private UserRepository userRepository;

	@RequestMapping("/login")
	public String form(HttpSession session) {
		return "login";
	}

	
	@RequestMapping(value = "/login_check.json", method = RequestMethod.POST)
	public @ResponseBody String loginFromIOS(@RequestBody String data) {

		Gson gson = new Gson();
		HashMap<String, String> loginData = gson.fromJson(data,
				new TypeToken<HashMap<String, String>>() {
				}.getType());

		String id = loginData.get("ID");
		String password = loginData.get("PW");
		HashMap<String, String> result = new HashMap<String, String>();
		result.put("result", "NO");
		result.put("code", "400");

		// test code
		//log.error("data = " + data);
		//log.error("ID = " + loginData.get("ID"));
		//log.error("PW = " + loginData.get("PW"));

		User userData = userRepository.findOne(id);
		if (userData != null) {
			if (userData.getPassword().equals(password)) {
				result.put("result", "OK");
				result.put("code", "200");
			}
		}

		//log.error("tostring : " + gson.toJson(result));
		return gson.toJson(result);
	}

	@RequestMapping(value = "/login_check", method = RequestMethod.POST)
	public String login(String userId, String password, HttpSession session) {
		// TODO userId에 해당하는 사용를 데이터베이스에서 조회
		// TODO 사용자가 입력한 비밀번호와 데이터베이스에서 조회한 사용자 비밀번호가 같은지 확인
		// model.addAttribute("userId", userId);
		User user = userRepository.findOne(userId);

		if (!user.matchPassword(password)) {
			System.out.println("wrong password");
			return "redirect:/login";
		}

		System.out.println("You are" + userId);
		session.setAttribute("userId", userId);
		// session에서 받아온 정보를 셋팅하는 부분
		return "redirect:/";
	}

	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/";
	}
	// 1111누르면 logout할 수 있게 해주기
}
