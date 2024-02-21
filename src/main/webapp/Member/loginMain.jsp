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
	margin-top: 70px;
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
	margin-top: 30px;
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
</style>
</head>

<script>
	var message = "${requestScope.Message}";
	if (message != "") {
		alert(message);
	}
	$(function() {

		fnInit();

	});

	function frm_check() {
		saveid();
	}

	function fnInit() {
		var cookieid = getCookie("remember-check");
		console.log(cookieid);
		if (cookieid != "") {
			$("input:checkbox[id='remember-check']").prop("checked", true);
			$('#MBRID').val(cookieid);
		}

	}

	function setCookie(name, value, expiredays) {
		var todayDate = new Date();
		todayDate.setTime(todayDate.getTime() + 0);
		if (todayDate > expiredays) {
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ expiredays + ";";
		} else if (todayDate < expiredays) {
			todayDate.setDate(todayDate.getDate() + expiredays);
			document.cookie = name + "=" + escape(value) + "; path=/; expires="
					+ todayDate.toGMTString() + ";";
		}

		console.log(document.cookie);
	}

	function getCookie(Name) {
		var search = Name + "=";
		console.log("search : " + search);

		if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
			offset = document.cookie.indexOf(search);
			console.log("offset : " + offset);
			if (offset != -1) { // 쿠키가 존재하면 
				offset += search.length;
				// set index of beginning of value
				end = document.cookie.indexOf(";", offset);
				console.log("end : " + end);
				// 쿠키 값의 마지막 위치 인덱스 번호 설정 
				if (end == -1)
					end = document.cookie.length;
				console.log("end위치  : " + end);

				return unescape(document.cookie.substring(offset, end));
			}
		}
		return "";
	}

	function saveid() {
		var expdate = new Date();
		if ($("#remember-check").is(":checked")) {
			expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
			setCookie("remember-check", $("#MBRID").val(), expdate);
		} else {
			expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
			setCookie("remember-check", $("#MBRID").val(), expdate);

		}
	}
	function findidpw(){
		alert('준비중입니다...');
	}
</script>

<body>
	<header>
		<jsp:include page="./../MainPage/top.jsp" />
	</header>
	<div class="login-wrapper">
		<h2>LOG IN</h2>
		<form method="post" action="<%=withFormTag%>" id="login-form"
			onsubmit="return frm_check();">
			<input type="hidden" name="command" value="meLogin">
			<input type="text" name="MBRID" placeholder="아이디" id="MBRID">
			<input type="password" name="MBRPW" placeholder="비밀번호">
				<label for="remember-check">
				<input type="checkbox" id="remember-check">아이디 저장하기
				<a style="cursor:pointer" onclick="findidpw();" class="alink">아이디/비밀번호 찾기</a>
			</label>
			<input type="submit" value="로그인" class="login-default" id="submitbt">
		</form>
	</div>
</body>
</html>