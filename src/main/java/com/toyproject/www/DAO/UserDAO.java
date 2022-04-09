package com.toyproject.www.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.toyproject.www.VO.UserVO;

@Repository
public class UserDAO {

	@Autowired
	SqlSessionTemplate mybatis;
	
	public void insertUser(UserVO uservo) {
		mybatis.insert("userDAO.insertUser",uservo);
	}
}
