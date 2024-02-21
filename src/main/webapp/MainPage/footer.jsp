<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <style>
    .boxWrap{
    	height: 200px;
    	width: 100%;
    	display: flex;
    	justify-content: space-around; 
    	background-color: #3c3c3c;
    }
    .foot1{
    	height: 200px;
       	color: white;
       	display: flex;
       	align-items: center;
       	font-size: 40px;
       	font-weight: bold;
    }
    .foot2{
        height: 200px;
    	color: white;
    	text-align: left;
    }
    .foot2 span:nth-child(1) {
    	font-size: 25px;
    	font-weight: bold;
    }
    @media screen and (max-width:500px){
    
    	.boxWrap {
    		display: none;
    	}
    
    
    }
    
    </style>
    <footer>
      	 <div class="boxWrap">
       		<div class="foot1">
       		 	한국ICT개발원 4조
       		</div>
       		<div class="foot2">
       				<br/>
	           	 <span>조원 할당 페이지</span><br/>
		   		 <span>전준형 : 상세페이지 / 메인상품연결</span><br/>
	       		 <span>박수호 : 장바구니 / 메인상품연결 </span><br/>
		   		 <span>진실로 : 회원가입 / 로그인 / 로그아웃 </span><br/>
		   		 <span>전병일 : 메인페이지 초기 레이아웃 / 게시판</span><br/>
		   		 <span>이춘성 : 자료수집</span>
	   		</div>
       	 </div>
    </footer>

