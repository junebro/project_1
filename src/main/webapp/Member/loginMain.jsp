<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="Message" value="${requestScope.Message}" />

<title>Insert title here</title>
<style type="text/css">
* {
	border: none;
}

body {
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}

.login-wrapper {
	width: 400px;
	height: 350px;
	padding: 40px;
	box-sizing: border-box;
	margin: 0 auto;
}

.login-wrapper>h2 {
	font-family: 'Kanit', sans-serif;
	font-size: 50px;
	font-weight: bolder;
	color: #000000;
	margin-bottom: 30px;
	margin-top: 80px;
}

#login-form>input {
	width: 100%;
	height: 48px;
	padding: 0 10px;
	box-sizing: border-box;
	margin-bottom: 16px;
	border-radius: 6px;
	background-color: #F8F8F8;
}

#login-form>input::placeholder {
	color: #D2D2D2;
}

#login-form>.login-default {
	color: #fff;
	font-size: 16px;
	background-color: #000000;
	margin-top: 20px;
}
/*
#login-form>.login-kakao {
	color: #000000;
	font-size: 16px;
	background-color: #FEE500;
	margin-top: 20px;
}

#login-form>.login-naver {
	color: #fff;
	font-size: 16px;
	background-color: #1EC800;
	margin-top: 20px;
}

#login-form>.login-apple {
	color: #000000;
	font-size: 16px;
	background-color: #fff;
	margin-top: 20px;
	border: 1px solid black;
}
*/
#login-form>input[type="checkbox"] {
	display: none;
}

#login-form>label {
	color: #999999;
}

#login-form input[type="checkbox"]+label {
	cursor: pointer;
	padding-left: 26px;
	background-image: url("checkbox.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#login-form input[type="checkbox"]:checked+label {
	background-image: url("checkbox-active.png");
	background-repeat: no-repeat;
	background-size: contain;
}

#login-form .alink {
	color: #999999;
	margin-left: 70px;
	text-decoration-line: none;
}

#login-form .blink {
	color: #999999;
}

#login-form .nonMembers_txt {
	margin-top: 30px;
	font-size: 20px;
}

</style>
</head>

<script>

	var message = "${requestScope.Message}";
	if (message != "") {
		alert(message);
	}
</script>

<body>
	<jsp:include page="./../MainPage/top.jsp" />
	<div class="login-wrapper">
		<h2>LOG IN</h2>
		<form method="post" action="<%=withFormTag%>" id="login-form">
			<input type="hidden" name="command" value="meLogin">
			<input type="text" name="MBRID" placeholder="아이디">
			<input type="password" name="MBRPW" placeholder="비밀번호">
				<label for="remember-check">
					<input type="checkbox" id="remember-check">아이디 저장하기
					<a href="/customer/direct.FindID.action" class="alink">아이디/비밀번호 찾기</a>
				</label>
			<input type="submit" value="로그인" class="login-default" id="submitbt">
			<div class="nonMembers_txt">
				<a href="/noncustomer/findNonCustomerOrder.action" class="blink">비회원 주문조회</a>
			</div>
		</form>
	</div>
	

</body>
</html>