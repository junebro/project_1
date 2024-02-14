<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
// appName : 애플리케이션 컨텍스트 이름(프로젝트 이름)
String appName = request.getContextPath();
String mappingName = "/Shopping_project"; // in FrontController.java file

// 폼 태그에서 사용할 전역 변수
String withFormTag = appName + mappingName;

// 폼 태그가 아닌 곳에서 사용할 전역 변수
String notWithFormTag = withFormTag + "?command=";

//out.print("컨텍스트 이름 : " + appName + "<br/>");
//out.print("mappingName : " + mappingName + "<br/>");
//out.print("withFormTag : " + withFormTag + "<br/>");
//out.print("notWithFormTag : " + notWithFormTag + "<br/>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>

/* 탑 메뉴의 위치 설정 */
.topmenu ul {
	display: flex;
	justify-content: right;
	margin-top: -5px;
	margin-right: 10px;
}

.topmenu li {
	list-style: none;
	float: left;
	margin-right: 5px;
}

/* 글자 스타일 지정 */
.topmenu a {
	font-size: 0.8em;
	text-decoration: none;
	color: rgba(128, 128, 128, 0.5);
}

.topmenu a:hover {
	font-weight: bold;
	color: rgb(23, 84, 176);
}

/* 하이퍼링크 표시되지 않게 설정 */
.topmenu a:visited {
	text-decoration: none;
}

.topmenu li:hover {
	font-weight: bold;
	color: rgb(23, 84, 176);
}

.topmenu a:link {
	color: rgb(0, 0, 0);
}
</style>
<script type="text/javascript">
	
</script>
<body>
	<nav class="topmenu">
		<ul>
			<li><a
				href="${pageContext.request.contextPath}/Member/MemberJoin.jsp">회원가입&nbsp;</a></li>
			<c:choose>
				<c:when test="${sessionScope.loginfo.MBRID != null}">
					<li><a href="<%=notWithFormTag%>meLogout">로그아웃&nbsp;</a></li>
				</c:when>
				<c:otherwise>
					<li><a
						href="${pageContext.request.contextPath}/Member/loginMain.jsp">로그인&nbsp;</a></li>
				</c:otherwise>
			</c:choose>
			<li><a
				href="${pageContext.request.contextPath}/Member/MyCart.jsp">장바구니&nbsp;</a></li>
			<li><a
				href="${pageContext.request.contextPath}/MyPage/MyPageM.jsp">주문조회&nbsp;</a></li>
			<li><a
				href="${pageContext.request.contextPath}/MyPage/MyPageM.jsp">최근본상품&nbsp;</a></li>
			<li><a
				href="${pageContext.request.contextPath}/MyPage/MyPageM.jsp">고객센터&nbsp;</a></li>
		</ul>
	</nav>
</body>
</html>