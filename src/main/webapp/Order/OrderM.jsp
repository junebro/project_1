<%@page import="java.util.ArrayList"%>
<%@page import="com.shopping.model.bean.Product"%>
<%@page import="com.shopping.model.bean.Cart"%>
<%@page import="com.shopping.model.dao.CartDao"%>
<%@page import="com.shopping.model.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ include file="./../common/common.jsp"%>
<%@ page import="com.shopping.model.dao.OrderDao"%>
<%@ page import="com.shopping.model.bean.Order"%>
<%@ page import="com.shopping.model.bean.Member"%>

<%
OrderDao dao = new OrderDao();
Order bean = new Order();
Member beanM = new Member();
MemberDao mdao = new MemberDao();

session.getAttribute("MBRID");
session.getAttribute("loginfo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 정보1</title>
<link href="TabMenuCss.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;500&display=swap"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="jquery.js"></script>
<script src="parsley.min.js"></script>
<script type="text/javascript">
	/* 데이터 전송 시 오류에 대한 함수 */
	$(document)
			.ready(
					function() {
						var newph = "필수 입력 사항입니다."
						// 결제 버튼을 클릭 시 값이 비어있을 경우 작동하는 함수
						$('#buy')
								.click(
										function() {
											// 입금자 정보가 비어있을 시
											if ($('#inputdp').val() == ''
													&& document
															.getElementById('tab1-li').classList
															.contains('selected')) {
												$('#inputdp').addClass(
														'focusError');
												document.getElementById(
														'inputdp').focus();
												$('#inputdp').attr(
														'placeholder', newph);
												return false;
											} else {
												$('#inputdp').removeClass(
														'focusError');
												$('#inputdp').removeAttr(
														'placeholder', newph);
											}
											// 비회원 주문자 번호가 비어있을 시
											if ($('#inputpn2').val() == '') {
												$('#inputpn2').addClass(
														'focusError');
												document.getElementById(
														'inputpn2').focus();
												$('#inputpn2').attr(
														'placeholder', newph);
												return false;
											} else if ($('#inputpn2').val().length < 8) { // 비회원 주문자 번호가 8글자미만일시
												alert('너무 짧습니다.');
												$('#inputpn2').addClass(
														'focusError');
												document.getElementById(
														'inputpn2').focus();
												$('#inputpn2').attr(
														'placeholder', newph);
											} else {
												$('#inputpn2').removeClass(
														'focusError');
												$('#inputpn2').removeAttr(
														'placeholder', newph);
											}
											// 상세주소가 비어있을 시
											if ($('#address-2').val() == '') {
												$('#address-2').addClass(
														'focusError');
												document.getElementById(
														'address-2').focus();
												$('#address-2').attr(
														'placeholder', newph);
												return false;
											} else {
												$('#address-2').removeClass(
														'focusError');
												$('#address-2').removeAttr(
														'placeholder', newph);
											}
											// 받는사람 정보가 비어있을 시
											if ($('#inputrc').val() == '') {
												$('#inputrc').addClass(
														'focusError');
												document.getElementById(
														'inputrc').focus();
												$('#inputrc').attr(
														'placeholder', newph);
												return false;
											} else {
												$('#inputrc').removeClass(
														'focusError');
												$('#inputrc').removeAttr(
														'placeholder', newph);
											}

											/* 주문자 이메일이 비어있을 시
											if ($('#inputemail').val() == '') {
												$('#inputemail').addClass('focusError');
												document.getElementById('inputemail').focus();
												$('#inputemail').attr('placeholder', newph);
												return false;
											}else{
												$('#inputemail').removeClass('focusError');
												$('#inputemail').removeAttr('placeholder', newph);
											}
											// 주문자 정보가 비어있을 시
											if ($('#inputid').val() == '') {
												$('#inputid').addClass('focusError');
												document.getElementById('inputid').focus();
												$('#inputid').attr('placeholder', newph);
											}else{
												$('#inputid').removeClass('focusError');
												$('#inputid').removeAttr('placeholder', newph);
												return false;
											}*/
											return true;
										});
						/* 새로 만든 탭 메뉴 함수  */
						$("input").addClass("form-control");
						var displayController = 'display:none;'
						var displayOn = 'display:block;'
						$('#tab1click').click(function() {
							$('#tab1-li').addClass('selected')
							$('#tab1').attr('style', displayOn)
							$('#tab2-li').removeClass('selected')
							$('#tab2').attr('style', displayController)
							$('#tab3-li').removeClass('selected')
							$('#tab3').attr('style', displayController)
						})
						$('#tab2click').click(function() {
							$('#tab1-li').removeClass('selected')
							$('#tab1').attr('style', displayController)
							$('#tab2-li').addClass('selected')
							$('#tab2').attr('style', displayOn)
							$('#tab3-li').removeClass('selected')
							$('#tab3').attr('style', displayController)
						})
						$('#tab3click').click(function() {
							$('#tab1-li').removeClass('selected')
							$('#tab1').attr('style', displayController)
							$('#tab2-li').removeClass('selected')
							$('#tab2').attr('style', displayController)
							$('#tab3-li').addClass('selected')
							$('#tab3').attr('style', displayOn)
						})
					});

	/* 이전 탭 메뉴 함수 */
	$(function() {
		$("#tabs").tabs().addClass("ui-tabs-vertical ui-helper-clearfix");
		$("#tabs li").removeClass("ui-corner-top").addClass("ui-corner-left");
	});
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('zip-code').value = data.zonecode;
				document.getElementById('address-1').value = data.address;
			}
		}).open();
	}
