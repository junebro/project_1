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
div{
	margin: 20px 0;
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
	font-size: 20px;
	font-weight: bolder;
}
.cart-subtitle { /* 일반상품 */
	width: 100%;
	text-align: left;
	font-size: 18px;
	background-color: #F6F6F6;
	padding: 10px 20px;
}
.prdbox{ /* 상품칸 */
	width: 100%;
	height: 200px;
	font-size: 15px;
	text-align: left;
	padding: 10px 20px;
}
.check, .thumbnail, .description { /* 체크박스, 사진, 설명 */
	float: left;
}
.btnDelete{ /* 삭제표시 */
	float: right;
	font-size: 25px;
	font-weight: bolder;
	font-family: 'Kanit', sans-serif;
	color: #5D5D5D;
}
input[type="checkbox"]{ /* 체크박스 */
	width: 20px;
	height: 20px;
	cursor: pointer;
	margin: 10px;
}
.thumbnail{ /* 상품 사진 */
	padding: 10px 20px;
	margin: -10px;
}
.description{
	margin-top: -5px;
}
.description li { /* 설명 리스트 */
	list-style: none;
	margin-left: 30px;
	font-size: 16px;
}
.description .txtSecondary{ /* 할인가격 */
	color: red;
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
.container-fluid{ /* 수량박스 */
	width: 100%;
	height: 100px;
	font-size: 18px;
	padding: 0 20px;
	border-bottom: 1px solid #ddd;
	margin: 20px 0;
}
.qty_title{ /* 수량 */
	float: left;
}
.qty_number{ /* 수량 숫자 */
	text-align: center;
	padding: 10px 0;
}
.qty_updown{ /* 수량버튼 박스 */
	float: right;
}
.qty_number, .qty_updown .up, .qty_updown .down{ /* 수량버튼, 숫자 */
	padding: 10px 20px;
	border: 1px solid #ddd;
	margin: -3px;
}
.sumPrice{ /* 주문금액 박스 */
	width: 100%;
	height: 50px;
	font-size: 18px;
	padding: 10px 20px;
}
.sumPrice .label{ /* 주문금액 */
	float: left;
}
.sumPrice strong{ /* 주문금액-금액 */
	float: right;
}
.buttonGroup{ /* 관심상품, 주문하기 박스*/
	width: 100%;
	height: 100px;
	font-size: 18px;
	padding: 10px 0;
	border-bottom: 1px solid #ddd;
}
.buttonGroup button{ /* 관심상품, 주문하기 */
	width: 49%;
	border: 1px solid #ddd;
	padding: 20px 0;
}
.buttonGroup .btn1{ /* 관심상품 */
	float: left;
}
.buttonGroup .btn2{ /* 주문하기 */
	float: right;
}
.heading{ /* 총상품금액, 총배송비, 결제예정금액*/
	width: 100%;
	height: 80px;
	transform: translateY(40%);
}
.totalSummary_item{ /* 총상품금액, 총배송비 박스 */
	border: 1px solid #ddd;
	padding: 10px;
}
.heading h4{ /* 총상품금액, 총배송비 */
	float: left;
	margin: 5px;
	font-size: 20px;
}
#total_delivery{
	border-bottom: 1px solid #ddd;
}
.heading .data{ /* 총상품금액, 총배송비 내용 */
	float: right;
	margin: 5px;
	font-size: 20px;
}
.ec-base-button{ /* 하단버튼 박스 */
	padding: 20px 0;
}
.ec-base-button .btn1{ /* 전체상품주문 */
	width: 100%;
	padding: 20px;
	border: 1px solid #ddd;
	font-size: 20px;
	margin-bottom: 10px;
}
.ec-base-button .btn2{ /* 선택상품주문 */
	width: 100%;
	padding: 20px;
	border: 1px solid #ddd;
	font-size: 20px;
}
.left{
	width: 900px;
}
.right{
	position: relative;
	width: 400px;
	padding: 10px;
}
.wrap {
	display: flex;
	align-items: flex-start;
	width: 1200px;
	margin: 0 auto;
}
.sticky {
	position: absoulte;
	width:400px;
	height: 400px;
	padding: 10px;
}
/* 반응형 스타일 예시 -> 1200px 이하에서는 고정 요소가 아래에 배치됩니다. */
@media (max-width: 1200px){
    .wrap { display: block; width: 100%; }
    .left, .right, .sticky{ width: 100%; height: 100%; }
}
</style>
<script>
	$(window).on('load', function() {
	    const $sticky = $('.sticky'); // 고정될 박스 요소
	    const $footer = $('footer'); // 페이지 하단의 footer 요소
	    const $body = $('body'); // 페이지 본문
	    const topMargin = 50; // 고정될 때의 상단, 하단 여백
	    const breakpoint = 1200; // 반응형 디자인의 기준 너비

	    // 고정 박스가 없으면 함수를 종료합니다.
	    if (!$sticky.length) return;

	    // 고정 박스의 초기 상단 위치를 계산합니다.
	    let initialTop = $sticky.offset().top;

	    // 스크롤 위치와 화면 너비에 따라 고정 박스의 위치를 업데이트하는 함수
	    const updatePosition = () => {
	        const scrollTop = $(window).scrollTop(); // 현재 스크롤 위치
	        const footerHeight = $footer.outerHeight(true); // footer의 높이
	        const bodyHeight = $body.outerHeight(true); // body의 높이
	        // 고정 박스가 위치할 수 있는 최대 높이를 계산합니다.
	        const availableHeight = bodyHeight - footerHeight - $sticky.outerHeight(true) - initialTop - topMargin;

	        // 스크롤 위치와 화면 너비에 따라 고정 박스의 위치를 조정합니다.
	        if (scrollTop > initialTop - topMargin && window.innerWidth > breakpoint) {
	            if (availableHeight + initialTop - topMargin > scrollTop) {
	                $sticky.css({ 'position': 'fixed', 'top': `${topMargin}px` });
	            } else {
	                $sticky.css({ 'position': 'absolute', 'top': `${availableHeight}px` });
	            }
	        } else {
	            if (window.innerWidth > breakpoint){
	                $sticky.css({ 'position': 'absolute', 'top': `0` }); // 고정 박스 위치가 최상단일 때
	            }else{
	                $sticky.css({ 'position': 'static' }); // 화면이 좁을 때는 기본 위치로 설정
	            }
	        }
	    };
	    
	    // 창 크기가 변경될 때 고정 박스의 위치를 초기화하고 초기 상단 위치를 다시 계산합니다.
	    let resizeTimer;
	    let isResize = false;
	    $(window).on('resize', () => {
	        clearTimeout(resizeTimer);
	        isResize = true;
	        resizeTimer = setTimeout(function() {
	            $sticky.css({ 'position': 'absolute', 'top': '0' });
	            initialTop = $sticky.offset().top;
	            isResize = false;
	            updatePosition();
	        }, 100);
	    });

	    // 스크롤 할 때 위치 업데이트 함수를 호출합니다. (창 크기가 변경되지 않을 때)
	    $(window).on('scroll', function() {
	        if(isResize == false){
	            updatePosition();
	        }
	    });

	    updatePosition();
	});
