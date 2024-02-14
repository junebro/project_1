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
	<p><%=appName%></p>
	<p><%=mappingName%></p>
	<form action="<%=withFormTag%>" method="get">
		목록:<input type="hidden" name="command" value="boList">
		페이지넘버:<input type="text" name="pageNumber" value="1">
		한줄행:<input type="text" name="pageSize" value="10">
		<input type="submit" value="전송">
	</form>
<!-- 
String appName = request.getContextPath();
String mappingName = "/Shopping_project"; // in FrontController.java file

// 폼 태그에서 사용할 전역 변수
String withFormTag = appName + mappingName;

// 폼 태그가 아닌 곳에서 사용할 전역 변수
String notWithFormTag = withFormTag + "?command=";

 -->

</body>	
</html>