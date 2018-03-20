<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>注册</title>
		<link rel="icon" type="image/x-icon" href="img/logo-tim.png"/>
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
						<div class="welcomeCon">欢迎注册QQ</div>
						<div class="header free"><a href="#">免费靓号</a></div>
						<div class="header">每一天，乐在沟通。</div>
					</div>
					<form>
						<div class="inputArea inputName">
							<div class="inputFlags"><div class="inputOk" style="display: none;"></div></div>
							<label class="inputPlaceholder">
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">昵称</font>
								</font>
							</label>
							<div class="inputOuter">
								<input autocomplete="off" type="text" class="nickname error" id="nickname" name="name" />
							</div>
							<div class="errorWrap slideup nameError">
								<div class="errorTips nameErrorTips" style="display: none;"></div>
							</div>
						</div>
						
						<div class="inputArea inputPsw">
							<label class="inputPlaceholder">
								<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">密码</font>
								</font>
							</label>
							<div class="inputFlags">
								<div class="inputOk" style="display: none;"></div>
								<div class="eye close" title="长按显示密码"></div>
							</div>
							<div class="inputOuter">
								<input autocomplete="off" type="password" class="password" id="password" name="pwd" maxlength="16"/>
							</div>
							<div class="passwordTipsGroup slideup">
								<div class="passwordTips" id="okSpace">不能包括空格</div>
								<div class="passwordTips" id="okLength">长度为8~16个字符</div>
								<div class="passwordTips" id="okClass">必须包含字母、数字、符号中至少2种</div>
							</div>
							<div class="errorWrap slideup pswError">
								<div class="errorTips pswErrorTips" style="display: none;"></div>
							</div>
						</div>
						
						<div style="position: relative;">
							<div class="inputArea phoneArea">
								<div class="inputFlags">
									<div class="inputOk" style="display: none;"></div>
								</div>
								<div class="inputOuter">
								    <input autocomplete="off" type="text" class="phone" id="phone" value="@qq.com"/>
								    <div class="selector">
							   	        <img class="selectorDown" src="img/down.png"/>
							   	        <img class="selectorUp" src="img/up.png" style="display: none;"/>
							        </div>
							   </div>
							</div>
							<div class="inputArea nationArea">
								<label class="inputPlaceholder" id="phoneTips">邮箱号</label>
								<div class="inputOuter">
								    <input autocomplete="off" type="text" class="nation"/>
							    </div>
							</div>
							<ul class="options country" style="display: none;">
								<li><a class="mailItem" href="#">@qq.com</a></li>
								<li><a class="mailItem" href="#">@163.com</a></li>
								<li><a class="mailItem" href="#">@126.com</a></li>
								<li><a class="mailItem" href="#">@gmail.com</a></li>
								<li><a class="mailItem" href="#">@sina.com</a></li>
								<li><a class="mailItem" href="#">@hotmail.com</a></li>
								<li><a class="mailItem" href="#">@sohu.com</a></li>
								<li><a class="mailItem" href="#">@yahoo.com</a></li>
							</ul>
						</div>
						<div class="errorWrap slideup">
								<div class="errorTips" style="display: none;"></div>
					    </div>
					    <div class="inputTipsWrap">
					    	<div class="inputTips">
					    		<font style="vertical-align: inherit;">
									<font style="vertical-align: inherit;">可通过该邮箱找回密码</font>
								</font>
					    	</div>
					    </div>
					    <div style="display: none;" class="duanxin">
					    	<a href="#" id="sendSms" class="sendSms">发送邮箱验证码</a>
					    	<div class="inputArea codeArea">
					    		<label class="inputPlaceholder" id="codeTips">邮箱验证码</label>
					    		<div class="inputOuter">
								    <input autocomplete="off" type="text" class="code" id="code"/>
							    </div>
					    	</div>
					    	<div class="errorWrap slideup">
								<div class="errorTips" style="display: none;"></div>
					        </div>
					    </div>
					    <div >
					    	<input type="button" id="getAcc" class="submit" value="立即注册" />
					    	<div class="errorWrap slideup">
								<div class="errorTips" style="display: none;"></div>
					        </div>
					    </div>
					    <div class="agreement">
					    	<label class="checkbox">
					    		<img class="checkboxImg1" src="img/checkbox_check.png"/>
					    		<img class="checkboxImg2" src="img/checkbox_normal.png" style="display: none;"/>
					    		 同时开通QQ空间
					    	</label>
					    	<br>
					    	<label class="checkbox">
					    		<img class="checkboxImg1" src="img/checkbox_check.png"/>
					    		<img class="checkboxImg2" src="img/checkbox_normal.png" style="display: none;"/>
					    		  我已阅读并同意相关服务条款和隐私政策
					    	</label>
					    	&nbsp;
					    	<img class="agreeListDown" src="img/down.png"/>
					    	<img class="agreeListUp" src="img/up.png" style="display: none;"/>
					    	<div class="agreementList" style="visibility: hidden;opacity: 0;" >
					    		<a href="#" target="_blank">《QQ号码规则》</a>
					    		<a href="#" target="_blank">《隐私政策》</a>
					    		<a href="#" target="_blank">《QQ空间服务协议》</a>
					    	</div>
					    </div>
					</form>
				</div>
				<div class="footer">
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
