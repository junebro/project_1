package com.shopping.product;

import java.util.List;

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
		String mbrid = "aaa";
		
		ProductDetailDao dao = new ProductDetailDao();
		List<Product> dataList = dao.getDataList(pronm, mbrid);
		

		// 사이즈 조회
		Product firstData = dataList.get(0);
	    
	    int SSZ = firstData.getPROSSZ(); 
	    int ESZ = firstData.getPROESZ(); 
	    
	    ItemDao Idao = new ItemDao();
		
		List<Item> sizeList = Idao.getDataList(SSZ, ESZ);
		
		request.setAttribute("sizeList", sizeList);
		request.setAttribute("dataList", dataList);
		
		super.gotoPage(PREFIX + "DetailProduct.jsp");
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
	
}