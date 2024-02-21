<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.shopping.model.dao.MyOrderDao"%>
<%@page import="com.shopping.model.bean.MyOrder"%>

<%
	MyOrder bean = new MyOrder();
	MyOrderDao dao = new MyOrderDao();
	String mbrid = (String)session.getAttribute("MBRID");
	List<MyOrder> dataList = dao.getDataList(mbrid);
%>
<c:set var="dataList" value="<%=dataList%>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
String appName = request.getContextPath();
String mappingName = "/Shopping_project";
String withFormTag = appName + mappingName;
String notWithFormTag = withFormTag + "?command=";
%> 
<title>Insert title here</title>
</head>
<body> 
<script>

/* 리뷰 쓰기 함수 */
$(document).ready(function() {
	$('.review_btn').click(function() {
		$('.popup').show();
	})
});
</script>
<div  id="mainDiv" >
				<p class="maino">나의 구매 내역</p>
				<br>
				<table style="width: 100%">
					<tbody>
						<tr class="underline">
							<th class="orderTh">주문 날짜</th>
							<th class="orderTh">상품 이미지</th>
							<th class="orderTh" style="width: 40%;">상품 상세</th>
							<th class="orderTh">옵션</th>
							<th class="orderTh">수량</th>
							<th class="orderTh">가격</th>
						</tr>
						<c:forEach var="order" items="${dataList}" varStatus="status">
							<tr class="underline">
								<td class="orderTd" id="ORDDT">${order.ORDDT}</td>
								<td class="orderTd">
									<img class="orderImg " style="cursor: pointer"
									src="${pageContext.request.contextPath}/Image/Detail_main/${order.PROIMG}"
									onclick="location.href='<%=notWithFormTag%>DetailProduct&pronm=${order.PRONM}&mbrid=${sessionScope.loginfo.MBRID}'">
								</td>
								<td class="orderTd">
									<div style="cursor: pointer; width: 40%; margin: 0 auto;"
										onclick="location.href='<%=notWithFormTag%>DetailProduct&pronm=${order.PRONM}&mbrid=${sessionScope.loginfo.MBRID}'">${order.PRONM}
									</div>
								</td>
								<td class="orderTd">${order.ORDSZ}, ${order.PROCR}</td>
								<td class="orderTd">${order.ORDQTY}</td>
								<td class="orderTd"><fmt:formatNumber value="${order.TOTPR}" pattern="###,###" /></td> </td>
								

							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="popup">
		<form method="post" action="#">
			<br>
			<h2>리뷰 작성하기</h2>
			<select class="all_star selectbox_star sel_color"
				style="margin-left: 7px;">
				<option selected="selected">&#xf005 &#xf005 &#xf005 &#xf005
					&#xf005</option>
				<option>&#xf005 &#xf005 &#xf005 &#xf005</option>
				<option>&#xf005 &#xf005 &#xf005</option>
				<option>&#xf005 &#xf005</option>
				<option>&#xf005</option>
			</select>
			<table class="table table-hover">
				<tbody>
					<tr>
						<td><textarea class="form-control" placeholder="리뷰 내용을 작성하세요"
								name="contentDetail" maxlength="270" style="height: 270px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div style="text-align: left; margin-left: 30px;">
				<button type="submit" class="btn_white">파일선택</button>
				<button type="submit" class="btn_white">파일선택</button>
				<button type="submit" class="btn_white">파일선택</button>
			</div>
			<hr>
			<div style="text-align: center">
				<button type="submit" class="btn_white" style="margin-right: 20px">올리기</button>
				<button type="reset" class="btn_black" style="margin-left: 20px">나가기</button>
			</div>
		</form>
	</div>
	<script>
		/* SELECT BOX */
		$(document).ready(function() {
			var selectTarget = $('.selectbox select');
			selectTarget.on('blur', function() {
				$(this).parent().removeClass('focus');
			});

			selectTarget.change(function() {
				var select_name = $(this).children('option:selected').text();
				$(this).siblings('label').text(select_name);
			});
		});
	</script>
</body>
</html>