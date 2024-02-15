package com.shopping.cart;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Cart;
import com.shopping.model.bean.Product;
import com.shopping.model.bean.Product_main;
import com.shopping.model.dao.CartDao;
import com.shopping.model.dao.ProductDao;

public class CartController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doGet(request, response);

		// 넘겨받은 장바구니 데이터를 변수에 저장
		String PROCD = request.getParameter("PROCD");
		//String PROSZ = request.getParameter("PROSZ");
		//String QTY = request.getParameter("QTY");
		int PROSZ = 250;
		int QTY = 1;
		// 세션 아이디 정보를 변수에 저장
		String MBRID = super.loginfo.getMBRID();
		CartDao cDao = new CartDao();
		Cart cBean = new Cart();
		Product pBean = new Product();
		ProductDao pDao = new ProductDao();

		System.out.println(PROCD);
		System.out.println(PROSZ);
		System.out.println(QTY);
		
		cBean.setMBRID(MBRID);
		cBean.setPROCD(PROCD);
		cBean.setQTY(QTY);
		cBean.setPROSZ(PROSZ);

		// bean에 장바구니 데이터 저장

		//cDao.insertData(cBean);
		// Dao의 insertData를 통해 DB에 장바구니 정보를 저장
		
		List<Cart> be = cDao.getDataList(MBRID);
		System.out.println("장바구니 데이터 행 개수 :"+be.size());
		
		super.gotoPage("Member/MyCart.jsp");
		
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);
	}

}
