package com.toyproject.www.Controller;

import java.awt.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {
	@ResponseBody
	@RequestMapping(value = "/displayData.do")
	public ArrayList<Map> displayData() {

			ArrayList<Map> list = new ArrayList<Map>();
			
			//ArrayList<Map> list2 = (ArrayList<Map>) list.subList(6, 11);
			String name = "name";
			String gender = "gender";

			for (int i = 1; i <= 10; i++) {
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("name", name);
				map.put("gender", gender);
				map.put("data", i);
				list.add(map);
			
			}
			
			
		return list;
	}

	@ResponseBody
	@RequestMapping(value = "/testData.do")
	public Map<String, Object> test(String data) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(data);
		String testData = "testData";

		String toData = data + testData;

		map.put("toData", toData);

		return map;
	}
}
