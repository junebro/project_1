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
import com.shopping.utility.reviews_Paging;


public class ProductDetailController extends SuperClass{
	
	private final String PREFIX = "Product/DetailProduct/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		super.doGet(request, response);
		
		String pronm = request.getParameter("pronm");
		String mbrid = request.getParameter("mbrid");

		ProductDetailDao dao = new ProductDetailDao();
		
		// 페이징 처리를 위한 파라미터 목록들
		String isGrid = "pro";
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");

		String sel_star = request.getParameter("sel_star"); 
		String sel_color = request.getParameter("sel_color");

		int totalCount = dao.getTotalReviewsCount("TRVW", sel_star, sel_color, pronm, mbrid, isGrid);	
		String url = super.getUrlInfomation("DetailProduct");

		reviews_Paging paging = new reviews_Paging(pageNumber, pageSize, totalCount, url, sel_star, sel_color, isGrid);

		Map<String, Object> dataList = dao.getTotalList(pronm, mbrid, paging);
		
		List<Grade> dataGrade = dao.getDataList(pronm);
		double Grade_total = dao.getTotal(pronm);
		
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
		request.setAttribute("paging", paging);	// 페이징 객체도 바인딩
		
		//super.gotoPage(PREFIX + "DetailProduct.jsp");
		new ProductReviewsController().doGet(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}
	
}
