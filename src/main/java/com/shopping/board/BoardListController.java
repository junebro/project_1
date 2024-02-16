package com.shopping.board; 

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.model.bean.Board;
import com.shopping.common.SuperClass;
import com.shopping.model.dao.BoardDao;
import com.shopping.utility.Paging;

public class BoardListController extends SuperClass{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.doGet(request, response);
		
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
				
		BoardDao dao = new BoardDao();
		
		
		int totalCount = dao.getTotalRecordCount("boards", mode, keyword);
		String url = super.getUrlInfomation("boList") ;
		boolean isGrid = false ;
		
		System.out.println("1pageNumber: " +pageNumber);
		System.out.println("2pageSize: " +pageSize);
		System.out.println("3totalCount: " +totalCount);
		System.out.println("4url: " +url);
		System.out.println("5mode: " +mode);
		System.out.println("6keyword: " +keyword);
		
		Paging paging = new Paging(pageNumber, pageSize, totalCount, url, mode, keyword, isGrid);
					
			
		List<Board> abc = dao.getDataList(paging);
		
		System.out.println("BeginRow" + paging.getBeginRow());
		System.out.println("EndRow" + paging.getEndRow());
		
		request.setAttribute("paging", paging);
		request.setAttribute("abc", abc);
		
		
		RequestDispatcher dispatcher = null ;
		try {
			dispatcher = request.getRequestDispatcher("/board/boList.jsp") ;
			dispatcher.forward(request, response) ;
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}