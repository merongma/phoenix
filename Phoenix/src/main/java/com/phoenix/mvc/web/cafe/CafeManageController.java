package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageService;
import com.phoenix.mvc.service.domain.Cafe;

@Controller
@RequestMapping("/cafe/*")
public class CafeManageController {

	
	@Autowired
	@Qualifier("cafeManageServiceImpl")
	private CafeManageService cafeManageService;
	
	public CafeManageController() {
		System.out.println(this.getClass().getName()+"생성자 start");
	}

	@RequestMapping(value = "/{cafeURL}/updateCafeBoardView", method = RequestMethod.GET )
	public String updateCafeBoardView( @PathVariable String cafeURL , HttpSession session, Model model)//session user정보, 카페번호
	{
		System.out.println("/{cafeURL}/updateCafeBoardView : GET");
		//session 으로  1.로그인되어있는지 2.카페에 가입되어있는지 3.cafeURL의 카페매니저인지 확인
		System.out.println("cafeURL : "+cafeURL);
		
		List boardList = cafeManageService.getCafeBoard(cafeURL);
		
		model.addAttribute("boardList", boardList);
		
		return "/cafe/updateCafeBoard";
	}
	
	@RequestMapping(value = "/{cafeURL}/updateCafeBoard", method = RequestMethod.POST)
	public String updateCafeBoard()
	{
		
		return "";// 다시 updateCafeBoardView 호출하고 싶은데.
	}
	@RequestMapping(value = "/{cafeURL}/manage/getCafeApplicationList")
	public String getCafeApplicationList(@ModelAttribute("search") Search search, Model model) {
		int pageUnit = 5;
		int pageSize = 5;
		System.out.println("/{cafeURL}/manage/getCafeApplicationList : GET/POST");
		
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(5);//일단 5로 설정
		
		Map<String, Object> map = cafeManageService.getCafeApplicationList(search);
		
		Page resutlPage = new Page(search.getCurrentPage(),((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage 는 ? " +resutlPage);
		System.out.println("search 값 확인 : "+search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("page", resutlPage);
		model.addAttribute("search", search);
		
		return "/cafe/listCafeApplication";
		
	}
	

	
	@RequestMapping(value= "/cafe/updateCafeInfoView", method=RequestMethod.GET)
	public String updateCafeInfoView(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/updateCafeInfoView : GET");
		
		return "cafe/updateCafeInfoView";
	}
	
	//수정중
	@RequestMapping(value= "/cafe/updateCafeInfo", method=RequestMethod.POST)
	public String addCafe(@RequestParam("cafeNo" ) String cafeNo, Model model)throws Exception{
		
		System.out.println("/updateCafeInfo : POST");
		
		//Cafe cafe =  cafeManageService.getCafeInfo(cafeNo);
		
	//	model.addAttribute("cafe", cafe);
		
		return "cafe/updateCafeInfo";
	}
	
}
