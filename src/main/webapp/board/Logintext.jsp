<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="<%=withFormTag%>" method="post">
	<input type="hidden" name="command" value="meLoginA">
	
	<input type="text" name="pageNumber" value="1">
	<input type="text" name="pageSize" value="10">
	<input type="text" name="MBRID" value="suho">
	<input type="text" name="MBRPW" value="123">
	<input type="submit" value="전송">
</form>




</body>
</html>