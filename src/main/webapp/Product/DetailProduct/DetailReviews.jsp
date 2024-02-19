<%@page import="com.shopping.common.SuperClass"%>
<%@page import="com.shopping.utility.reviews_Paging"%>
<%@page import="com.shopping.model.dao.ProductDetailDao"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ include file="./../../common/common.jsp"%>
   
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="views" items="${requestScope.dataList['resultSetViews']}" varStatus="status">
						
		<div class="view_Board">
			<div class="view_Board_left">
				<div class="border_top">
					<div id="view_star${status.index}" class="view_star">
						<c:forEach var="i" begin="1" end="${views['RVWGR']}">
							<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="20" height="20" viewBox="0 0 20 20" class="crema_product_reviews_score_star_wrapper__star " style="fill: rgb(0, 0, 0); width: 20px; height: 20px;">
								<defs>
									<path id="star-full" d="M7.157 6.698l2.165-4.59a.743.743 0 0 1 1.358 0l2.165 4.59 4.84.74c.622.096.87.895.42 1.353l-3.503 3.57.827 5.044c.106.647-.544 1.141-1.1.835l-4.328-2.382-4.329 2.382c-.556.306-1.205-.188-1.099-.835l.826-5.044-3.502-3.57c-.45-.458-.202-1.257.42-1.352l4.84-.74z"/>
								</defs>
								<use xlink:href="#star-full"/>
							</svg>
						</c:forEach>
						<span class="view_star_gr"> 
							<c:if test="${views['RVWGR'] eq 5}">&nbsp;아주 좋아요</c:if>
							<c:if test="${views['RVWGR'] eq 4}">&nbsp;맘에 들어요</c:if>
							<c:if test="${views['RVWGR'] eq 3}">&nbsp;보통이에요</c:if>
							<c:if test="${views['RVWGR'] eq 2}">&nbsp;그냥 그래요</c:if>
							<c:if test="${views['RVWGR'] eq 1}">&nbsp;별로에요</c:if>
						</span>
					</div>
					
					<div class="border_date">${views['RVWDT']}</div>
				</div>
				<br>
				<div class="border_main">
					${views['RVWCT']}
				</div>
				<br>
				<div class="inq_img">
					<c:if test="${views['RVWIMG1']!=null}">
						<img src="${pageContext.request.contextPath}/Image/Reviews/${views['RVWIMG1']}" alt="${views['RVWIMG1']}">
					</c:if>
					<c:if test="${views['RVWIMG2']!=null}">
						<img src="${pageContext.request.contextPath}/Image/Reviews/${views['RVWIMG2']}" alt="${views['RVWIMG2']}">
					</c:if>
					<c:if test="${views['RVWIMG3']!=null}">
						<img src="${pageContext.request.contextPath}/Image/Reviews/${views['RVWIMG3']}" alt="${views['RVWIMG3']}">
					</c:if>
				</div>
				
			</div>
			
			<div class="view_center"></div>
			<div class="view_Board_right">
				<div class="Board_member">
					<div class="Board_member_detail">${views['MBRID']}님의 리뷰입니다.</div>
					<div class="Board_member_detail">발 사이즈 <span class="font_pro">245mm</span></div>
					<div class="Board_member_detail">회원 등급 <span class="font_pro">FAMILY</span></div>
					<div class="Board_member_detail">사이즈 <span class="font_pro">245</span></div>
					<div class="Board_member_detail">컬러 <span class="font_pro">(15)Gray</span></div>
				</div>
			</div>
		</div>

		<div class="view_line"></div>
	</c:forEach>
	${requestScope.paging.pagingHtml}
	

</body>
</html>