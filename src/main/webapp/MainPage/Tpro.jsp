<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.util.List" %>
<%@page import="com.shopping.model.bean.Tpro"%>
<%@page import="com.shopping.model.dao.TproDao"%>

<%@ include file="../common/common.jsp"%>



<%
	TproDao tdao = new TproDao();
	List<Tpro> dataList = tdao.getTproSelectList();
%>
<c:set var="dataList" value="<%=dataList%>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div class="container mt-3">
		<h2>게시물 목록</h2>
		<p>사용자들이 작성한 게시물 목록을 보여 주는 페이지입니다.</p>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>PROTP</th>
					<th>PROCD</th>
					<th>PRONM</th>
					<th>PROSSZ</th>
					<th>PROESZ</th>
					<th>PROCR</th>
					<th>PROPR</th>
					<th>PROIMG</th>
					<th>PROIMG1</th>
					<th>PROIMG2</th>
					<th>PROIMG3</th>
					<th>PROPNT</th>
					<th>PROCMN</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="bean" items="${dataList}" varStatus="status">
				<tr>
					<td>${bean.PROTP}</td>
					<td>${bean.PROCD}</td>
					<td>${bean.PRONM}</td>
					<td>${bean.PROSSZ}</td>
					<td>${bean.PROESZ}</td>
					<td>${bean.PROCR}</td>
					<td>${bean.PROPR}</td>
					<td>${bean.PROIMG}</td>
					<td>${bean.PROIMG1}</td>
					<td>${bean.PROIMG2}</td>
					<td>${bean.PROIMG3}</td>
					<td>${bean.PROPNT}</td>
					<td>${bean.PROCMN}</td>
				</tr>
			 </c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>



