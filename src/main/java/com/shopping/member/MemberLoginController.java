package com.shopping.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.MemberDao;

public class MemberLoginController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);

		String MBRID = request.getParameter("MBRID");
		String MBRPW = request.getParameter("MBRPW");
		System.out.println(MBRID + "/" + MBRPW);

		MemberDao dao = new MemberDao();
		Member bean = dao.getDataByIdAndPassword(MBRID, MBRPW);

		if (bean == null) { // 로그인 실패
			String message = "로그인 정보가 잘못되었습니다.";
			super.setAlertMessage(message);
			super.gotoPage("Member/loginMain.jsp");

		} else { // 로그인 성공
			// session 영역(scope)에 나의 로그인 정보를 저장(바인딩)합니다.
			// loginfo 속성을 사용하여 현재 로그인 상태를 확인할 수 있습니다.
			super.session.setAttribute("loginfo", bean);

			// 로그인 성공 이후 상품 목록 페이지로 이동합니다.
			super.gotoPage("Order/OrderM.jsp");
		}
	}

}
