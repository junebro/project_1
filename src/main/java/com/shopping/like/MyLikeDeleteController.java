package com.shopping.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.dao.MyLikeDao;

public class MyLikeDeleteController extends SuperClass{	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		String pronm = request.getParameter("pronm");
		String mbrid = request.getParameter("mbrid");
		
		MyLikeDao ldao = new MyLikeDao();
		int cnt = ldao.deleteLike(pronm, mbrid);
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
}
