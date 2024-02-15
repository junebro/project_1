package com.shopping.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Cart;
import com.shopping.model.dao.CartDao;

public class CartController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// 넘겨받은 장바구니 데이터를 변수에 저장
		String PROCD = request.getParameter("PROCD");
		String PROSZ = request.getParameter("PROSZ");
		String QTY = request.getParameter("QTY");
		// 세션 아이디 정보를 변수에 저장
		String MBRID = super.loginfo.getMBRID();
		CartDao cDao = new CartDao();
		Cart cBean = new Cart();
		
		System.out.println(PROCD);
		System.out.println(PROSZ);
		System.out.println(QTY);
		
		cBean.setMBRID(MBRID);
		cBean.setPROCD(PROCD);
		cBean.setQTY(Integer.parseInt(QTY));
		cBean.setPROSZ(Integer.parseInt(PROSZ));

		// bean에 장바구니 데이터 저장

		cDao.insertData(cBean);

		
		// Dao의 insertData를 통해 DB에 장바구니 정보를 저장

		super.doGet(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);
	}

}
