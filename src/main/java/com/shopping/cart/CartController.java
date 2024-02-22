package com.shopping.cart;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Cart;
import com.shopping.model.dao.CartDao;

public class CartController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doGet(request, response);
		String MBRID = super.loginfo.getMBRID();
		CartDao cDao = new CartDao();
		Cart cBean = new Cart();

		
		String submitParam = request.getParameter("submit");
        String[] submitArray = submitParam.split(",");
        
         for (String data : submitArray) {
            String[] values = data.split("/");

            String PROCD = values[1];
    		String PROSZ = values[2];
    		String QTY = values[3];
            
            cBean.setMBRID(MBRID);
    		cBean.setPROCD(PROCD);
    		cBean.setQTY(Integer.parseInt(QTY));
    		cBean.setPROSZ(Integer.parseInt(PROSZ));
    		
    		cDao.insertData(cBean);
            
        }
			List<Cart> be = cDao.getDataList(MBRID);
		
		super.gotoPage("Member/MyCart.jsp");
		
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);
	}

}
