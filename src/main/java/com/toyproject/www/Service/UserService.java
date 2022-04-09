package com.toyproject.www.Service;

import org.springframework.stereotype.Service;

import com.toyproject.www.VO.UserVO;

@Service
public interface UserService {
	public void insertUser(UserVO uservo);
}
