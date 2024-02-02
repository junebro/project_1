<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
*{padding:0;margin:0}
li{list-style:none}
a{text-decoration:none;font-size:14px}
.menu {
  width: 800px;
  overflow: hidden;
  margin: 150px auto;
}

.menu > li {
  width: 20%; /*20*5=100%*/
  float: left;
  text-align: center;
  line-height: 40px;
  background-color: #5778ff;
}

.menu a {
  color: #fff;
}

.submenu > li {
  line-height: 50px;
  background-color: #94a9ff;
}

.submenu {
  height: 0; /*ul의 높이를 안보이게 처리*/
  overflow: hidden;
}



.menu > li:hover {
  background-color: #94a9ff;
  transition-duration: 0.5s;
}

.menu > li:hover .submenu {
  height: 250px; /*서브메뉴 li한개의 높이 50*5*/
  transition-duration: 1s;


</style>
</head>
<body>

    <ul class="menu">
      <li>
        <a href="#">MENU1</a>
        <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
      <li>
        <a href="#">MENU2</a>
        <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
      <li>
        <a href="#">MENU3</a>
        <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
      <li>
        <a href="#">MENU4</a>
        <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
      <li>
        <a href="#">MENU5</a>
        <ul class="submenu">
          <li><a href="#">submenu01</a></li>
          <li><a href="#">submenu02</a></li>
          <li><a href="#">submenu03</a></li>
          <li><a href="#">submenu04</a></li>
          <li><a href="#">submenu05</a></li>
        </ul>
      </li>
    </ul>
</body>
</html>