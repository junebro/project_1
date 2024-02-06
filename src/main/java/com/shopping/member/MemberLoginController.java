package com.shopping.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

public class MemberLoginController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doPost(request, response);
		
		String MBRID = request.getParameter("MBRID") ;
		String MBRPW = request.getParameter("MBRPW") ;
		System.out.println(MBRID + "/" + MBRPW);
		
		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByIdAndPassword(MBRID, MBRPW);
		
		
	}
	
}
