package com.shopping.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Cart;
import com.shopping.model.dao.CartDao;

public class CartDeleteController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		Cart bean = new Cart();
		CartDao cDao = new CartDao();
		
		String MBRID = super.loginfo.getMBRID();
		String PROCD = request.getParameter("PROCD");
		int PROSZ = Integer.parseInt(request.getParameter("PROSZ"));

		cDao.deleteData(MBRID, PROCD, PROSZ);
	
		super.gotoPage("Member/MyCart.jsp");
		
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
	}
	
}
