package com.toyproject.www.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toyproject.www.DAO.SimpleBoardDAO;
import com.toyproject.www.Service.SimpleBoardService;
import com.toyproject.www.VO.SimpleBoardVO;

@Service
public class SimpleBoardImpl implements SimpleBoardService{

	@Autowired
	SimpleBoardDAO simpleBoardDAO;
	
	@Override
	public List<SimpleBoardVO> boardList(SimpleBoardVO vo) {
		return simpleBoardDAO.boardList(vo);
	}

	@Override
	public SimpleBoardVO getBoard(SimpleBoardVO vo) {
		return simpleBoardDAO.getBoard(vo);
	}

	@Override
	public void deleteBoard(int board_seq) {
		simpleBoardDAO.deleteBoard(board_seq);
	}

	@Override
	public void insertBoard(SimpleBoardVO vo) {
		simpleBoardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(SimpleBoardVO vo) {
		simpleBoardDAO.updateBoard(vo);
	}

}
