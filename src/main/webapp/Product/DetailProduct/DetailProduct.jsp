<%@page import="com.shopping.model.dao.ProductDetailDao"%>
<%@page import="com.shopping.model.bean.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<%@ include file="./../../common/common.jsp"%>

<!-- font-family: 'Cute', sans-serif; -->
<link
	href="https://fonts.googleapis.com/css2?family=Cute+Font&display=swap"
	rel="stylesheet">

<!--  font-family: 'Noto Serif KR', cursive; -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css">

<!-- 페이징 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>


<c:set var="bean" value="${requestScope.dataList[0]}" />
<c:set var="dataList" value="${requestScope.dataList}" />


<title>상품 상세페이지</title>
<style>

header {
	/*background-color: #333;*/
	/*color: #fff;*/
	/*text-align: center;
	padding: 1em;*/
}

.product_top {
	max-width: 1050px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	display: flex;
	flex-direction: row; /* 이미지와 텍스트를 가로로 나열 */
}

.text-container {
	margin-left: 50px;
	flex: 1; /* 텍스트 컨테이너가 남은 공간을 모두 차지하도록 설정 */
}

/* 버튼 */
.div_btn {
	text-align: right;
}


.btn_buy {
	padding: 18px 80px;
	background-color: #E97373;
	color: #ffffff;
	border: none;
}

.btn_Basket {
	padding: 16px 26px;
	padding-bottom: 19px;
	
}

/* 메인 이미지*/
.marketing {
	display: flex;
}
/* 이미지 간격 조절 */
.marketing img {
	margin-right: 2px;
}

.container {
	display: flex;
	justify-content: space-between;
}

.items {
	list-style: none;
	padding: 0;
	margin: 0;
	display: flex;
	overflow-x: auto; /* 가로 스크롤을 허용하여 넘치는 요소들을 볼 수 있도록 설정 */
	justify-content: flex-start; /* 왼쪽으로 정렬 */
}

.items li {
	margin-right: 10px; /* 각 이미지 사이의 간격 조절 */
}

.items img {
	width: 80px; /* 이미지의 가로 크기 조절 */
	height: auto; /* 이미지의 세로 크기 자동 조절 */
	border: 1px solid #ddd; /* 이미지 주변에 테두리 설정 (선택사항) */
}

.items input[type="radio"] {
	display: none; /* 실제 radio 버튼을 감춤 */
}

.items input[type="radio"]:checked+label img {
	border: 2px solid black; /* 선택된 이미지에 테두리 추가 (선택사항) */
}

.big-image {
	max-width: 500px; /* 이미지의 최대 너비 조절 */
	height: auto;
}

.big-image-container {
	margin-top: 20px;
	display: flex;
	justify-content: center;
	width: 500px; /* big-image-container의 너비를 40px로 설정 */
	height: 500px; /* big-image-container의 높이를 400px로 설정 */
}

.ht-image {
	width: 20px;
	height: 20px;
}

.twitter-image {
	width: 22px;
	height: 19px;
}

.facebook-image {
	width: 45px;
	height: 45px;
}

.font-top {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px;
}

.fonttest {
	font-family: 'Noto Serif KR', cursive;
	font-size: 18px;
	text-align: center;
	font-weight: bold;
}

.font_color {
	color: red;
}

.font_pro {
	font-weight: bold;
	font-family: 'Kanit', sans-serif;
}

.price {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px;
}

.save_point{
	font-family: 'Noto Sans KR', sans-serif;
	color: B5B4B4;
	font-size: 15px;
}

.payment {
	display: flex;
	justify-content: space-between;
	padding-top: 10px;
}

#total_name, #total_qt, #total_div_price {
	font-family: 'Noto Sans KR', sans-serif;
}

#total_name {
	padding-top: 10px;
	padding-bottom: 2px;
	text-align: left;
}

#total_qt {
	padding-top: 5px;
	padding-right:30px;
	font-size: 20px;
	text-align: center;
}

#total_div_price {
	text-align: right;
	font-size: 25px;
}

#color_area {
	padding-top: 10px;
	padding-bottom: 10px;
	padding-right: 23px;
	text-align:right;
}

#color_area_name {
	font-family: 'Noto Sans KR', sans-serif;
	border: 1px solid #ddd; /* 이미지 주변에 테두리 설정 (선택사항) */
	padding: 5px 20px;
}

#color_area_color {

	font-family: 'Noto Sans KR', sans-serif;
}

/*

#buy_count {
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
}

#buy_name {
	color: #7D7D7D;
	padding-top: 2%;
	font-family: 'Noto Sans KR', sans-serif;
	width:150px;
	font-size: 15px;
}

#cnt_total {
	padding-left : 10px;
	padding-right : 10px;
}

.cnt_button {
	border: 1px solid #ddd; 
	padding-left : 10px;
	padding-right : 10px;
	padding-bottom : 4px;
}



#buy_del {
	font-family: 'Noto Sans KR', sans-serif;
	padding-left:20px;
	width:30px;
}



#sel {
	text-align: right;
	padding-right:20px;
	padding-top:10px;
	padding-bottom:10px;
}


*/


.card_banner {
	padding-top:1%;
}



/* 사이즈 영역 */
#area_size {
	display: flex;
	flex-wrap: wrap; /* flex 요소들을 여러 줄로 랩핑할 수 있도록 설정 */
	gap: 8px; /* 각 자식 <div> 사이의 간격을 띄우기 위해 gap 사용 */
	padding-left:1%;
}

.btn_size {
	font-family: 'Noto Sans KR', sans-serif;
	border: 1px solid #ddd;
	width: 80px;
	height: 30px;
	text-align: center;
	font-size: 13px;
	padding-top: 3px;
}

