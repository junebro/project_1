package com.shopping.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

public class MemberInsertController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doGet(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);

		Member bean = new Member();
		MemberDao dao = new MemberDao();

		bean.setMBRID(request.getParameter("MBRID"));
		bean.setMBRPW(request.getParameter("MBRPW"));
		bean.setMBRNM(request.getParameter("MBRNM"));
		bean.setMBRHP(request.getParameter("MBRHP"));
		bean.setMBRBT(request.getParameter("MBRBT"));
		
		String depart = "";
		String email = request.getParameter("MBREM01");
		// <select>태그의 전공에 따라 depart에 다르게 저장
        if (email.equals("@naver.com")) {
            depart="@naver.com";
        } else if (email.equals("@gmail.com")){
            depart="@gmail.com";
        } else if (email.equals("@daum.net")){
            depart="@daum.net";
        };
        
		bean.setMBREM(request.getParameter("MBREM") + request.getParameter("MBREM01"));
		bean.setMBRAR("우편번호 : " +
				request.getParameter("MBRAR1"));
		bean.setMBRAR1("기본주소 :  "+
				request.getParameter("MBRAR2")+" "+
				request.getParameter("MBRAR3")
				);
		bean.setMBRHP(request.getParameter("mobile1")+"-"
				+request.getParameter("mobile2")+"-"
				+request.getParameter("mobile3")
				);
		bean.setMBRGD(request.getParameter("is_sex")
				);
		int cnt = dao.insertData(bean);

		if (cnt == 1) { // 인서트 성공
			// 로그인 컨트롤러의 doPost() 메소드를 호출하면 가입과 동시에 로그인하는 효과를 봅니다.
			new MemberLoginController().doPost(request, response);

		} else { // 인서트 실패
			new MemberInsertController().doGet(request, response);
		}
	}

}
