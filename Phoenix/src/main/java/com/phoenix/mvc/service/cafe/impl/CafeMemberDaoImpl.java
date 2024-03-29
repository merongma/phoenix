package com.phoenix.mvc.service.cafe.impl;

import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.phoenix.mvc.common.Search;
import com.phoenix.mvc.service.cafe.CafeMemberDao;
import com.phoenix.mvc.service.domain.CafeApplication;
import com.phoenix.mvc.service.domain.CafeGrade;
import com.phoenix.mvc.service.domain.CafeMember;
import com.phoenix.mvc.service.domain.CafeMemberBlock;

@Repository("cafeMemberDaoImpl")
public class CafeMemberDaoImpl implements CafeMemberDao {

	@Autowired
	private SqlSession sqlSession;

	public CafeMemberDaoImpl(SqlSession sqlSession) {
		System.out.println(this.getClass());
		this.sqlSession = sqlSession;
	}

/////////////////////////////////지니 시작//////////////////////////////
	@Override
	public void addCafeApplication(CafeApplication cafeApplication) {
		sqlSession.insert("CafeApplicationMapper.addCafeApplication", cafeApplication);
	}

	@Override
	public int updateCafeMember(CafeMember cafeMember) {
		return sqlSession.update("CafeMemberMapper.updateCafeMember", cafeMember);

	}

	@Override
	public void addCafeMember(CafeMember cafeMember) {
		sqlSession.insert("CafeMemberMapper.addCafeMember", cafeMember);

	}

	@Override
	public void updateCafeMemberProfile(CafeMember cafeMember) {
		sqlSession.update("CafeMemberMapper.updateCafeMemberProfile", cafeMember);

	}

	@Override
	public int changeGradeNo(CafeMember cafeMember) {

		return sqlSession.update("CafeMemberMapper.changeGradeNo", cafeMember);
	}

	@Override
	public int updateMembersIncrease(int cafeNo) {

		return sqlSession.update("CafeMapper.increaseMember", cafeNo);
	}

	@Override
	public int updateMembersDecrease(int cafeNo) {

		return sqlSession.update("CafeMapper.decreaseMember", cafeNo);
	}

	@Override
	public int lowGradeNo(int cafeNo) {

		return sqlSession.selectOne("CafeGradeMapper.lowGrade", cafeNo);
	}

	@Override
	public CafeMember checkNickname(CafeMember cafeMember) {

		return sqlSession.selectOne("CafeMemberMapper.checkNickname", cafeMember);
	}

////////////////////////////////지니끝//////////////////////////////////

////////////////////////////////////////////////// 예림 시작///////////////////////////////////
	@Override // 예림예림
	public CafeMember getCafeMember(int cafeNo, int userNo) {

		HashMap map = new HashMap();
		map.put("cafeNo", cafeNo);
		map.put("userNo", userNo);

		CafeMember cafeMember = new CafeMember();

		cafeMember = sqlSession.selectOne("getCafeMember", map);

		return cafeMember;
	}
///////////////////////////////////////// 예림끝///////////////////////////////////////////

////////////////////////////////////기황 시작///////////////////////////////////////

	@Override
	public CafeMember getCafeMember(Search search) throws Exception {
		return sqlSession.selectOne("CafeMemberMapper.getCafeMemeber", search);
	}

	@Override
	public int updatePostCountIncrease(int memberNo) throws Exception {
		return sqlSession.update("CafeMemberMapper.increasePostCount", memberNo);
	}

	@Override
	public int updatePostCountDecrease(int memberNo) throws Exception {
		return sqlSession.update("CafeMemberMapper.decreasePostCount", memberNo);
	}

	@Override
	public int updateReplyCountIncrease(int memberNo) throws Exception {
		return sqlSession.update("CafeMemberMapper.increaseReplyCount", memberNo);
	}

	@Override
	public int updateReplyCountDecrease(int memberNo) throws Exception {
		return sqlSession.update("CafeMemberMapper.decreaseReplyCount", memberNo);
	}

	@Override
	public int updateVisitCountIncrease(int memberNo) throws Exception {
		return sqlSession.update("CafeMemberMapper.increaseVisitCount", memberNo);
	}

	@Override
	public int updateFavorite(CafeMember cafeMember) throws Exception {
		return sqlSession.update("CafeMemberMapper.updateFavorite", cafeMember);
	}

	@Override
	public CafeMember getCafeMemberByURL(Search search) throws Exception {
		return sqlSession.selectOne("CafeMemberMapper.checkMember", search);
	}

//////////////////////////////기황 끝///////////////////////////////////////	

}