/* 줄바꿈 상위 div를 display: flex; 사용했기때문에 줄바꿈을 강제로 해줘야된다 */
#newline {
	display: flex;
	flex-basis: 100%; /* 가로 폭을 100%로 설정하여 줄바꿈 */
}







/* 하단 */
.product_bottom {
	max-width: 1050px;
	margin: 20px auto;
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
}

.tab_box {
	z-index: 999;
	position: sticky;
	top: 0px;
	text-align: center;
	height: 72px;
	padding: 1em;
	background-color: #ffffff;
}

.tab_box ul {
	margin-top: 1px;
}

.tab_box li {
	margin: 8%; /* 사이 간격 */
	text-align: center;
	display: inline;
	font-family: 'Noto Serif KR', cursive;
}

.tab_box li a {
	font-size: 25px;
	text-decoration: none;
	color: black;
}

a {
	font-weight: normal;
	text-decoration: none;
	color: black;
}

a.active {
	font-weight: bold; /* 클릭 시 글자 굵기 */
}

/* 상품 문의 */
.sec_tit {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px;
}

.inq_none {
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
	font-size: 20px;
	color: #2C2C2C;
}

.inq_none ul {
	text-align: left;
	font-size: 15px;
	padding-left: 120px;
	color: #A2A2A1;
}

/* CSS Grid 설정 */
.grid-container {
	display: grid;
	grid-template-columns: 140px 740px 140px; /* 각 열의 너비를 지정 */
	grid-gap: 20px; /* 열과 행 사이의 간격 */
}

.inq_img_q img {
	width: 250px;
	height: 180px;
}

/* 버튼 */
.inq_a_btn {
	background-color: #E3E3E2;
	font-size: 20px;
	padding: 13px;
	margin-right: 10px;
	color: #2C2C2C;
}

/* 상품 리뷰 */
.view_tit {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 30px;
}

.black_hr_1px {
	border-top: 1px solid rgb(43, 43, 43);
}


.black_hr_2px {
	border-top: 2px solid rgb(43, 43, 43);
}

.view_line {
	border-top: 1px solid rgba(128, 128, 128, 0.3); /* 투명도를 포함한 회색 선 */
}

#pr_review {
	margin: 5%;
}


.view_hd_top {
	margin: 5%;
	height: 130px;
	display: flex;
}

.view_right, .view_left {
	flex: 1;
}


.view_left_top {
	padding-left: 13%;
	padding-top: 1px;
	display: flex;
}

.view_left_bottom {
	color: #7D7D7D;
	padding-top: 15px;
	padding-left: 15px;
	font-family: 'Noto Sans KR', sans-serif;
}

.view_left_star{
	padding-top: 8px;
	padding-right: 15px;
}

.view_right {
	padding-left: 2%;

}

.view_left_grade {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 60px;
}

.view_center {
	border-right: 1px solid rgba(128, 128, 128, 0.3); /* 투명도를 포함한 회색 선 */
}

.font_pro_view_left_bottom {
	color: #000000;
}

/* 게이지 바*/
.progress-bar {
	background-color: #E3E3E2;
	width: 200px;
	height: 13px;
	border: 1px solid #ccc;
	position: relative;
	border-radius: 10px;
	overflow: hidden;
	
}

.progress {
	height: 100%;
	background-color: #2B2B2B;
	border-radius: inherit;
}

.percentage {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #000;
	
}
 
.progress_td {
	font-family:'Noto Sans KR', sans-serif;
	text-align: right;
	font-size:15px;
}


.view_Board {
	margin-top: 3%;
	margin-bottom: 3%;
	margin-left: 1px;
	height: 250px;
	display: flex;
}


.view_Board_left {
	width: 80%;
	
}

.border_top {
	justify-content: space-between; /* a는 왼쪽, b는 오른쪽으로 배치 */
	display: flex;
}

.view_star {
	font-weight: bold;
	font-family:'Noto Sans KR', sans-serif;
	padding-right: 10%;
}

.border_date {
	padding-right: 5%;
	font-family: 'Noto Sans KR', sans-serif;
	color: #B0AFAF;
	font-size: 13px;
}

.inq_img img {
	width:150px;
	height:150px;
	border-radius: 10%;
}

.border_main{
	color: #595959;
	font-size: 13px;
	font-family: 'Noto Sans KR', sans-serif;
}

.Board_member {
	padding-left: 10%;
	align-text: center;
	color: #595959;
	font-size: 13px;
	font-family: 'Noto Sans KR', sans-serif;
}

.view_Board_right{
	width: 20%;
	margin-right: 1px;
}

.Board_member_detail {
	padding-top: 5%;
}

.view_page {
	padding-top:2%;
	padding-left:35%;
	text-align: center;
}

.height {
	padding-top:30%;
}


.dynamic-div {
      position: relative; /* 상대 위치 지정 */
      border: 1px solid #000;
      padding: 10px;
      margin: 5px;
    }
    
    
/* 하단 상품 리뷰 */
.review01_box {
	font-family: 'Gothic A1', sans-serif;
	font-weight: bold;
}

.btn_select {
	text-align: right;
	padding: 8px 20px;
}

</style>
</head>
	<script>
		
		var LK = `${bean.LK}`;
	
		// 클라이언트 측 JavaScript
		function changeImage(pronm) { 

			if (LK) {
				//alert("삭제" + LK);
				var URL = '<%=notWithFormTag%>liDelete';
				LK = null;
				document.getElementById("ht-image").src = "./Image/bht.png";
			} else {
				//alert("저장" + LK);
				var URL = '<%=notWithFormTag%>liInsert';
				LK = "LK";	
				document.getElementById("ht-image").src = "./Image/ht.png";
			}

			$.ajax({
		        type: 'GET',
		        url: URL,
		        data: { pronm: pronm },
		        error: function(xhr, status, error) {
		            console.error(error);
		        }
		    });
		}
	
	</script>

	<header>
		<%-- <jsp:include page="./../../MainPage/top.jsp" />--%>
	</header>
