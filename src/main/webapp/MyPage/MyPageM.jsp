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
	function toggleReview() {
		var mainDiv = document.getElementById("mainDiv");
		var otherDiv = document.getElementById("otherDiv");
		var otherDiv2 = document.getElementById("otherDiv2");

		mainDiv.style.display = "none";
		otherDiv.style.display = "block";
		otherDiv2.style.display = "none";

	}
	function toggleMyinfo() {
		var mainDiv = document.getElementById("mainDiv");
		var otherDiv = document.getElementById("otherDiv");
		var otherDiv2 = document.getElementById("otherDiv2");

		mainDiv.style.display = "none";
		otherDiv.style.display = "none";
		otherDiv2.style.display = "block";

	}
	/* 리뷰 쓰기 함수 */
	$(document).ready(function() {
		$('.review_btn').click(function() {
			$('.popup').show();
		})
	});
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
</style>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$('#birth').datepicker({
			dateFormat : "yy/mm/dd"
		});
	});

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
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
				<div class="spanbar" onclick="toggleReview()">
					<a href="#">리뷰 보기</a>
				</div>
				<div class="spanbar" onclick="toggleOrder()">
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
				<div class="spanbar" onclick="toggleMyinfo()">
					<a href="#">내 정보</a>
				</div>
				<br> <a href="#">회원정보수정</a><br> <a href="#">로그아웃</a><br>
			</div>			
			<div class="col-sm-10" id="mainDiv">
				<p class="maino">나의 구매 내역</p>
				<br>
				<table style="width: 100%">
					<tbody>
						<tr class="underline">
							<th class="orderTh">주문번호</th>
							<th class="orderTh">상품</th>
							<th class="orderTh" style="width: 40%;">상품 상세</th>
							<th class="orderTh">옵션</th>
							<th class="orderTh">수량</th>
							<th class="orderTh">가격</th>
							<th class="orderTh">리뷰</th>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">6969</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20230925/NB20230925082154449001.jpg"></td>
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)</td>
							<td class="orderTd">260, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">109,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">7474</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20240123/NB20240123151041974001.jpg"></td>
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)</td>
							<td class="orderTd">(91)Silver, 280, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">99,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">6969</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20230925/NB20230925082154449001.jpg"></td>
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)</td>
							<td class="orderTd">260, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">109,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">7474</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20240123/NB20240123151041974001.jpg"></td>
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)</td>
							<td class="orderTd">(91)Silver, 280, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">99,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">6969</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20230925/NB20230925082154449001.jpg"></td>
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)</td>
							<td class="orderTd">260, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">109,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">7474</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20240123/NB20240123151041974001.jpg"></td>
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)</td>
							<td class="orderTd">(91)Silver, 280, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">99,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">6969</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20230925/NB20230925082154449001.jpg"></td>
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)</td>
							<td class="orderTd">260, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">109,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">7474</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20240123/NB20240123151041974001.jpg"></td>
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)</td>
							<td class="orderTd">(91)Silver, 280, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">99,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-sm-10" id="otherDiv" style="display: none;">
				<p class="maino">리뷰 관리</p>
				<hr class="disborder">
				<br>
				<div class="crema-product-reviews crema-applied"
					data-product-code="NBPFES152A"
					data-applied-widgets="[&quot;.crema-product-reviews&quot;]"
					style="margin-top: 32px; margin-bottom: 32px;">
					<iframe id="crema-product-reviews-1"
						src="https://review3.cre.ma/nbkorea.com/products/reviews?product_code=NBPFES152A&amp;iframe_id=crema-product-reviews-1&amp;widget_style=&amp;app=0&amp;parent_url=https%3A%2F%2Fwww.nbkorea.com%2Fproduct%2FproductDetail.action%3FstyleCode%3DNBPFES152A%26colCode%3D35%26cIdx%3D1288&amp;nonmember_token=&amp;secure_device_token=V2aad0d0f64d5df91dd038b106de0fde342243abdf9113098edd43e4801dfc77ded19ddc93e6de862532393fbdd9fed86c&amp;iframe=1"
						height="0" width="100%" scrolling="no" allowtransparency="true"
						frameborder="0" name="crema-product-reviews-1-1706574865307"
						style="display: block; visibility: visible; height: 2434px;"></iframe>
				</div>
			</div>
			<form action="<%=withFormTag%>" method="post">
				<input type='hidden' name="command" value="myUpdate">
				<div class="col-sm-10" id="otherDiv2" style="display: none;">
					<p class="maino">내 정보</p>
					<hr class="disborder">
					<br>
					<div class="titleArea" style="width: 800px">
						<h3>기본정보</h3>
						<li class="required">필수입력사항</li>
					</div>
					<div>
						<div>
							<table>
								<tr>
									<th scope="row">
										<li class="required id">아이디</li>
									</th>
									<td><input id="member_id" name="MBRID "
										class="inputTypeText" type="text" onkeyup="idtest()"
										value="${sessionScope.loginfo.MBRID}">
										<div class="success-message hide">사용할 수 있는 아이디입니다.</div>
										<div class="failure-message hide">잘못된 형식입니다.</div>
										<div class="txtInfo">(영문소문자/숫자, 4~16자)</div>
										<p id="idMsg" class="txtInfo txtSuccess"></p></td>
								</tr>
								<tr>
									<th scope="row">
										<li class="required password">비밀번호</li>
									</th>
									<td><input id="member_password" name="MBRPW"
										class="inputTypeText" type="password" onkeyup="pwtest()"
										value="${sessionScope.loginfo.MBRPW}">
										<div class="success-message2 hide">사용할 수 있는 비밀번호입니다.</div>
										<div class="failure-message2 hide">잘못된 형식입니다.</div>
										<div class="txtInfo">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합,
											10~16자)</div>
										<p id="passwordMsg" class="txtInfo txtSuccess"></p></td>
								</tr>
								<tr>
									<th scope="row">
										<li class="required password check">비밀번호 확인</li>
									</th>
									<td><input id="member_password_check"
										name="member_password_check" class="inputTypeText"
										type="password" onkeyup="pwtest2()">
										<div class="success-message3 hide">비밀번호가 일치합니다.</div>
										<div class="failure-message3 hide">비밀번호가 일치하지 않습니다.</div>
										<p id="passwordCheckMsg" class="txtInfo txtSuccess"></p></td>
								</tr>
								<tr>
									<th scope="row">
										<li class="required name">이름</li>
									</th>
									<td><input id="member_name" name="MBRNM"
										class="inputTypeText" type="text" onkeyup="nmtest()"
										value="${sessionScope.loginfo.MBRNM}">
										<div class="failure-message4 hide">필수입력사항입니다.</div>
										<p id="nameMsg" class="txtInfo txtSuccess"></p></td>
								</tr>
								<tr>
									<th scope="row">
										<li class="required address">주소</li>
									</th>
									<td class="formMultiple">
										<ul class="ec-address">
											<li id="join_zipcode_wrap"><input id="sample6_postcode"
												name="MBRAR1" placeholder="우편번호" class="inputTypeText"
												type="text" readonly="readonly"
												onclick="sample6_execDaumPostcode()"
												value="${sessionScope.loginfo.MBRAR}">
												<button id="postBtn" class="btnBasic" type="button"
													onclick="sample6_execDaumPostcode()"
													style="cursor: pointer">주소검색</button></li>
											<li id="join_baseAddr_wrap"><input id="sample6_address"
												name="MBRAR2" placeholder="기본주소" class="inputTypeText"
												type="text" readonly="readonly"
												onclick="sample6_execDaumPostcode()"
												value="${sessionScope.loginfo.MBRAR1}"></li>
											<li id="join_detailAddr_wrap"><input
												id="sample6_detailAddress" name="MBRAR3"
												placeholder="나머지 주소" class="inputTypeText" type="text"
												onkeyup="artest()" value="${sessionScope.loginfo.MBRAR2}">
												<div class="failure-message5 hide">필수입력사항입니다.</div> <input
												type="text" id="sample6_extraAddress" placeholder="참고항목"
												class="inputTypeText" type="text" readonly="readonly">
											</li>
										</ul>
									</td>
								</tr>
								<tr>
									<th scope="row">
										<li class="required handphone">휴대전화</li>
									</th>
									<td class="formGroup code"><select id="mobile1"
										name="mobile1">
											<option value="010">010</option>
											<option value="011">011</option>
											<option value="016">016</option>
											<option value="017">017</option>
											<option value="018">018</option>
											<option value="019">019</option>
									</select>- <input id="mobile2" name="mobile2" maxlength="4" type="text"
										onkeyup="hptest()" onkeypress="return checkNumber(event)">-
										<input id="mobile3" name="mobile3" maxlength="4" type="text"
										onkeyup="hptest()" onkeypress="return checkNumber(event)">
										<div class="failure-message6 hide">필수입력사항입니다.</div></td>
								</tr>
								<tr>
									<th scope="row">
										<li class="required email" alt="필수">이메일
									</th>
									<td><input id="email1" name="MBREM" class="inputTypeText"
										type="text" onkeyup="emtest()"
										value="${sessionScope.loginfo.MBREM}"> <select
										class="required email" id="email2" name="MBREM01">
											<option>--메일 선택--</option>
											<option>@naver.com</option>
											<option>@gmail.com</option>
											<option>@daum.net</option>
									</select>
										<div class="failure-message7 hide">필수입력사항입니다.</div></td>
								</tr>
							</table>
						</div>
					</div>
					<div class="titleArea" style="width: 800px">
						<h3>
							추가정보 <span class="desc">(선택)</span>
						</h3>
					</div>
					<div>
						<table>
							<tr>
								<th scope="row">
									<li class="notrequired gender">성별
								</th>
								<td><input id="is_sex0" name="is_sex" value="M"
									type="radio" autocomplete="off"> <label for="is_sex0">남자</label>
									<input id="is_sex1" name="is_sex" value="F" type="radio"
									autocomplete="off"> <label for="is_sex1">여자</label></td>
							</tr>
							<tr>
								<th scope="row">
									<li class="notrequired birth">생년월일
								</th>
								<td class="formGroup date"><input type="text"
									class="inputTypeText" id="birth" name="MBRBT"></td>
							</tr>
						</table>
					</div>
					<div class="gBottom">
						<button class="btn_white" onclick="history.go(-1);">취소</button>
						<button class="btn_black" id="join" type="submit">수정하기</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="col-sm-1"></div>
	</div>
	<div class="popup">
		<form method="post" action="#">
			<br>
			<h2>리뷰 작성하기</h2>
			<select class="all_star selectbox_star sel_color"
				style="margin-left: 7px;">
				<option selected="selected">&#xf005 &#xf005 &#xf005 &#xf005
					&#xf005</option>
				<option>&#xf005 &#xf005 &#xf005 &#xf005</option>
				<option>&#xf005 &#xf005 &#xf005</option>
				<option>&#xf005 &#xf005</option>
				<option>&#xf005</option>
			</select>
			<table class="table table-hover">
				<tbody>
					<tr>
						<td><textarea class="form-control" placeholder="리뷰 내용을 작성하세요"
								name="contentDetail" maxlength="270" style="height: 270px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div style="text-align: left; margin-left: 30px;">
				<button type="submit" class="btn_white">파일선택</button>
				<button type="submit" class="btn_white">파일선택</button>
				<button type="submit" class="btn_white">파일선택</button>
			</div>
			<hr>
			<div style="text-align: center">
				<button type="submit" class="btn_white" style="margin-right: 20px">올리기</button>
				<button type="reset" class="btn_black" style="margin-left: 20px">나가기</button>
			</div>
		</form>
	</div>
	<script>
		/* SELECT BOX */
		$(document).ready(function() {
			var selectTarget = $('.selectbox select');
			selectTarget.on('blur', function() {
				$(this).parent().removeClass('focus');
			});

			selectTarget.change(function() {
				var select_name = $(this).children('option:selected').text();
				$(this).siblings('label').text(select_name);
			});
		});
	</script>
	<script type="text/javascript">
		let inputId = document.getElementById('member_id');
		let SuccessMessage = document.querySelector('.success-message');
		let FailureMessage = document.querySelector('.failure-message');

		function idLength(value) {
			return value.length >= 4 && value.length <= 16
		};

		function onlyNumberAndEnglish(str) {
			return /^[a-z0-9][a-z0-9]*$/.test(str);
		}

		function idtest() {
			// 값을 입력한 경우
			if (inputId.value.length !== 0) {

				if (onlyNumberAndEnglish(inputId.value) === false) {
					SuccessMessage.classList.add('hide');
					FailureMessage.classList.remove('hide');
				} else if (idLength(inputId.value) === false) {
					SuccessMessage.classList.add('hide'); // 성공 메시지가 가려져야 함
					FailureMessage.classList.remove('hide'); // 아이디는 4~12글자이어야 합니다
				}
				// 조건을 모두 만족할 경우
				else {
					SuccessMessage.classList.remove('hide'); // 사용할 수 있는 아이디입니다
					FailureMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
				}
			}
			// 값을 입력하지 않은 경우 (지웠을 때)
			// 모든 메시지를 가린다.
			else {
				SuccessMessage.classList.add('hide');
				FailureMessage.classList.add('hide');
			}
		};

		let inputPw = document.getElementById('member_password');
		let SuccessMessage2 = document.querySelector('.success-message2');
		let FailureMessage2 = document.querySelector('.failure-message2');

		function strongPassword(str) {
			return /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{10,16}$/
					.test(str);
		}

		function pwtest() {
			// 값을 입력한 경우
			if (inputPw.value.length !== 0) {
				if (strongPassword(inputPw.value)) {
					SuccessMessage2.classList.remove('hide');
					FailureMessage2.classList.add('hide'); // 실패 메시지가 가려져야 함
				} else {
					SuccessMessage2.classList.add('hide'); // 실패 메시지가 보여야 함
					FailureMessage2.classList.remove('hide');
				}
			}
			// 값을 입력하지 않은 경우 (지웠을 때)
			// 모든 메시지를 가린다.
			else {
				SuccessMessage2.classList.add('hide');
				FailureMessage2.classList.add('hide');
			}
		};

		let inputPw2 = document.getElementById('member_password_check');
		let SuccessMessage3 = document.querySelector('.success-message3');
		let FailureMessage3 = document.querySelector('.failure-message3');

		function isMatch(password1, password2) {
			return password1 === password2;
		}

		function pwtest2() {
			// 값을 입력한 경우
			if (inputPw2.value.length !== 0) {
				if (isMatch(inputPw.value, inputPw2.value)) {
					SuccessMessage3.classList.remove('hide');
					FailureMessage3.classList.add('hide'); // 실패 메시지가 가려져야 함
				} else {
					SuccessMessage3.classList.add('hide'); // 실패 메시지가 보여야 함
					FailureMessage3.classList.remove('hide');
				}
			}
			// 값을 입력하지 않은 경우 (지웠을 때)
			// 모든 메시지를 가린다.
			else {
				SuccessMessage3.classList.add('hide');
				FailureMessage3.classList.add('hide');
			}
		};

		// 나머지 필수입력사항
		// 이름
		let inputNm = document.getElementById('member_name');
		let FailureMessage4 = document.querySelector('.failure-message4');
		function nmtest() {
			if (inputNm.value.length !== 0) {
				FailureMessage4.classList.add('hide');
			}
		}
		// 주소
		let inputAr = document.getElementById('sample6_detailAddress');
		let FailureMessage5 = document.querySelector('.failure-message5');
		function artest() {
			if (inputAr.value.length !== 0) {
				FailureMessage5.classList.add('hide');
			}
		}
		// 휴대전화
		let inputHp = document.getElementById('mobile2');
		let inputHp2 = document.getElementById('mobile3');
		let FailureMessage6 = document.querySelector('.failure-message6');
		function hptest() {
			if (inputHp.value.length !== 0) {
				FailureMessage6.classList.add('hide');
			} else if (inputHp2.value.length !== 0) {
				FailureMessage6.classList.add('hide');
			}
		}

		function checkNumber(event) {
			if (event.key === '.' || event.key === '-' || event.key >= 0
					&& event.key <= 9) {
				return true;
			}
			return false;
		}
		// 이메일
		let inputEm = document.getElementById('email1');
		let FailureMessage7 = document.querySelector('.failure-message7');
		function emtest() {
			if (inputEm.value.length !== 0) {
				FailureMessage7.classList.add('hide');
			}
		}
	</script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('#join')
									.click(
											function() {
												// 아이디
												let inputId = document
														.getElementById('member_id');
												let FailureMessage = document
														.querySelector('.failure-message');

												function idLength(value) {
													return value.length >= 4
															&& value.length <= 16
												}
												;

												function onlyNumberAndEnglish(
														str) {
													return /^[a-z0-9][a-z0-9]*$/
															.test(str);
												}

												if (inputId.value == "") {
													inputId.focus();
													inputId.scrollIntoView({
														block : "center"
													});
													FailureMessage.classList
															.remove('hide');
													return false;
												} else if (onlyNumberAndEnglish(inputId.value) === false) {
													inputId.focus();
													inputId.scrollIntoView({
														block : "center"
													});
													FailureMessage.classList
															.remove('hide');
													return false;
												} else if (idLength(inputId.value) === false) {
													inputId.focus();
													inputId.scrollIntoView({
														block : "center"
													});
													FailureMessage.classList
															.remove('hide');
													return false;
												}

												// 비밀번호
												let inputPw = document
														.getElementById('member_password');
												let FailureMessage2 = document
														.querySelector('.failure-message2');

												function strongPassword(str) {
													return /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{10,16}$/
															.test(str);
												}

												if (inputPw.value == '') {
													inputPw.focus();
													inputPw.scrollIntoView({
														block : "center"
													});
													FailureMessage2.classList
															.remove('hide');
													return false;
												} else if (strongPassword(inputPw.value) == false) {
													inputPw.focus();
													inputPw.scrollIntoView({
														block : "center"
													});
													FailureMessage2.classList
															.remove('hide');
													return false;
												}

												// 비밀번호 확인
												let inputPw2 = document
														.getElementById('member_password_check');
												let FailureMessage3 = document
														.querySelector('.failure-message3');

												function isMatch(password1,
														password2) {
													return password1 === password2;
												}

												if (inputPw2.value == '') {
													inputPw2.focus();
													inputPw2.scrollIntoView({
														block : "center"
													});
													FailureMessage3.classList
															.remove('hide');
													return false;
												} else if (isMatch(
														inputPw.value,
														inputPw2.value) == false) {
													inputPw2.focus();
													inputPw2.scrollIntoView({
														block : "center"
													});
													FailureMessage3.classList
															.remove('hide');
													return false;
												}

												// 이름
												let inputNm = document
														.getElementById('member_name');
												let FailureMessage4 = document
														.querySelector('.failure-message4');

												if (inputNm.value == '') {
													inputNm.focus();
													inputNm.scrollIntoView({
														block : "center"
													});
													FailureMessage4.classList
															.remove('hide');
													return false;
												}
												// 주소
												let inputAr = document
														.getElementById('sample6_detailAddress');
												let FailureMessage5 = document
														.querySelector('.failure-message5');

												if (inputAr.value == '') {
													inputAr.focus();
													inputAr.scrollIntoView({
														block : "center"
													});
													FailureMessage5.classList
															.remove('hide');
													return false;
												}
												// 휴대전화
												let inputHp = document
														.getElementById('mobile2');
												let inputHp2 = document
														.getElementById('mobile3');
												let FailureMessage6 = document
														.querySelector('.failure-message6');

												if (inputHp.value == '') {
													inputHp.focus();
													inputHp.scrollIntoView({
														block : "center"
													});
													FailureMessage6.classList
															.remove('hide');
													return false;
												}
												if (inputHp2.value == '') {
													inputHp2.focus();
													inputHp.scrollIntoView({
														block : "center"
													});
													FailureMessage6.classList
															.remove('hide');
													return false;
												}

												// 이메일
												let inputEm = document
														.getElementById('email1');
												let inputEm2 = document
														.getElementById('email2');
												let FailureMessage7 = document
														.querySelector('.failure-message7');

												if (inputEm.value == '') {
													inputEm.focus();
													inputEm.scrollIntoView({
														block : "center"
													});
													FailureMessage7.classList
															.remove('hide');
													return false;
												}
												if (inputEm2.value == '--메일 선택--') {
													inputEm.focus();
													inputEm.scrollIntoView({
														block : "center"
													});
													FailureMessage7.classList
															.remove('hide');
													return false;
												}
											})
						})
	</script>
</body>
</html>