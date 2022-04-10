package com.toyproject.www.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toyproject.www.Service.UserService;
import com.toyproject.www.VO.UserVO;

@Controller
public class UserController {
	
	@Autowired
	UserService userservice;
	
	public void SignUp(UserVO uservo) {
		userservice.SignUp(uservo);
	}
	
	@RequestMapping("/login")
	public String login() {
		System.out.println("�α��� �޼��� ���");
		System.out.println("�ѱ۱���test");
		return "login";
	}
}
