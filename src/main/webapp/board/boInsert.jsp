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
		background-color: black;
		color: white;
		
	}
	
	.formwrap input{
		margin: 10px;
			
	}
	.formwrap{
		text-align: center;
		display: block;
		/* border: 1px solid black;*/
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
	.intop{
		text-align: center;
	}
	.textareadiv{
		display: inline-block;
		background-color: black;
		color: white;
		width: 70%;
		height: 30px;
		font-size: 20px;
	}
	
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	

	
</style>
</head>
<body>


	<div class="intop">
		<jsp:include page="../MainPage/top.jsp" />
	</div>
			
	<div class="formwrap">
	  <h2>게시물 등록</h2>
	  <h5>상품 문의 게시물</h5>
	  	<form action="<%=withFormTag%>" method="post">			
			<input type="hidden" name="command" value="boInsert">
			
			
			
			<c:if test="${not empty sessionScope.loginfo.MBRID}">
				<label for="id">아이디</label>
				<input class="selinput" type="text" id="id" name="id" value="${sessionScope.loginfo.MBRID}" readonly><br/>
			</c:if>
			 <c:if test="${empty sessionScope.loginfo.MBRID}">
				<label for="id">아이디</label>
				<input class="selinput" type="text" id="id" name="id" value="Guest" readonly><br/>
			</c:if>
					
			<label for="subject">제&nbsp;&nbsp;&nbsp;목</label>
			<input class="selinput" type="text" id="subject" name="subject" required><br/><br/>
			
			<div class="textareadiv">글&nbsp;내&nbsp;용<br/><br/>
			<textarea name="contents" cols="80" rows="7" autofocus required wrap="hard"></textarea><br/>
			</div><br/>
			<!-- <label for="submit"></label> -->
			<button type="submit" id="submit" class="btn btn-dark">글쓰기 저장</button>
			<button class="btn btn-dark" onclick="history.back()">목록으로</button>			 
		</form>
	</div>
		
</body>
</html>