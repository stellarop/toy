package com.toyproject.www.Controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toyproject.www.Service.ProductService;
import com.toyproject.www.Service.VendorService;
import com.toyproject.www.VO.VendorVO;

@Controller
public class VendorController {
	private static final Logger logger = Logger.getLogger(VendorController.class);
	
	@Autowired 
	private VendorService vendorService;
	
	@Autowired
	private ProductService productservice;
	
	@ResponseBody
	@RequestMapping(value = "/vendorProductList.do")
	public Map<String, Object> vendorProductList(String vendor_code){
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		try {
			if(vendor_code == null || StringUtils.isEmpty(vendor_code)) {
				logger.error("[vendorProductList error] : vendor_code 를 찾을 수 없습니다.");
			}else {
				result.put("data", productservice.vendorProductList(vendor_code));
				logger.info("[vendorProductList] 실행");
			}
		} catch (Exception e) {
			logger.info("vendorProductList 오류[" + e.getMessage() + "]");
		}
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertVendor.do")
	public int insertVendor(VendorVO vendorvo, HttpSession session) {
	
		try {
			String vendor_code = "";
			
			for (int i = 1; i <= 15; i++) {
				char ch = (char) ((Math.random() * 26) + 65);	
				vendor_code+=ch;
			}
			
			String user_Id = (String) session.getAttribute("userId");
			
			// 판매처 등록 아이디 확인 
			int ui = vendorService.selectUserId(user_Id);
			
			// 판매처 코드 중복 확인
			int vc = vendorService.selectVendorCode(vendor_code);
			
			if(user_Id == null || StringUtils.isEmpty(user_Id)) {
				logger.error("[insertVendor 오류] 세션이 만료되어 아이디 정보를 찾을 수 없습니다.");
				return 20;
			}
			
			if(ui == 1) {
				logger.error("[insertVendor 오류] 판매처 등록 실패(계정당 하나의 판매처만 가능)");
				return 0;
			}
			if(vc == 1) {
				logger.error("[insertVendor 오류] 판매처 코드 생성 실패(판매처 코드 중복)");
				return 1;
			}else {
				logger.info("[insertVendor] 판매처 코드 생성 성공 ");
				vendorvo.setVendor_code(vendor_code);
				vendorvo.setUserid(user_Id);
				logger.info("[insertVendor 실행]");
				vendorService.insertVendor(vendorvo);
			}
			return 2;
			
		} catch (Exception e) {
			logger.error("insertVendor 오류[" + e.getMessage() + "]");
			return 3;
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/vendorList.do")
	public Map<String, Object> vendorList(VendorVO vendorvo){
		HashMap<String, Object> list = new HashMap<String, Object>();
		try {
			list.put("data", vendorService.vendorList(vendorvo));
			logger.info("[vendorList] 실행");
		} catch (Exception e) {
			logger.error("vendorList 오류[" + e.getMessage() + "]");
		}
		return list;
	}
	
	@ResponseBody
	@RequestMapping(value = "/selectVendor.do")
	public Map<String, Object> selectVendor(VendorVO vendorvo){
		HashMap<String, Object> selectVendor = new HashMap<String, Object>();
	
		try {
			selectVendor.put("selectVendor", vendorService.selectVendor(vendorvo));
			logger.info("[selectVendor] 실행");
		} catch (Exception e) {
			logger.error("selectVendor 오류[" + e.getMessage() + "]");
		}
		
		return selectVendor;	
	}
	
	@ResponseBody
	@RequestMapping(value = "/deleteVendor.do")
	public boolean deleteVendor(int vendor_seq) {
		try {
			vendorService.deleteVendor(vendor_seq);
			logger.info("[deleteVendor] 실행");
			return true;
			
		} catch (Exception e) {
			logger.error("deleteVendor 오류[" + e.getMessage() + "]");
			return false;
		}
	}
}
