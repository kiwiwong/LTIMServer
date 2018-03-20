<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>仿TIM</title>
		<link rel="icon" type="image/x-icon" href="img/logo-tim.png"/>
		<link rel="stylesheet" type="text/css" href="dist/css/uikit.min.css"/>
		<link rel="stylesheet" type="text/css" href="css/index.css"/>
</head>
<body>
	<div class="chatPage">
			<div class="banner">
				
				<img class="headImage" src=${touxiang}/>
				<div class="headList">
					<div class="headName">
						<p class="myName">${name}</p>
						<span style = "display:none" id="componment" class="myid">${id}</span>
						<span class="jianjie">我是谁？将要去哪？</span>
					</div>
					<hr/>
					<ul class="ulList">
						<li><span uk-icon="icon: cloud-upload"></span>&nbsp;微云</li>
						<li><span uk-icon="icon: calendar"></span>&nbsp;日程</li>
						<li><span uk-icon="icon: star"></span>&nbsp;收藏</li>
						<li><span uk-icon="icon: mail"></span>&nbsp;邮箱</li>
						<li><span uk-icon="icon: bell"></span>&nbsp;消息管理</li>
						<hr/>
						<li><span uk-icon="icon: thumbnails"></span>&nbsp;福利</li>
						<hr/>
						<li>&nbsp;在线</li>
						<li>&nbsp;切换账号</li>
						<li>&nbsp;退出账号</li>
					</ul>
				</div>
				<div class="search">
					<form>
						<label id="kuang">
							<span href="" class="toSearch" uk-icon="icon: search"></span>
							<input type="text" name="searchBox" id="searchBox" />
						</label>
					</form>   
				</div>
				<div class="changeTop">
					<span href="" class="chat" uk-icon="icon: comments" onclick="chatIconOne()"></span>
				    <span href="" class="friends" uk-icon="icon: users" onclick="chatIconTwo()"></span>
				    <span href="" class="files" uk-icon="icon: file-edit" onclick="chatIconThree()"></span>
					
				</div>
				<div class="topRight">
				    <span href="" class="toprightico close" uk-icon="icon: close"></span>
				    <span href="" class="toprightico max"></span>
				    <span href="" class="toprightico" uk-icon="icon: minus"></span>
				    <span href="" class="toprightico" uk-icon="icon: menu"></span>
			    </div>
				
			</div>
			<div class="chatBody">
				<div class="chatLeft">
					
					
				</div>
				<div class="chatMain">
					<div class="entry-trangle"></div>
					<div class="chatTop">
						<span class="friendName"></span>
						<span class="friendid" style="display:none"></span>
						<div class="chatTopRight">
							<span class="chatTopIcon" uk-icon="icon: desktop"></span>
							<span class="chatTopIcon" uk-icon="icon: whatsapp"></span>
							<span class="chatTopIcon" uk-icon="icon: plus-circle"></span>
							<span class="chatTopIcon" uk-icon="icon: nut"></span>
						</div>
					</div>
					<div class="messageBody">
						
						
					</div>
					<div class="chatBox">
						<div class="chatBoxTop">
							<span class="chatBoxIcon" >A</span>
							<span class="chatBoxIcon" uk-icon="icon: happy"></span>
							<span class="chatBoxIcon" uk-icon="icon: file-edit"></span>
							<span class="chatBoxIcon" uk-icon="icon: phone"></span>
							<span class="chatBoxIcon sanjiao" uk-icon="icon: triangle-down"></span>
							<span class="chatBoxIcon" uk-icon="icon: location"></span>
							<span class="chatBoxIcon" uk-icon="icon: bell"></span>
							<span class="chatBoxIcon" uk-icon="icon: image"></span>
							<span class="chatBoxIcon" uk-icon="icon: folder"></span>
						</div>
						<div class="historyMessage">
							<span>消息记录&nbsp;&nbsp;</span>
							<span class="chatBoxIcon sanjiao" uk-icon="icon: triangle-down"></span>
						</div>
						<textarea class="inputChat"></textarea>
						<button class="sendButton">发送&nbsp;&nbsp;
							<span class="chatBoxIcon sanjiao" uk-icon="icon: triangle-down"></span>
						</button>
					</div>
				</div>
				<div class="bgChat">
					<div class="entry-trangle"></div>
				    <img src="img/bg-chat.png" />	
				</div>
				
			</div>
			
		</div>
		
		<audio id="bgMusic">
		    <source = src="music/ring2.mp3" type="audio/mp3">
		</audio>
		
		<script type="text/javascript" src="js/jquery.js"></script>
		<script type="text/javascript" src="dist/js/uikit.min.js"></script>
		<script src="dist/js/uikit-icons.min.js"></script>
		<script src="js/index.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>