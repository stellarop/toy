package com.toyproject.www.Controller;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.toyproject.www.VO.UserVO;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class Maincontroller {
	private static final Logger logger = Logger.getLogger(Maincontroller.class);
	
	@RequestMapping(value = "/main.do")
	public String main(UserVO uservo, Model model, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
//		||StringUtils.isEmpty(userId)
		if (userId == null) {
			logger.info("[비정상적인 접근] : 로그인 후 이용 바랍니다.");
			return "redirect:login.jsp";
		}
		
		return "main.jsp";
	}
}
