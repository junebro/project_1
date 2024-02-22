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





.footer {
	background-color: #3c3c3c;
}

.footer_main {
	display: flex;
	color:#898989; 
	font-family: 'Noto Sans KR', sans-serif;
	font-size:12px;
	justify-content: space-between;
}

.copyright a{
	text-decoration: none; /* 밑줄 제거 */ 
	color:#898989; 
}

.isms {
	font-family: 'Noto Sans KR', sans-serif;
	font-size:12px;
	color:#898989; 
	display: flex;
	text-align:left;
	justify-content: space-between;
}
.copyright {
	text-align:left;
}

.foot_menu {
	display: flex;
	justify-content: space-between;
}

.list {
	text-align: left;
}

.list a{
	color: inherit; /* 부모 요소의 색을 상속받음 */
  	text-decoration: none; /* 밑줄 제거 */ 
}

.list ul {
	text-align: left;
	list-style-type: none; /* 목록 마커 제거 */
	margin-right: 50px; /* 각 항목 사이의 간격 설정 */
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
    <jsp:include page="top.jsp" />
    
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
			<!-- <video width="100%" src="https://image.nbkorea.com/NBRB_PC/event/imc/ML860v2/video.mp4" autoplay="" loop="" muted="" playsinline=""></video> -->
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
											NEW
										</c:if>
									</div>
										<c:if test="${product.PRODT == 'new' && product.RVWGR > 3.5}">
											&nbsp|&nbsp
										</c:if>
									<div class="color_div_left">
										<c:if test="${product.RVWGR > 3.5}">
										BEST
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
			<!-- <img width="100%" src="https://image.nbkorea.com/NBRB_Site/20240219/NB20240219105941806001.jpg" alt="">
			
			<br><br><br><br><br><br> -->
			
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
											NEW
										</c:if>
									</div>
										<c:if test="${product.PRODT == 'new' && product.RVWGR > 3.5}">
											&nbsp|&nbsp
										</c:if>
									<div class="color_div_left">
										<c:if test="${product.RVWGR > 3.5}">
										BEST
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
			<!-- <img width="100%" src="https://image.nbkorea.com/NBRB_Site/20240219/NB20240219091039501001.jpg" alt="">
			
			<br><br><br><br><br><br> -->
			
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
											NEW
										</c:if>
									</div>
										<c:if test="${product.PRODT == 'new' && product.RVWGR > 3.5}">
											&nbsp|&nbsp
										</c:if>
									<div class="color_div_left">
										<c:if test="${product.RVWGR > 3.5}">
										BEST
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
			<!-- <img width="100%" src="https://image.nbkorea.com/NBRB_Site/20240207/NB20240207145257499001.jpg" alt="">
			
			<br><br><br><br><br><br> -->
			
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
											NEW
										</c:if>
									</div>
										<c:if test="${product.PRODT == 'new' && product.RVWGR > 3.5}">
											&nbsp|&nbsp
										</c:if>
									<div class="color_div_left">
										<c:if test="${product.RVWGR > 3.5}">
										BEST
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
			<%-- <jsp:include page="footer.jsp" /> --%>
	
			<div class="footer">
				<br><br>
				<div class="footer_main">
					<div></div>
					<div class="foot_menu">
						<div class="list">
							<ul> <strong style="color:white;">NEED HELP</strong>
								<li>&nbsp;</li>
								<li><a href="/support/callCenter.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="고객센터">고객센터</a></li>
								<li><a href="/support/searchFaqList.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="FAQs">FAQs</a></li>
								<li><a href="/support/searchNoticeList.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="공지사항">공지사항</a></li>
								<li><a href="/my/qna/searchQuestionList.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="1:1문의">1:1 문의</a></li>
								<li><a href="/support/searchShopList.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="매장찾기">매장 찾기</a></li>
								<li><a href="/support/appDownload.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="App다운로드">App 다운로드</a></li>
							</ul>
						</div>
						<div class="list">
							<ul> <strong style="color:white;">INFORMATION</strong>
								<li>&nbsp;</li>
								<li><a href="/support/mileage.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="통합 마일리지 안내">통합 마일리지 안내</a></li>
								<li><a href="/support/teamwearOrder.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="팀/단체복 주문안내">팀/단체복 주문안내</a></li>
								<li><a href="/support/dlvy.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="배송 및 반품 안내">배송 및 반품 안내</a></li>
								<li><a href="/support/wash.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="세탁 및 손질 방법 안내">세탁 및 손질 방법 안내</a></li>
								<li><a href="/support/terms.action?tabCode=AT" data-gtag-idx="fo_common_footer_2" data-gtag-label="이용약관">이용약관</a></li>
								<li><a href="/common/SiteMap.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="SITE MAP">SITE MAP</a></li> 
							</ul>
						</div>
						<div class="list">
							
							<ul> <strong style="color:white;">INSIDE NB</strong>
								<li>&nbsp;</li>
								<li><a href="/support/insideNB.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="INSIDE NB">INSIDE NB</a></li>
								<li><a href="/collection/madeusauk.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="MADE IN USA/UK">MADE IN USA ⁄ UK</a></li>
								<li><a href="/collection/nbx.action" data-gtag-idx="fo_common_footer_2" data-gtag-label="NBx GUIDE">NBx GUIDE</a></li>
							</ul>
						</div>
					</div>
					<div class="foot_info">
						<!-- 20200709 수정 :: S -->
						<!-- <div class="sns">
			          		<a href="https://www.instagram.com/newbalance/" target="_blank" class="in"><span class="blind">INSTAGRAM</span></a>
			          		<a href="https://www.instagram.com/nbrc_seoul/" target="_blank" class="nbrc"><span class="blind">NBRC</span></a>
							<a href="https://www.facebook.com/nbkorea.LS" target="_blank" class="fb"><span class="blind">FACEBOOK</span></a>
							<a href="https://www.youtube.com/user/nbkorea" target="_blank" class="yt"><span class="blind">YOUTUBE</span></a>						
							<a href="https://blog.naver.com/nb_lifestyle" target="_blank" class="nb_l">NB LIFE STYLE</a>
							<a href="https://blog.naver.com/nbkids" target="_blank" class="nb_k">NB KIDS</a>
						</div> -->
			          	<!-- 20200709 수정 :: E -->
						<div class="copyright">
							<p>
								<a  style="color:white; font-size:14px;" href="/support/terms.action?tabCode=PP" class="c_link" data-gtag-idx="fo_common_footer_2" data-gtag-label="개인정보 처리방침"><span>개인정보 처리방침</span></a> / <a href="/support/terms.action?tabCode=AT" class="c_link" data-gtag-idx="fo_common_footer_2" data-gtag-label="이용약관">이용약관</a> / ㈜이랜드월드패션사업부 / 서울특별시 금천구 가산디지털1로 159 이랜드월드
								<br>
								온라인 고객센터 : 1566-0086, AS/오프라인 고객센터 : 080-999-0456
								<br>
								대표 이메일 : <a href="mailto:webmaster@nbkorea.com" data-gtag-idx="fo_common_footer_2" data-gtag-label="대표이메일">webmaster@nbkorea.com</a>
								<br>
								호스팅 서비스 제공자 : (주)라드씨엔에스 <!--20210311 추가-->
							</p>
							<p>
								<span>대표이사 : 최운식</span> <span>사업자등록번호 : 113-85-19030</span> <span>통신판매업신고 : 금천구청 제 2005-01053 </span>
								<br><span>개인정보보호책임자 : 최운식&nbsp;&nbsp;</span><a style="color:white; font-size:14px; text-decoration: underline;"  href="#" class="btn_line" onclick="window.open('https://www.ftc.go.kr/bizCommPop.do?wrkr_no=1138519030', 'bizCommPop', 'scrollbars=yes,width=750, height=700;'); return false;">사업자정보조회</a>
								<br>온라인디지털콘텐츠산업발전법에 의한 <a  style="color:white; font-size:14px; text-decoration: underline;" href="javascript:;" onclick="fnLayerPopOpenForContentsPolicy()" class="btn_line">콘텐츠보호안내 자세히보기</a>
							</p>
						</div>
					</div>
					<div></div>
				</div>
				<!-- 20200519 추가 :: S -->
				<br>
				<div class="isms">
					<div></div>
					<div class="isms">
						<div>
							<p class="isms_img">
								<a href="https://isms.kisa.or.kr/main/ispims/intro/" target="_blank">
									<img src="https://image.nbkorea.com/NBRB_PC/common/ISMS-P.png" alt="isms-p">
								</a>
							</p>
						</div>
						<div>&nbsp;&nbsp;&nbsp;&nbsp;</div>
						<div>
							<span style="display: block;">[인증범위] 이랜드월드 온라인 서비스 운영</span>
							<span style="display: block;">[유효기간] 2023.05.03~2026.05.02</span>
							<p class="copy">Copyright 2018. New Balance</p>
						</div>
						<!-- 20200519 추가 :: E -->
						
						
					</div>
					<div></div>
				</div>
				
				<br><br>
			</div>
		</section>
		<article></article>
		
		<script>
			/* 하트 이미지 클릭 시 페이지 이동 안되게 막음*/
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
	        	return;
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