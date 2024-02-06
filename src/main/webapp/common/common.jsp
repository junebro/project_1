<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
// appName : 애플리케이션 컨텍스트 이름(프로젝트 이름)
String appName = request.getContextPath();
String mappingName = "/Shopping"; // in FrontController.java file

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

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- SELECT 별모양 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>


<!-- 상단 폰트 -->
<!--  font-family: 'Kanit', sans-serif;  -->
<link
	href="https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap"
	rel="stylesheet">

<!--  헤더 / 탭 메뉴 / 배너,썸네일 등 소개 문구 / 상품소개 타이틀 문구 -->
<!-- font-family: 'Noto Sans KR', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<!-- 상품 상세 페이지 -->
<!-- font-family: 'Noto Sans KR', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap"
	rel="stylesheet">

<!-- 이용약관, 개인정보처리방침, 개인정보 수집 이용동의 박스 -->
<!-- font-family: 'Gothic A1', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@200&display=swap"
	rel="stylesheet">

<!-- 버튼 폰트 -->
<!-- font-family: 'Black Han Sans', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">



<meta charset="UTF-8">
<style>

/* 버튼 */
button {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1em;
	cursor: pointer;
	border-width: thin;
}

.btn_white {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 5px 10px;
	background-color: #FFFFFF;
	color: #000000;
}

.btn_black {
	font-family: 'Noto Sans KR', sans-serif;
	padding: 5px 10px;
	background-color: #000000;
	color: #ffffff;
}

/* 회색선 */
.underline {
	border-bottom: 1px solid rgba(128, 128, 128, 0.5); /* 투명도를 포함한 회색 선 */
	margin-bottom: 10px; /* 선 위의 간격 조절 */
	margin-top: 10px; /* 선 위의 간격 조절 */
}

/* select box */
.selectbox {
	display: inline-block;
	position: relative;
	width: 150px;
	border: 1px solid rgba(128, 128, 128, 0.3);
	z-index: 1;
	text-align: right;
}

.selectbox:before {
	content: "";
	position: absolute;
	top: 50%;
	right: 15px;
	width: 0;
	height: 0;
	margin-top: -1px;
	border-left: 5px solid transparent;
	border-right: 5px solid transparent;
	border-top: 5px solid #333;
}

.selectbox label {
	position: absolute;
	top: 1px;
	left: 5px;
	padding: .6em .5em;
	color: #999;
	z-index: -1;
}

.selectbox select {
	width: 100%;
	height: auto;
	line-height: normal;
	font-family: inherit;
	padding: .6em .5em;
	border: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

/* select box 별모양*/
.sel_color {
	width: 100px;
	border-radius: 4%;
	border: 1px solid rgba(128, 128, 128, 0.3);
}

.sel_color label {
	font-family: "Font Awesome 5 Free";
	padding: .5em .5em;
	font-weight: 900;
	color: #000000;
}

.all_star {
	width: 280px;
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
}

.all_star option {
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
}

.selectbox_star {
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
	width: 170px;
	height: 43px;
	padding-top: 3px;
}
</style>
<title>Insert title here</title>
<!-- jQuery section -->
<!-- bootstrap은 jquery를 기반으로 구동이 되므로 반드시 jquery 선언이 먼저 되어야 합니다. -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<!-- bootstrap section -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>

</body>
</html>