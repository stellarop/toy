package com.toyproject.www.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.toyproject.www.Service.SimpleBoardService;
import com.toyproject.www.VO.SimpleBoardVO;

@Controller
public class SimpleBoardController {
	private static final Logger logger = Logger.getLogger(SimpleBoardController.class);
	@Autowired
	private SimpleBoardService simpleboardservice;
	
	@ResponseBody
	@RequestMapping(value = "/boardList.do")
	public Map<String, Object> boardList(SimpleBoardVO vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			//dataTable�� �Ѱ��ִ� ������ �̸��� ������ data�� �Ѱ��־�� �Ѵ�.
			map.put("data", simpleboardservice.boardList(vo));
			logger.info("[boardList ����]");
		} catch (Exception e) {
			logger.error("boardList ����[" + e.getMessage() + "]");
		}
		return map;
	}
	
	
	@RequestMapping(value = "/getBoard.do")
	public String getBoard(SimpleBoardVO vo, Model model) {
		try {
			model.addAttribute("getBoard", simpleboardservice.getBoard(vo));
			logger.info("[getBoard ����]");
		} catch (Exception e) {
			logger.error("getBoard ����[" + e.getMessage() + "]");
		}
		return "getBoard.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteBoard.do")
	public boolean deleteBoard(int board_seq) {
		try {
			simpleboardservice.deleteBoard(board_seq);
			logger.info("[deleteBoard ����]");
			return true;
		} catch (Exception e) {
			logger.error("deleteBoard ���� [" + e.getMessage() + "]");
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertBoard.do")
	public boolean insertBoard(SimpleBoardVO vo, HttpSession session) {
		try {
			String userId = (String) session.getAttribute("userId");
			vo.setWriter(userId);
			simpleboardservice.insertBoard(vo);
			logger.info("[insertBoard ����]");
			return true;
		} catch (Exception e) {
			logger.error("insertBoard ����[" + e.getMessage() + "]");
			return false;
		}
	}
	
	@RequestMapping(value = "/updateBoardView.do")
	public String updateBoardView(SimpleBoardVO vo, Model model) {
		try {
			model.addAttribute("getBoard", simpleboardservice.getBoard(vo));
			logger.info("[updateBoardView ����]");
			return "updateBoard.jsp";
		} catch (Exception e) {
			logger.error("updateBoardView ����[" + e.getMessage() + "]");
			return "redirect:getBoard.do";
		}
	}
	 
	@ResponseBody
	@RequestMapping(value = "/updateBoard.do")
	public boolean updateBoard(SimpleBoardVO vo) {
		try {
			simpleboardservice.updateBoard(vo);
			logger.info("[updateBoard ����]");
			return true;
		} catch (Exception e) {
			logger.error("updateBoard ����[" + e.getMessage() + "]");
			return false;
		}
	}
	

}
