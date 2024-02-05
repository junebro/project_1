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

		mainDiv.style.display = "block";
		otherDiv.style.display = "none";

	}
	function toggleReview() {
		var mainDiv = document.getElementById("mainDiv");
		var otherDiv = document.getElementById("otherDiv");

		mainDiv.style.display = "none";
		otherDiv.style.display = "block";

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
	height: 500px; /*세로길이 설정은 여기서*/
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
</head>
<body>
	<div class="justify-content-center row">
		<div class="col-sm-2"></div>
		<div class="col-sm-8">
			<h1>마이 쇼핑</h1>
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
				<br> <a href="./../Product/DetailProduct/DetailProduct.jsp">최근 본 상품</a><br> <br> <a href="./../Product/DetailProduct/DetailProduct.jsp">좋아요한상품</a><br>
				<br> <a href="#">나의게시글</a><br>
				<div class="spanbar">
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
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)
							</td>
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
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)
							</td>
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
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)
							</td>
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
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)
							</td>
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
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)
							</td>
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
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)
							</td>
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
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)
							</td>
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
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)
							</td>
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
		</div>
		<div class="col-sm-1"></div>
	</div>
	<div class="popup">
		<form method="post" action="#">
			<br>
			<h2>리뷰 작성하기</h2>
			<select class="all_star selectbox_star sel_color" style="margin-left:7px;">
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
			<div style="text-align: center">
				<button type="submit" class="btn_white" style="margin-right: 20px">올리기</button>
				<button type="submit" class="btn_black" style="margin-left: 20px">나가기</button>
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
</body>
</html>