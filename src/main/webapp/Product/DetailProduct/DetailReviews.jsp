<%@page import="com.shopping.common.SuperClass"%>
<%@page import="com.shopping.utility.reviews_Paging"%>
<%@page import="com.shopping.model.dao.ProductDetailDao"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<!-- font-family: "Dongle", sans-serif; -->
<link href="https://fonts.googleapis.com/css2?family=Dongle&display=swap" rel="stylesheet">

<!-- 페이징 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
   
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<style>

header {
	/*background-color: #333;*/
	/*color: #fff;*/
	text-align: center;
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
	margin: 0;
  	padding: 0;
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


.top_grade {
	padding-top:7px;
	margin-right: auto; /* 오른쪽 마진을 자동으로 채우면서 왼쪽 끝에 배치됩니다. */
	font-family: 'Noto Sans KR', sans-serif;
	display: flex;
	justify-content: space-between;
}

.top_grade_div_1{
	
}

.top_grade_div_2{
	margin-top:2px;
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
	height: 66px;
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
	font-family: 'Noto Sans KR', sans-serif;
}

.tab_box li a {
	font-size: 20px;
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
.view_star_gr {
	font-weight: normal;
	font-size: 13px;
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


.paging {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 16px;
	font-weight: lighter;
	color: #8C8B8B;
}

.paging_click{
font-family: 'Noto Sans KR', sans-serif;
	font-size: 20px;
	font-weight: lighter;
}

</style>

	<c:forEach var="views" items="${requestScope.dataList['resultSetViews']}" varStatus="status">
						
		<div class="view_Board">
			<div class="view_Board_left">
				<div class="border_top">
					<div id="view_star${status.index}" class="view_star">
						<c:forEach var="i" begin="1" end="${views['RVWGR']}">
							<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 20px; height: 20px;">
								<defs>
									<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
								</defs>
								<use xlink:href="#star-full"/>
							</svg>
						</c:forEach>
						<span class="view_star_gr"> 
							<c:if test="${views['RVWGR'] eq 5}">&nbsp;아주 좋아요</c:if>
							<c:if test="${views['RVWGR'] eq 4}">&nbsp;맘에 들어요</c:if>
							<c:if test="${views['RVWGR'] eq 3}">&nbsp;보통이에요</c:if>
							<c:if test="${views['RVWGR'] eq 2}">&nbsp;그냥 그래요</c:if>
							<c:if test="${views['RVWGR'] eq 1}">&nbsp;별로에요</c:if>
						</span>
					</div>
					
					<div class="border_date">${views['RVWDT']}</div>
				</div>
				<br>
				<div class="border_main">
					${views['RVWCT']}
				</div>
				<br>
				<div class="inq_img">
					<c:if test="${views['RVWIMG1']!=null}">
						<img src="${pageContext.request.contextPath}/Image/Reviews/${views['RVWIMG1']}" alt="${views['RVWIMG1']}">
					</c:if>
					<c:if test="${views['RVWIMG2']!=null}">
						<img src="${pageContext.request.contextPath}/Image/Reviews/${views['RVWIMG2']}" alt="${views['RVWIMG2']}">
					</c:if>
					<c:if test="${views['RVWIMG3']!=null}">
						<img src="${pageContext.request.contextPath}/Image/Reviews/${views['RVWIMG3']}" alt="${views['RVWIMG3']}">
					</c:if>
				</div>
				
			</div>
			
			<div class="view_center"></div>
			<div class="view_Board_right">
				<div class="Board_member">
					<div class="Board_member_detail">${views['MBRID']}님의 리뷰입니다.</div>
					<div class="Board_member_detail">발 사이즈 <span class="font_pro">245mm</span></div>
					<div class="Board_member_detail">회원 등급 <span class="font_pro">FAMILY</span></div>
					<div class="Board_member_detail">사이즈 <span class="font_pro">245</span></div>
					<div class="Board_member_detail">컬러 <span class="font_pro">(15)Gray</span></div>
				</div>
			</div>
		</div>

		<div class="view_line"></div>
	</c:forEach>
	${requestScope.paging.pagingHtml}
	

</body>
</html>