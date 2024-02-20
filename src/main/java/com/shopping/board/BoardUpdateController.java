package com.shopping.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Board;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.BoardDao;
import com.shopping.model.dao.MemberDao;

public class BoardUpdateController extends SuperClass{
	//private final String PREFIX = "board/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		// 넘어 오는 게시물 번호를 우선 챙깁니다.
		int no = Integer.parseInt(request.getParameter("no")) ;
		BoardDao dao = new BoardDao();
		Board bean = dao.getDataBean(no);
		
		// 이전에 작성했던 게시물 내용을 폼 양식에서 볼수 있도록 바인딩합니다. 
		request.setAttribute("bean", bean);
		
		super.gotoPage("/board/boUpdateForm.jsp"); 
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		BoardDao dao = new BoardDao();
		Board bean = new Board();
		
		MemberDao mdao = new MemberDao();
		Member mpw = new Member();
		
		
		
		/* 다음 컬럼들에 대하여 주의하도록 합니다.
		 * 글번호(no)는 반드시 파라미터를 챙겨야 합니다.
		 * regdate 컬럼은 현재 시각으로 변경하도록 합니다. */
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		
		String mbrpw = "";
		mbrpw = mdao.getMemberPw(id);
		
		bean.setNo(no) ;
		bean.setId(id);
		bean.setPassword(password);
		bean.setSubject(subject);
		bean.setContents(contents);		
		
		System.out.println("멤버 암호 : " + mbrpw);
		request.setAttribute("pwdata", mbrpw);
		
		int cnt = -1 ;
		cnt = dao.updateData(bean);

		if(cnt == 1){ // 수정 성공
			
			new BoardListController().doGet(request, response) ;
			
			
		}else{ // 수정 실패
			new BoardUpdateController().doGet(request, response);
		}	
	}
}
