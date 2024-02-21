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

<c:set var="bean" value="${requestScope.dataList['resultSetPro'][0]}" />
<c:set var="dataList" value="${requestScope.dataList}" />
<c:set var="dataGrade" value="${requestScope.dataGrade}" />
<c:set var="Grade_total" value="${requestScope.Grade_total}" />
<c:set var="rsViews" value="${fn:length(requestScope.dataList['resultSetTotal'])}" />	
<title>상품 상세페이지</title>

</head>
	<script>
		var LK = `${bean.LK}`;

		// 클라이언트 측 JavaScript
		function changeImage(pronm) { 
			
			var mbrid = "${sessionScope.loginfo.MBRID}";
			
			if(!mbrid) {
				if (confirm("로그인이 필요한 서비스입니다.\n로그인 하시곘습니까?")) {
					location.href = '${pageContext.request.contextPath}/Member/loginMain.jsp';
				}
				return;
			}
			
			if (LK) {
				
				var URL = '<%=notWithFormTag%>liDelete';
				LK = null;
				document.getElementById("ht-image").src = "${pageContext.request.contextPath}/Image/bht.png";
				
			} else {
				
				var URL = '<%=notWithFormTag%>liInsert';
				LK = "LK";	
				document.getElementById("ht-image").src = "${pageContext.request.contextPath}/Image/ht.png";
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

	<header>
		<jsp:include page="./../../MainPage/top.jsp" />
	</header>
<body>
	<div class="product_top">
		<div class="big-image-container">
			<img class="big-image" src="${pageContext.request.contextPath}/Image/Detail_main/${bean.PROIMG}" alt="">
		</div>
		<div class="text-container">
			<h1 class="font-top">${bean.PRONM} | ${bean.PROCD}</h1>
			<div class="marketing" id="iconOpt">
				<img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200053137001.png" alt="270130"> 
				<img src="https://image.nbkorea.com/NBRB_Icon/NB20180727200034090001.png" alt="270130">
			</div>
		
			<br>

			<div class="container">
				<div class="top_grade">
					<div class="top_grade_div_1">
						<c:set var="aaa" value="${Math.floor(requestScope.Grade_total)}" />
						<c:set var="bbb" value="${Math.ceil(requestScope.Grade_total)}" />
						<c:forEach var="i" begin="1" end="5">
							<c:if test="${requestScope.Grade_total >= i}">
							   <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 20px; height: 20px;">
								<defs>
									<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
								</defs>
								<use xlink:href="#star-full"/>
							</svg>
							</c:if>
							
							<c:if test="${requestScope.Grade_total < i}">
							    <c:if test="${requestScope.Grade_total - aaa != 0 && i == bbb}">
							    	<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 20px; height: 20px;">
									    <defs>
									        <path id="a" fill="#E8E8E8" d="M10.003 1.667c.27 0 .539.148.677.442l2.165 4.59 4.84.74c.622.095.87.894.42 1.352l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382c0-9.166 0-13.897.002-14.191z"></path>
									        <path id="c" d="M7.157 6.698l2.165-4.59a.746.746 0 0 1 .688-.441c-.007.294-.01 5.025-.01 14.19L5.673 18.24c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
									    </defs>
									    <use xlink:href="#a"></use>
									    <use xlink:href="#c"></use>
									</svg>
							    </c:if>
							    
							    <c:if test="${requestScope.Grade_total - aaa != 0 && i > bbb}">
							    	<c:if test="${requestScope.Grade_total < i}">
										<c:if test="${requestScope.Grade_total < i}">
											<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
												<defs>
													<path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
												</defs>
												<use xlink:href="#star-empty"></use>
											</svg>
										</c:if>
									</c:if>
							    </c:if> 
							    
							    <c:if test="${requestScope.Grade_total - aaa == 0 && requestScope.Grade_total < i}">
							    	<c:if test="${requestScope.Grade_total < i}">
										<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: #000000">
											<defs>
												<path id="star-empty" fill="#E8E8E8" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"></path>
											</defs>
											<use xlink:href="#star-empty"></use>
										</svg>
									</c:if>
							    </c:if> 
							</c:if>
						</c:forEach>
					</div>
					<div class="top_grade_div_2">
						<span>&nbsp;${requestScope.Grade_total}</span>/5 <a>(${rsViews})</a>
					</div>
				</div>
				<div class="a">
					<a><img class="ht-image" id="ht-image" src="" onclick="changeImage('${bean.PRONM}')" /></a>
					&nbsp;&nbsp;<span style="color:#B5B4B4;">|</span>
					<a href="https://www.facebook.com/?locale=ko_KR" target="_blank"><img class="facebook-image" src="${pageContext.request.contextPath}/Image/facebook.png" alt="facebook"></a>
					<a href="https://twitter.com/?lang=ko" target="_blank"><img class="twitter-image" src="${pageContext.request.contextPath}/Image/twitter.png" alt="twitter"></a>	
				</div>
			</div>
			<br>
			<div>
		
				<span id="pro_price" class="price">
					<fmt:formatNumber value="${bean.PROPR}" pattern="###,###" />
				</span>
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
					<c:forEach var="bean_cr" items="${requestScope.dataList['resultSetPro']}" varStatus="status">
						<c:if test="${status.index == 0}">
							<li>
								<%-- <input type="radio" id="colCode_${status.index}" name="pr_color" value="10" checked="checked" />--%> 
								<input type="radio" id="${bean_cr.PROCD}" name="pr_color" value="10" checked="checked" /> 
								<label for="${bean_cr.PROCD}" title="${bean_cr.PROCR}" onclick="test('${bean_cr.PROCR}')">
									<img src="${pageContext.request.contextPath}/Image/Detail_main/${bean_cr.PROIMG}" alt="${bean_cr.PROCR}" />
								</label>
							</li>
						</c:if>
						
						<c:if test="${status.index != 0}">
							<li>
								<input type="radio" id="${bean_cr.PROCD}" name="pr_color" value="10" /> 
								<label for="${bean_cr.PROCD}" title="${bean_cr.PROCR}" onclick="test('${bean_cr.PROCR}')">
									<img src="${pageContext.request.contextPath}/Image/Detail_main/${bean_cr.PROIMG}" alt="${bean_cr.PROCR}" />
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
				<button class="btn_white btn_Basket" onclick="fn_buy('c')">장바구니</button>
				<button class="btn_buy" onclick="fn_buy('b')">구 매</button>
			</div>
		</div>
	</div>

	<script>
		// 첫 시작 찜이미지 설정
		var LK = `${bean.LK}`;
		var chk = document.getElementById("ht-image").src;
		
		if (LK) {
			document.getElementById("ht-image").src = "${pageContext.request.contextPath}/Image/ht.png";
		} else {
			document.getElementById("ht-image").src = "${pageContext.request.contextPath}/Image/bht.png";
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
			var buy_price = color + '/buy_price/' + size;
			
			var cnt = document.getElementById(cnt_total);
			var buyprice = document.getElementById(buy_price);

			var num = cnt.innerText;
			var total_num = total_qt.innerText;
			
			var id_price = document.getElementById('pro_price');	     
			var total_price = document.getElementById('total_price');
			
			var price = parseInt(id_price.innerHTML.replace(/,/g, ''), 10);

			var S_key = color + '/' + size;
			var size_key = document.getElementById(S_key);
			var sz = size_key.innerHTML; 
			
			if(type === 'plus') {
				
				if (sz == '5') {
					alert("해당 상품은 최대 5pcs까지 구매 가능합니다.");
					return;
				}
				
				num = parseInt(num) + 1;
				total_num = parseInt(total_num) + 1
				
			} else if(type === 'minus')  {
				
				if(num > 1) {
					num = parseInt(num) - 1;
					total_num = parseInt(total_num) - 1;
				} 
			}
			
			total_qt.innerText = total_num;
			cnt.innerText = num;
	
			buyprice.innerText = price * num;
			
			var sum = price * total_num;
			var integerValue = parseInt(sum, 10);
		    var formattedValue = integerValue.toLocaleString();
		    
		    total_price.innerText = formattedValue;
			
			//total_price.innerText = price * total_num;
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
			var price = parseInt(id_price.innerHTML.replace(/,/g, ''), 10);
			var total_price = document.getElementById('total_price');	     
			
			if (Div) {
				Div.remove();
				total_qt.innerText = total - cnt;
				//total_price.innerText = total_price.innerText - (price * cnt);
				
				var innerHTMLValue = total_price.innerText;
			    var integerValue = parseInt(innerHTMLValue.replace(/,/g, ''), 10);

				var sum = integerValue - (price * cnt);
				var integerValue = parseInt(sum, 10);
			    var formattedValue = integerValue.toLocaleString();
			    
			    total_price.innerText = formattedValue;
			}
		}

		var count = 0;
		
		function sizeBuy(size) {
			
			var check_id = document.querySelector('input[name="pr_color"]:checked').id;
			
			var total_qt = document.getElementById('total_qt');
			var total_num = total_qt.innerText;
			
			var id_price = document.getElementById('pro_price');	     
			var price = parseInt(id_price.innerHTML.replace(/,/g, ''), 10);
			var can = document.getElementById('color_area_color');
			var color = can.innerText;
 
			var S_key = color + '/' + size;
			var size_key = document.getElementById(S_key);
			var can = document.getElementById('buy_name' + size);
			
			if (size_key) {
				
				var sz = size_key.innerHTML; 
				
				if (sz == '5') {
					alert("해당 상품은 최대 5pcs까지 구매 가능합니다.");
					return;
				}
				var buy_price = color + '/buy_price/' + size;
				var buyprice = document.getElementById(buy_price);
				
				var cnt = size_key.innerText;
				cnt = parseInt(cnt) + 1;
				buyprice.innerText = price * cnt;
				size_key.innerText = cnt;
				
			} else {
				
				var total_class = document.getElementById('total_class');
				total_class.style.display = '';

				// 클릭한 상품의 정보를 가져와서 상세 정보를 표시하는 div에 추가
				var productDetailsDiv = document.getElementById('sourceDiv');
				var newProductDiv = document.createElement('div');
	
				var subDiv1 = document.createElement('div');
	
			    subDiv1.id = color + '/buy_payment/' + size; 
			    //subDiv1.classList.add('payment_d');  		    
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
				
				var subDiv11 = document.createElement('div');
				subDiv11.id = color +'/' + check_id + '/' + size;  
				subDiv11.classList.add('payment_d');
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
				subDiv1.appendChild(subDiv11);
			    newProductDiv.appendChild(subDiv1);
			    productDetailsDiv.appendChild(newProductDiv);
	
				count ++;
			}

			total_num = parseInt(total_num) + 1
			total_qt.innerText = total_num;
			
			var total_price = document.getElementById('total_price');	     
			
			var sum = price * total_num;
			var integerValue = parseInt(sum, 10);
		    var formattedValue = integerValue.toLocaleString();
		    
		    total_price.innerText = formattedValue;
		   // total_price.innerText = price * total_num;
			
			/*
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
	        total_qt.innerHTML = price;*/
		}
		 
		
		function fn_buy(t) {
			
			var mbrid = "${sessionScope.loginfo.MBRID}";
			
			if(!mbrid) {
				if (confirm("로그인이 필요한 서비스입니다.\n로그인 하시곘습니까?")) {
					location.href = '${pageContext.request.contextPath}/Member/loginMain.jsp';
				}
				return;
			}
	
			var parent_div = document.getElementById('sourceDiv');

            var child_div = parent_div.getElementsByClassName('payment_d');
            var child_qt = parent_div.getElementsByClassName('buy_qt');
            var child_cnt = child_div.length;
			var submit = [];
			
			if ( child_cnt > 0 ) {
	
				for (var i = 0; i < child_cnt; i++) {
	                var childDiv = child_div[i];
	                var childqt = child_qt[i].innerText;
	                var childId = childDiv.id;
	                submit.push(childId + '/' + childqt);
	            }
				
				if (t == "b") {
					var url = '<%=notWithFormTag%>OrderC&submit=' + submit.join(',');
					location.href = url
					
				} else if (t == "c") {
					var url = '<%=notWithFormTag%>cartInsert&submit=' + submit.join(',');
					location.href = url
				}  
	
			} else {
				alert("상품을 선택해 주세요.");
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
			<li class="active">
				<a id="text-to-change" href="#pr_details" data-gtag-idx="fo_detail_3" data-gtag-label="상품정보">상품정보</a>
			</li>
			<li>
				<a href="#pr_main_review" data-gtag-idx="fo_detail_3" data-gtag-label="상품리뷰" id="view_top"></a>
			</li>
			<li>
				<a href="#pr_inquiry" data-gtag-idx="fo_detail_3" data-gtag-label="상품문의">상품문의 </a>
			</li>
		</ul>
		<hr style="width:100%">
	</div>

	<div class="product_bottom">
		<div class="sticky_wrap" style="top: 0px;">
		

			<div id="pr_details" style="margin-bottom:100px; text-align:center" id="prodAddInfo_wrap">
				<br><br><br><br><br>
				<img src="${pageContext.request.contextPath}/Image/Details/${bean.PROIMG1}">
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
					<h3 id="view_tit" class="view_tit"></h3>
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
									${requestScope.Grade_total}
								</div>
							</div>
							<div class="view_left_bottom">
								<span class="font_pro font_pro_view_left_bottom">${requestScope.dataGrade.get(0).PER}%</span>의 구매자가 이 상품을 좋아합니다.
							</div>
						</div>
						<div class="view_center"></div>
						<div class="view_right">
							<table width=330px; align="center">
								<c:forEach var="Grade" items="${requestScope.dataGrade}" varStatus="status">
								<tr>
									<td  class="progress_td">${Grade.TEXT}</td>
									<td>
										<div class="progress-bar">
											<div class="progress" style="width: ${Grade.PER}%;"></div>
											<div class="percentage"></div>
										</div>
									</td>
									<td class="progress_td">${Grade.COUNT}</td>
								</tr>
								</c:forEach>
							</table>
						</div>
					</div>
					
					<div class="view_line"></div>
					
					<div class="view_hr_bt">
						<br>
						
						<div class="selectbox sel_color">
							<label>색상</label> 
							<select id="sel_color" name="sel_color">
								<option value ="" select>색상</option>
								<c:forEach var="bean_cr" items="${requestScope.dataList['resultSetPro']}" varStatus="status">
									<option value="${bean_cr.PROCR}">${bean_cr.PROCR}</option>
								</c:forEach>
							</select>
						</div>
						<div class="selectbox selectbox_star sel_color">
						<label>별점</label> 
						<select id="sel_star" name="sel_star" class="all_star">
							<option value ="" selected="selected" >별점</option>
							<option value="5">&#xf005 &#xf005 &#xf005 &#xf005 &#xf005</option>
							<option value="4">&#xf005 &#xf005 &#xf005 &#xf005</option>
							<option value="3">&#xf005 &#xf005 &#xf005</option>
							<option value="2">&#xf005 &#xf005</option>
							<option value="1">&#xf005</option>
						</select>
						</div>
						
						<button onclick="review_search('${bean.PRONM}')" class="btn_black btn_select">검 색</button>
						<br><br>
						<div class="view_line"></div>
					</div>
					<div id="refreshableContent">
						<jsp:include page="./DetailReviews.jsp" />
					</div>
				</div>
			</div>
			
			<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
			<script>
				
				var rsViews = ${rsViews};
				
				var view_tit = document.getElementById("view_tit");
				var view_top = document.getElementById("view_top");
				
				view_tit.innerHTML = "REVIEW("+rsViews+")";
				view_top.innerHTML = "상품리뷰("+rsViews+")";
				
				function review_search(PRONM){ /* 전체 검색 */
					<%-- location.href = '<%=notWithFormTag%>DetailProduct' ; --%>
					var sel_star = document.getElementById("sel_star");
					var sel_color = document.getElementById("sel_color");
					
					var star = sel_star.value;
					var color = sel_color.value;
					
					var URL = '<%=notWithFormTag%>DetailReviews&pronm=' + PRONM + '&sel_star=' + star + '&sel_color=' + color;
					$.ajax({
			            url: URL,
			            type: "POST",
			            success: function(data) {
			                // 서버로부터 받은 내용으로 갱신
			                $("#refreshableContent").html(data);
			            },
			            error: function() {
			                alert("새로고침에 실패했습니다.");
			            }
			        });
				}

			    function gotoPage(pageNumber, pageSize) {
			    	
			    	var sel_star = document.getElementById("sel_star");
					var sel_color = document.getElementById("sel_color");
				
					var PRONM = `${bean.PRONM}`;
					var star = sel_star.value;
					var color = sel_color.value;
					
			        var URL = '<%=notWithFormTag%>DetailReviews&pronm=' + PRONM + '&sel_star=' + star + '&sel_color=' + color + '&pageNumber=' + pageNumber + '&pageSize=' + pageSize;
					
			        $.ajax({
			            url: URL,
			            type: "POST",
			            success: function(data) {
			                // 서버로부터 받은 내용으로 갱신
			                $("#refreshableContent").html(data);
			            },
			            error: function() {
			                alert("새로고침에 실패했습니다.");
			            }
			        });
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
								<a href="${pageContext.request.contextPath}/board/start.jsp" class="inq_a_btn">자주 묻는 질문 찾기 </a> 
								<a href="${pageContext.request.contextPath}/board/start.jsp" class="inq_a_btn">1:1 문의하기</a>
							</div>
						</div>
					</div>
					<div class="grid_btm"></div>
				</div>
				<br><br>
				<hr>
				<br><br><br><br><br><br>
			</div> 
			
		</div>
	</div>

	<footer>
		<jsp:include page="./../../MainPage/footer.jsp" />
	</footer>

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
