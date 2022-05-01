package com.toyproject.www.Controller;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toyproject.www.Service.UserService;
import com.toyproject.www.VO.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class Maincontroller {
	private static final Logger logger = Logger.getLogger(Maincontroller.class);

	@Autowired
	UserService userservice;

	@RequestMapping(value = "/main.do")
	public String main(UserVO uservo, Model model) {
		UserVO user = userservice.selectUser(uservo);
		if (user == null || StringUtils.isEmpty(user.getId())) {
			logger.info("로그인한 기록이 없습니다 로그인 후 이용 바랍니다.");
			return "redirect:login.jsp";
		}
		return "main.jsp";
	}
}
