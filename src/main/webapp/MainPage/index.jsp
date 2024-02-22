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
	/*  display: none;  */
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
	

	
	
	<div id="visibleDiv">
       <jsp:include page="top.jsp" />
    </div>
    
    <div id="hiddenDiv">
        <jsp:include page="hidden_top.jsp" />
    </div>
    
    <!-- 111 : 삭제 -->
    
   <%--  <jsp:include page="hidden_top.jsp" /> --%>
	<!-- <div class="hidden"></div> -->
	
	
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<main class="main">
		
		<aside></aside>
		<section>
			<br>
			<br>
			<br>
			<br>
			<br>
			<!-- 111 : 주석 품  -->
			<video width="100%" src="https://image.nbkorea.com/NBRB_PC/event/imc/ML860v2/video.mp4" autoplay="" loop="" muted="" playsinline=""></video>
			<br><br>
			<div class="middelContents">
				<p style="font-size: 40px;">NEW CLASSIC, NEW STYLE</p>
				<p style="margin-bottom: 30px; font-size: 20px; font-weight: 400;">
					클래식한 디자인과 스타일, 편안한 착화감의 2002를 만나보세요.
				</p>
			</div>
			<br><br>
			<c:forEach var="product" items="${dataList}" varStatus="status">
				<c:if test="${product.PROTP==1}">
					<div class="columnwrap">
						<div class="column">
							<div class="thumbnail">
								<%-- <a href="./img/${list}"> <img src="./img/${list}" alt="Product">--%>
								<div>
									<a  href="<%=notWithFormTag%>DetailProduct&pronm=${product.PRONM}&mbrid=${sessionScope.loginfo.MBRID}"> 
										<img src="${pageContext.request.contextPath}/Image/Detail_main/${product.PROIMG}" alt="Product" class="main-image">
										<c:if test="${product.LK == 'LK'}">
											<img id="${product.PRONM}ht-image" src="${pageContext.request.contextPath}/Image/black_ht.png" alt="ht Icon" style="width: 45px;height: 45px;" class="overlay-image" onclick="fn_lk('${product.PRONM}', 'ht')">
										</c:if>				
										<c:if test="${product.LK != 'LK'}">
											<img id="${product.PRONM}ht-image" src="${pageContext.request.contextPath}/Image/main_bht.png" alt="ht Icon" style="width: 45px;height: 45px;" class="overlay-image"onclick="fn_lk('${product.PRONM}', 'bht')">
										</c:if>
									</a>
								</div>
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
			
			<br><br><br><br><br><br>
			<!-- 111 : 주석 품  -->
			<img width="100%" src="https://image.nbkorea.com/NBRB_Site/20240219/NB20240219105941806001.jpg" alt="">
			
			<br><br><br><br><br><br>
			
			<div class="middelContents">
				<p style="font-size: 40px;">Newbalance lconic, LIFESTYLE</p>
				<p style="margin-bottom: 30px; font-size: 20px; font-weight: 400;">
					뉴발란스 DNA가 현대적인 디자인으로 재해석되어 탄생한 LIFESTYLE을 만나보세요.
				</p>
			</div>
			<br><br>
			<c:forEach var="product" items="${dataList}" varStatus="status">
				<c:if test="${product.PROTP==2}">
					<div class="columnwrap">
						<div class="column">
							<div class="thumbnail">
								<%-- <a href="./img/${list}"> <img src="./img/${list}" alt="Product">--%>
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
			
			<br><br><br><br><br><br>
			<!-- 111 : 주석 품  -->
			<img width="100%" src="https://image.nbkorea.com/NBRB_Site/20240219/NB20240219091039501001.jpg" alt="">
			
			<br><br><br><br><br><br>
			
			<div class="middelContents">
				<p style="font-size: 40px;">Intelligent choice, SANDLE</p>
				<p style="margin-bottom: 30px; font-size: 20px; font-weight: 400;">
					꾸준하게 선택받은 뉴발란스 스테디셀러, SANDLE
				</p>
			</div>
			<br><br>
			<c:forEach var="product" items="${dataList}" varStatus="status">
				<c:if test="${product.PROTP==3}">
					<div class="columnwrap">
						<div class="column">
							<div class="thumbnail">
								<%-- <a href="./img/${list}"> <img src="./img/${list}" alt="Product">--%>
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
			
			<br><br><br><br><br><br>
			<!-- 111 : 주석 품  -->
			<img width="100%" src="https://image.nbkorea.com/NBRB_Site/20240207/NB20240207145257499001.jpg" alt="">
			
			<br><br><br><br><br><br>
			
			<div class="middelContents">
				<p style="font-size: 40px;">1906 Silver Metallic Styling, Sport</p>
				<p style="margin-bottom: 30px; font-size: 20px; font-weight: 400;">
					1906R과 함께한 다양한 스타일링을 만나보세요
				</p>
			</div>
			<br><br>
			<c:forEach var="product" items="${dataList}" varStatus="status">
				<c:if test="${product.PROTP==4}">
					<div class="columnwrap">
						<div class="column">
							<div class="thumbnail">
								<%-- <a href="./img/${list}"> <img src="./img/${list}" alt="Product">--%>
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
	
		</section>
		<article></article>
		
		<script>
			/* 하트 이미지 클릭 시 페이지 이동 안되게 막음 */
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
			
			
			 // 보이는 div와 숨겨진 div 요소를 가져옴
	        var visibleDiv = document.getElementById('visibleDiv');
	        var hiddenDiv = document.getElementById('hiddenDiv');

	        // 스크롤 이벤트에 대한 핸들러 함수
	        function handleScroll() {
	        	// 111 : return; 삭제
	
	            // 스크롤 위치 확인
	            var scrollPosition = window.scrollY;

	            // 스크롤 위치에 따라 보이는 div와 숨겨진 div를 토글
	            if (scrollPosition > 100) { // 스크롤 위치가 100보다 크면 숨겨진 div를 보이게 함
	            	visibleDiv.style.display = 'none';
	                hiddenDiv.style.display = 'block';
	            } else { // 그 외의 경우에는 보이는 div를 보이게 하고 숨겨진 div를 숨김
	            	visibleDiv.style.display = 'block';
	                hiddenDiv.style.display = 'none';
	            }
	        }

	        // 스크롤 이벤트에 핸들러 함수 연결
	        window.addEventListener('scroll', handleScroll);
			
		</script>
	</main>
	
</body>
</html>