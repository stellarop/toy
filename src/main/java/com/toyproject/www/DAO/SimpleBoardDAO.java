package com.toyproject.www.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.toyproject.www.VO.SimpleBoardVO;

@Repository
public class SimpleBoardDAO {
	
	@Autowired
	SqlSessionTemplate sqlsessiontemplate;
	
	public List<SimpleBoardVO> boardList(SimpleBoardVO vo) {
		return sqlsessiontemplate.selectList("boardDAO.boardList", vo);
	}
	
	public SimpleBoardVO getBoard(SimpleBoardVO vo) {
		return sqlsessiontemplate.selectOne("boardDAO.getBoard", vo);
	}
	
	public void deleteBoard(int board_seq) {
		sqlsessiontemplate.delete("boardDAO.deleteBoard", board_seq);
	}
	
	public void insertBoard(SimpleBoardVO vo) {
		sqlsessiontemplate.insert("boardDAO.insertBoard", vo);
	}
	
	public void updateBoard(SimpleBoardVO vo) {
		sqlsessiontemplate.update("boardDAO.updateBoard", vo);
	}
}
