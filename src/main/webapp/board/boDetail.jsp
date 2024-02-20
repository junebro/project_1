<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세 보기</title>
<style>
	table {
		font-family: 'Kanit', sans-serif;
	}
	
	.tableWrap th{
		height: 50px;
		font-size: 20px;
		background-color: black; /*#191970 */
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
		border: 1px solid black;
	}
	.tcontents tr:nth-child(even){
		background-color: #dcdcdc;
	}
	.tcontents tr:nth-child(7) td{
		margin: 5%;	
	}
	.tcontents tr td:nth-child(1){
		font-weight: bolder;
		width: 100px;
		font-size: 17px;
		border: 1px solid black;
	}
	.tcontents tr td:nth-child(2){
		width: 900px;
		/*border: 1px solid black;*/
	}
	/*
	.tcontents tbody tr:hover{
		background-color: #c0c0c0;
		cursor: pointer
	}
	*/
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
	<script type="text/javascript">
		/* 삭제 버튼 클릭 */
		/* jQuery의 on()이라는 메소드는 선택된 요소에 이벤트 핸들러 함수를 연결해 주는 역할을 하는 함수입니다. */
		/* 개발자가 직접 지정한 no와 cnum이라는 속성을 이용하여 삭제하도록 해보겠습니다. */
		
		/* '.delete_btn'라는 항목이 'click'되었을 때, 동작하겠습니다. */
		$(document).on('click', '.delete_btn', function(){
			if(confirm('선택하신 항목을 삭제하시겠습니까?')){
				
				/* 
					삭제 버튼에 사용자가 정의한 no와 cnum이라는 속성 정보가 들어 있습니다.
				 	no 파라미터는 컨트롤러에서 사용되지 않지만, 반드시 넘겨 주어야 합니다. 
					상세 보기 페이지로 이동할 때 필수 사항이기 때문입니다.
				*/
				$.ajax({
					url:'<%=notWithFormTag%>cmDelete',	
					data:'no=' + $(this).attr('no') + '&cnum=' + $(this).attr('cnum'),
					type:'get',
					dataType:'text',
					success:function(result, status){
						console.log(result);
						console.log('상태 메시지 : ' + status);
						fillListComment(); /* 삭제 후 화면 다시 읽어 들이기 */
					}
				});
			}
		});
	
	
		function fillListComment(){
			$('#comment_list').empty(); /* 이전 목록 우선 지워주기 */			
			
			/* $.ajax() 함수를 이용하여 데이터를 가져 와서 목록을 동적으로 만들어 줍니다. */
			$.ajax({
				url:'<%=notWithFormTag%>cmList',	
				data:'no=' + '${requestScope.bean.no}',
				type:'get',
				dataType:'json',
				success:function(result, status){
					/* console.log('success');
					console.log(result);
					console.log('상태 메시지 : ' + status); */					
					
					/* 반환 받은 목록을 반복문을 이용하여 처리합니다. */
					$.each(result, function(idx){ /* idx는 색인 번호입니다. */
						var no = result[idx].no ;						
						var cnum = result[idx].cnum ;
						var id = result[idx].id ;
						var contents = result[idx].contents ;
						var regdate = result[idx].regdate ;
						
						console.log(no + '/' + cnum + '/' + id + '/' + contents + '/' + regdate);
						addNewItem(no, cnum, id, contents, regdate);	
					});
				},
				error:function(result, status){
					console.log('error');
					console.log(result);
					console.log('상태 메시지 : ' + status);
				}
			});
		}
		
		function addNewItem(no, cnum, id, contents, regdate){
			/* 댓글 1개에 대한 정보를 화면에 보여 줍니다. */
			var litag = $('<li>') ; /* 댓글의 외곽 li 태그  */
			litag.addClass('commentItem') ;
			
			var ptag = $('<p>') ; /* 작성자 정보가 들어갈 태그  */
			ptag.addClass('comment_'+cnum) ;

			var spantag = $('<span>') ; /* 작성자 이름이 들어갈 태그  */
			spantag.addClass('name') ;
			spantag.html(id + "님") ;
			
			var spandate = $('<span>') ;  /* 작성 일자가 들어갈 태그  */
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + regdate + '&nbsp;&nbsp;&nbsp;') ;
			
			/* 로그인한 사람이 작성한 댓글이면 삭제 가능 */
			if(id == '${sessionScope.loginfo.MBRID}'){ 
				var deleteTag = $('<input>') ; /* 삭제 버튼 */
				var attrlist = {'id':id, 'type':'button', 'value':'삭제', 'class':'btn btn-xs btn-outline-primary', 'cnum':cnum, 'no':no};
				deleteTag.attr(attrlist);
				deleteTag.addClass('delete_btn');
				
				var updateTag = $('<input>') ; /* 수정 버튼 */
				var attrlist = {'id':id, 'type':'button', 'value':'수정', 'class':'btn btn-xs btn-outline-primary', 'cnum':cnum, 'no':no};
				updateTag.attr(attrlist);
				updateTag.addClass('update_btn');
			}else{
				var inputtag = '' ;
			}
			
			var contents_p = $('<p>') ; /* 작성한 댓글 내용 */
			contents_p.html(contents) ;
			contents_p.addClass('contents_'+cnum)
			
			/* 조립하기(compose up) */
			ptag.append(spantag).append(spandate).append(deleteTag).append(updateTag);
			litag.append(ptag).append(contents_p) ; 
			
			$('#comment_list').append(litag) ;			
		}
	
		$(document).ready(function(){			
			fillListComment();
			
			/* 사용자가 댓글을 입력하고, 전송 버튼을 눌렀습니다. */
			$('#comment_form').submit(function(){
				
				/* 입력한 댓글이 없으면 전송이 불가능합니다. */
				if(!$('#contents').val()){
					alert('댓글을 반드시 입력해 주세요.');
					$('#contents').focus();
					return false;
				}
				
				/* submit 버튼의 캡션 정보 가져 오기 */
				var caption = $('button[type="submit"]').text();
				/* alert(caption); */
				
				if(caption=='저장하기'){
					/* jQuery의 Ajax 기능 중에서 post 방식을 이용하여 데이터를 전송합니다. */
					
					var URL = '<%=notWithFormTag%>cmInsert';
					
					// 명시된 폼 양식 내의 모든 파라미터를 인코딩이 적용된 문자열을 만들어 줍니다.
					var data = $('#comment_form').serialize() ;
					
					$.post(URL, data, function(data,status,xhr){
						fillListComment();
						$('#contents').val(''); /* 입력한 글자 지우기 */
						return true ;
						
					}).fail(function(){
						alert('댓글 작성에 실패하였습니다.')
						return false ;
					});
					
					return false ;
				}else if(caption=='수정하기'){
					return false ;
				}
			});
		});
		

		
	
	</script>
