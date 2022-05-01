package com.toyproject.www.Controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;

import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;

import java.net.URL;
import java.util.HashMap;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.toyproject.www.Service.UserService;
import com.toyproject.www.VO.UserVO;

import lombok.extern.log4j.Log4j;


@Log4j
@Controller
public class UserController {
private static final Logger logger = Logger.getLogger(UserController.class);	
	
	
	@Autowired
	UserService userservice;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {
		return "login.jsp";
	}
	
	@RequestMapping(value = "/getKakaoLoginUrl.do")
	public @ResponseBody String getKakaoUrl(HttpServletRequest request)throws Exception {
		String KakaoLoginUrl = "https://kauth.kakao.com/oauth/authorize"
						+ "?client_id=3a5420cb005cbd9929cfc6764d800831"
						+ "&redirect_uri=http://localhost:8080/kakaoLogin.do"
						+ "&response_type=code";
		
		return KakaoLoginUrl;
	}
	
	// 카카오 연동정보 조회
	@RequestMapping(value = "/kakaoLogin.do")
	public String kakaoLogin(@RequestParam(value = "code", required = false)
	String code, Model model)throws Exception {
		
		logger.info("code : " + code);
		// 카카오 로그인 시 발급된 토큰 가져오기
		String access_Token = getAccessToken(code);
		logger.info("access_Token" + access_Token);
		
		// 발급된 토큰으로 해당 유저 정보 가져오기
		HashMap<String, Object> userInfo = getUserInfo(access_Token);
		
		logger.info("access_Token : " + access_Token);
		logger.info("email : " + userInfo.get("email"));
		logger.info("nickname : " + userInfo.get("nickname"));
		
		// 유저 정보 json으로 변경
		JSONObject kakaoInfo =  new JSONObject(userInfo);
		// json으로 변경한 유저 정보 main.jsp에 넘김
		model.addAttribute("kakaoInfo", kakaoInfo);
		return "main.jsp";
	}
	
	// 토큰 발급
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
	    String refresh_Token = "";
	    String KakaoLoginUrl = "https://kauth.kakao.com/oauth/token";
	    
	    try {
			URL url = new URL(KakaoLoginUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=3a5420cb005cbd9929cfc6764d800831");
			sb.append("&redirect_uri=http://localhost:8080/kakaoLogin.do");
			sb.append("&code=" + authorize_code);
	        bw.write(sb.toString());
	        bw.flush();
	        
	        int responseCode = conn.getResponseCode();
	        logger.info("responseCode" + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        String line = "";
            String result = "";
            
            while((line = br.readLine()) != null) {
            	result += line;
            }
            
            logger.info("result" + result);
            
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            logger.info("access_token : " + access_Token);
            logger.info("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
	    } catch (Exception e) {
			e.printStackTrace();
		}
	    
	    return access_Token;
	}
	
	
	// 유저 정보 조회
	public HashMap<String, Object> getUserInfo(String access_Token){
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String KakaoLoginUrl = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(KakaoLoginUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
			conn.setRequestMethod("GET");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            
            logger.info("responseCode : " + responseCode);
      
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            
            logger.info("response body : " + result);
         
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            logger.info("element : " + element);
            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();
            
            userInfo.put("accessToken", access_Token);
            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfo;
	}
	
	@SuppressWarnings("null")
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ResponseEntity<Integer> selectUser(UserVO uservo, HttpSession session) {

		try {
			UserVO user = userservice.selectUser(uservo);

			if (user != null || StringUtils.isEmpty(user.getId())) {
				session.setAttribute("userName", user.getUsername());
				return new ResponseEntity<Integer>(1, HttpStatus.OK);
			}

		} catch (Exception e) {
			logger.info("login 실패 errorMessage : " + e.getMessage());
			return new ResponseEntity<Integer>(2, HttpStatus.BAD_REQUEST);
		}
		return null;

	}

	@RequestMapping(value = "/SignUp.do", method = RequestMethod.POST)
	@ResponseBody
	public boolean signUp(UserVO uservo) {

		int idCheck = userservice.idCheck(uservo);

		if (idCheck == 1) {
			return false;
		} else {
			userservice.SignUp(uservo);
		}
		return true;
	}

	@RequestMapping(value = "/idCheck.do")
	@ResponseBody
	public int idCheck(UserVO uservo) {
		int idCheck = userservice.idCheck(uservo);
		return idCheck;
	}

}
