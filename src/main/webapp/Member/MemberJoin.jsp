<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>

<%@ page import="com.shopping.model.bean.Member"%>
<%@ page import="com.shopping.model.dao.MemberDao"%>

<%
Member bean = new Member();
MemberDao dao = new MemberDao();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
* {
	padding: 0;
	margin: 0;
	border: none;
}

body {
	font-size: 14px;
	font-family: 'Noto Sans KR', sans-serif;
	text-align: center;
}

.contents h2 { /* 회원가입 */
	font-size: 40px;
	margin-bottom: 30px;
	margin-top: 100px;
}

.section li { /* 페이지 진행과정 */
	font-size: 15px;
	color: #BDBDBD;
	display: inline;
	padding: 5px;
}

.section .selected { /* 현재 페이지 */
	color: black;
}

.titleArea { /* 기본정보, 추가정보 */
	margin: auto;
}

.titleArea h3 { /* 기본정보 */
	text-align: left;
	margin-top: 30px;
}

.titleArea li { /* 필수입력사항 */
	text-align: right;
	color: #A6A6A6;
}

.required::marker { /* 리스트 마커 색상 설정 */
	color: red;
}

table {
	width: 800px;
	margin-left: auto;
	margin-right: auto;
	border-left: none;
	border-right: none;
	border-top: 1px solid rgba(128, 128, 128, 0.5);
}

tr { /* 행 */
	border-bottom: 1px solid rgba(128, 128, 128, 0.5); /* 투명도를 포함한 회색 선 */
	margin-top: 10px; /* 선 위의 간격 조절 */
}

th { /* 1열 */
	padding: 15px;
	margin: auto;
	background-color: #F6F6F6;
	width: 200px;
	text-align: left;
}

td { /* 2열 */
	text-align: left;
	padding: 15px;
	margin: auto;
}

table li, .txtInfo { /* 1열, 아이디/비번 부가설명 */
	color: #5D5D5D;
}

table .notrequired { /* 추가정보 1열 */
	text-align: left;
	list-style: none;
}

table .inputTypeText { /* 2열 입력칸 */
	border: 1px groove #BDBDBD;
	width: 400px;
	padding: 10px;
}

#mobile1, #mobile2, #mobile3, #email2 { /* 휴대전화 입력칸 */
	border: 1px groove #BDBDBD;
	width: 30%;
	height: 40px;
}

.ec-address li { /* 주소칸 */
	list-style: none;
	margin-left: -30px;
	margin-top: 5px;
}

#sample6_postcode, #sample6_address, #sample6_extraAddress {
	/* 주소 입력칸 */
	background-color: #F6F6F6;
	border: 1px solid #BDBDBD;
}

#postBtn { /* 주소검색 버튼 */
	width: 87px;
	height: 43px;
}

#sample6_address { /* 기본주소 칸 */
	width: 500px;
}

#sample6_detailAddress, #sample6_extraAddress { /* 나머지주소, 참고항목 */
	width: 248px;
	display: inline;
}

#email1 {
	width: 50%;
}

button {
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1em;
	cursor: pointer;
	border-width: thin;
	border: 1px groove #BDBDBD;
}

.btnBasic {
	margin-left: 10px;
}

.btn_white {
	padding: 20px 50px;
	background-color: #FFFFFF;
	color: #000000;
	border: 1px groove #BDBDBD;
	text-decoration: none;
}

.btn_black {
	padding: 20px 50px;
	background-color: #000000;
	color: #ffffff;
	border: 1px groove #BDBDBD;
	text-decoration: none;
}

.desc { /* (선택) */
	font-size: 15px;
	color: #BDBDBD;
}

#is_sex0, #is_sex1 { /* 성별 라디오 */
	margin-left: 10px;
}

.gBottom { /* 하단 버튼 */
	margin-top: 100px;
	margin-bottom: 100px;
}

.hide {
	display: none;
}

.success-message, .success-message2, .success-message3 {
	color: green;
}

