package com.toyproject.www.Controller;



import org.apache.commons.lang3.StringUtils;
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
	
	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "login.jsp";
	}
	
	
	@RequestMapping(value = "/SignUp.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean SignUp(UserVO uservo) {
		
		int idCheck = userservice.idCheck(uservo);
		
		if(idCheck == 1) {
			return false;
		}else {
			userservice.SignUp(uservo);
		}
		return true;
	}
	
	
	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public int idCheck(UserVO uservo) {
		int idCheck = userservice.idCheck(uservo);
		return idCheck;
	}
	
	
}
