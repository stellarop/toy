package com.toyproject.www.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.toyproject.www.VO.SimpleBoardVO;

@Service
public interface SimpleBoardService {
	public List<SimpleBoardVO> boardList(SimpleBoardVO vo);
	public SimpleBoardVO getBoard(SimpleBoardVO vo);
	public void deleteBoard(int board_seq);
	public void insertBoard(SimpleBoardVO vo);
	public void updateBoard(SimpleBoardVO vo);
}
