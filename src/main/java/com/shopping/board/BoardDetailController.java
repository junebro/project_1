package com.shopping.board;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.bean.Board;
import com.shopping.common.SuperClass;
import com.shopping.model.dao.BoardDao;

public class BoardDetailController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		BoardDao dao = new BoardDao() ;
		int no = Integer.parseInt(request.getParameter("no")) ;
		Board abc = dao.getDataBean(no);
		
		request.setAttribute("abc", abc);
		
		RequestDispatcher dispatcher = null;
		
			dispatcher = request.getRequestDispatcher("/board/boDetail.jsp");
			dispatcher.forward(request, response);
	}
	

}
