<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.shopping.model.bean.Product"%>
<%@page import="com.shopping.model.dao.MyLikeDao"%>
<%@page import="com.shopping.model.bean.MyLike"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	MyLike bean = new MyLike();
	MyLikeDao dao = new MyLikeDao();
	String mbrid = (String)session.getAttribute("MBRID");
	List<MyLike> dataList = dao.getDataList(mbrid);
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
<script>
	// 클라이언트 측 JavaScript
	function deleteLike(pronm) {

		var mbrid = "${sessionScope.loginfo.MBRID}";
		
		var URL = '<%=notWithFormTag%>myLiDelete';
		
		$.ajax({
	        type: 'GET',
	        url: URL,
	        data: { pronm: pronm, mbrid: mbrid },
	        error: function(xhr, status, error) {
	            console.error(error);
	        }
	    });
				
		var buttonId = "btn_" + pronm;
        var button = document.getElementById(buttonId);
        var row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
	}
</script>
</head>
<body>
	<div id="mainDiv" >
		<p class="maino">나의 찜 내역</p>
		<br>
		<table style="width: 100%">
			<tbody>
				<tr class="underline">
					<th class="orderTh">찜한 날짜</th>
					<th class="orderTh">상품 이미지</th>
					<th class="orderTh" style="width: 40%;">상품명</th>
					<th class="orderTh">가격</th>
					<th class="orderTh">삭제</th>
				</tr>
				<c:forEach var="like" items="${dataList}" varStatus="status">
					<tr class="underline" >
						<td class="orderTd">${like.LKEDT}</td>
						<td class="orderTd">
							<img class="orderImg " style="cursor: pointer"
							src="${pageContext.request.contextPath}/Image/Detail_main/${like.PROIMG}"
							onclick="location.href='<%=notWithFormTag%>DetailProduct&pronm=${like.PRONM}&mbrid=${sessionScope.loginfo.MBRID}'"></td>
						<td class="orderTd" ><div style="cursor: pointer; width: 40%; margin: 0 auto;"
							onclick="location.href='<%=notWithFormTag%>DetailProduct&pronm=${like.PRONM}&mbrid=${sessionScope.loginfo.MBRID}'">${like.PRONM}</div></td>
						<td class="orderTd">${like.PROPR}</td>
						<td class="orderTd">
							<button class="review_btn" type="button" class="btn_white" id="btn_${like.PRONM}"
								style="font-size: 15px" onclick="deleteLike('${like.PRONM}')">X</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>