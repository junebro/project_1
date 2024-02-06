<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList"%>
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
	
	#topwrap{
	    position: fixed;
	    width: 100%;
	    height: 180px;
	    background-color: white;
	    text-align: center;
	    z-index: 99;
	}
	
</style>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>You and I Shopping</title>
    <link rel="stylesheet" href="./alleffect/main.css">
    <link rel="stylesheet" type="text/css" href="./alleffect/slick.css">
    <link rel="stylesheet" type="text/css" href="./alleffect/SlideImg.css">
    <script src="./alleffect/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="./alleffect/slick.min.js"></script>
   
    
</head>
<body>
	 
   <jsp:include page="top.jsp" />
   <div class="hidden"></div>
   <section class="visual">
      <div><img class="visualImg" src="./img/main1.jpg"></div>
      <div><img class="visualImg" src="./img/main2.jpg"></div>
      <div><img class="visualImg" src="./img/main3.jpg"></div>
      <div><img class="visualImg" src="./img/main4.jpg"></div>
      <div><img class="visualImg" src="./img/main5.jpg"></div>
      <div><img class="visualImg" src="./img/main6.jpg"></div>
      <div><img class="visualImg" src="./img/main7.jpg"></div>
   </section>

    <script type="text/javascript">
      $('.visual').slick();
     </script>
   
    <main class="main">
        <aside></aside>
        <section>
        <div class="middelContents"><p>지금 인기 있는 맞춤 신상품</p></div>
        <c:forEach var="list" items="${imgPath}" varStatus="status">
 				<div class="columnwrap">
					<div class="column">
						<div class="thumbnail">
							<a href="./img/${list}"> <img src="./img/${list}" alt="Product">
								<div class="description">
									<p> 상품 설명 란</p>
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