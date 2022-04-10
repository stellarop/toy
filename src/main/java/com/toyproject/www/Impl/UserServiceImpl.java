package com.toyproject.www.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toyproject.www.DAO.UserDAO;
import com.toyproject.www.Service.UserService;
import com.toyproject.www.VO.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDAO userDAO;
	
	@Override
	public void SignUp(UserVO uservo) {
		userDAO.SignUp(uservo);
	}

}
