<%@page import="com.shopping.model.bean.Product_main"%>
<%@page import="com.shopping.model.bean.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.shopping.model.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="./../common/common.jsp"%>

<%
	ProductDao dao = new ProductDao();
	String mbrid = (String)session.getAttribute("MBRID");
	List<Product_main> dataList = dao.getDataList(mbrid);
%>

<!-- 

ArrayList<String> imgPath = new ArrayList<String>();
	
	imgPath.add("img1.jpg");
	imgPath.add("img2.jpg");
	imgPath.add("img3.jpg");
	imgPath.add("img4.jpg");
	imgPath.add("img5.jpg");
	imgPath.add("img6.jpg");
	imgPath.add("img7.jpg");
	imgPath.add("img8.jpg");
	imgPath.add("img9.jpg");
	imgPath.add("img10.jpg");
	imgPath.add("img11.jpg");
	imgPath.add("img12.jpg");
	
	session.setAttribute("imgPath", imgPath);
 -->
<c:set var="dataList" value="<%=dataList%>" />

<!DOCTYPE html>
<html lang="ko">
<style>
.menuwrap {
	position: fixed;
	text-align: center;
}

#topwrap {
	position: fixed;
	width: 100%;
	height: 180px;
	background-color: white;
	text-align: center;
	z-index: 99;
}

.visual {
	margin-top: 100px;
}

.d-block {
	width: 100%;
	height: 500px;
}
#demo {
	width: 1000px;
	display: flex;
	margin:auto;
}

.detail{
	 display: flex;
	 justify-content: space-between;
	 margin: 10px;
	 margin-left: 23px;
	 margin-right: 23px;
}

.description {
	box-sizing: border-box; /* 테두리와 패딩을 포함하여 너비 계산 */
	color: black;
	font-family: 'Noto Sans KR', sans-serif;
}
.PRONM {
	 margin-left: 20px;
	 margin-right: 20px;
	 font-family: 'Noto Sans KR', sans-serif;
}

.thumbnail {
	position: relative; /* 포지션 상대적으로 설정 */
	display: inline-block;
}
.overlay-image {
	position: absolute; /* 절대 위치 설정 */
	top: 12px; /* 상단에 위치 */
	right: 23px; /* 왼쪽에 위치 */
	/*height: auto;  이미지의 비율을 유지하면서 크기 조정 */
}

.main-image {
	/* 기본 이미지에 대한 스타일링 (예: 최대 너비 설정 등) */
	max-width: 90%;
	height: auto;
}


	
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>You and I Shopping</title>
<script src="${pageContext.request.contextPath}/MainPage/alleffect/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/MainPage/alleffect/main.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/MainPage/alleffect/top.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/MainPage/alleffect/main.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/MainPage/alleffect/slick.min.js"></script>


</head>
<body>

	<jsp:include page="top.jsp" />
	<div class="hidden"></div>
	<br>
	<br>
	<br>
	<!-- Carousel -->
	<div id="demo" class="carousel slide" data-bs-ride="carousel" >
	
		<!-- Indicators/dots -->
		<div class="carousel-indicators" >
			<button type="button" data-bs-target="#demo" data-bs-slide-to="0"
				class="active"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="1"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="2"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="3"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="4"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="5"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="6"></button>
			<button type="button" data-bs-target="#demo" data-bs-slide-to="7"></button>
		</div>

		<!-- The slideshow/carousel -->
		<div class="carousel-inner" >
			<div class="carousel-item active">
				<img class="d-block" src="https://image.nbkorea.com/NBRB_Site/20240213/NB20240213093206542001.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="https://image.nbkorea.com/NBRB_Site/20240207/NB20240207145118557001.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="https://image.nbkorea.com/NBRB_Site/20240119/NB20240119111110780001.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="https://image.nbkorea.com/NBRB_Site/20240207/NB20240207144546818001.jpg"
					style="width: 100%;">
			</div>
		</div>
		<!-- Left and right controls/icons -->
		<button class="carousel-control-prev" type="button"
			data-bs-target="#demo" data-bs-slide="prev">
			<span class="carousel-control-prev-icon"></span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#demo" data-bs-slide="next">
			<span class="carousel-control-next-icon"></span>
		</button>
	</div>
	<main class="main">
		<aside></aside>
		<section>
			<div class="middelContents">
				<p>지금 인기 있는 맞춤 신상품</p>
			</div>
			
			<c:forEach var="product" items="${dataList}" varStatus="status">
				<div class="columnwrap">
					<div class="column">
						<div class="thumbnail">
							<%-- <a href="./img/${list}"> <img src="./img/${list}" alt="Product">--%>
							<a href="<%=notWithFormTag%>DetailProduct&pronm=${product.PRONM}&mbrid=${sessionScope.loginfo.MBRID}"> 
								<img src="${pageContext.request.contextPath}/Image/Detail_main/${product.PROIMG}" alt="Product" class="main-image">
								<c:if test="${product.LK == 'LK'}">
									<img src="${pageContext.request.contextPath}/Image/main_ht.png" alt="ht Icon" style="width: 45px;height: 45px;" class="overlay-image">
								</c:if>				
								<c:if test="${product.LK != 'LK'}">
									<img src="${pageContext.request.contextPath}/Image/main_bht.png" alt="ht Icon" style="width: 45px;height: 45px;" class="overlay-image">
								</c:if>
								<div class="detail">
									<div class="description" style="color:#A5A5A5;">
										${product.PRONM}
									</div>
									<div class="description">
										${product.PROPR}원
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
			
		</section>
		<article></article>
	</main>
	<jsp:include page="footer.jsp" />
</body>
</html>