</script>
</head>
<body>
	<header>
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
	</header>
	<div class="cart-container">
		<div class="wrap">
			<div class="left">
				<div class="accordion accordion-flush" id="accordionExample">
					<div class="accordion-item">
						<h2 class="accordion-header" id="headingOne">
							<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne"
								aria-expanded="true" aria-controls="collapseOne"
								style="background-color: white">장바구니 상품 </button>
						</h2>
						<div id="collapseOne" class="accordion-collapse collapse show"
							aria-labelledby="headingOne" data-bs-parent="#accordionExample">
							<div class="cart-subtitle">일반상품</div>
							<div class="prdbox">
								<div class="checkbox">							
									<input type="checkbox" id="basket_chk_id_0"
										name="basket_product_normal_type_normal" class="check">
								</div>
								<div class="thumbnail">
									<a href="#"><img
										src="https://post-phinf.pstatic.net/MjAxOTA4MTNfMjIg/MDAxNTY1NjYwNDE4NjY3.l7xSqzLFBIojMAa8xxfY_OzKucZb4FimEDq2eS2WHkYg.tyeXLu39J6qYdxke7FTEnSdxuKWEf2jM5BRdk5Ronowg.GIF/1565623714.gif?type=w500_q75"
										width="150" height="150">
									</a>
								</div>
								<div class="description">
									<li class="list1">
										<strong class="prdName" title="상품명" id="basket_prod_id_0">
											<a href="#" class="ec-product-name">초간단 5분 조리! 돈까스 주먹</a>
										</strong>
									</li>								
									<li class="price"><strong>13,600</strong>원</li>
									<li class="price"><span class="txtSecondary">-0</span>원</li>
									<li>배송 :<span class="price">3,500원</span></li>
								</div>
								<a href="#none" onclick="Basket.deleteBasketItem(1);" class="btnDelete">X</a>
							</div>
							<div class="prdOption">
								<span class="product displaynone">초간단 5분 조리! 돈까스 주먹</span>
								<span class="optionStr">[옵션: 돈까스 주먹]</span>
								<span class="displaynone">(2개)</span>
							</div>
							<div class="container-fluid">
								<div class="qty_title">수량</div>
								<div class="qty_updown">
									<button class="down btn_white" onclick="Basket.outQuantityShortcut('quantity_id_0', 0);">-</button>
									<input class="qty_number" name="quantity_name_0" size="2" value="2" type="text">
									<button class="up btn_white" onclick="Basket.addQuantityShortcut('quantity_id_0', 0);">+</button>
								</div>
							</div>
							<div class="sumPrice">
								<span class="label">주문금액</span> <strong>13,600원</strong>
							</div>
							<div class="buttonGroup">
								<button onclick="BasketNew.moveWish(0);" class="btn1 btn_white">관심상품</button>
								<button onclick="Basket.orderBasketItem(0);" class="btn2 btn_white">주문하기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="sticky">
					<div class="totalSummary_item">
						<div class="heading total">
							<h4 class="title">총 상품금액</h4>
							<div class="data">
								<strong><span class="total_product_price_display_front">13,600원</span></strong>
							</div>
						</div>
						<div class="heading delivery" id="total_delivery">
							<h4 class="title">총 배송비</h4>
							<div class="data">
								<strong id="total_delv_price_front"> <span
									class="total_delv_price_front">3,500원</span>
								</strong>
							</div>
						</div>
						<div class="heading total" id="total_money">
							<h4 class="title">결제예정금액</h4>
							<div class="data">
								<strong id="total_order_price_front">17,100원</strong>
							</div>
						</div>
					</div>
					<div id="orderFixItem"
						class="xans-element xans-order xans-order-totalorder ">
						<div class="ec-base-button">
							<button class="btn1 btn_black" onclick="Basket.orderAll(this)"
								link-order="/order/orderform.html?basket_type=all_buy"
								link-login="/member/login.html">전체상품주문</button>
							<button class="btn2 btn_white" href="#none" onclick="Basket.orderSelectBasket(this)"
								link-order="/order/orderform.html?basket_type=all_buy"
								link-login="/member/login.html">선택상품주문</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer></footer>
</body>
</html>