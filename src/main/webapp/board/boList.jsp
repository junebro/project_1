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
	table {
		font-family: 'Kanit', sans-serif;
	}

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
	.tcontents tr:nth-child(odd){
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
	a{
		text-decoration: none;
		color: #5D5D5D;
	}
	a:hover{
		color: black;
		font-weight: bolder;
		
	}


</style>

<script>

$(document).ready(function(){
	/* 필드 검색시 체크한 콤보 박스 상태 보존 */
	var optionList = $('#mode option');/* 옵션 목록 */
	for(var i=0 ; i<optionList.length ; i++){
		if(optionList[i].value == '${requestScope.paging.mode}'){
			optionList[i].selected = true ;
		}
	}		
	
	/* 필드 검색시 입력한 keyword 내용 보존 */
	$('#keyword').val('${requestScope.paging.keyword}');
});

function searchAll(){ /* 전체 검색  */
	location.href = '<%=notWithFormTag%>boList'	;
}

function writeForm(){ /* 게시물 작성  */
	location.href = '<%=notWithFormTag%>boInsert' ;
}
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
				 <tr>
					<td colspan="9" align="center">
						<div class="row">
							<div class="col-sm-1"></div>
							<div class="col-sm-10">
								<form action="<%=withFormTag%>" method="get">
									<input type="hidden" name="command" value="boList">
									<div class="row">
										<div class="col-sm-12">
											<select class="form-control-sm" id="mode" name="mode">
												<option value="all">--- 선택해주세요.
												<option value="id">작성자
												<option value="subject">글제목
												<option value="contents">글내용
											</select>
											<input class="form-control-sm" type="text" id="keyword" name="keyword">
											
											<button class="form-control-sm btn btn-warning" type="submit">검색</button>
											
											<button class="form-control-sm btn btn-warning" type="button" onclick="searchAll();">전체 검색</button>
											
											<button class="form-control-sm btn btn-info" type="button" onclick="writeForm();">글쓰기</button>
											
											&nbsp;&nbsp;
											<span class="label label-default">
												${requestScope.paging.pagingStatus}
											</span>
										</div>								
									</div>							
								</form>
								
							</div>
							<div class="col-sm-1"></div>
						</div>
					</td>
				</tr>
				<c:forEach var="bean" items="${bean}">
				<tr>
					<td><div class="tdwrap" style="width:50px">${bean.no}</div></td>
					<td><div class="tdwrap" style="width:100px">${bean.id}</div></td>
					<td>
						<c:set var="readhitUpdate" value="${not (sessionScope.loginfo.MBRID == bean.id)}"/>
					
						<div class="tdwrap" style="width:100px">
						
						<a href="<%=notWithFormTag%>boDetail&no=${bean.no}&readhitUpdate=${readhitUpdate}${requestScope.paging.flowParameter}">
							<c:forEach var="i" begin="1" end="${bean.depth}"  step="1">
								<span class="badge rounded-pill bg-secondary">re</span>
							</c:forEach>
							${bean.subject}
						</a>
						
						<%-- <a href="<%=notWithFormTag%>boDetail&no=${bean.no}">${bean.subject}</a>--%>
						</div>
					</td>
					<td>
						<div class="tdwrap" style="width:200px">
							<a href="<%=notWithFormTag%>boDetail&no=${bean.no}&readhitUpdate=${readhitUpdate}${requestScope.paging.flowParameter}">
							${bean.contents}
							</a>
						</div>
					</td>
					<td>
						<c:if test="${bean.readhit >= 20}">
							<span class="badge rounded-pill bg-primary">
								${bean.readhit}
							</span>
						</c:if>
						
						<c:if test="${bean.readhit < 20}">
							<span class="badge rounded-pill bg-danger">
								${bean.readhit}
							</span>
						</c:if>						
					</td>
					<%--  <td><div class="tdwrap" style="width:50px">${bean.readhit}</div></td> --%>
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