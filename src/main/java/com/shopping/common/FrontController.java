package com.shopping.common;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shopping.utility.MyUtility;
  
@WebServlet(urlPatterns = {"/Shopping_project", "/Member"},
	initParams = {
			@WebInitParam(name = "todolist", value ="/WEB-INF/todolist.txt")
	}
)
public class FrontController extends HttpServlet{

	private String todolist = null;	// 할일을 명시해둔 장부 파일
	private Map<String, SuperController> todolistMap = null;
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		ServletContext application = config.getServletContext();
		
		this.todolist = config.getInitParameter("todolist");
		
		//애플리케이션의 전체 경로를 매개 변수로 넘겨 줍니다.
		System.out.println("1111111111111111111");
		this.todolistMap = MyUtility.getTodolistMap(application.getRealPath(todolist));
		
		System.out.println("todolist Map size : " + todolistMap.size());
		System.out.println(todolistMap.toString());
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");	// 한글 깨짐 방지
		
		// command Parameter : 컨트롤러 분기를 위한 핵심 파라미터
		String command = request.getParameter("command");
		
		System.out.println("command is [" + command + "]");
		
		// controller는 해당 command에 상응하는 하위 컨트롤러 객체 입니다.
		SuperController contorller = this.todolistMap.get(command);
		System.out.println("1300000000000000000000000000000");
		if (contorller != null) {
			System.out.println("1400000000000000000000000000000");
			try {
				String method = request.getMethod().toLowerCase();
				System.out.println("1500000000000000000000000000000");
				if(method.equals("get")) {
					System.out.println("1600000000000000000000000000000");
					contorller.doGet(request, response);
					System.out.println(contorller.getClass() + " get 메소드 호출됨");
					
				} else {
					
					contorller.doPost(request, response);
					System.out.println(contorller.getClass() + " post 메소드 호출됨");
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			System.out.println("request command is not found");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doProcess(request, response);
	}
}
