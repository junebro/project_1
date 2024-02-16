<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 수정</title>
<script type="text/javascript">
	$(document).ready(function() {

	});
	
	function validCheck(){/* 폼 유효성 검사 */
		var password = $('#password').val();
		if(password == ${bean.contents}){
			if(password.length < 3 || password.length > 20){
				alert('비밀 번호는 3글자 이상 20글자 이하이어야 합니다.');
				$('#password').focus() ;
				return false ;
			}
			else {
				alert('비밀번호가 일치 하지 않습니다.');
				return false ;
			}
		}	
		
		var subject = $('#subject').val();
		if(subject.length < 3 || subject.length > 20){
			alert('글 제목은 3글자 이상 20글자 이하이어야 합니다.');
			$('#subject').focus() ;
			return false ;
		}
		
		var contents = $('#contents').val();
		if(contents.length < 5 || contents.length > 85){
			alert('글 내용은 5글자 이상 85글자 이하이어야 합니다.');
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
	
	/*
	.tcontents input{
		border: none;
		width: 900px;
	}
	*/
	.inputcontrol {
		width: 800px;
		
	
	}
	.textcontrol {
		height: 100px;
		width: 800px;
		border: none;
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

</style>
</head>
<body>
		
	<div class="tableWrap">
		<form action="<%=withFormTag%>" method="post">
			<input type="hidden" name="command" value="boUpdate"> 
			<input type="hidden" name="pageNumber" value="<%=request.getParameter("pageNumber")%>">
			<input type="hidden" name="pageSize" value="<%=request.getParameter("pageSize")%>">
			<input type="hidden" name="mode" value="<%=request.getParameter("mode")%>">
			<input type="hidden" name="keyword" value="<%=request.getParameter("keyword")%>">
 		 <table class="tcontents">
  		  <thead>
    		  <tr>
					<th colspan="2">게시물 수정</th>
	          </tr>
	      

    	</thead>
	    <tbody>
	    	  <tr>
					<td>글번호</td>
					<td>
						<input class="inputcontrol" type="text" id="fakeno" name="fakeno" value="${bean.no}" disabled="disabled">
						<input class="inputcontrol" type="hidden" id="no" name="no" value="${bean.no}">
					</td>
			  </tr>
			  <tr>
					<td>작성자</td>
					<td>
						<input class="inputcontrol" type="text" id="fakeid" name="fakeid" value="${bean.id}" disabled="disabled">
						<input class="inputcontrol" type="hidden" id="id" name="id" value="${bean.id}">
					</td>
			  </tr>
			  <tr>
					<td>비밀번호</td>
					<td>
						<input class="inputcontrol" type="password" id="password" name="password">
					</td>
			  </tr>
			  <tr>
					<td>글제목</td>
					<td>
						<textarea class="textcontrol" id="subject" name="subject">${bean.subject}</textarea>
					</td>
			  </tr>
			  <tr>
					<td>글내용</td>
					<td>
						<textarea class="textcontrol" id="contents" name="contents">${bean.contents}</textarea>
						<span>${bean.password}</span>
					</td>
			  </tr>
			  <tr>
					<td colspan="2">
					<button type="submit" onclick="return validCheck();">수정</button>
					<%-- ${request.getAttribute(pwdata)} --%>
					
					</td>
			  </tr>

	    </tbody>
  		</table>
  		</form>
	</div>
</body>
</html>