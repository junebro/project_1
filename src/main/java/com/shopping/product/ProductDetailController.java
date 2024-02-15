package com.shopping.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Item;
import com.shopping.model.bean.Product;
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
		List<Product> dataList = dao.getDataList(pronm, mbrid);
		Map<String, Object> dataTest = dao.calculate(pronm, mbrid);
		
		//List<Map<String, Object>> resultSet1List = (List<Map<String, Object>>) dataTest.get("resultSet1");
		//for (Map<String, Object> rowMap : resultSet1List) {
		//    System.out.println("PROCD: " + rowMap.get("PROCD"));
		//}
		
		//Map<String, Object> resultSet1Map = (Map<String, Object>) dataTest.get("resultSet1");
		//System.out.println("Result of resultSet1: " + resultSet1Map);
		
		// 사이즈 조회
		Product firstData = dataList.get(0);
	    
	    int SSZ = firstData.getPROSSZ(); 
	    int ESZ = firstData.getPROESZ(); 
	    
	    ItemDao Idao = new ItemDao();
		
		List<Item> sizeList = Idao.getDataList(SSZ, ESZ);
		
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("dataList", dataList);
		request.setAttribute("dataTest", dataTest);
		
		super.gotoPage(PREFIX + "DetailProduct.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
	
}