<body>
	<div class="product_top">
		<div class="big-image-container">
			<img class="big-image" src="./Image/Detail_main/${bean.PROIMG}" alt="">
		</div>
		<div class="text-container">
			<h1 class="font-top">${bean.PRONM} | ${bean.PROCD}</h1>
			<div class="marketing" id="iconOpt">
				<img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200053137001.png" alt="270130"> 
				<img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200034090001.png" alt="270130">
			</div>
		
			<br>

			<div class="container">
				<div class="a">
					<span class="star crema-hide"><span style="width: 96.0%"></span></span>
					<em class="num"><span>평점</span>/5</em> <a>(0)</a>
				</div>
				<div class="a">
					<a><img class="ht-image" id="ht-image"
						src="" onclick="changeImage('${bean.PRONM}')" /></a>
					
					&nbsp;&nbsp;<span style="color:#B5B4B4;">|</span>
					<a href="https://www.facebook.com/?locale=ko_KR" target="_blank"><img class="facebook-image" src="./Image/facebook.png" alt="facebook"></a>
					<a href="https://twitter.com/?lang=ko" target="_blank"><img class="twitter-image" src="./Image/twitter.png" alt="twitter"></a>
						
						
				</div>
			</div>
			<br>
			<div>
		
				<span id="pro_price" class="price">${bean.PROPR}</span>
				<span style="font-family: 'Noto Sans KR', sans-serif;">원</span> 
				<br> 
				<span class="save_point">적립</span>
				<span class="save_point" style="color:#8D8D8D;">${bean.PROPNT}P</span>
			</div>

			<div class="underline"></div>
			
			<div class="pr_limit">
				<p class="fonttest">
					해당 상품은 <span class="font_pro">ID</span>당 색상별<br />최대 <span
						class="font_color">5</span>pcs까지 구매가능합니다.
				</p>
			</div>
			<div class="underline"></div>

			<div class="color">
				<br>
				<ul class="items">
					<c:forEach var="bean_cr" items="${requestScope.dataList}" varStatus="status">
						
						<c:if test="${status.index == 0}">
							<li>
								<input type="radio" id="colCode_${status.index}" name="pr_color" value="10" checked="checked" /> 
								<label for="colCode_${status.index}" title="${bean_cr.PROCR}" onclick="test('${bean_cr.PROCR}')">
									<img src="./Image/Detail_main/${bean_cr.PROIMG}" alt="${bean_cr.PROCR}" />
								</label>
							</li>
						</c:if>
						
						<c:if test="${status.index != 0}">
							<li>
								<input type="radio" id="colCode_${status.index}" name="pr_color" value="10" /> 
								<label for="colCode_${status.index}" title="${bean_cr.PROCR}" onclick="test('${bean_cr.PROCR}')">
									<img src="./Image/Detail_main/${bean_cr.PROIMG}" alt="${bean_cr.PROCR}" />
								</label>
							</li>
						</c:if>
					
					
					</c:forEach>
				</ul>
			</div>

			<div id="color_area"><span id="color_area_color">${bean.PROCR}</span>&nbsp|&nbsp<span id="color_area_name"></span></div>
			
			<div id="area_size">
			
				<!-- 줄바꿈을 위한 columnSu -->
				<c:set var="columnSu" value="5" />
				<c:forEach var="size" items="${requestScope.sizeList}" varStatus="status">
					<a href="#link"><div class="btn_size" onclick="sizeBuy(${size.ITMNM});">${size.ITMNM}</div></a>
					<c:if test="${status.index mod columnSu == 4}">
						<div id="newline"></div>
					</c:if>
				</c:forEach>
			</div>
			
			<br>
			
			<div class="total_buy_page">
				<div class="underline"></div>
				 <div id=sourceDiv style="display:">
				 	<!-- 동적으로 만들어 주기때문에 주석처리 -->
					<!--<div id="buy_payment"class="payment" >
						<div id="buy_name">1</div>
						<div id="buy_count">
							<div class="cnt_button"onclick='count("minus")'>-</div>
							<div id='cnt_total'>1</div>
							<div class="cnt_button"onclick='count("plus")'>+</div>
						</div>
						<div id="total_qt">3</div>
						
						<div id="buy_del">
							<input id='hdn_id' type='hidden' value='main'>
							<a href="#link" onclick="fn_del(hdn_id.value)">
								<span>x</span>
							</a>
						</div>	
					</div>-->
				</div>
			</div>
			
			<div id="total_class" style="display:none"> 
				<div class="black_hr_2px"></div>
				<div class="payment">
					<div id=total_name>합계</div>
					<div style="width:140px"></div>
					<div id="total_qt" style="width:50px">0</div>
					<div id="total_div_price" style="width:180px;"><span id="total_price">0</span>원</div>
				</div>
			</div>
			<br>
			<div>
				<div class="card_banner">
					<a href="https://www.nbkorea.com/etc/collection.action?collectionIdx=5365" data-gtag-idx="fo_detail_2" data-gtag-label="Wearable tech, 1906R"></a>
					<img src="https://image.nbkorea.com/NBRB_Banner/20240112/NB20240112094037484001.jpg" alt="Wearable tech, 1906R"/>	
				</div>
				<div class="card_banner">
					<a href="https://www.nbkorea.com/collection/HERITAGEDROP1.action" data-gtag-idx="fo_detail_2" data-gtag-label="New Balance HERITAGE DROP1"></a>
					<img src="https://image.nbkorea.com/NBRB_Banner/20240119/NB20240119125937348001.jpg" alt="New Balance HERITAGE DROP1"/>
				</div>
				<div class="card_banner">
					<a href="https://www.nbkorea.com/etc/collection.action?collectionIdx=5362" data-gtag-idx="fo_detail_2" data-gtag-label="The MADE in USA, 990v6 restock"></a>
					<img src="https://image.nbkorea.com/NBRB_Banner/20240129/NB20240129142525506001.jpg" alt="The MADE in USA, 990v6 restock"/>
				</div>
			</div>
			<br>
			<div class="div_btn">
				<button class="btn_white btn_Basket">장바구니</button>
				<button class="btn_buy" onclick="fn_buy()">구 매</button>
			</div>
		</div>
	</div>

	<script>
		// 첫 시작 찜이미지 설정
		var LK = `${bean.LK}`;
		var chk = document.getElementById("ht-image").src;
		
		if (LK) {
			document.getElementById("ht-image").src = "./Image/ht.png";
		} else {
			document.getElementById("ht-image").src = "./Image/bht.png";
		}
		
		// 첫 시작 컬러값 설정
		var sColor = `${bean.PROCR}`;
		document.getElementById("color_area_name").style.backgroundColor = sColor;
		
		// 이미지 클릭시 큰 이미지로 출력
		const itemsContainer = document.querySelector('.items');
		const bigImage = document.querySelector('.big-image');

		itemsContainer.addEventListener('change', function(event) {
			const selectedRadio = event.target.closest('input[type="radio"]');
			if (selectedRadio) {
				const selectedImageSrc = selectedRadio.nextElementSibling
						.querySelector('img').src;
				bigImage.src = selectedImageSrc;
			}
		});
		
		function test(val){
		
			var color = val//.substring(4);
			var can = document.getElementById("color_area_name");
			
			can.style.backgroundColor = color;
		    
			var can = document.getElementById('color_area_color');
			can.innerText = val;
			
		}
		
		
		function fn_count(type) {

			var clickedElementId = event.target.id;
			var keyArray = clickedElementId.split('/');

			var color = keyArray[0];
			var value = keyArray[1];
			var size = keyArray[2];
			
			var cnt_total = color + '/' + size;
			
			var cnt = document.getElementById(cnt_total);
			var num = cnt.innerText;
			var total_num = total_qt.innerText;
			
			var id_price = document.getElementById('pro_price');	     
			var total_price = document.getElementById('total_price');	     
			var price = id_price.innerHTML;
			
			//var S_key = color + '/' + size;
			//var size_key = document.getElementById(S_key);
			//var sz = size_key.innerHTML; 
			
			if(type === 'plus') {
				//if (sz == '4') {
				//	alert("123");
				//	return;
				//}
				
				num = parseInt(num) + 1;
				total_num = parseInt(total_num) + 1
			}else if(type === 'minus')  {
				if(num > 1) {
					num = parseInt(num) - 1;
					total_num = parseInt(total_num) - 1;
				} 
			}
			total_qt.innerText = total_num;
			cnt.innerText = num;
			
			total_price.innerText = price * total_num;
		}
		
		// x누르면 태그 삭제
		function fn_del() {
		
			var clickedButton = event.target;
			var Id = clickedButton.parentNode.id;

			var keyArray = Id.split('/');
			var color = keyArray[0];
			var value = keyArray[1];
			var size = keyArray[2];
			
			var divId = color + '/buy_payment/' + size;
			var Div = document.getElementById(divId);
			
			//size
			var clickedElementId = event.target.id;
			var cnt = document.getElementById(color + '/' + size).innerText;
			var total = total_qt.innerText;
			
			var id_price = document.getElementById('pro_price');	     
			var price = id_price.innerHTML;
			
			var total_price = document.getElementById('total_price');	     
			
			if (Div) {
				Div.remove();
				total_qt.innerText = total - cnt;
				
				total_price.innerText = total_price.innerText - (price * cnt);
			}
		}

		var count = 0;
		
		function sizeBuy(size) {

			var total_qt = document.getElementById('total_qt');
			var total_num = total_qt.innerText;
			
			var id_price = document.getElementById('pro_price');	     
			var price = id_price.innerHTML;
			
			var can = document.getElementById('color_area_color');
			var color = can.innerText;
			
			var S_key = color + '/' + size;
			var size_key = document.getElementById(S_key);
			var can = document.getElementById('buy_name' + size);
			
			if (size_key) {
				
				var sz = size_key.innerHTML; 
				
				if (sz == '4') {
					alert("123");
					return;
				}
				
				var cnt = size_key.innerText;
				cnt = parseInt(cnt) + 1;

				size_key.innerText = cnt;
				
			} else {
				
				var total_class = document.getElementById('total_class');
				total_class.style.display = '';

				// 클릭한 상품의 정보를 가져와서 상세 정보를 표시하는 div에 추가
				var productDetailsDiv = document.getElementById('sourceDiv');
				var newProductDiv = document.createElement('div');
	
				var subDiv1 = document.createElement('div');
	
			    subDiv1.id = color + '/buy_payment/' + size; 
			    subDiv1.classList.add('payment_d');  		    
			    subDiv1.style.display = 'flex';  
			    //subDiv1.style.justifyContent = 'space-between';
			    subDiv1.style.paddingTop = '10px';  
			    subDiv1.style.paddingBottom = '10px';  
			    
			    var subDiv2 = document.createElement('div');
			    
			    subDiv2.id = 'buy_name' + size;  
			    subDiv2.style.color = '#7D7D7D';
			    subDiv2.style.paddingTop = '2%';  
			    subDiv2.style.fontFamily = 'Noto Sans KR, sans-serif';
			    subDiv2.style.width = '180px';
			    subDiv2.style.fontSize = '15px';
			    subDiv2.innerHTML = '<p>' + size+'/'+ color + '</p>';
			    
			    var subDiv3 = document.createElement('div');
			    
			    subDiv3.id = 'buy_count' + count;
			    subDiv3.style.fontFamily = 'Noto Sans KR, sans-serif';
			    subDiv3.style.display = 'flex';  // display: flex; 추가
			    
			    var subDiv4 = document.createElement('div');
			    
			    subDiv4.id = color + '/p_button/' + size; 
			    subDiv4.classList.add('cnt_button'); 
			    subDiv4.style.paddingLeft = '10px';  
			    subDiv4.style.paddingRight = '10px';  
			    subDiv4.style.border = '1px solid #ddd';
			    subDiv4.innerHTML = '+';
			    subDiv4.onclick = function() {
			    	fn_count("plus");
			    };
	
			    var subDiv4_a = document.createElement('a');
			    subDiv4_a.href = '#link';
	
				var subDiv5 = document.createElement('div');
			    
				subDiv5.id = color + '/' + size;
				subDiv5.classList.add('buy_qt'); 
			    subDiv5.style.paddingLeft = '10px';  
			    subDiv5.style.paddingRight = '10px';  
			    subDiv5.innerHTML = '<p>' + 1 + '</p>';
			    subDiv5.style.width = '35px';
			    subDiv5.style.textAlign = 'center';
	
				var subDiv6 = document.createElement('div');
			    
				subDiv6.classList.add('cnt_button');  // 클래스 추가
				
				subDiv6.id = color + '/m_button/' + size; 
				subDiv6.style.paddingLeft = '10px';  
				subDiv6.style.paddingRight = '10px';  
				subDiv6.style.border = '1px solid #ddd';
				subDiv6.innerHTML = '-';
				subDiv6.onclick = function() {
					fn_count("minus");
			    };
	
			    var subDiv6_a = document.createElement('a');
			    subDiv6_a.href = '#link';
	
				var subDiv7 = document.createElement('div');
				
				subDiv7.id = color + '/buy_price/' + size;
				subDiv7.style.fontFamily = 'Noto Sans KR, sans-serif';
				subDiv7.style.fontSize = '20px';
				subDiv7.style.textAlign = 'right';
				subDiv7.style.width = '150px';
				subDiv7.style.marginLeft = '10px';
				subDiv7.innerHTML = price;
	
	
				var subDiv9 = document.createElement('span');
				subDiv9.id = color + '/x/' + size;  
				
				subDiv9.innerHTML = 'x';
				
				var subDiv9_a = document.createElement('a');
				subDiv9_a.style.marginRight= '1px';
				subDiv9_a.id = color + '/'+count+'/' + size;  
				subDiv9_a.href = '#link';
				//var myLinkElement = document.getElementById('key'+count);
				subDiv9_a.onclick = function() {
					fn_del();
			    };
						
		
			    var subDiv10 = document.createElement('div');
			    
				subDiv10.id = 'buy_del' + count;  
				subDiv10.style.fontFamily = 'Noto Sans KR, sans-serif';
				subDiv10.style.paddingLeft = '10px';
				//subDiv10.style.width = '30px';
	
				subDiv1.appendChild(subDiv2);
				subDiv3.appendChild(subDiv4);
				subDiv3.appendChild(subDiv6_a);
				subDiv3.appendChild(subDiv5);
				subDiv3.appendChild(subDiv4_a);
				subDiv6_a.appendChild(subDiv6);
				subDiv4_a.appendChild(subDiv4);
				subDiv1.appendChild(subDiv3);
				subDiv1.appendChild(subDiv7);
				subDiv9_a.appendChild(subDiv9);
				subDiv10.appendChild(subDiv9_a);
				subDiv1.appendChild(subDiv10);
			    newProductDiv.appendChild(subDiv1);
			    productDetailsDiv.appendChild(newProductDiv);
	
				count ++;
			}

			total_num = parseInt(total_num) + 1
			total_qt.innerText = total_num;
			
			//var id_price = document.getElementById('pro_price');	     
			var total_price = document.getElementById('total_price');	     
			//var price = id_price.innerHTML;
			total_price.innerText = price * total_num;
			
	
			var payment = document.getElementById("buy_payment");

			if(payment.style.display == "none") {
				payment.style.display = "";
			}

			var id_cr = document.getElementById('sel_color');
			
			
			var price = id_price.innerHTML;
			var cr = id_cr.value;

			var buy_name = document.getElementById('buy_name');
			var total_qt = document.getElementById('total_qt');

	        buy_name.innerHTML = size + "/" + cr;
	        total_qt.innerHTML = price;
		}
		
		
		function fn_buy() {
			alert("구매 버튼");
			
			var parent_div = document.getElementById('sourceDiv');
            
            // Get child divs
            var child_div = parent_div.getElementsByClassName('payment_d');
            var child_qt = parent_div.getElementsByClassName('buy_qt');
            var child_cnt = child_div.length;

            for (var i = 0; i < child_cnt; i++) {
                var childDiv = child_div[i];
                var childqt = child_qt[i].innerText;
                var childId = childDiv.id;
                console.log('Child div ID: ' + childId + '/' + childqt);
            }
		}
		
		
		// SELECT BOX
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

	<div class="tab_box">
		<ul>
			<li class="active"><a id="text-to-change" href="#pr_details"
				data-gtag-idx="fo_detail_3" data-gtag-label="상품정보">상품정보</a></li>
			<li><a href="#pr_main_review" data-gtag-idx="fo_detail_3"
				data-gtag-label="상품리뷰">상품리뷰 (102)</a></li>
			<li><a href="#pr_inquiry" data-gtag-idx="fo_detail_3"
				data-gtag-label="상품문의">상품문의 (0)</a></li>
		</ul>
		<hr style="width:100%">
	</div>

	<div class="product_bottom">
		<div class="sticky_wrap" style="top: 0px;">
		

			<div id="pr_details" style="margin-bottom:100px; text-align:center" id="prodAddInfo_wrap">
				<br><br><br><br><br>
				${bean.PROIMG1}
				<img src="./Image/Details/${bean.PROIMG1}">
			</div>

			<div id="pr_main_review" class="section Re_review">
				<br>
				<br>
				<br>
				<br>
				<h3 class="sec_tit">상품리뷰</h3>
				<div class="black_hr_1px" />
				<br>
				<div class="review_sec">
					<div class="pr_infoReview">
						<div class="review01_box">
							구매확정 후 <span style="color:red"> <em class="font_pro">30</em>일 이내에</span> 상품평 작성 시,&nbsp;<span style="color:red">최대 <em class="font_pro">2,000</em> 마일리지의 혜택을 드립니다.</span> 
							<br> 
							작성하신 상품평에 대한 마일리지 지급은 작성후 <em style="color:red">15</em>일 이내로 적립됩니다.
						</div>
						<br>
						<div class="review01_box">
								<span>일반리뷰 <em class="font_pro">500 </em>마일리지</span> 
								<span>포토리뷰 <em class="font_pro">1,000 </em>마일리지</span> 
								<span>스타일리뷰 <em class="font_pro" style="color:red">2,000 </em>마일리지</span>
								
							<div class="">
								<p>
								<div class="">
									<ul>
										<li>
											<p class="review01_box">[스타일 리뷰 기준]</p>
											<ol>
												<li> 구매하신 상품을 착용한 전신 컷 (얼굴 제외 가능, 어깨부터 발끝까지 보이게끔 촬영한
													사진)</li>
												<li> 세트나 한 쌍의 상품인 경우, 양 쪽이 모두 보이도록 촬영한 사진 (신발, 양말 등)</li>
												<li> 스타일링을 보여줄 수 있는 사진 (실내복 착용이나 신발 없는 전신 사진은 포토리뷰로
													간주됩니다.)</li>
												<li> 상품 형태와 컬러 식별이 가능한 사진</li>
												<li> 10자 이상의 상품에 대한 후기</li>
											</ol>
										</li>
										<br>
										<li>
											<p class="review01_box">[포토 리뷰 기준]</p>
											<ol>
												<li> 구매하신 상품이 모두 나오게 촬영한 사진</li>
												<li> 포장을 제거하고 상품의 전체가 보이게 촬영한 사진</li>
												<li> 세트나 한 쌍의 상품인 경우, 양 쪽이 모두 보이도록 촬영한 사진 (신발, 양말 등)</li>
												<li> 상품 형태와 컬러 식별이 가능한 사진</li>
												<li> 10자 이상의 상품에 대한 후기</li>
											</ol>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div id="pr_review" class="section">
					<br>
					<br>
					<br>
					<h3 class="view_tit">REVIEW(114)</h3>
					<div class="black_hr_2px"></div>
					
					<div class="view_hd_top">
						<div class="view_left">
							<div class="view_left_top">
								<div class="view_left_star">
									<svg xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink" width="50"
										height="50" viewBox="0 0 20 20"
										class="crema_product_reviews_score_star_wrapper__star "
										style="fill: rgb(0, 0, 0); width: 100%; height: 100%;">
										<defs>
											<path id="star-full"
										d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z" />
										</defs>
										<use xlink:href="#star-full" />
									</svg>
								</div>
								<div class="view_left_grade">
									5.0
								</div>
							</div>
							<div class="view_left_bottom">
								<span class="font_pro font_pro_view_left_bottom">99%</span>의 구매자가 이 상품을 좋아합니다.
							</div>
						</div>
						<div class="view_center"></div>
						<div class="view_right">
							<table width=330px; align="center">
								<tr>
									<td  class="progress_td">아주 좋아요</td>
									<td>
										<div class="progress-bar">
											<div class="progress" style="width: 80%;"></div>
											<div class="percentage"></div>
										</div>
									</td>
									<td class="progress_td">144</td>
								</tr>
								<tr>
									<td class="progress_td">맘에 들어요</td>
									<td>
										<div class="progress-bar">
											<div class="progress" style="width: 70%;"></div>
											<div class="percentage"></div>
										</div>
									</td>
									<td class="progress_td">2</td>
								</tr>
								<tr>
									<td class="progress_td">보통이에요</td>
									<td>
										<div class="progress-bar">
											<div class="progress" style="width: 60%;"></div>
											<div class="percentage"></div>
										</div>
									</td>
									<td class="progress_td">123</td>
								</tr>
								<tr>
									<td class="progress_td">그냥 그래요</td>
									<td>
										<div class="progress-bar">
											<div class="progress" style="width: 50%;"></div>
											<div class="percentage"></div>
										</div>
									</td>
									<td class="progress_td">22</td>
								</tr>
								<tr>
									<td class="progress_td">별로에요</td>
									<td>
										<div class="progress-bar">
											<div class="progress" style="width: 30%;"></div>
											<div class="percentage"></div>
										</div>
									</td>
									<td class="progress_td">1</td>
								</tr>
							</table>
						</div>
					</div>
					
					<div class="view_line"></div>
					
					<div class="view_hr_bt">
						<br>
						
						<div class="selectbox sel_color">
							<label>색상</label> 
							<select>
								<option select>색상</option>
								<option><a><img src="./../../Image/bht.png"" /></span></a></option>
								<option>(20)Red</option>
								<option>(50)Blue</option>
								<option>(91)Sliver</option>
							</select>
						</div>
						<div class="selectbox selectbox_star sel_color">
						<label>별점</label> 
						<select class="all_star">
							<option selected="selected" >별점</option>
							<option value="five_star">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
							<option value="four_star">&#xf005 &#xf005 &#xf005 &#xf005</option>
							<option value="three_star">&#xf005 &#xf005 &#xf005</option>
							<option value="two_star">&#xf005 &#xf005</option>
							<option value="one_star">&#xf005</option>
						</select>
						</div>
						<div class="selectbox sel_color">
							<label>사이즈</label> 
							<select>
								<option select>사이즈</option>
								<option>250</option>
								<option>255</option>
								<option>260</option>
								<option>265</option>
								<option>270</option>
								<option>275</option>
								<option>280</option>
								<option>285</option>
								<option>290</option>
							</select>
						</div>
						<button  class="btn_black btn_select">검 색</button>
						<br><br>
						<div class="view_line"></div>
		
						<div class="view_Board">
							<div class="view_Board_left">
								<div class="border_top">
									<div id="view_star0" class="view_star"></div>
									<div class="border_date">2024.01.30</div>
								</div>
								<br>
								<div class="border_main">
									가볍고 발볼도 편하고 좋아요<br>
									딸이 맘에 들어해요
								</div>
								<br>
								<div class="inq_img">
									<img src="./../../Image/board.jpg" alt="board">
								</div>
								
							</div>
							
							<div class="view_center"></div>
							<div class="view_Board_right">
								<div class="Board_member">
									<div class="Board_member_detail">전****님의 리뷰입니다.</div>
									<div class="Board_member_detail">발 사이즈 <span class="font_pro">245mm</span></div>
									<div class="Board_member_detail">회원 등급 <span class="font_pro">FAMILY</span></div>
									<div class="Board_member_detail">사이즈 <span class="font_pro">245</span></div>
									<div class="Board_member_detail">컬러 <span class="font_pro">(15)Gray</span></div>
								</div>
							</div>
							
						</div>
			
						<div class="view_line"></div>
						
						
						<div class="view_Board">
							<div class="view_Board_left">
								<div class="border_top">
									<div id="view_star1" class="view_star"></div>
									<div class="border_date">2024.01.30</div>
								</div>
								<br>
								<div class="border_main">
									가볍고 발볼도 편하고 좋아요<br>
									딸이 맘에 들어해요
								</div>
								<br>
								<div class="inq_img">
									<img src="./../../Image/board.jpg" alt="board">
								</div>
								
							</div>
							
							<div class="view_center"></div>
							<div class="view_Board_right">
								<div class="Board_member">
									<div class="Board_member_detail">전****님의 리뷰입니다.</div>
									<div class="Board_member_detail">발 사이즈 <span class="font_pro">245mm</span></div>
									<div class="Board_member_detail">회원 등급 <span class="font_pro">FAMILY</span></div>
									<div class="Board_member_detail">사이즈 <span class="font_pro">245</span></div>
									<div class="Board_member_detail">컬러 <span class="font_pro">(15)Gray</span></div>
								</div>
							</div>
							
						</div>
			
						<div class="view_line"></div>
						
						<div class="view_Board">
							<div class="view_Board_left">
								<div class="border_top">
									<div id="view_star2" class="view_star"></div>
									<div class="border_date">2024.01.30</div>
								</div>
								<br>
								<div class="border_main">
									가볍고 발볼도 편하고 좋아요<br>
									딸이 맘에 들어해요
								</div>
								<br>
								<div class="inq_img">
									<img src="./../../Image/board.jpg" alt="board">
								</div>
								
							</div>
							
							<div class="view_center"></div>
							<div class="view_Board_right">
								<div class="Board_member">
									<div class="Board_member_detail">전****님의 리뷰입니다.</div>
									<div class="Board_member_detail">발 사이즈 <span class="font_pro">245mm</span></div>
									<div class="Board_member_detail">회원 등급 <span class="font_pro">FAMILY</span></div>
									<div class="Board_member_detail">사이즈 <span class="font_pro">245</span></div>
									<div class="Board_member_detail">컬러 <span class="font_pro">(15)Gray</span></div>
								</div>
							</div>
							
						</div>
			
						<div class="view_line"></div>
						
						<div class="view_Board">
							<div class="view_Board_left">
								<div class="border_top">
									<div id="view_star3" class="view_star"></div>
									<div class="border_date">2024.01.30</div>
								</div>
								<br>
								<div class="border_main">
									가볍고 발볼도 편하고 좋아요<br>
									딸이 맘에 들어해요
								</div>
								<br>
								<div class="inq_img">
									<img src="./../../Image/board.jpg" alt="board">
								</div>
								
							</div>
							
							<div class="view_center"></div>
							<div class="view_Board_right">
								<div class="Board_member">
									<div class="Board_member_detail">전****님의 리뷰입니다.</div>
									<div class="Board_member_detail">발 사이즈 <span class="font_pro">245mm</span></div>
									<div class="Board_member_detail">회원 등급 <span class="font_pro">FAMILY</span></div>
									<div class="Board_member_detail">사이즈 <span class="font_pro">245</span></div>
									<div class="Board_member_detail">컬러 <span class="font_pro">(15)Gray</span></div>
								</div>
							</div>
							
						</div>
			
						<div class="view_line"></div>
						
						<div class="view_Board">
							<div class="view_Board_left">
								<div class="border_top">
									<div id="view_star4" class="view_star"></div>
									<div class="border_date">2024.01.30</div>
								</div>
								<br>
								<div class="border_main">
									가볍고 발볼도 편하고 좋아요<br>
									딸이 맘에 들어해요
								</div>
								<br>
								<div class="inq_img">
									<img src="./../../Image/board.jpg" alt="board">
								</div>
								
							</div>
							
							<div class="view_center"></div>
							<div class="view_Board_right">
								<div class="Board_member">
									<div class="Board_member_detail">전****님의 리뷰입니다.</div>
									<div class="Board_member_detail">발 사이즈 <span class="font_pro">245mm</span></div>
									<div class="Board_member_detail">회원 등급 <span class="font_pro">FAMILY</span></div>
									<div class="Board_member_detail">사이즈 <span class="font_pro">245</span></div>
									<div class="Board_member_detail">컬러 <span class="font_pro">(15)Gray</span></div>
								</div>
							</div>
							
						</div>
			
						<div class="view_line"></div>
						
						<div class="view_Board">
							<div class="view_Board_left">
								<div class="border_top">
									<div id="view_star5" class="view_star"></div>
									<div class="border_date">2024.01.30</div>
								</div>
								<br>
								<div class="border_main">
									가볍고 발볼도 편하고 좋아요<br>
									딸이 맘에 들어해요
								</div>
								<br>
								<div class="inq_img">
									<img src="./../../Image/board.jpg" alt="board">
								</div>
								
							</div>
							
							<div class="view_center"></div>
							<div class="view_Board_right">
								<div class="Board_member">
									<div class="Board_member_detail">전****님의 리뷰입니다.</div>
									<div class="Board_member_detail">발 사이즈 <span class="font_pro">245mm</span></div>
									<div class="Board_member_detail">회원 등급 <span class="font_pro">FAMILY</span></div>
									<div class="Board_member_detail">사이즈 <span class="font_pro">245</span></div>
									<div class="Board_member_detail">컬러 <span class="font_pro">(15)Gray</span></div>
								</div>
							</div>
							
						</div>
			
						<div class="view_line"></div>
						<div class="view_page">
							<ul class="pagination">
							  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
							  <li class="page-item"><a class="page-link" href="#">1</a></li>
							  <li class="page-item"><a class="page-link" href="#">2</a></li>
							  <li class="page-item"><a class="page-link" href="#">3</a></li>
							  <li class="page-item"><a class="page-link" href="#">Next</a></li>
							</ul>
						</div>
					</div>
					<!-- 
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 100%; height: 100%;">
							<defs>
								<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
							</defs>
							<use xlink:href="#star-full"/>
						</svg>
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 100%; height: 100%;">
						    <defs>
						        <path id="a" fill="#E8E8E8" d="M10.003 1.667c.27 0 .539.148.677.442l2.165 4.59 4.84.74c.622.095.87.894.42 1.352l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382c0-9.166 0-13.897.002-14.191z"></path>
						        <path id="c" d="M7.157 6.698l2.165-4.59a.746.746 0 0 1 .688-.441c-.007.294-.01 5.025-.01 14.19L5.673 18.24c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
						    </defs>
						    <use xlink:href="#a"></use>
						    <use xlink:href="#c"></use>
						</svg> -->

				</div>
			</div>

			<div style="display: none"; id="five_star" >
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 15px; height: 15px;">
					<defs>
						<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
					</defs>
					<use xlink:href="#star-full"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 15px; height: 15px;">
					<defs>
						<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
					</defs>
					<use xlink:href="#star-full"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 15px; height: 15px;">
					<defs>
						<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
					</defs>
					<use xlink:href="#star-full"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 15px; height: 15px;">
					<defs>
						<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
					</defs>
					<use xlink:href="#star-full"/>
				</svg>
				<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 15px; height: 15px;">
					<defs>
						<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
					</defs>
					<use xlink:href="#star-full"/>
				</svg>
			</div>
				
				
			<script>
				
				for ( var i = 0; i < 6; i ++ ) {
					// JavaScript 코드
			     	var five_star = document.getElementById('five_star');
			     	var view_star = document.getElementById('view_star'+i);
			
			     	// <div>의 내용을 가져와서 <p> 태그에 넣기
			     	var divContent = five_star.innerHTML;
			     	view_star.innerHTML = divContent + "아주 좋아요";	
				}

		    </script>
			
			<div class="height"></div>

			<!-- #pr_inquiry 상품문의 없을 때-->
			<div id="pr_inquiry" class="section" style="min-height: 850px;">
				<br>
				<br>
				<br>
				<br>
				
				<h3 class="sec_tit">상품문의</h3>
				<div class="black_hr_1px" />
				<div class="grid-container">
					<div class="grid_btm"></div>
					<div class="grid_btm">
						<div class="inq_none">
							<div class="inq_img_q">
								<img src="./Image/QA.png" alt="QA">
							</div>
							<br>
							<strong>상품 관련 <span>궁금한 점</span>이 있으신가요?</strong>
							<br><br>
							<ul>
								<li>상품에 대한 문의를 남겨 주시면 회원 정보에 등록된 메일 주소로 답변이 발송됩니다.</li>
								<li>주문/배송/반품 등 일반 문의는 1:1 문의를 이용해 주시기 바랍니다.</li>
								<li>상품에 대한 허위 정보, 광고성 글은 사전 통보 없이 임의로 삭제될 수 있습니다.</li>
							</ul>
							<br>
							<br>
							<div class="">
								<a href="https://www.nbkorea.com/support/searchFaqList.action"
									class="inq_a_btn">자주 묻는 질문 찾기 </a> <a
									href="https://www.nbkorea.com/my/qna/searchQuestionList.action"
									class="inq_a_btn">1:1 문의하기</a>
							</div>
						</div>
					</div>
					<div class="grid_btm"></div>
				</div>
				<br><br>
				<hr>
			</div>
			<!-- // #pr_inquiry 상품문의 없을 때 -->
		</div>
	</div>

	<script>
		// 스크롤 
		let prevScrollPos = window.pageYOffset;

		window.onscroll = function() {
			let currentScrollPos = window.pageYOffset;

			if (prevScrollPos > currentScrollPos) {
				// 스크롤을 올릴 때
				document.getElementById("navbar").style.top = "0";
				document.getElementById("middlebar").style.top = "50%";
			} else {
				// 스크롤을 내릴 때
				document.getElementById("navbar").style.top = "-50px";
				document.getElementById("middlebar").style.top = "0";
			}
			prevScrollPos = currentScrollPos;
		};

		/* 클릭 시 글자크기 조절*/

		var links = document.querySelectorAll('a');

		links.forEach(function(link) {
			link.addEventListener('click', function() {
				links.forEach(function(innerLink) {
					innerLink.classList.remove('active');
				});
				link.classList.add('active');
			});
		});
	</script>
</body>

</html>