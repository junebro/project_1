<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 답글</title>
<script type="text/javascript">
	$(document).ready(function() {

	});
	
	function validCheck(){/* 폼 유효성 검사 */
		var password = $('#password').val();
		if(password.length < 3 || password.length > 20){
			alert('비밀 번호는 3글자 이상 20글자 이하이어야 합니다.');
			$('#password').focus() ;
			return false ;
		}		
		
		var subject = $('#subject').val();
		if(subject.length < 3 || subject.length > 20){
			alert('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
			$('#subject').focus() ;
			return false ;
		}
		
		var contents = $('#contents').val();
		if(contents.length < 5 || contents.length > 30){
			alert('글 내용은 5글자 이상 30글자 이하이어야 합니다.');
			$('#contents').focus() ;
			return false ;
		}
		
		//var regdate = $('#regdate').val();
		
		//var regex = /^\d{4}[\/-][01]\d{1}[\/-][0123]\d{1}$/ ;
		//var result = regex.test(regdate) ;
		
		/*if(result == false){
			alert('날짜 형식은 반드시 yyyy/mm/dd 형식 또는 yyyy-mm-dd으로 작성해 주세요.');
			$('#regdate').focus() ;
			return false ;
		}*/
	}
</script>
<style>
	form {
		font-family: 'Kanit', sans-serif;
	}

	.replytop{
	text-align: center;
	}

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
		width: 600px;
		height: 30px;
		font-size: 20px;
	}
	
	body{
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<body>

	<div class="replytop">
		<jsp:include page="../MainPage/top.jsp" />
	</div>


	<div class="formwrap">
		<form action="<%=withFormTag%>" method="post"> 
			<input type="text" name="pageNumber" value="<%=request.getParameter("pageNumber")%>"> 
			<input type="text" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="text" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="text" name="keyword" value="<%=request.getParameter("keyword")%>">

			<input type="text" name="groupno" value="<%=request.getParameter("groupno")%>">
			<input type="text" name="orderno" value="<%=request.getParameter("orderno")%>">
			<input type="text" name="depth" value="<%=request.getParameter("depth")%>">	<br/>	
	   	<h2>답글 등록</h2>
	    <h5>게시판 답글</h5>
		 

			<input type="hidden" name="command" value="boReply">

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
			<textarea name="contents" cols="50" rows="7" autofocus required wrap="hard"></textarea><br/>
			</div><br/>
			<!-- <label for="submit"></label> -->
			<button type="submit" class="btn btn-dark" onclick="return validCheck();">답글 작성</button>
			&nbsp;&nbsp;&nbsp;
			<button type="reset" class="btn btn-dark" >초기화</button>
			<button class="btn btn-dark" onclick="history.go(-1)">목록으로</button>

		</form>
	</div>
		
</body>
</html>