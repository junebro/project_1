package com.shopping.board;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.bean.Board;
import com.shopping.common.SuperClass;
import com.shopping.model.dao.BoardDao;
 
public class BoardInsertController extends SuperClass{
	private final String PREFIX = "/board/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		RequestDispatcher dispatcher = null;
			dispatcher = request.getRequestDispatcher(PREFIX + "boInsert.jsp");
			dispatcher.forward(request, response);
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
		
		BoardDao dao = new BoardDao();
		Board bean = new Board();
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String subject = request.getParameter("subject");
		String contents = request.getParameter("contents");
		
		bean.setId(id);
		bean.setPassword(password);
		bean.setSubject(subject);
		bean.setContents(contents);
		
		int cnt = -1;
		cnt = dao.insertData(bean);
		
		if(cnt == 1) {
			new BoardListController().doGet(request, response);
		}else {
			new BoardInsertController().doGet(request, response);
		}

		
	}

}
