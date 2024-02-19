package com.shopping.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Grade;
import com.shopping.model.dao.ProductDetailDao;
import com.shopping.utility.reviews_Paging;

public class ProductReviewsController extends SuperClass{
	
	private final String PREFIX = "Product/DetailProduct/";
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
 
		super.doGet(request, response);
		
		
		
		super.gotoPage(PREFIX + "DetailProduct.jsp");
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doPost(request, response);
	
		String pronm = request.getParameter("pronm");
		String mbrid = request.getParameter("mbrid");

		ProductDetailDao dao = new ProductDetailDao();
		String isGrid = "pro";
		
		// 페이징 처리를 위한 파라미터 목록들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");

		String sel_star = request.getParameter("sel_star");
		String sel_color = request.getParameter("sel_color");

		int totalCount = dao.getTotalReviewsCount("TRVW", sel_star, sel_color, pronm, mbrid, isGrid);	
		String url = super.getUrlInfomation("DetailProduct");

		reviews_Paging Paging = new reviews_Paging(pageNumber, pageSize, totalCount, url, sel_star, sel_color, isGrid);
		
		Map<String, Object> dataList = dao.getviewsList(pronm, sel_color, sel_star, Paging);

		request.setAttribute("paging", Paging);	// 페이징 객체도 바인딩
		request.setAttribute("dataList", dataList);

		super.gotoPage(PREFIX + "DetailReviews.jsp");
	}
}
