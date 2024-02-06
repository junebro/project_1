<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
    <style>
	*{
	  box-sizing: border-box;
	}
	body{
	    font-family: 'Noto Serif KR', serif;
	    margin: 0;
	}
	.menuwrap{
	   width: 100%;
	   text-align: center;
	}
	.hidden {
	    width: 100%;
	    height: 181px;
	    margin: 0 0 10px 0;
	    /* border-bottom: 20px solid rgb(0,0,0); */
	    border: 2px solid rgb(192, 192, 192);
	}
	#topwrap{
	    position: fixed;
	    width: 100%;
	    height: 180px;
	    background-color: white;
	    text-align: center;
	    z-index: 99;
	}
	.topmenu ul{
	    list-style: none;
	    float: right;
	}
	.topmenu li{
	    display: inline-block;
	    padding: 12px;
	    font-size: 15px;
	}
	.topmenu li:hover{
	    font-weight: bold;
	    color: rgb(23, 84, 176);
	}
	.topmenu a:link{
		color: rgb(0, 0, 0);
	}
	.topmenu a{
	    text-decoration: none;
	}
	.topmenu a:hover{
	    font-weight: bold;
	    color: rgb(23, 84, 176);
	}
	
	.title{
	    clear:both;
	    text-align: center;
	    
	}
	/*
	header{
	    opacity: 0.7;
	    clear: both;
	    background-color: lightslategrey;
	    text-align: center;
	    padding: 25px;
	}
	*/
	.menuwrap {
	    position: fixed;
	    text-align: center;
	}
	/* Style The Dropdown Button */
	.dropbtn {
	  background-color:rgb(255, 255, 255); /*#191970*/
	  /*border-bottom: 5px solid rgb(64, 0, 0);*/
	  /*border-right: 3px solid #000000;*/
	  color: rgb(106, 106, 106);
	  padding: 5px;
	  font-size: 16px;
	  font-weight: bold;
	  cursor: pointer;
	  /*border-radius: 10%;*/
	  width: 90px; 
	  border:none;
	}
	
	.dropbtn a {
	  color: #000;
	  text-decoration: none;
	  text-align: center;
	  font-size: 20px;
	  font-weight: bolder;
	  cursor: pointer;
	  
	}
	
	/* The container <div> - needed to position the dropdown content */
	.dropdown {
	  position: relative;
	  display: inline-block;
	 
	}
	
	/* Dropdown Content (Hidden by Default) */
	.dropdown-content {
	  display: none;
	  position: absolute;
	  background-color: #f9f9f9;
	  min-width: 160px;
	  /*box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);*/
	  z-index: 1;
	}
	
	/* Links inside the dropdown */
	.dropdown-content a {
	  color:rgb(64, 0, 128);
	  padding: 12px 16px;
	  text-decoration: none;
	  display: block;
	}
	
	/* Change color of dropdown links on hover */
	.dropdown-content a:hover {
		background-color: rgb(0, 0, 0);
		color: white;	
		
	}
	
	/* Show the dropdown menu on hover */
	.dropdown:hover .dropdown-content {
	  display: block;
	  
	}
	
	/* Change the background color of the dropdown button when the dropdown content is shown */
	.dropdown:hover .dropbtn {
	  background-color: #666666;
	  color:#e6e6fa;
	}
	.middelContents{
		/*background-color: rgb(71, 71, 71);*/
		color: rgb(0, 0, 0);
		font-size: 25px;
		font-weight: bolder;
		width: 100%;
		text-align: center;
		/*
		border-bottom: 5px solid white;
		border-right: 5px solid white;
		*/
		margin-bottom: 10px;
	}
    </style>
 
  <section id="topwrap">
    <nav class="topmenu">
        <ul>
            <li><a href="#">회원가입</a></li>
            <li><a href="#">로그인</a></li>
            <li><a href="#">장바구니</a></li>
            <li><a href="#">주문조회</a></li>
            <li><a href="#">최근본상품</a></li>
            <li><a href="#">고객센터</a></li>
        </ul>
    </nav>
    <h1 class="title">우리동네 신발</h1>
    <!-- <header>
    </header> -->
     <div class="menuwrap">
    	<div class="dropdown">
          <button class="dropbtn" onclick="location.href='http://www.naver.com'">Home</button>
        </div>

        <div class="dropdown">
          <button class="dropbtn" onclick="location.href='http://www.naver.com'">Running</button>
          <!-- 
          <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
          </div>--> 
        </div>

        <div class="dropdown">
          <button class="dropbtn" onclick="location.href='http://www.naver.com'">LifeStyle</button>
           <!-- 
          <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
          </div>--> 
        </div>

        <div class="dropdown">
          <button class="dropbtn" onclick="location.href='http://www.naver.com'">Sandle</button>
            <!-- 
          <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
          </div>-->
        </div>

        <div class="dropdown">
          <button class="dropbtn" onclick="location.href='http://www.naver.com'">Sport</button>
          <!-- 
          <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
          </div>-->
        </div>

           <div class="dropdown">
            <button class="dropbtn" onclick="location.href='http://www.naver.com'">Board</button>
            <!--
            <div class="dropdown-content">
              <a href="#">Link 1</a>
              <a href="#">Link 2</a>
              <a href="#">Link 3</a>
            </div>-->
         </div>

     </div>
   </section>
         <div class="hidden"></div>
     
        
          