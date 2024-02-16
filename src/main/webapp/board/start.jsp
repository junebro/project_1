<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){
	    $("#Start").trigger('click'); 
	});
</script>
</head>
<body >
	<form action="<%=withFormTag%>" id="submitForm" method="get">
		<input type="hidden" name="command" value="boList">
		<input type="hidden" name="pageNumber" value="1">
		<input type="hidden" name="pageSize" value="10">
		<input type="submit" id="Start" value="Loading.....">
	</form>
</body>	
</html>