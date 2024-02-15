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
	.formwrap label{
		text-align: center;
		width: 150px;	
		font-weight: bold;
		background-color: #191970;
		color: white;
		
	}
	
	.formwrap input{
		margin: 10px;
			
	}
	.formwrap{
		text-align: center;
		display: block;
		border: 1px solid black;
		widht:400px;
		padding: 50px;
	}
	
/* 	input {
		  width:200px;
		  height:100px;
		  font-size:12px;
	} */
 	.selinput {
		  width:500px;
		  height:30px;
		  font-size:12px;
	
	} 

	
</style>
</head>
<body>
			
	<div class="formwrap">
	  <h2>게시물 등록</h2>
	  <h5>상품 문의 게시물</h5>
	  		<form action="<%=withFormTag%>" method="post">			
			<input type="hidden" name="command" value="boInsert">
			
			<label for="id">아이디</label>
			<input class="selinput" type="text" id="id" name="id" ><br/>
			
			<label for="subject">제&nbsp;&nbsp;&nbsp;목</label>
			<input class="selinput" type="text" id="subject" name="subject" required><br/>
			
			<label for="contents">내&nbsp;&nbsp;&nbsp;용</label>
			<input class="selinput" type="text" id="contents" name="contents" required><br/>
			
			<!-- <label for="submit"></label> -->
			<button type="submit" id="submit" class="btn btn-dark">글쓰기</button>
		</form>
	</div>
		
</body>
</html>