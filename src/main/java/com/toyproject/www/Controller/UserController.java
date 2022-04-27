package com.toyproject.www.Controller;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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

	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ResponseEntity<Integer> selectUser(UserVO uservo) {

		try {
			UserVO user = userservice.selectUser(uservo);

			if (user != null || StringUtils.isEmpty(user.getId())) {
				return new ResponseEntity<Integer>(1, HttpStatus.OK);
			}

		} catch (Exception e) {
			String error = e.getMessage();
			int errorMessage = Integer.parseInt(error);
			
			return new ResponseEntity<Integer>(errorMessage, HttpStatus.BAD_REQUEST);
		}
		return null;

	}

	@RequestMapping(value = "/SignUp.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean signUp(UserVO uservo) {

		int idCheck = userservice.idCheck(uservo);

		if (idCheck == 1) {
			return false;
		} else {
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