</head>
<body>

	
	<div class="intop">
		<jsp:include page="../MainPage/top.jsp" />
	</div>
		
	<div class="tableWrap">
		 <table class="tcontents">
  		  <thead class="table-dark">
    		  <tr>
    		  		<th>구 분</th>
					<th colspan="2">게 시 물&nbsp;&nbsp;&nbsp;상 세 내 용</th>
	          </tr>
    	</thead>
	    <tbody>
	    	  <tr>
					<td>글번호</td><td>${requestScope.bean.no}</td>
			  </tr>
			  <tr>
					<td>작성자</td>
					<td>
						<c:if test="${not empty sessionScope.loginfo.MBRID}">
								${sessionScope.loginfo.MBRID}
						</c:if> <c:if test="${empty sessionScope.loginfo.MBRID}">
								비회원 이거나 탈퇴 회원 접속 입니다
						</c:if>
					</td>
			  </tr>
			  <tr>
					<td>글제목</td><td>${requestScope.bean.subject}</td>
			  </tr>
			  <tr>
					<td>글내용</td><td>${requestScope.bean.contents}</td>
			  </tr>
			  <tr>
					<td>조회수</td><td>${requestScope.bean.readhit+1}</td>
			  </tr>
			  <tr>
					<td>작성일</td><td>${requestScope.bean.regdate}</td>
			  </tr>
			  <tr>
			 		<td></td>
			 		<!--<td><button class="btn btn-dark" onclick="document.location='<%=notWithFormTag%>boList&no=${bean.no}${requestScope.paging.flowParameter}'">목록으로</button></td>-->
			 		<td><button class="btn btn-dark" onclick="location.href = document.referrer;">목록으로</button></td> 
			  </tr>

	    </tbody>
  		</table>
  		
	</div>
</body>
</html>