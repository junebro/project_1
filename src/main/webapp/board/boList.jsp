<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/common.jsp" %>
<%
session.getAttribute("loginfo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	.tableWrap th{
		height: 50px;
		background-color: #000; 
	}
	.tableWrap{
		/* border: 1px solid red; */
		text-align: center;
	}
	.tcontents{
		margin: 0 auto;
		width: 1000px;
		border-collapse: collapse;
		
	}
	.tcontents thead{
		background-color: black;
		color: white;
	}
	.tcontents tr{
		border-bottom: 1px solid darkgray;
		height: 20px;
	}
	.tcontents tr:nth-child(even){
		background-color: #dcdcdc;
	}
	.tcontents tbody tr:hover{
		background-color: #c0c0c0;
		cursor: pointer
	}
	.tdwrap{
		display: inline-block;
		height: 30px;
		overflow: hidden;
		white-space: nowrap;
		text-overflow: ellipsis;
	}
	.intop{
		text-align: center;
	}

</style>

<script>
	function deleteBoard(no, paramList){ /* 게시물 삭제  */
		/* no : 삭제될 게시물 번호, paramList : 페이징 관련 파라미터들 */
		
		var response = window.confirm('해당 게시물을 삭제하시겠습니까?');
		
		if(response==true){
			var url = '<%=notWithFormTag%>boDelete&no=' + no + paramList;
			/* alert(url); */
			location.href = url ;
		
		}else{
			alert('게시물 삭제가 취소되었습니다.');
			return false ;
		}
	}

</script>

</head>
<body>

	<div class="intop">
		<jsp:include page="../MainPage/top.jsp" />
	</div>
	
	<div class="tableWrap"> 
			<table class="tcontents">
				<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>글제목</th>
					<th>글내용</th>
					<th>조회</th>
					<th>작성 일자</th>
					<th>수정</th>
					<th>삭제</th>
					<th>답글</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="bean" items="${abc}">
				<tr>
					<td><div class="tdwrap" style="width:50px">${bean.no}</div></td>
					<td><div class="tdwrap" style="width:100px">${bean.id}</div></td>
					<td>
						<div class="tdwrap" style="width:100px">
						<a href="<%=notWithFormTag%>boDetail&no=${bean.no}">${bean.subject}</a>
						</div>
					</td>
					<td><div class="tdwrap" style="width:200px">${bean.contents}</div></td>
					<td><div class="tdwrap" style="width:50px">${bean.readhit}</div></td>
					<td><div class="tdwrap" style="width:100px">${bean.regdate}</div></td>
					<td><div class="tdwrap" style="width:50px">
						<c:if test="${sessionScope.loginfo.MBRID == bean.id}">
							<a href="<%=notWithFormTag%>boUpdate&no=${bean.no}${requestScope.paging.flowParameter}">수정</a>
						</c:if>
						</div>
					</td>
					<td>
					<div class="tdwrap" style="width:50px">
						<c:if test="${sessionScope.loginfo.MBRID == bean.id}">
							<a href="#" onclick="return deleteBoard('${bean.no}', '${requestScope.paging.flowParameter}');">삭제</a>
						</c:if>
					</div>
					</td>
					<td>
						<c:if test="${sessionScope.loginfo.MBRID == bean.id}">
						<c:set var="replyInfo" value="&groupno=${bean.groupno}&orderno=${bean.orderno}&depth=${bean.depth}"/>
						<div class="tdwrap" style="width:50px">
							<a href="<%=notWithFormTag%>boReply&no=${bean.no}${requestScope.paging.flowParameter}${replyInfo}">답글</a>
						</div>
						</c:if>
					</td>
				</tr>
				</c:forEach>
				</tbody>
			</table>
			${requestScope.paging.pagingHtml}	
	</div>


</body>
</html>