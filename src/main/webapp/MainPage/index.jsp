<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="./../common/common.jsp"%>
<%
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
%>
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
	width: 60%;
	display: flex;
	margin:auto;
}
</style>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<title>You and I Shopping</title>
<script src="MainPage/alleffect/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="MainPage/alleffect/main.css">
<link rel="stylesheet" type="text/css"
	href="MainPage/alleffect/main.css">
<link rel="stylesheet" type="text/css"
	href="MainPage/alleffect/main.css">
<script type="text/javascript" src="MainPage/alleffect/slick.min.js"></script>


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
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img class="d-block" src="MainPage/img/main1.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="MainPage/img/main2.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="MainPage/img/main3.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="MainPage/img/main4.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="MainPage/img/main5.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="MainPage/img/main6.jpg"
					style="width: 100%;">
			</div>
			<div class="carousel-item">
				<img class="d-block" src="MainPage/img/main7.jpg"
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
			<c:forEach var="list" items="${imgPath}" varStatus="status">
				<div class="columnwrap">
					<div class="column">
						<div class="thumbnail">
							<%-- <a href="./img/${list}"> <img src="./img/${list}" alt="Product">--%>
							<a href="<%=notWithFormTag%>DetailProduct&pronm=U996"> <img
								src="MainPage/img/${list}" alt="Product">
								<div class="description">
									<p>상품 설명 란</p>
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