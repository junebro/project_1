package com.shopping.like;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.dao.LikeDao;

public class LikeInsertController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		System.out.println("LikeInsertController 성공 get");
		
		String pronm = request.getParameter("pronm");
		String mbrid = "aaa";
		
		LikeDao ldao = new LikeDao();
		int cnt = ldao.insertLike(pronm, mbrid);
		
		System.out.println("저장 완료");
	}
	
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
}
