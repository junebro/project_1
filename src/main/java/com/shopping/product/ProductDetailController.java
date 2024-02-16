package com.shopping.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Grade;
import com.shopping.model.bean.Item;
import com.shopping.model.dao.ItemDao;
import com.shopping.model.dao.ProductDetailDao;

public class ProductDetailController extends SuperClass{
	
	private final String PREFIX = "Product/DetailProduct/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		
		// 상품 조회
		String pronm = request.getParameter("pronm");
		String mbrid = request.getParameter("mbrid");
		
		ProductDetailDao dao = new ProductDetailDao();
		
		Map<String, Object> dataList = dao.calculate(pronm, mbrid);
		
		
		List<Grade> dataGrade = dao.getDataList(pronm);
		double Grade_total = dao.getTotal(pronm);
		
		System.out.println("Grade_total : " + Grade_total);
		
		List<Map<String, Object>> resultSetPro = (List<Map<String, Object>>) dataList.get("resultSetPro");
		Map<String, Object> firstRow = resultSetPro.get(0);
		
		//for (Map<String, Object> rowMap : resultSetPro) {
		//    System.out.println("PROCD: " + rowMap.get("PROCD"));
		//}
		
		// 사이즈 조회
	    int SSZ = (int)firstRow.get("PROSSZ"); 
	    int ESZ = (int)firstRow.get("PROESZ"); 
	    
	    ItemDao Idao = new ItemDao();
		
		List<Item> sizeList = Idao.getDataList(SSZ, ESZ);
		
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("dataList", dataList);
		request.setAttribute("dataGrade", dataGrade);
		request.setAttribute("Grade_total", Grade_total);
		
		super.gotoPage(PREFIX + "DetailProduct.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
	
}
