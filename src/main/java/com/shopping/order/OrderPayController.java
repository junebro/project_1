package com.shopping.order;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Member;
import com.shopping.model.bean.Order;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.CartDao;
import com.shopping.model.dao.MemberDao;
import com.shopping.model.dao.OrderDao;

public class OrderPayController extends SuperClass {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doGet(request, response);
		// 세션 사용자 아이디
		String MBRID = super.loginfo.getMBRID();
		OrderDao oDao = new OrderDao();
		// 주문코드 생성 , 주문 날짜 생성하여 TORD 테이블에 인서트
		String submitParam = request.getParameter("submit1");
		String[] submitArray = submitParam.split(",");

		CartDao cDao = new CartDao();
		List<Product> pBean = new ArrayList<>();
		for (String data : submitArray) {
			String[] values = data.split("/");

			String PROCD = values[1];
			int ORDSZ = Integer.parseInt(values[2]);
			int ORDQTY = Integer.parseInt(values[3]);

			pBean = cDao.getDataList1(PROCD);
			int TOTPR = ORDQTY * pBean.get(0).getPROPR();
			int MBRPT =(int)(0.03*TOTPR); // 포인트 정보 업데이트 
			
			cDao.deleteData(MBRID, PROCD, ORDSZ);
			oDao.pointData(MBRPT, MBRID);
			oDao.insertData(MBRID, PROCD, ORDQTY, ORDSZ, TOTPR);
		}

		super.gotoPage("MainPage/index.jsp");

	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {

		super.doPost(request, response);
	}

}
