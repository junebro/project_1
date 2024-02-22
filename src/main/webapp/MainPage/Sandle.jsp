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
	List<Product> dataColor = dao.getDataColor();
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
<c:set var="dataColor" value="<%=dataColor%>" />

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
	height: 100px;
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
	 margin-left: 23px;
	 margin-right: 23px;
	 margin-bottom:15px;
	 pointer-events: none;
	 height:14px;
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

#color_area {
	/* padding: 5px 5px 5px 5px; */
	padding: 4px;
	text-align: left;
}

.color_div_left{
	margin-top:5px;
	color:Light Blue;
	pointer-events: none;
	font-family: "Raleway", sans-serif;
	font-size: 15px;
	font-weight: bold; /* 클릭 시 글자 굵기 */
	
}

.color_div_right{
	margin-top:7px;
	height:17px;
}

.color_div_center{
	margin-left: auto;
	margin-right: auto;
}

.middelContents{
	font-family: 'Noto Sans KR', sans-serif;
}

#hiddenDiv {
	display: none;
}

#visibleDiv {
	/* 111 : 주석 */
	 display: none; 
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
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">

</head>
<body>

	<jsp:include page="top.jsp" />
	<div class="hidden"></div>
	<br>
	<br>
	<br>
	<main class="main">
		<aside></aside>
		<section>
		<!-- Carousel -->
			<div id="demo" class="carousel slide" data-bs-ride="carousel" >
				
				<!-- Indicators/dots -->
				<div class="carousel-indicators" >
					<button type="button" data-bs-target="#demo" data-bs-slide-to="0" class="active"></button>
				</div>
				
				<!-- The slideshow/carousel -->
				<div class="carousel-inner" >
					<div class="carousel-item active">
						<img class="d-block" src="https://image.nbkorea.com/NBRB_Site/20240213/NB20240213093206542001.jpg"
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
			<br>
			<div class="middelContents">
				<!-- <p style="margin-top: 10px; font-size: 50px; font-family: 'Black Han Sans', sans-serif; font-weight: 200;">Sandle</p> -->
				<p>
					Bring On Trends
				</p>
				<p style="margin-bottom: 30px; font-size: 20px; font-weight: 400;">
					집을 나서는 발걸음부터 편안함을 가져다주는 샌들/슬라이드.
				</p>
			</div>
			
			<c:forEach var="product" items="${dataList}" varStatus="status">
				<c:if test="${product.PROTP==3}">
					<div class="columnwrap">
						<div class="column">
							<div class="thumbnail">
								<a href="<%=notWithFormTag%>DetailProduct&pronm=${product.PRONM}&mbrid=${sessionScope.loginfo.MBRID}"> 
									<img src="${pageContext.request.contextPath}/Image/Detail_main/${product.PROIMG}" alt="Product" class="main-image">
									<c:if test="${product.LK == 'LK'}">
										<img id="${product.PRONM}ht-image" src="${pageContext.request.contextPath}/Image/black_ht.png" alt="ht Icon" style="width: 45px;height: 45px;" class="overlay-image" onclick="fn_lk('${product.PRONM}', 'ht')">
									</c:if>				
									<c:if test="${product.LK != 'LK'}">
										<img id="${product.PRONM}ht-image" src="${pageContext.request.contextPath}/Image/main_bht.png" alt="ht Icon" style="width: 45px;height: 45px;" class="overlay-image"onclick="fn_lk('${product.PRONM}', 'bht')">
									</c:if>
								</a>
								<div class="detail">
									<div class="color_div_left">
										<c:if test="${product.PRODT == 'new'}">
											<span style="color:#692D5D;">NEW</span>
										</c:if>
									</div>
										<c:if test="${product.PRODT == 'new' && product.RVWGR > 3.5}">
											&nbsp|&nbsp
										</c:if>
									<div class="color_div_left">
										<c:if test="${product.RVWGR > 3.5}">
											<span style="color:#5D9CA4;">BEST</span>
										</c:if>
									</div>
									<div class="color_div_center" ></div>
									
									
									<c:forEach var="color" items="${dataColor}" varStatus="status">
										
										<c:if test="${product.PRONM == color.PRONM}">
											<c:if test="${color.PROCR == 'White'}">
												&nbsp<div class="color_div_right" id="color_area" style="border:1px solid #A5A5A5; background-color:${color.PROCR}"></div>
											</c:if>
											<c:if test="${color.PROCR != 'White'}">
												&nbsp<div class="color_div_right" id="color_area" style="background-color:${color.PROCR}"></div>
											</c:if>
										</c:if>
									</c:forEach>
							
								</div>
								<div class="detail">
									<div class="description" style="color:#A5A5A5;">
										${product.PRONM}
									</div>
									<div class="description">
										<fmt:formatNumber value="${product.PROPR}" pattern="###,###" />원
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:forEach>
			<br><br><br>
			<jsp:include page="footer.jsp" />
			<script>
			
			document.querySelectorAll('.overlay-image').forEach(function(element) {
				element.addEventListener('click', function(event) {
					event.preventDefault();
				});
			});
			
			function fn_lk(pronm, ht){

				var mbrid = "${sessionScope.loginfo.MBRID}";
				
				if(!mbrid) {
					if (confirm("로그인이 필요한 서비스입니다.\n로그인 하시곘습니까?")) {
						location.href = '${pageContext.request.contextPath}/Member/loginMain.jsp';
					}
					return;
				}
				var url = document.getElementById(pronm + "ht-image").src;
				var fileName = url.split('/').pop();
				
				if (fileName == "black_ht.png") {
					var URL = '<%=notWithFormTag%>liDelete';
					document.getElementById(pronm + "ht-image").src = "${pageContext.request.contextPath}/Image/main_bht.png";
					
				} else if (fileName == "main_bht.png") {
					var URL = '<%=notWithFormTag%>liInsert';
					document.getElementById(pronm + "ht-image").src = "${pageContext.request.contextPath}/Image/black_ht.png";
				}
	
				$.ajax({
			        type: 'GET',
			        url: URL,
			        data: { pronm: pronm, mbrid: mbrid },
			        error: function(xhr, status, error) {
			            console.error(error);
			        }
			    });
			}

		</script>
		</section>
		<article></article>
	</main>
</body>
</html>