</script>
<style>
div .menu {
	list-style-type: none;
}

/* 메뉴 탭에 대한 css */
#tab1, #tab2, #tab3 {
	width: 100%;
	display: none;
}

.ec-base-tab {
	position: relative;
}

.ec-base-tab .menu {
	border: 1px solid #cbcdce;
	border-bottom-color: #202020;
	background: white;
	box-sizing: border-box;
}

.ec-base-tab .menu:after {
	content: "";
	display: block;
	clear: both;
}

.ec-base-tab .menu div {
	float: left;
	border-left: 1px solid #cbcdce;
	background: #f2f2f2;
}

.ec-base-tab .menu div a {
	display: block;
	min-width: 187px;
	margin: 0 0 0 -1px;
	padding: 12px 5px 11px;
	border-right: 1px solid #cbcdce;
	color: #707070;
	text-decoration: none;
	outline: 0;
	text-align: center;
	background: white;
}

.ec-base-tab .menu div.selected a {
	position: relative;
	top: -1px;
	left: -2px;
	margin: 0 0 -1px;
	border: 1px solid #202020;
	border-bottom: 0;
	color: #fff;
	font-weight: bold;
	background: #4a5164;
}

.ec-base-tab .menu div.selected:first-child a {
	left: -1px;
}

tr, input, select {
	height: 50px;
	width: 100%;
}

.distinct {
	/* 구분선 스타일 */
	border-bottom: 1px solid rgba(128, 128, 128, 0.5);
	margin-top: 10px;
}

.info {
	background-color: #CCFFFF;
	opacity: 1;
	font-weight: none;
	font-size: 12px;
}

.icon {
	width: 30px;
	height: 30px;
}

.mar {
	margin-left: 15px;
}

.col-12 button {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1em;
	cursor: pointer;
	border-width: thin;
}

.paymentbar {
	text-align: center;
}

.btn_black {
	margin-bottom: 30px;
	padding: 5px 10px;
	background-color: #000000;
	color: #ffffff;
}

.focusError {
	border-color: red;
	color: red;
}

.focusError::placeholder {
	color: red;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}
/* 별점 css */
#myform fieldset {
	display: inline-block;
	direction: rtl;
	border: 0;
}

#myform fieldset legend {
	text-align: right;
}

#myform input[type=radio] {
	display: none;
}

#myform label {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
}

#myform label:hover {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform label:hover ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#myform input[type=radio]:checked ~ label {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#reviewContents {
	width: 100%;
	height: 150px;
	padding: 10px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
	resize: none;
}

td span {
	display: block;
	margin-bottom: 10px; /* 간격을 조절할 수 있는 값 */
}

