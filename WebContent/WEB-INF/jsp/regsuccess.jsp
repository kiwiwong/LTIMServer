<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/register.css"/>
		
	</head>
	<body>
		<a class="logo" href="#">QQ</a>
		<div class="side">
			<img src="img/sidebg1.jpg"/>
            <img src="img/sidebg2.jpg"/>
            <img src="img/sidebg3.jpg"/>
		</div>
		<div class="top">
			<div class="item feedback">
				<a href="#">意见反馈</a>
			</div>
			<div class="item language">
				<div>
					简体中文&nbsp;
					<img class="imageDown" src="img/down.png"/>
					<img class="imageUp" src="img/up.png" style="display: none;"/>
				</div>
				<ul class="languageList" style="display: none;">
					<li><a href="#">繁体中文</a></li>
					<li><a href="#">English</a></li>
				</ul>
			</div>
			<div class="item mail">
				<a href="#">邮箱账号</a>
			</div>
			<div class="item lianghao">
				<a class="lianghaoEntry" href="#">
					<div>QQ靓号</div>
					<img src="img/viplogo.png"/>
				</a>
			</div>
		</div>
		<div class="mainWraper">
			<div class="main">
				<div class="form">
					<div class="welcome">
						<div class="welcomeCon">恭喜注册成功！</div>
						<div class="header-s">您的QQ账号为：</div>
						<div class="header-s qqNumber">${num}</div>
						<div class="header-s tishi">请在24小时内完成登录，以激活您的账号！</div>
						<a href="login" id="toLogin" class="toLogin">前往登录</a>
					</div>
				</div>
				<div class="footer-s">
					Copyright 
					<span>©</span>
					 1998-
					 <script>document.write((new Date).getFullYear());</script>
					 A Imitated Page
				</div>
			</div>
		</div>
		<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>
		<script src="js/register.js"></script>
		<script type="text/javascript">
            
        </script>
        
	</body>
</html>