.failure-message, .failure-message2, .failure-message3,
.failure-message4, .failure-message5, .failure-message6,
.failure-message7 {
	color: red;
}
</style>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function() {
		$('#birth').datepicker({
			dateFormat : "yy/mm/dd"
		});
	});

	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 각 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var addr = ''; // 주소 변수
						var extraAddr = ''; // 참고항목 변수

						//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
							addr = data.roadAddress;
						} else { // 사용자가 지번 주소를 선택했을 경우(J)
							addr = data.jibunAddress;
						}

						// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						if (data.userSelectedType === 'R') {
							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraAddr !== '') {
								extraAddr = ' (' + extraAddr + ')';
							}
							// 조합된 참고항목을 해당 필드에 넣는다.
							document.getElementById("sample6_extraAddress").value = extraAddr;

						} else {
							document.getElementById("sample6_extraAddress").value = '';
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample6_postcode').value = data.zonecode;
						document.getElementById("sample6_address").value = addr;
						// 커서를 상세주소 필드로 이동한다.
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

</head>
<body>
	<form method="post" action="<%=withFormTag%>">
		<input type="hidden" name="command" value="meInsert">
		<div class="container">
			<div class="contents">
				<h2>회원 가입</h2>
			</div>
			<div class="section">
				<ol class="step">
					<li>1.약관동의 ></li>
					<li class="selected">2.정보입력 ></li>
					<li>3.가입완료</li>
				</ol>
			</div>
			<div class="titleArea" style="width: 800px">
				<h3>기본정보</h3>
				<li class="required">필수입력사항</li>
			</div>
			<div>
				<div>
					<table>
						<tr>
							<th scope="row">
								<li class="required id">아이디</li>
							</th>
							<td><input id="member_id" name="MBRID"
								class="inputTypeText" type="text" onkeyup="idtest()">
								<div class="success-message hide">사용할 수 있는 아이디입니다.</div>
								<div class="failure-message hide">잘못된 형식입니다.</div>
								<div class="txtInfo">(영문소문자/숫자, 4~16자)</div>
								<p id="idMsg" class="txtInfo txtSuccess"></p></td>
						</tr>
						<tr>
							<th scope="row">
								<li class="required password">비밀번호</li>
							</th>
							<td><input id="member_password" name="MBRPW"
								class="inputTypeText" type="password" onkeyup="pwtest()">
								<div class="success-message2 hide">사용할 수 있는 비밀번호입니다.</div>
								<div class="failure-message2 hide">잘못된 형식입니다.</div>
								<div class="txtInfo">(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10~16자)</div>
								<p id="passwordMsg" class="txtInfo txtSuccess"></p></td>
						</tr>
						<tr>
							<th scope="row">
								<li class="required password check">비밀번호 확인</li>
							</th>
							<td><input id="member_password_check"
								name="member_password_check" class="inputTypeText"
								type="password" onkeyup="pwtest2()">
								<div class="success-message3 hide">비밀번호가 일치합니다.</div>
								<div class="failure-message3 hide">비밀번호가 일치하지 않습니다.</div>
								<p id="passwordCheckMsg" class="txtInfo txtSuccess"></p></td>
						</tr>
						<tr>
							<th scope="row">
								<li class="required name">이름</li>
							</th>
							<td><input id="member_name" name="MBRNM"
								class="inputTypeText" type="text" onkeyup="nmtest()">
								<div class="failure-message4 hide">필수입력사항입니다.</div>
								<p id="nameMsg" class="txtInfo txtSuccess"></p></td>
						</tr>
						<tr>
							<th scope="row">
								<li class="required address">주소</li>
							</th>
							<td class="formMultiple">
								<ul class="ec-address">
									<li id="join_zipcode_wrap"><input id="sample6_postcode"
										name="MBRAR1" placeholder="우편번호" class="inputTypeText"
										type="text" readonly="readonly"
										onclick="sample6_execDaumPostcode()">
										<button id="postBtn" class="btnBasic" type="button"
											onclick="sample6_execDaumPostcode()" style="cursor: pointer">주소검색</button>
									</li>
									<li id="join_baseAddr_wrap"><input id="sample6_address"
										name="MBRAR2" placeholder="기본주소" class="inputTypeText"
										type="text" readonly="readonly"
										onclick="sample6_execDaumPostcode()"></li>
									<li id="join_detailAddr_wrap"><input
										id="sample6_detailAddress" name="MBRAR3"
										placeholder="나머지 주소(선택 입력 가능)" class="inputTypeText"
										type="text" onkeyup="artest()">
										<div class="failure-message5 hide">필수입력사항입니다.</div> <input
										type="text" id="sample6_extraAddress" placeholder="참고항목"
										class="inputTypeText" type="text" readonly="readonly">
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<th scope="row">
								<li class="required handphone">휴대전화</li>
							</th>
							<td class="formGroup code"><select id="mobile1"
								name="mobile1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select>- <input id="mobile2" name="mobile2" maxlength="4" type="text"
								onkeyup="hptest()" onkeypress="return checkNumber(event)">- <input id="mobile3" name="mobile3"
								maxlength="4" type="text" onkeyup="hptest()" onkeypress="return checkNumber(event)">
								<div class="failure-message6 hide">필수입력사항입니다.</div></td>
						</tr>
						<tr>
							<th scope="row">
								<li class="required email"  alt="필수">이메일
							</th>
							<td><input id="email1" name="MBREM" class="inputTypeText"
								type="text" onkeyup="emtest()"> <select
								class="required email" id="email2" name="MBREM01">
									<option>--메일 선택--</option>
									<option>@naver.com</option>
									<option>@gmail.com</option>
									<option>@daum.net</option>
							</select>
							<div class="failure-message7 hide">필수입력사항입니다.</div></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="titleArea" style="width: 800px">
				<h3>
					추가정보 <span class="desc">(선택)</span>
				</h3>
			</div>
			<div>
				<table>
					<tr>
						<th scope="row">
							<li class="notrequired gender">성별
						</th>
						<td><input id="is_sex0" name="is_sex" value="M" type="radio"
							autocomplete="off"> <label for="is_sex0">남자</label> <input
							id="is_sex1" name="is_sex" value="F" type="radio"
							autocomplete="off"> <label for="is_sex1">여자</label></td>
					</tr>
					<tr>
						<th scope="row">
							<li class="notrequired birth">생년월일
						</th>
						<td class="formGroup date"><input type="text"
							class="inputTypeText" id="birth" name="MBRBT"></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="gBottom">
			<button class="btn_white" onclick="history.go(-1);">취소</button>
			<button class="btn_black" id="join" type="submit">가입하기</button>
		</div>
	</form>
</body>
<script type="text/javascript">
	let inputId = document.getElementById('member_id');
	let SuccessMessage = document.querySelector('.success-message');
	let FailureMessage = document.querySelector('.failure-message');

	function idLength(value) {
		return value.length >= 4 && value.length <= 16
	};

	function onlyNumberAndEnglish(str) {
		return /^[a-z0-9][a-z0-9]*$/.test(str);
	}

	function idtest() {
		// 값을 입력한 경우
		if (inputId.value.length !== 0) {

			if (onlyNumberAndEnglish(inputId.value) === false) {
				SuccessMessage.classList.add('hide');
				FailureMessage.classList.remove('hide');
			} else if (idLength(inputId.value) === false) {
				SuccessMessage.classList.add('hide'); // 성공 메시지가 가려져야 함
				FailureMessage.classList.remove('hide'); // 아이디는 4~12글자이어야 합니다
			}
			// 조건을 모두 만족할 경우
			else {
				SuccessMessage.classList.remove('hide'); // 사용할 수 있는 아이디입니다
				FailureMessage.classList.add('hide'); // 실패 메시지가 가려져야 함
			}
		}
		// 값을 입력하지 않은 경우 (지웠을 때)
		// 모든 메시지를 가린다.
		else {
			SuccessMessage.classList.add('hide');
			FailureMessage.classList.add('hide');
		}
	};

	let inputPw = document.getElementById('member_password');
	let SuccessMessage2 = document.querySelector('.success-message2');
	let FailureMessage2 = document.querySelector('.failure-message2');

	function strongPassword(str) {
		return /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{10,16}$/
				.test(str);
	}

	function pwtest() {
		// 값을 입력한 경우
		if (inputPw.value.length !== 0) {
			if (strongPassword(inputPw.value)) {
				SuccessMessage2.classList.remove('hide');
				FailureMessage2.classList.add('hide'); // 실패 메시지가 가려져야 함
			} else {
				SuccessMessage2.classList.add('hide'); // 실패 메시지가 보여야 함
				FailureMessage2.classList.remove('hide');
			}
		}
		// 값을 입력하지 않은 경우 (지웠을 때)
		// 모든 메시지를 가린다.
		else {
			SuccessMessage2.classList.add('hide');
			FailureMessage2.classList.add('hide');
		}
	};

	let inputPw2 = document.getElementById('member_password_check');
	let SuccessMessage3 = document.querySelector('.success-message3');
	let FailureMessage3 = document.querySelector('.failure-message3');

	function isMatch(password1, password2) {
		return password1 === password2;
	}

	function pwtest2() {
		// 값을 입력한 경우
		if (inputPw2.value.length !== 0) {
			if (isMatch(inputPw.value, inputPw2.value)) {
				SuccessMessage3.classList.remove('hide');
				FailureMessage3.classList.add('hide'); // 실패 메시지가 가려져야 함
			} else {
				SuccessMessage3.classList.add('hide'); // 실패 메시지가 보여야 함
				FailureMessage3.classList.remove('hide');
			}
		}
		// 값을 입력하지 않은 경우 (지웠을 때)
		// 모든 메시지를 가린다.
		else {
			SuccessMessage3.classList.add('hide');
			FailureMessage3.classList.add('hide');
		}
	};

	// 나머지 필수입력사항
	// 이름
	let inputNm = document.getElementById('member_name');
	let FailureMessage4 = document.querySelector('.failure-message4');
	function nmtest() {
		if (inputNm.value.length !== 0) {
			FailureMessage4.classList.add('hide');
		}
	}
	// 주소
	let inputAr = document.getElementById('sample6_detailAddress');
	let FailureMessage5 = document.querySelector('.failure-message5');
	function artest() {
		if (inputAr.value.length !== 0) {
			FailureMessage5.classList.add('hide');
		}
	}
	// 휴대전화
	let inputHp = document.getElementById('mobile2');
	let inputHp2 = document.getElementById('mobile3');
	let FailureMessage6 = document.querySelector('.failure-message6');
	function hptest() {
		if (inputHp.value.length !== 0) {
			FailureMessage6.classList.add('hide');
		} else if (inputHp2.value.length !== 0) {
			FailureMessage6.classList.add('hide');
		}
	}
	
	function checkNumber(event) {
		if(event.key === '.' 
		     || event.key === '-'
		     || event.key >= 0 && event.key <= 9) {
		    return true;
		}
		return false;
	}  
	// 이메일
	let inputEm = document.getElementById('email1');
	let FailureMessage7 = document.querySelector('.failure-message7');
	function emtest() {
		if (inputEm.value.length !== 0) {
			FailureMessage7.classList.add('hide');
		}
	}
</script>
<script  type="text/javascript">
$(document).ready(function() {
	$('#join').click(function() {
		// 아이디
		let inputId = document
				.getElementById('member_id');
		let FailureMessage = document
				.querySelector('.failure-message');
	
		function idLength(value) {
			return value.length >= 4
					&& value.length <= 16
		}
		;
	
		function onlyNumberAndEnglish(str) {
			return /^[a-z0-9][a-z0-9]*$/
					.test(str);
		}
	
		if (inputId.value == "") {
			inputId.focus();
			inputId.scrollIntoView({
				block : "center"
			});
			FailureMessage.classList
					.remove('hide');
			return false;
		} else if (onlyNumberAndEnglish(inputId.value) === false) {
			inputId.focus();
			inputId.scrollIntoView({
				block : "center"
			});
			FailureMessage.classList
					.remove('hide');
			return false;
		} else if (idLength(inputId.value) === false) {
			inputId.focus();
			inputId.scrollIntoView({
				block : "center"
			});
			FailureMessage.classList
					.remove('hide');
			return false;
		}
	
		// 비밀번호
		let inputPw = document
				.getElementById('member_password');
		let FailureMessage2 = document
				.querySelector('.failure-message2');
	
		function strongPassword(str) {
			return /^(?!((?:[A-Za-z]+)|(?:[~!@#$%^&*()_+=]+)|(?:[0-9]+))$)[A-Za-z\d~!@#$%^&*()_+=]{10,16}$/
					.test(str);
		}
	
		if (inputPw.value == '') {
			inputPw.focus();
			inputPw.scrollIntoView({
				block : "center"
			});
			FailureMessage2.classList
					.remove('hide');
			return false;
		} else if (strongPassword(inputPw.value) == false) {
			inputPw.focus();
			inputPw.scrollIntoView({
				block : "center"
			});
			FailureMessage2.classList
					.remove('hide');
			return false;
		}
	
		// 비밀번호 확인
		let inputPw2 = document
				.getElementById('member_password_check');
		let FailureMessage3 = document
				.querySelector('.failure-message3');
	
		function isMatch(password1,
				password2) {
			return password1 === password2;
		}
	
		if (inputPw2.value == '') {
			inputPw2.focus();
			inputPw2.scrollIntoView({
				block : "center"
			});
			FailureMessage3.classList
					.remove('hide');
			return false;
		} else if (isMatch(inputPw.value,
				inputPw2.value) == false) {
			inputPw2.focus();
			inputPw2.scrollIntoView({
				block : "center"
			});
			FailureMessage3.classList
					.remove('hide');
			return false;
		}
	
		// 이름
		let inputNm = document
				.getElementById('member_name');
		let FailureMessage4 = document
				.querySelector('.failure-message4');
	
		if (inputNm.value == '') {
			inputNm.focus();
			inputNm.scrollIntoView({
				block : "center"
			});
			FailureMessage4.classList
					.remove('hide');
			return false;
		}
		// 주소
		let inputAr = document
				.getElementById('sample6_detailAddress');
		let FailureMessage5 = document
				.querySelector('.failure-message5');
	
		if (inputAr.value == '') {
			inputAr.focus();
			inputAr.scrollIntoView({
				block : "center"
			});
			FailureMessage5.classList
					.remove('hide');
			return false;
		}
		// 휴대전화
		let inputHp = document
				.getElementById('mobile2');
		let inputHp2 = document
				.getElementById('mobile3');
		let FailureMessage6 = document
				.querySelector('.failure-message6');
	
		if (inputHp.value == '') {
			inputHp.focus();
			inputHp.scrollIntoView({
				block : "center"
			});
			FailureMessage6.classList
					.remove('hide');
			return false;
		}
		if (inputHp2.value == '') {
			inputHp2.focus();
			inputHp.scrollIntoView({
				block : "center"
			});
			FailureMessage6.classList
					.remove('hide');
			return false;
		}
	
		// 이메일
		let inputEm = document
				.getElementById('email1');
		let inputEm2 = document
				.getElementById('email2');
		let FailureMessage7 = document
				.querySelector('.failure-message7');
	
		if (inputEm.value == '') {
			inputEm.focus();
			inputEm.scrollIntoView({
				block : "center"
			});
			FailureMessage7.classList
					.remove('hide');
			return false;
		}
		if (inputEm2.value == '--메일 선택--') {
			inputEm.focus();
			inputEm.scrollIntoView({
				block : "center"
			});
			FailureMessage7.classList
					.remove('hide');
			return false;
		}
	})
})
</script>

</html>