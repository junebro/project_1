package com.shopping.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.FillItem;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.FillItemDao;
import com.shopping.model.dao.MemberDao;
import com.shopping.product.ProductListController;

public class MypageUpdateController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		// 라디오 버튼과 체크 박스는 데이터 베이스에서 읽어 동적으로 채웁니다.
				FillItemDao fdao = new FillItemDao();
				List<FillItem> genderList = fdao.getDataList("members", "gender");
				
				request.setAttribute("genderList", genderList);
				
				// 현재 로그인 한 사람의 아이디(primary key) 
				String id = request.getParameter("MBRID") ;
				
				MemberDao dao = new MemberDao();
				Member bean = dao.getDataBean(id) ; 
				
				request.setAttribute("bean", bean);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		MemberDao dao = new MemberDao();
		Member bean = new Member();
		
		bean.setMBRID(request.getParameter("MBRID"));
		bean.setMBRNM(request.getParameter("MBRNM"));
		bean.setMBRPW(request.getParameter("MBRPW"));	
		bean.setMBRAR(request.getParameter("MBRAR"));
		bean.setMBRAR1(request.getParameter("MBRAR1"));
		bean.setMBRAR2(request.getParameter("MBRAR2"));
		bean.setMBRHP(request.getParameter("MBRHP"));
		bean.setMBREM(request.getParameter("MBREM"));
		bean.setMBRBT(request.getParameter("MBRBT"));
		bean.setMBRGD(request.getParameter("MBRGD"));
		
		// 적립 포인트는 데이터 베이스 기본 값으로 대체하면 문제 없음
		String message = "수정완료";
		request.setAttribute("message", message);
		/*
		 * int cnt = dao.updateData(bean) ;
		 * 
		 * if(cnt == 1){ // 수정 성공 new ProductListController().doGet(request, response);
		 * 
		 * }else{ // 수정 실패 new MypageUpdateController().doGet(request, response); }
		 */
	}
	
	
}
