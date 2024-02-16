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
		String MBRID = super.loginfo.getMBRID();
		CartDao cDao = new CartDao();
		Cart cBean = new Cart();
		Product pBean = new Product();
		ProductDao pDao = new ProductDao();

		
		String submitParam = request.getParameter("submit");
        String[] submitArray = submitParam.split(",");
        
         for (String data : submitArray) {
            String[] values = data.split("/");

            String PROCD = values[1];
    		String PROSZ = values[2];
    		String QTY = values[3];
            
            
            System.out.println(values[0]);
            System.out.println(values[1]);
            System.out.println(values[2]);
            System.out.println(values[3]);
            
            cBean.setMBRID(MBRID);
    		cBean.setPROCD(PROCD);
    		cBean.setQTY(Integer.parseInt(QTY));
    		cBean.setPROSZ(Integer.parseInt(PROSZ));
    		
    		cDao.insertData(cBean);
            
        }
			List<Cart> be = cDao.getDataList(MBRID);
		System.out.println("장바구니 데이터 행 개수 :" + be.size());
		
		super.gotoPage("Member/MyCart.jsp");
		
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);
	}

}
