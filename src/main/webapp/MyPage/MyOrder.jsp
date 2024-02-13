<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>

/* 리뷰 쓰기 함수 */
$(document).ready(function() {
	$('.review_btn').click(function() {
		$('.popup').show();
	})
});
</script>
<div  id="mainDiv" >
				<p class="maino">나의 구매 내역</p>
				<br>
				<table style="width: 100%">
					<tbody>
						<tr class="underline">
							<th class="orderTh">주문번호</th>
							<th class="orderTh">상품</th>
							<th class="orderTh" style="width: 40%;">상품 상세</th>
							<th class="orderTh">옵션</th>
							<th class="orderTh">수량</th>
							<th class="orderTh">가격</th>
							<th class="orderTh">리뷰</th>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">6969</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20230925/NB20230925082154449001.jpg"></td>
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)</td>
							<td class="orderTd">260, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">109,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">7474</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20240123/NB20240123151041974001.jpg"></td>
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)</td>
							<td class="orderTd">(91)Silver, 280, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">99,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">6969</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20230925/NB20230925082154449001.jpg"></td>
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)</td>
							<td class="orderTd">260, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">109,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">7474</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20240123/NB20240123151041974001.jpg"></td>
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)</td>
							<td class="orderTd">(91)Silver, 280, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">99,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">6969</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20230925/NB20230925082154449001.jpg"></td>
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)</td>
							<td class="orderTd">260, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">109,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">7474</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20240123/NB20240123151041974001.jpg"></td>
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)</td>
							<td class="orderTd">(91)Silver, 280, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">99,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">6969</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20230925/NB20230925082154449001.jpg"></td>
							<td class="orderTd" style="width: 40%;">MT410AS5 (Uni, 2E)</td>
							<td class="orderTd">260, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">109,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
						<tr class="underline">
							<td class="orderTd" id="ORDCD">7474</td>
							<td class="orderTd"><img class="orderImg "
								src="https://image.nbkorea.com/NBRB_Product/20240123/NB20240123151041974001.jpg"></td>
							<td class="orderTd" style="width: 40%;">W480KW5 (Uni, 4E)</td>
							<td class="orderTd">(91)Silver, 280, 2E</td>
							<td class="orderTd">1</td>
							<td class="orderTd">99,000원</td>
							<td class="orderTd">
								<button class="review_btn" type="button" class="btn_white"
									style="font-size: 12px">리뷰 쓰기</button>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="popup">
		<form method="post" action="#">
			<br>
			<h2>리뷰 작성하기</h2>
			<select class="all_star selectbox_star sel_color"
				style="margin-left: 7px;">
				<option selected="selected">&#xf005 &#xf005 &#xf005 &#xf005
					&#xf005</option>
				<option>&#xf005 &#xf005 &#xf005 &#xf005</option>
				<option>&#xf005 &#xf005 &#xf005</option>
				<option>&#xf005 &#xf005</option>
				<option>&#xf005</option>
			</select>
			<table class="table table-hover">
				<tbody>
					<tr>
						<td><textarea class="form-control" placeholder="리뷰 내용을 작성하세요"
								name="contentDetail" maxlength="270" style="height: 270px;"></textarea></td>
					</tr>
				</tbody>
			</table>
			<div style="text-align: left; margin-left: 30px;">
				<button type="submit" class="btn_white">파일선택</button>
				<button type="submit" class="btn_white">파일선택</button>
				<button type="submit" class="btn_white">파일선택</button>
			</div>
			<hr>
			<div style="text-align: center">
				<button type="submit" class="btn_white" style="margin-right: 20px">올리기</button>
				<button type="reset" class="btn_black" style="margin-left: 20px">나가기</button>
			</div>
		</form>
	</div>
	<script>
		/* SELECT BOX */
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
</body>
</html>