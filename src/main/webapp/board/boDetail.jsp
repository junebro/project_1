<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		
	<div class="container mt-3">
  		<h2>게시물 상세 내용</h2>
  		<p></p>
 		 <table class="table">
  		  <thead class="table-dark">
    		  <tr>
					<th>글번호</th>
					<th>작성자</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>조회수</th>
					<th>작성 일자</th>
					<th>수정</th>
		   	 </tr>
    	</thead>
	    <tbody>
	      <tr>
				<td>${requestScope.abc.no}</td>
				<td>${requestScope.abc.id}</td>
				<td>${requestScope.abc.subject}</td>
				<td>${requestScope.abc.contents}</td>
				<td>${requestScope.abc.readhit}</td>
				<td>${requestScope.abc.regdate}</td>
				<td>${requestScope.abc.remark}</td>
		  </tr>
	    </tbody>
  		</table>
	</div>
</body>
</html>