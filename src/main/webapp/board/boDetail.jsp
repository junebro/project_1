<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.tableWrap th{
		height: 50px;
		font-size: 25px;
		background-color: #191970; 
	}
	.tableWrap{
		/* border: 1px solid red; */
		text-align: center;
	}
	.tcontents{
		margin: 0 auto;
		width: 1000px;
		border-collapse: collapse;
		
	}
	.tcontents thead{
		background-color: black;
		color: white;
	}
	.tcontents tr{
		border-bottom: 1px solid darkgray;
		height: 20px;
		border: 1px solid black;
	}
	.tcontents tr:nth-child(even){
		background-color: #dcdcdc;
	}
	.tcontents tr td:nth-child(1){
		font-weight: bolder;
		width: 100px;
		font-size: 20px;
		border: 1px solid black;
	}
	.tcontents tr td:nth-child(2){
		width: 900px;
		border: 1px solid black;
	}
	/*
	.tcontents tbody tr:hover{
		background-color: #c0c0c0;
		cursor: pointer
	}
	*/
	.tdwrap{
		display: inline-block;
		height: 30px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
</style>
</head>
<body>
		
	<div class="tableWrap">
 		 <table class="tcontents">
  		  <thead class="table-dark">
    		  <tr>
					<th colspan="2">게시물 상세 내용</th>
	          </tr>
    	</thead>
	    <tbody>
	    	  <tr>
					<td>글번호</td><td>${requestScope.abc.no}</td>
			  </tr>
			  <tr>
					<td>작성자</td><td>${requestScope.abc.id}</td>
			  </tr>
			  <tr>
					<td>글제목</td><td>${requestScope.abc.subject}</td>
			  </tr>
			  <tr>
					<td>글내용</td><td>${requestScope.abc.contents}</td>
			  </tr>
			  <tr>
					<td>조회수</td><td>${requestScope.abc.readhit}</td>
			  </tr>
			  <tr>
					<td>작성일</td><td>${requestScope.abc.regdate}</td>
			  </tr>

	    </tbody>
  		</table>
	</div>
</body>
</html>