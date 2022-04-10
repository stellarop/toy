package com.toyproject.www.Controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toyproject.www.Service.UserService;
import com.toyproject.www.VO.UserVO;

@Controller
public class UserController {
	
	@Autowired
	UserService userservice;
	
	
	
	@RequestMapping(value = "/SignUp.do", method = RequestMethod.GET)
	public String SignUp() {
		return "SignUp";
	}
	
	@RequestMapping("/login.do")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/SignUp.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> SignUp(UserVO uservo) {
		HashMap<String, Object> SignUpMap = new HashMap<String, Object>();
		//SignUpMap.put("SignUp", userservice.SignUp(uservo));
		return SignUpMap;
	}
	
	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public int idCheck(UserVO uservo) {
		int idCheck = userservice.idCheck(uservo);
		return idCheck;
	}
	
	
}
