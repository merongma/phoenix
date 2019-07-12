package com.phoenix.mvc.web.cafe;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.common.Page;
import com.phoenix.mvc.service.domain.User;
import com.phoenix.mvc.common.Search;


@Controller
@RequestMapping("/cafe/*")
public class CafeTabContoller {
	
	@Autowired
	@Qualifier("cafeTabServiceImpl")
	private CafeTabService cafeTabService;
	
	@Value("${pageSize}")
	private int pageSize;
	
	@Value("${pageUnit}")
	private int pageUnit;
	
	public CafeTabContoller() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@RequestMapping("/cafe/main")
	public String cafeMain() {
		System.out.println("/cafe/main입니다.");
		return "forward:/WEB-INF/views/cafe/cafeHomeMain.jsp";
	}
	///////////////////////////////준호시작///////////////////////////////////////	
	@RequestMapping(value= "/addCafeView", method=RequestMethod.GET)
	public String addCafeView(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/addCafe : GET");
		
		
		
		return "cafe/addCafeView";
	}
	
	@RequestMapping(value= "/{cafeURL}/addCafe", method=RequestMethod.POST)
	public String addCafe(@ModelAttribute("cafe") Cafe cafe)throws Exception{
		
		System.out.println("/addCafe : POST");
		
		
		//cafe.setManageUserNo("10012");		

		cafeTabService.addCafe(cafe);
		
		return "cafe/addCafe";
	}
	
	///////////////////////////////준호끝///////////////////////////////////////		
	
	/////////////////////////////////기황 시작//////////////////////////////////////
	@RequestMapping("/cafe/search")
	public String cafeSearch(@ModelAttribute("search") Search search, Model model) throws Exception {
	
		System.out.println("/cafe/search입니다.");
		
		pageSize=2;

		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String, Object> map = cafeTabService.searchCafe(search);
		List cafeList = (List) map.get("cafeList");
		List postList = (List) map.get("postList");
		int totalCount = (int) map.get("totalCount");
		Page page = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		model.addAttribute("cafeList", cafeList);
		model.addAttribute("postList", postList);
		model.addAttribute("search", search);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("page", page);
		return "forward:/WEB-INF/views/cafe/listCafeSearch.jsp";
	}
	
	@RequestMapping("/cafe/category")
	public String getCategorizedCafe(@ModelAttribute("search") Search search, Model model) throws Exception {
		
		System.out.println("/cafe/category입니다.");
		pageSize=2;

		if(search.getCurrentPage() == 0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = cafeTabService.getCategorizedCafeList(search);
		
		List cafeList = (List) map.get("cafeList");
		int totalCount = (int) map.get("totalCount");
		Page page = new Page( search.getCurrentPage(), totalCount, pageUnit, pageSize);

		model.addAttribute("categoryCafeList", cafeList);
		model.addAttribute("search", search);
		model.addAttribute("page", page);
			
		return "forward:/WEB-INF/views/cafe/cafeHomeMain.jsp";
	}
	
	/////////////////////////////////기황 끝//////////////////////////////////////

	//////////////////////////////////////////////예림시작 ////////////////////////////////////////////////
	@RequestMapping("/{cafeURL}")
		public String getCafeMain(@PathVariable String cafeURL,HttpSession session,Model model)
		{
			System.out.println("/cafe/{cafeURL}");
			
			//승규 getBoardPostList Service 불러오면 안되잖아. 그럼 바로 dao부르나?? 내가 메서드를 만들어야겠네.
			User user = new User(); 
			
			if(session.getAttribute("user")!=null)  //session에 있으면
			{
				user = (User) session.getAttribute("user") ;
			}
				
			if(user.getUserNo()==0) //포탈로그인되어있지않음. 400
			{
				user.setUserNo(400);
			} 
			//set해주고 service태워서 service에서 회원인지 아닌지 검사
		
			//가짜데이터
			user.setUserNo(10000);
			Map map = cafeTabService.getCafeMain(user, cafeURL);
			
			model.addAttribute("cafeURL", map.get("cafeURL"));
			model.addAttribute("noticePostList", map.get("noticePostList"));//공지게시글리스트
			model.addAttribute("cafeMember", map.get("cafeMember"));//내정보
			model.addAttribute("boardList", map.get("boardList"));//카페게시판리스트
			
			return "cafe/mainCafe";
		}
	////////////////////////////////////////////////////예림 끝//////////////////////////////////////////////
}
