<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
// appName : 애플리케이션 컨텍스트 이름(프로젝트 이름)
String appName = request.getContextPath();
String mappingName = "/Shopping_project"; // in FrontController.java file

// 폼 태그에서 사용할 전역 변수
String withFormTag = appName + mappingName;

// 폼 태그가 아닌 곳에서 사용할 전역 변수
String notWithFormTag = withFormTag + "?command=";

//out.print("컨텍스트 이름 : " + appName + "<br/>");
//out.print("mappingName : " + mappingName + "<br/>");
//out.print("withFormTag : " + withFormTag + "<br/>");
//out.print("notWithFormTag : " + notWithFormTag + "<br/>");
%>
<style>
#topwrap{
	font-family: 'Noto Sans KR', sans-serif;
}
.menuwrap {
	width: 100%;
	text-align: center;
	margin-top: 100px;
}

.hidden {
	width: 100%;
	height: 181px;
	margin: 0 0 10px 0;
	/* border-bottom: 20px solid rgb(0,0,0); */
	/* border: 2px solid rgb(192, 192, 192); */
}
.topmenu ul {
	list-style: none;
	float: right;
	margin-right: 10px;
}

.topmenu li {
	display: inline-block;
	border-right: 0px solid rgba(128, 128, 128, 0.5);
	height: 20px;
}

.topmenu li:hover {
	font-weight: bold;
	color: rgb(23, 84, 176);
}

.topmenu .libt:hover {
	font-weight: bold;
	color: rgb(23, 84, 176);
}

.libt {
	border: 0;
	outline: 0;
	background-color: white;
	color: rgba(128, 128, 128);
	font-size: 13px;
}
/*
	header{
	    opacity: 0.7;
	    clear: both;
	    background-color: lightslategrey;
	    text-align: center;
	    padding: 25px;
	}
	*/

/* Style The Dropdown Button */
.dropbtn {
	background-color: rgb(255, 255, 255); /*#191970*/
	/*border-bottom: 5px solid rgb(64, 0, 0);*/
	/*border-right: 3px solid #000000;*/
	color: rgb(106, 106, 106);
	padding: 5px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	/*border-radius: 10%;*/
	width: 90px;
	border: none;
}

.dropbtn a {
	color: #000;
	text-decoration: none;
	text-align: center;
	font-size: 20px;
	font-weight: bolder;
	cursor: pointer;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
	font-size: 50px;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	/*box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);*/
	z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: rgb(64, 0, 128);
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: rgb(0, 0, 0);
	color: white;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

/* Change the background color of the dropdown button when the dropdown content is shown */
.dropdown:hover .dropbtn {
	background-color: #666666;
	color: #e6e6fa;
}

/* 회색선 */
.underline {
	border-bottom: 1px solid rgba(128, 128, 128, 0.5); /* 투명도를 포함한 회색 선 */
	margin-bottom: 10px; /* 선 위의 간격 조절 */
	margin-top: 20px; /* 선 위의 간격 조절 */
}

section {
	font-family: 'Kanit', sans-serif;
}

#topimage {
	width: 300px;
	height: 150px;
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Kanit:wght@300&display=swap"
	rel="stylesheet">
<script type="text/javascript">
	function call_confirm() {
		if (confirm("로그인 하시겠습니까?")) {
			location.href = '${pageContext.request.contextPath}/Member/loginMain.jsp';
		}
	}	
</script>
<section id="topwrap">
	<nav class="topmenu">
		<ul>
			<li><button type="button" onclick="location.href='${pageContext.request.contextPath}/Member/MemberJoin.jsp'"
							class="libt">회원가입&nbsp;</button></li>
			<c:choose>
				<c:when test="${sessionScope.loginfo.MBRID != null}">
				<li><button type="button" onclick="location.href = '<%=notWithFormTag%>meLogout'"
							class="libt">로그아웃&nbsp;</button></li>
					<li><button type="button" onclick="location.href ='${pageContext.request.contextPath}/Member/MyCart.jsp'"
							class="libt">장바구니&nbsp;</button></li>
					<li><button type="button" onclick="location.href ='${pageContext.request.contextPath}/MyPage/MyPageM.jsp'"
							class="libt">주문조회&nbsp;</button></li>
					<li><button type="button" onclick="location.href ='${pageContext.request.contextPath}/MyPage/MyPageM.jsp'"
							class="libt">최근본상품&nbsp;</button></li>
					<li><button type="button" onclick="location.href ='${pageContext.request.contextPath}/MyPage/MyPageM.jsp'"
							class="libt">고객센터&nbsp;</button></li>
				</c:when>
				<c:otherwise>
					<li><button type="button" onclick="location.href='${pageContext.request.contextPath}/Member/loginMain.jsp'"
							class="libt">로그인&nbsp;</button>
					</li>
					<li><button type="button" onclick="call_confirm()"
							class="libt">장바구니&nbsp;</button></li>
					<li><button type="button" onclick="call_confirm()"
							class="libt">주문조회&nbsp;</button></li>
					<li><button type="button" onclick="call_confirm()"
							class="libt">최근본상품&nbsp;</button></li>
					<li><button type="button" onclick="call_confirm()"
							class="libt">고객센터&nbsp;</button></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
	<br>
	<div
		style="display: flex; justify-content: center; width: 100%; background-color: white;">
		<img id="topimage" style="cursor: pointer"
			src="${pageContext.request.contextPath}/Image/2main.png" onclick="location.href='${pageContext.request.contextPath}/MainPage/index.jsp'"> <br>
	</div>


	<!-- <header>
    </header> -->
	<div style="background-color: white;">
		<div class="dropdown">
			<button class="dropbtn"
				onclick="location.href='${pageContext.request.contextPath}/MainPage/index.jsp'">Home</button>
		</div>

		<div class="dropdown">
			<button class="dropbtn"
				onclick="location.href='${pageContext.request.contextPath}/MainPage/Running.jsp'">Running</button>
			<!-- 
          <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
          </div>-->
		</div>

		<div class="dropdown">
			<button class="dropbtn"
				onclick="location.href='${pageContext.request.contextPath}/MainPage/LifeStyle.jsp'">LifeStyle</button>
			<!-- 
          <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
          </div>-->
		</div>

		<div class="dropdown">
			<button class="dropbtn"
				onclick="location.href='${pageContext.request.contextPath}/MainPage/Sandle.jsp'">Sandle</button>
			<!-- 
          <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a> 
              <a href="#">Link 3</a>
          </div>-->
		</div>

		<div class="dropdown">
			<button class="dropbtn"
				onclick="location.href='${pageContext.request.contextPath}/MainPage/Sport.jsp'">Sport</button>
			<!-- 
          <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
          </div>-->
		</div>

		<div class="dropdown">
			<button class="dropbtn"
			onclick="location.href='${pageContext.request.contextPath}/board/start.jsp'">Board</button>
			<!--	/board/start.jsp
			
            <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
            </div>-->
		</div>
		<div class="underline"></div>
	</div>
</section>
