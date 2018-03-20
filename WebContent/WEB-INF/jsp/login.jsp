<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>仿TIM</title>
		<link rel="icon" type="image/x-icon" href="img/logo-tim.png"/>
		<link rel="stylesheet" type="text/css" href="dist/css/uikit.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
</head>
<body>
	<div id="app">
			<div class="top">
				<span href="" class="toprightico close" uk-icon="icon: close"></span>
				<span href="" class="toprightico" uk-icon="icon: minus"></span>
				<span href="" class="toprightico" uk-icon="icon: chevron-down"></span>
			</div>
			<div class="main">
				<div class="touxiang">
					
				</div>
				<span class="status">
					
				</span>
				
				<input type="text" name="num" id="num" value="" placeholder="QQ号码/手机/邮箱" /><span href="" class="drop-down" uk-icon="icon: chevron-down"></span>
				<input type="password" name="pwd" id="pwd" value="" placeholder="密码" /><span href="" class="keybord" uk-icon="icon: commenting"></span>
				
				<a href="register" class="register">注册账号</a>
				<a href="" class="findpsw">找回密码</a>
				<div class="checkboxs">
					<label class="remember" for="remember"><input type="checkbox" name="remember" id="remember" value="记住密码"/>记住密码</label>
					<label class="autologin" for="autologin"><input type="checkbox" name="autologin" id="autologin" value="自动登录" />自动登录</label>
				</div>
				
				<div class="footer">
					<span href="" class="user" uk-icon="icon: users"></span>
				
					<button id="loginbtn">安全登录</button>
					<span href="" class="two" uk-icon="icon:  thumbnails"></span>
				</div>
			</div>
			
			
		</div>
		
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="dist/js/uikit.min.js"></script>
		<script src="dist/js/uikit-icons.min.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
</body>
</html>