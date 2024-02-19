package com.shopping.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.dao.MemberDao;

public class MypageDeleteController extends SuperClass{
	@Override 	// 특정 회원이 탈퇴할 때 사용하는 컨트롤러입니다.
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String id = super.loginfo.getMBRID();
		MemberDao dao = new MemberDao() ;
		int cnt = -1 ;
		cnt = dao.deleteData(id) ;
		
		// 세션 공간에 들어 있는 모든 정보를 무효화시킵니다.
		super.session.invalidate();
		
		super.gotoPage("MainPage/index.jsp");
	}
}
