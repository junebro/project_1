<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	padding: 0;
	margin: 0;
	border: none;
}
body {
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}
.contents h2 { /* 장바구니 */
	font-size: 40px;
	margin-bottom: 30px;
	margin-top: 100px;
}
.section li { /* 페이지 진행과정 */
	font-size: 15px;
	color: #BDBDBD;
	display: inline;
	padding: 5px;
}
.section .selected { /* 현재 페이지 */
	color: black;
}
.accordion-button { /* 장바구니 상품 */
	text-decoration: none;
	font-size: 20px;
}
.cart-subtitle { /* 일반상품 */
	width: 100%;
	text-align: left;
	font-size: 18px;
	background-color: #F6F6F6;
	padding: 10px 20px;
}
.prdbox{ /* 상품칸 */
	font-size: 15px;
	text-align: left;
	padding: 10px 20px;
}
.check, .thumbnail, .description { /* 체크박스, 사진, 설명 */
	display: inline-block;
}
input[type="checkbox"]{ /* 체크박스 */
	width: 20px;
	height: 20px;
	cursor: pointer;
	margin: 10px;
}
.thumbnail{ /* 상품 사진 */
	padding: 10px 20px; 
}
.description li { /* 설명 리스트 */
	list-style: none;
	margin-left: 30px;
	font-size: 16px;
}
a{ /* 링크 */
	text-decoration: none;
	decoration-line: none;
	color: black;
}
.prdOption{ /* 옵션 */
	width: 100%;
	text-align: left;
	font-size: 18px;
	background-color: #F6F6F6;
	padding: 10px 20px;
}
.quantity{ /* 수량박스 */
	width: 100%;
	font-size: 18px;
	padding: 10px 20px;
	text-align: left;
}
.qty_updown{ /* 수량버튼 */
	text-align: right;
}
</style>
</head>
<body>
	<div class="container">
		<div class="contents">
			<h2>장바구니</h2>
		</div>
		<div class="section">
			<ol class="step">
				<li class="selected">1.장바구니 ></li>
				<li>2.주문서작성 ></li>
				<li>3.주문완료</li>
			</ol>
		</div>
		<div class="cart-container">
			<div class="accordion accordion-flush" id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<a role="button" class="accordion-button" type="button"
							data-bs-toggle="collapse" data-bs-target="#collapseOne"
							aria-expanded="true" aria-controls="collapseOne"
							style="background-color: white">장바구니 상품 </a>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show"
						aria-labelledby="headingOne" data-bs-parent="#accordionExample">
						<div class="cart-subtitle">일반상품</div>
						<div class="prdbox">
							<input type="checkbox" id="basket_chk_id_0"
								name="basket_product_normal_type_normal" class="check">
							<div class="thumbnail">
								<a href="#"><img
									src="https://post-phinf.pstatic.net/MjAxOTA4MTNfMjIg/MDAxNTY1NjYwNDE4NjY3.l7xSqzLFBIojMAa8xxfY_OzKucZb4FimEDq2eS2WHkYg.tyeXLu39J6qYdxke7FTEnSdxuKWEf2jM5BRdk5Ronowg.GIF/1565623714.gif?type=w500_q75"
									width="150" height="150">
								</a>
							</div>
							<div class="description">
								<li>
									<strong class="prdName" title="상품명" id="basket_prod_id_0">
										<a href="#" class="ec-product-name">초간단 5분 조리! 돈까스 주먹</a>
									</strong>
								</li>								
								<li class="price"><strong>13,600</strong>원</li>
								<li class="price"><span class="txtSecondary">-0</span>원</li>
							</div>
						</div>
						<div class="prdOption">
							<span class="product displaynone">초간단 5분 조리! 돈까스 주먹</span>
							<span class="optionStr">[옵션: 돈까스 주먹]</span>
							<span class="displaynone">(2개)</span>
						</div>
						<div class="quantity">수량
							<div class="qty_updown">
								<button class="up" onclick="Basket.addQuantityShortcut('quantity_id_0', 0);">수량증가</button>
								<input id="quantity_id_0" name="quantity_name_0" size="2" value="2" type="text">
								<button class="down" onclick="Basket.outQuantityShortcut('quantity_id_0', 0);">수량감소</button>
							</div>
						</div>
						<div class="sumPrice">
							<span class="label">주문금액</span> <strong>13,600</strong>원
						</div>
						<div class="buttonGroup">
							<a href="#none" onclick="BasketNew.moveWish(0);"
								class="btnNormal sizeL">관심상품</a> <a href="#none"
								onclick="Basket.orderBasketItem(0);" class="btnNormal sizeL ">주문하기</a>
						</div>
					</div>
				</div>
			</div>
			<div class="cart total">
				<div class="sticky">
					<div class="totalSummary__item">
						<div class="heading">
							<h4 class="title">총 상품금액</h4>
							<div class="data">
								<strong><span class="total_product_price_display_front">13,600</span></strong>원
							</div>
						</div>
						<div class="heading">
							<h4 class="title">총 배송비</h4>
							<div class="data">
								<strong id="total_delv_price_front"> <span
									class="total_delv_price_front">3,500</span>
								</strong>원
							</div>
						</div>
						<div class="total">
							<h3 class="title">결제예정금액</h3>
							<div class="paymentPrice">
								<strong id="total_order_price_front">17,100</strong>원
							</div>
						</div>
					</div>
					<div id="orderFixItem"
						class="xans-element- xans-order xans-order-totalorder ">
						<div class="ec-base-button">
							<button href="#none" onclick="Basket.orderAll(this)"
								link-order="/order/orderform.html?basket_type=all_buy"
								link-login="/member/login.html" class="btnSubmit gFull sizeL  ">전체상품주문</button>
							<button href="#none" onclick="Basket.orderSelectBasket(this)"
								link-order="/order/orderform.html?basket_type=all_buy"
								link-login="/member/login.html" class="btnNormal gFull sizeL ">선택상품주문</button>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>