.inputTypeTextPay {
	width: 100%;
	height: 50px;
	text-align: right;
}

#buy {
	width: 100%;
	height: 100px;
	font-size: 24px;
}
</style>

</head>

<%
Order oBean = new Order();
OrderDao oDao = new OrderDao();
String MBRID = session.getAttribute("loginfo").toString();
%>
<body>
	<header>
		<jsp:include page="./../MainPage/top.jsp" />
	</header>
	<div class="justify-content-center row">
		<div class="col-7">
			<nav class="navbar navbar-expand-sm text-center">
				<ul class="navbar-nav mx-auto">
					<li class="nav-item"><p class="nav-link"
							style="font-size: 30px;">주문/결제</p></li>
				</ul>
			</nav>
		</div>
	</div>
	<div class="justify-content-center row">
		<div class="container col-7">
			<table class="col-12">
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 80%">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<h4 style="margin: 20px;">회원정보</h4>
						</td>
					</tr>
					<tr style="height: 50px">
						<td><span class="mar">주문자</span></td>
						<td><input id="inputid" placeholder="회원 정보를 통해 입력" size="15"
							value="${sessionScope.loginfo.MBRID}" name="MBRNM" type="text"
							style="width: 100%;" class="form-control"></td>
					</tr>
					<tr>
						<td><span class="mar">이메일</span></td>
						<td>
							<div class="input-group mt-3 mb-3 input-group-prepend">
								<input id="inputemail" style="width: 100%" type="text"
									value="${sessionScope.loginfo.MBREM}" class="form-control"
									placeholder="회원 정보를 통해 입력">
							</div>
						</td>
					</tr>
					<tr style="height: 50px">
						<td><span class="mar">휴대 전화</span></td>
						<td>
							<div class="input-group mt-3 mb-3 input-group-prepend">
								<input id="inputpn" style="width: 100%" type="text"
									value="${sessionScope.loginfo.MBRHP}" class="form-control"
									placeholder="회원 정보를 통해 입력">
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<hr class="distinct">
			<table class="col-12">
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 80%">
				</colgroup>
				<tbody>
					<tr style="margin: 20px;">
						<td>
							<h4 style="margin: 20px;">배송정보</h4>
						</td>
					</tr>
					<tr style="height: 50px">
						<td><span class="mar">받는사람 </span></td>
						<td><input id="inputrc" placeholder="받는분 성함" size="15"
							value="${sessionScope.loginfo.MBRNM}" type="text""></td>
					</tr>
					<tr style="height: 50px">
						<td><span class="mar">주소</span></td>
						<td><input type="button" onclick="execDaumPostcode()"
							value="우편번호 찾기"> <input type="text" id="zip-code"
							placeholder="우편번호" disabled="disabled"
							value="${sessionScope.loginfo.MBRAR}"></td>
					</tr>
					<tr style="height: 50px">
						<td><span></span></td>
						<td><input id="address-1" placeholder="도로명주소" size="15"
							type="text" style="width: 100%;" disabled="disabled"
							value="${sessionScope.loginfo.MBRAR1}"></td>
					</tr>
					<tr style="height: 50px">
						<td><span></span></td>
						<td><input id="address-2" placeholder="상세주소" size="15"
							type="text" value="${sessionScope.loginfo.MBRAR2}"></td>
					</tr>
					
				</tbody>
			</table>

			<div>
				<form>
				<br>
					<select class="form-select" id="messageC"
						style="width: 100%; margin: auto;">
						<option>--배송 메세지(선택사항)--</option>
						<option>부재 시 경비실에 맡겨주세요.</option>
						<option>부재 시 문 앞에 놓아주세요.</option>
						<option>택배함에 보관해주세요.</option>
					</select>
					<div class="form-check" style="margin-top: 10px">
						<input class="form-check-input" type="checkbox" id="op1"
							name="op1" value="something" checked> <label
							class="form-check-label">&nbsp;기본 배송지로 저장</label>
					</div>
				</form>
			</div>
			<hr class="distinct">
			<div>
				<table class="col-12" style="padding: 20px; border-bottom: none;">
					<tr>
						<td>
							<h4 style="margin: 20px;">주문 상품</h4>
						</td>
					</tr>
					<!-- 상품 출력  -->
					<%
					/* 총액을 합산하기 위한 변수 totalPR 선언*/
					int totalPR = 0;
					/* 구매 가격에 따른 할인양을 계산하기 위한 discountAmount 선언 */
					int discountAmount = 0;
					String couponMessage = "보유한 쿠폰이 없습니다.";
					/* 할인 가격에 대한 변수 */
					int discountTotalPR = totalPR;
					/* submit=White/996V5WH/245/2,White/996V5WH/270/1,White/996V5WH/275/1 
							와 같은 형태로 URL에 담아 submit 파라미터를 넘겨받습니다. */
					/* 장바구니와 상품 상세 페이지에서 넘겨받은 submit 파라미터 값을 String submitParam에 저장합니다. */
					String submitParam = request.getParameter("submit");
					/* 파라미터 값을 콤마로 잘라서 배열에 담습니다. */
					/* 콤마로 잘린 값은 색상/상품코드/주문사이즈/수량 으로 저장됩니다.*/
					String[] submitArray = submitParam.split(",");
					CartDao cDao = new CartDao();
					List<Product> pBean = new ArrayList<>();
					/* 배열로 for 문을 순회하며 주문할 상품의 정보를 출력해줍니다. */
					for (String data : submitArray) {
						/* value0123 = 색상 상품코드 주문사이즈 수량*/
						/* 다시 문자열을 잘라서 배열에 담아 출력합니다. */
						String[] values = data.split("/");
						
						/* 색상 상품코드 주문사이즈 수량을 변수에 담습니다. */
						String PROCR = values[0];
						String PROCD = values[1];
						int ORDSZ = Integer.parseInt(values[2]);
						int ORDQTY = Integer.parseInt(values[3]);
						
						/* 가져온 상품 코드로 List<Product> 에 정보를 담습니다. */
						pBean = cDao.getDataList1(PROCD);
						/* 단일 상품의 가격 합을 구합니다. */
						int TOTPR = ORDQTY * pBean.get(0).getPROPR();
						/* 단일 상품의 가격 합을 전체 상품에 넣습니다. */
						totalPR += TOTPR;
						// 주문 번호를 통해 오더 빈에 오더 정보 저장
						pBean.get(0).getPRONM();
					%>
					<!-- for 문을 닫지 않고 아래로 이어가 배열의 마지막 인덱스까지 반복합니다 -->
					<!-- pBean에 담긴 정보를 get(0).get() 메소드로 불러옵니다. -->
					<tr>
						<td width="150px"><img
							style="margin-left: 10px; margin-top: 10px; margin-bottom: 5px;"
							width="120px" height="120px"
							src="${pageContext.request.contextPath}/Image/Detail_main/<%=pBean.get(0).getPROIMG()%>"></img></td>
						<td><span><%=pBean.get(0).getPRONM()%></span> <span
							style="font-size: 0.8rem; font-weight: light;"><%="색상 : " + PROCR + ", 사이즈 : " + ORDSZ + ", 수량 : " + ORDQTY + "개"%>
						</span> <span><%="주문 상품 가격 : " + TOTPR + " 원"%></span><br></td>
					</tr>
					<%
					}%>
					<!-- for 문을 마칩니다. -->
					<tr>
						<td colspan="2">
							<nav
								class="navbar navbar-expand-sm bg-light border justify-content-between">
								<ul class="navbar-nav">
									<li class="nav-item" style="margin-left: 10px;">배송비</li>

								</ul>
								<ul class="navbar-nav">

									<li class="nav-item" style="margin-right: 20px;">0원(무료)</li>
								</ul>
							</nav>
						</td>
					</tr>

				</table>
			</div>
			<br>
			<hr class="distinct">
			<br>
			<table class="col-12">
				<colgroup>
					<col style="width: 20%;">
					<col style="width: 80%">
				</colgroup>
				<tbody>
					<tr>
						<td><span class="mar">주문 상품 금액</span></td>
						<td><input name="rname" class="inputTypeTextPay"
							disabled="disabled" placeholder="주문 상품 코드를 받아와서 입력될 예정" size="15"
							value="<%=totalPR%> 원" type="text"></td>
					</tr>
					<tr>
						<td><span class="mar">배송비</span></td>
						<td><input name="rname" class="inputTypeTextPay"
							disabled="disabled" placeholder="배송비 정보를 받아와서 입력될 예정" size="15"
							value="0원" type="text"></td>
					</tr>
					<%if (totalPR > 100000) {
						totalPR = (int) (totalPR * 0.9);
						discountAmount = (int) (totalPR * 0.1);
						couponMessage = "10만원 이상 구매 시 10% 할인 적용";
						}%>
					<tr>
						<td><span class="mar">할인/부가결제</span></td>
						<td><input name="rname" class="inputTypeTextPay"
							disabled="disabled" placeholder="회원 정보에 따른 할인량을 계산하여 입력될 예정"
							size="15" value="<%=couponMessage%>(<%=discountAmount%>) "
							type="text"></td>
					</tr>
					<tr>
						<td colspan="2">
							<nav
								class="navbar navbar-expand-sm bg-light border justify-content-between">
								<ul class="navbar-nav">
									<li class="nav-item" style="margin-left: 10px;">최종 결제 금액</li>

								</ul>
								<ul class="navbar-nav">

									<li class="nav-item" style="margin-right: 20px;"><%=totalPR%>
										원</li>
								</ul>
							</nav>
						</td>
					</tr>
				</tbody>
			</table>
			<hr class="distinct">
			<span class="mar" style="font-size: 24px; font-weight: bold;">결제
				수단</span><br> <br>
			<div class="ec-base-tab typeLight">
				<div class="menu">
					<div id="tab1-li">
						<a id="tab1click" href="#tab1">무통장 입금</a>
					</div>
					<div id="tab2-li">
						<a id="tab2click" href="#tab2">카카오페이</a>
					</div>
					<div id="tab3-li">
						<a id="tab3click" href="#tab3">신용카드</a>
					</div>
				</div>
			</div>
			<br>
			<div>
				<div id="tab1">
					<h3>무통장입금</h3>
					<span class="mar">입금은행 </span>
					<form>
						<select class="form-select" id="messageC"
							style="width: 100%; margin: auto;">
							<option>--입금 은행을 선택해주세요--</option>
							<option>쓰레기은행 20240126</option>
							<option>바보은행 32432432423432</option>
							<option>뜨아악은행 67212212</option>
						</select>
					</form>
					<span class="mar">입금자명 </span> <input id="inputdp" name="rname"
						class="form-control" placeholder="입금자 이름" size="15" value=""
						type="text" style="width: 100%; height: 50px;">
				</div>

				<div id="tab2">
					<h3>카카오 페이 결제</h3>
					<p>-카카오톡 앱을 설치한 후, 최초 1회 카드 정보를 등록하셔야 사용 가능합니다.</p>
					<p>-인터넷 익스플로러는 지원하지 않습니다.</p>
					<p>-카카오머니로 결제 시, 현금영수증 방급은 (주)카카오페이에서 발급가능합니다..</p>
				</div>
				<div id="tab3">
					<h3>신용 카드 결제</h3>
					<p>-소액 결제의 경우 PG사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</p>
					<p>-결제 버튼을 누르시면 팝업 창이 생성됩니다.</p>
				</div>
			</div>
			<br> <br>
			<script>
				function copyParam(){
					alert("결제 정상 처리되었습니다.");
					var url = "<%=notWithFormTag%>OrderP&submit1=<%=request.getParameter("submit")%>";
				        window.location.href = url;
				}
			</script>
			<div class="justify-content-center row d-flex">
				<div class="col-12" style="text-align: center;">
					<button id="buy" type="button" class="btn_black" onclick="copyParam()">
						<%=totalPR%> 원 결제하기
					</button>
				</div>
			</div>
			<div class="info">
				<br>
				<p>- 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에
					대해 무이자할부가 적용되지 않습니다. 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기
					바랍니다.</p>
				<br>
				<p>- 최소 결제 가능 금액은 결제금액에서 배송비를 제외한 금액입니다.</p>
				<br>
			</div>
		</div>
	</div>
</body>
</html>