package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeManageDao;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.cafe.CafeTabDao;
import com.phoenix.mvc.service.cafe.CafeTabService;
import com.phoenix.mvc.service.domain.Cafe;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.User;


@Service("cafeTabServiceImpl")
public class CafeTabServiceImpl implements CafeTabService{
	
	@Autowired
	@Qualifier("cafeTabDaoImpl")	
	private CafeTabDao cafeTabDao;
	
	@Autowired
	@Qualifier("cafeManageDaoImpl")
	private CafeManageDao cafeManageDao;
	
	@Autowired
	@Qualifier("cafeMemberDaoImpl")
	private CafeMemberDao cafeMemberDao;
	
	public void setCafeDao(CafeTabDao cafeDao) {
	this.cafeTabDao= cafeDao;
	}
	
	public void setCafeManageDao (CafeManageDao cafeManageDao)
	{
		this.cafeManageDao = cafeManageDao;
	}
	
	public void setCafeMemberDao(CafeMemberDao cafeMemberDao)
	{
		this.cafeMemberDao = cafeMemberDao;
	}
	
	
	public CafeTabServiceImpl() {
		System.out.println(getClass().getName() + "default Constuctor");
	}
	
	@Override
	public void addCafe(Cafe cafe) throws Exception {
		cafeTabDao.addCafe(cafe);
	}

	@Override
	public List searchCafe(Search search) throws Exception {
		// TODO Auto-generated method stub
		return cafeTabDao.searchCafe(search);
	}

	@Override
	public Map getCafeMain(User user, String cafeURL) { //예림예림
		
		CafeMember cafeMember = new CafeMember();
		Map map = new HashMap();
		
		//여기서 userNo 검사해서 400 이면 로그인되어있지않음. 
		int cafeNo = cafeManageDao.getCafeNo(cafeURL);
		
		if(user.getUserNo()!=400) //로그인이되어있을때
		{
			//1.카페멤버인지 확인 (=카페멤버이면 정보가져오고 아니면 못가져옴)
			cafeMember = cafeMemberDao.getCafeMember(cafeNo,user.getUserNo());//카페번호랑회원번호로
			//cafeMember.getUserNo().equals("500") 이면
			//500설정은 dao에서해줬음.
			
		}
		else //로그인이 되어있지않음.
		{
			cafeMember.setUserNo("400");
		}
		map.put("cafeMember", cafeMember);
		
		
		//공통
		//1.카페의 공지게시글 가져오기 ->승규 dao 
		
		//2.cafe정보가져오기 ->준호
		
		//3.카페 게시판 list ->내가한거네
		List boardList = cafeManageDao.getCafeBoard(cafeNo);
		map.put("boardList", boardList);
		
		return map;
	}
}
