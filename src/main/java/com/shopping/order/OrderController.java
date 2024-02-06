package com.shopping.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;

public class OrderController extends SuperClass{

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		super.doPost(request, response);
		
		System.out.println("오더컨트롤러 포스트 호출");
		
		
		
		System.out.println(request.getParameter("MBRNM"));
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		System.out.println("오더컨트롤러 겟또 호출");
	}
	
}
