package com.shopping.order;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.dao.OrderDao;

public class OrderController extends SuperClass {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub

		super.doPost(request, response);

		System.out.println(super.loginfo);
		System.out.println("오더컨트롤러 포스트 호출");

		OrderDao dao = new OrderDao();
		dao.insertData(super.loginfo.getMBRID());
		
	}

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		System.out.println(super.loginfo);
		System.out.println("오더컨트롤러 겟또 호출");

		OrderDao dao = new OrderDao();

		dao.insertData(super.loginfo.getMBRID());
		System.out.println(super.loginfo.getMBRID());
		
		
	}

}
