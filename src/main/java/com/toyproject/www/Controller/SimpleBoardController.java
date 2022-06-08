package com.toyproject.www.Controller;

import java.util.HashMap;
import java.util.Map;

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
	private static final Logger logger = Logger.getLogger(Maincontroller.class);
	@Autowired
	private SimpleBoardService simpleboardservice;
	
	@ResponseBody
	@RequestMapping(value = "/boardList.do")
	public Map<String, Object> boardList(SimpleBoardVO vo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			//dataTable로 넘겨주는 데이터 이름은 무조건 data로 넘겨주어야 한다.
			map.put("data", simpleboardservice.boardList(vo));
			logger.info("[boardList 실행]");
		} catch (Exception e) {
			logger.error("boardList 오류[" + e.getMessage() + "]");
		}
		return map;
	}
	
	
	@RequestMapping(value = "/getBoard.do")
	public String getBoard(SimpleBoardVO vo, Model model) {
		try {
			model.addAttribute("getBoard", simpleboardservice.getBoard(vo));
			logger.info("[getBoard 실행]");
		} catch (Exception e) {
			logger.error("getBoard 오류[" + e.getMessage() + "]");
		}
		return "getBoard.jsp";
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteBoard.do")
	public boolean deleteBoard(int board_seq) {
		try {
			simpleboardservice.deleteBoard(board_seq);
			logger.info("[deleteBoard 실행]");
			return true;
		} catch (Exception e) {
			logger.error("deleteBoard 오류 [" + e.getMessage() + "]");
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertBoard.do")
	public boolean insertBoard(SimpleBoardVO vo) {
		try {
			simpleboardservice.insertBoard(vo);
			logger.info("[insertBoard 실행]");
			return true;
		} catch (Exception e) {
			logger.error("insertBoard 오류[" + e.getMessage() + "]");
			return false;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/updateBoard.do")
	public boolean updateBoard(SimpleBoardVO vo) {
		try {
			simpleboardservice.updateBoard(vo);
			logger.info("[updateBoard 실행]");
			return true;
		} catch (Exception e) {
			logger.error("updateBoard 오류[" + e.getMessage() + "]");
			return false;
		}
	}
	

}
