<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPage</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script type="text/javascript">
	/* 리뷰보기, 주문보기 제어 함수 */
	function toggleDiv() {
		var mainDiv = document.getElementById("mainDiv");
		var otherDiv = document.getElementById("otherDiv");
		var otherDiv2 = document.getElementById("otherDiv2");

		if (mainDiv.style.display !== "none") {
			mainDiv.style.display = "none";
			otherDiv.style.display = "block";
		} else {
			mainDiv.style.display = "block";
			otherDiv.style.display = "none";
		}
	}

	function toggleOrder() {
		var mainDiv = document.getElementById("mainDiv");
		var otherDiv = document.getElementById("otherDiv");
		var otherDiv2 = document.getElementById("otherDiv2");

		mainDiv.style.display = "block";
		otherDiv.style.display = "none";
		otherDiv2.style.display = "none";

	}
	function toggleReview(url) {

		$.ajax({
			url: url,
			type: 'GET',
			success: function(response) {
				$('#otherDiv').html(response); // 가져온 내용을 div에 삽입
			}
		});
		
		/*
		var mainDiv = document.getElementById("mainDiv");
		var otherDiv = document.getElementById("otherDiv");
		var otherDiv2 = document.getElementById("otherDiv2");

		mainDiv.style.display = "none";
		otherDiv.style.display = "block";
		otherDiv2.style.display = "none";
		*/

	}
	function toggleMyinfo() {
		var mainDiv = document.getElementById("mainDiv");
		var otherDiv = document.getElementById("otherDiv");
		var otherDiv2 = document.getElementById("otherDiv2");

		mainDiv.style.display = "none";
		otherDiv.style.display = "none";
		otherDiv2.style.display = "block";

	}
	
</script>
<style type="text/css">
body {
	font-family: 'Noto Sans KR', sans-serif;
}

h1 {
	text-align: center;
}

.underline {
	border-bottom: 1px solid rgba(128, 128, 128, 0.5);
	margin-top: 10px;
}

.orderTh { /* 주문내역 테이블 스타일 */
	width: 10%;
	height: 15px;
	text-align: center;
	font-size: 14px;
}

.orderTd { /* 주문내역 테이블 스타일 */
	width: 10%;
	height: 150px;
	text-align: center;
}

.orderImg { /* 주문 내역 사진의 스타일*/
	width: 150px;
	height: 150px;
	padding: 5px;
}

.Myt {
	width: 80%;
	margin-top: 70px;
	height: 100px;
}

.Myp {
	text-align: center;
	width: 20%;
}

.Myp1 {
	text-align: center;
	width: 50%;
}

.row {
	margin-top: 50px;
	justify-content: center;
}

.bar {
	width: 20%;
}

.Main {
	width: 80%;
}

.spanbar {
	margin-top: 30px;
	font-weight: bolder;
	font-size: 20px;
}

a {
	text-decoration: none;
	color: black;
}

.maino {
	margin-top: 30px;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
}

.mainicon {
	width: 30px;
	height: 30px;
	margin-left: 60px;
}

.maintd {
	width: 20%;
	font-size: 20px;
	font-weight: bold;
}

.sideBar {
	position: fixed;
	left: 40px; /* 왼쪽 여백 */
	top: 50%;
	transform: translateY(-50%);
}
/* 팝업 css 설정 */
.popup {
	display: none; /*hide setting*/
	position: fixed;
	left: 50%;
	top: 50%;
	width: 50%; /*가로길이 설정은 여기서*/
	margin-left: -25%; /*width의 반만큼 음수로*/
	height: 550px; /*세로길이 설정은 여기서*/
	margin-top: -250px; /*height의 반만큼 음수로*/
	z-index: 1000;
	/*style*/
	background: white;
	border: 1px solid #d1d8dd;
	box-shadow: 0 0 6px 1px rgb(0 0 0/ 30%);
}

/* css 전부 common에 있음 */
.selectbox {
	display: inline-block;
	position: relative;
	width: 80px;
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

.selectbox_star {
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
	width: 170px;
	height: 43px;
	padding-top: 3px;
}

.all_star {
	width: 150px;
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
}

.all_star option {
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
}
</style>
<style>
.titleArea { /* 기본정보, 추가정보 */
	margin: auto;
}

.titleArea h3 { /* 기본정보 */
	text-align: left;
	margin-top: 30px;
}

.titleArea li { /* 필수입력사항 */
	text-align: right;
	color: #A6A6A6;
}

.required::marker { /* 리스트 마커 색상 설정 */
	color: red;
}

#otherDiv2 table {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	border-left: none;
	border-right: none;
	border-top: 1px solid rgba(128, 128, 128, 0.5);
}

#otherDiv2 tr { /* 행 */
	border-bottom: 1px solid rgba(128, 128, 128, 0.5); /* 투명도를 포함한 회색 선 */
	margin-top: 10px; /* 선 위의 간격 조절 */
}

#otherDiv2 th { /* 1열 */
	padding: 15px;
	margin: auto;
	background-color: #F6F6F6;
	width: 200px;
	text-align: left;
}

#otherDiv2 td { /* 2열 */
	text-align: left;
	padding: 15px;
	margin: auto;
}

