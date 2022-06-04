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
		//dataTable�� �Ѱ��ִ� ������ �̸��� ������ data�� �Ѱ��־�� �Ѵ�.
		map.put("data", simpleboardservice.boardList(vo));
		logger.info("boardList ����");
		return map;
	}
	
	
	@RequestMapping(value = "/getBoard.do")
	public String getBoard(SimpleBoardVO vo, Model model) {
		model.addAttribute("getBoard", simpleboardservice.getBoard(vo));
		logger.info("getBoard ����");
		return "getBoard.jsp";
	}
	
	public boolean deleteBoard(SimpleBoardVO vo) {
		
		try {
			simpleboardservice.deleteBoard(vo);
			logger.info("�Խñ� ���� �Ϸ�");
			return true;
		} catch (Exception e) {
			logger.error("�Խñ� ���� ���� [" + e.getMessage() + "]");
			return false;
		}
	}
	
	
	
	
	
	
	
	
}
