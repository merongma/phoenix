package com.phoenix.mvc.web.cafe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;

@Controller
@RequestMapping("/cafe/json/*")
public class CafeTabRestContoller {
	
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	

	
	public CafeTabRestContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
///////////////////////////////준호시작///////////////////////////////////////
	@RequestMapping(value = "/json/checkCafeNameDuplication", method=RequestMethod.POST)
	public boolean checkCafeNameDuplication(@RequestBody Cafe cafe)throws Exception{
		
		System.out.println("/Cafe/json/checkDuplication : POST");
		
		boolean JSONData = cafeTabService.checkCafeNameDuplication(cafe.getCafeName());
		
		System.out.println(JSONData);
		
		return JSONData;
	}


	
///////////////////////////////준호끝///////////////////////////////////////	
}