#otherDiv2 table li, .txtInfo { /* 1열, 아이디/비번 부가설명 */
	color: #5D5D5D;
}

table .notrequired { /* 추가정보 1열 */
	text-align: left;
	list-style: none;
}

table .inputTypeText { /* 2열 입력칸 */
	border: 1px groove #BDBDBD;
	width: 400px;
	padding: 10px;
}

#mobile1, #mobile2, #mobile3, #email2 { /* 휴대전화 입력칸 */
	border: 1px groove #BDBDBD;
	width: 30%;
	height: 40px;
}

.ec-address li { /* 주소칸 */
	list-style: none;
	margin-left: -30px;
	margin-top: 5px;
}

#sample6_postcode, #sample6_address, #sample6_extraAddress {
	/* 주소 입력칸 */
	background-color: #F6F6F6;
	border: 1px solid #BDBDBD;
}

#postBtn { /* 주소검색 버튼 */
	width: 87px;
	height: 43px;
}

#sample6_address { /* 기본주소 칸 */
	width: 500px;
}

#sample6_detailAddress, #sample6_extraAddress { /* 나머지주소, 참고항목 */
	width: 248px;
	display: inline;
}

#email1 {
	width: 50%;
}

button {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1em;
	cursor: pointer;
	border-width: thin;
	border: 1px groove #BDBDBD;
}

.btnBasic {
	margin-left: 10px;
}

.btn_white {
	padding: 20px 50px;
	background-color: #FFFFFF;
	color: #000000;
	border: 1px groove #BDBDBD;
	text-decoration: none;
}

.btn_black {
	padding: 20px 50px;
	background-color: #000000;
	color: #ffffff;
	border: 1px groove #BDBDBD;
	text-decoration: none;
}

.desc { /* (선택) */
	font-size: 15px;
	color: #BDBDBD;
}

#is_sex0, #is_sex1 { /* 성별 라디오 */
	margin-left: 10px;
}

.gBottom { /* 하단 버튼 */
	margin-top: 100px;
	margin-bottom: 100px;
	text-align: center;
}

.hide {
	display: none;
}

.success-message, .success-message2, .success-message3 {
	color: green;
}

.failure-message, .failure-message2, .failure-message3,
	.failure-message4, .failure-message5, .failure-message6,
	.failure-message7 {
	color: red;
}

.main-page {
	margin : 110px;
	padding-left: 120px;
}
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$('#birth').datepicker({
			dateFormat : "yy/mm/dd"
		});
		
		toggleReview('MyOrder.jsp')

	});


</script>
</head>
<body>
	<div class="justify-content-center row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<h1>마이 쇼핑'${message}'</h1>
			<table class="Myt">
				<tbody>
					<tr>
						<td class="Myp1" style="text-align: center;">
							<div
								style="width: 30%; float: none; display: inline-block; text-align: center;">
								<img style="height: 50px; width: 50px; margin-left: 40px;"
									src="https://cdn-icons-png.flaticon.com/128/4203/4203951.png">
							</div>
							<div
								style="width: 70%; float: none; display: inline-block; text-align: center; font-size: 16px; margin-top: 20px;">
								안녕하세요. 고객이름 님!<br> 고객님의 회원등급은 일반회원 입니다.
							</div>
						</td>
						<td class="Myp" style="text-align: center;">
							<div
								style="width: 30%; float: none; display: inline-block; text-align: center;">
								<img style="height: 50px; width: 50px;"
									src="https://cdn-icons-png.flaticon.com/128/65/65998.png">
							</div>
							<div
								style="width: 70%; float: none; display: inline-block; text-align: center; margin-top: 20px;">
								0회<br> 총 주문
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-sm-2"></div>
	</div>
	<div class="justify-content-center row">
		<div class="col-sm-1"></div>
		<div class="col-sm-10 justify-content-center d-flex">
			<div class="bar col-sm-1 sideBar">
				<div class="spanbar" onclick="toggleReview('Myreview.jsp')">
					<a href="#">리뷰 보기</a>
				</div>
				<%-- <div class="spanbar" onclick="toggleOrder()"> --%>
				<div class="spanbar" onclick="toggleReview('MyOrder.jsp')">
					<a href="#">주문 보기</a>
				</div>
				<div class="spanbar">
					<a href="./../Member/MyCart.jsp">장바구니</a>
				</div>
				<div class="spanbar">
					<a href="#">활동 정보</a>
				</div>
				<br> <a href="./../Product/DetailProduct/DetailProduct.jsp">최근
					본 상품</a><br> <br> <a
					href="./../Product/DetailProduct/DetailProduct.jsp">좋아요한상품</a><br>
				<br> <a href="#">나의게시글</a><br>
				<%-- <div class="spanbar" onclick="toggleMyinfo()">--%>
				<div class="spanbar" onclick="toggleReview('MyUpdate.jsp')">
					<a href="#">내 정보</a>
				</div>
				
				<br> <a href="#">회원정보수정</a><br> <a href="#">로그아웃</a><br>
			</div>	
		</div>
	</div>
	
	<div class="col-sm-1"></div>
	
	<div class="main-page"  id="otherDiv"></div>

	
	
	
</body>
</html>