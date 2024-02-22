package com.shopping.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.common.SuperClass;
import com.shopping.model.bean.Product;
import com.shopping.model.dao.ProductDao;
import com.shopping.utility.Paging;

public class ProductListController extends SuperClass{
	private final String PREFIX = "product/" ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);

		// 페이징 처리를 위한 파라미터 목록들
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");		
		
		ProductDao dao = new ProductDao();
		
		int totalCount = dao.getTotalRecordCount("products", mode, keyword);
		String url = super.getUrlInformation("prList") ;
		boolean isGrid = true ;	
		
		Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
		
		
//		int beginRow = 1 ;
//		int endRow = 6 ;
		/*
		List<Product> dataList = dao.getDataList(paging);
		
		System.out.println("상품 목록 개수 : " + dataList.size());
		
		request.setAttribute("paging", paging);
		request.setAttribute("dataList", dataList); // 상품 목록 request 영역에 바인딩
		
		super.gotoPage(PREFIX + "prList.jsp");*/
	}
}
