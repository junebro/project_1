package com.shopping.order;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.MyOrder;
import com.shopping.model.dao.MyOrderDao;

public class MyOrderController extends SuperClass{

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doGet(request, response);
		
		String MBRID = super.loginfo.getMBRID();
		
		List<MyOrder> ldao = new MyOrderDao().getDataList(MBRID);
		
		System.out.println(super.loginfo);
		System.out.println("주문 데이터 행 개수 :" + ldao.size());
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
		
		System.out.println(" 사용자 정보 : " + super.loginfo.getMBRID());
	}
	
}
