<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.model.dao.OrderDao"%>
<%@page import="com.shopping.model.bean.Order"%>
<%@page import="com.shopping.model.dao.MemberDao"%>
<%@page import="com.shopping.model.bean.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="justify-content-center row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<table class="Myt">
				<tbody>
					<tr>
						<td class="Myp1" style="text-align: center;">
							<div
								style="width: 30%; float: none; display: inline-block; text-align: center;">
								<img style="height: 50px; width: 50px;"
									src="https://cdn-icons-png.flaticon.com/128/4203/4203951.png">
							</div>
							<div
								style="width: 70%; float: none; display: inline-block; text-align: center; margin-top: 30px;">
								안녕하세요. ${sessionScope.loginfo.MBRNM}님!<br> 고객님의 회원등급은 일반회원 입니다.
							</div>
						</td>
					</tr>
					<tr>
						<td class="Myp" style="text-align: center;">
							<div
								style="width: 30%; float: none; display: inline-block; text-align: center; margin-top: 30px;">
								<img style="height: 50px; width: 50px;"
									src="https://cdn-icons-png.flaticon.com/128/65/65998.png">
							</div>
							<% 
								Order bean=new Order();
								OrderDao dao = new OrderDao();
								List<Order> orderList=new ArrayList<Order>();
								String MBRID = session.getAttribute("loginfo").toString();
								orderList=dao.getDataList(MBRID);
								MemberDao mdao=new MemberDao();
								Member mbean=new Member();
								mbean= mdao.getDataBean(MBRID);
							%>
							<div
								style="width: 70%; float: none; display: inline-block; text-align: center; margin-top: 30px;">
								<%=orderList.size()+"회"%><br> 총 주문
							</div>
						</td>
					</tr>
					<tr>
						<td class="Myp2" style="text-align: center;">
							<div
								style="width: 30%; float: none; display: inline-block; text-align: center; margin-top: 30px;">
								<img style="height: 50px; width: 50px;"
									src="https://my.gatten.co.kr/assets/theme/point/images/intro-01.png">
							</div>
							<div
								style="width: 70%; float: none; display: inline-block; text-align: center; margin-top: 30px;">
								<%=mbean.getMBRPT() %><br> 적립 포인트
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>
</html>