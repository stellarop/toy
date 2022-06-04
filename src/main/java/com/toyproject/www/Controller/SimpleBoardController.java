package com.toyproject.www.Controller;

import java.util.HashMap;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		//dataTable로 넘겨주는 데이터 이름은 무조건 data로 넘겨주어야 한다.
		map.put("data", simpleboardservice.boardList(vo));
		logger.info("boardList 실행");
		return map;
	}
	
	
	@RequestMapping(value = "/getBoard.do")
	public String getBoard(SimpleBoardVO vo, Model model) {
		model.addAttribute("getBoard", simpleboardservice.getBoard(vo));
		logger.info("getBoard 실행");
		return "getBoard.jsp";
	}
	
	public boolean deleteBoard(SimpleBoardVO vo) {
		
		try {
			simpleboardservice.deleteBoard(vo);
			logger.info("게시글 삭제 완료");
			return true;
		} catch (Exception e) {
			logger.error("게시글 삭제 실패 [" + e.getMessage() + "]");
			return false;
		}
	}
	
	
	
	
	
	
	
	
}
