
$(function() {
	$('.language').mouseover(function() {
		$('.languageList').css('display', 'block');
		$('.imageDown').css('display', 'none');
		$('.imageUp').css('display', 'inline-block');
	});
	$('.language').mouseout(function() {
		$('.languageList').css('display', 'none');
		$('.imageDown').css('display', 'inline-block');
		$('.imageUp').css('display', 'none');
	});
	
	/*左侧图片轮播*/
	var size = $('.side img').size();
    var _index = size;
    var timer = null;
    $('.side').append($('.side img:eq(0)').clone());
    timer = setInterval(function(){
        $('.side img').eq(_index).fadeOut(50);
        _index == 1?_index=size:_index--;
        $('.side img').eq(_index).fadeIn(50);
    },4000);
    
    
    
    $('input').focus(function(){
    	$(this).bind('input propertychange', function(){
    		$(this).closest('.inputArea').find('.inputPlaceholder').addClass('slideup');
       });
    });
    $('#nickname').focus(function(){
    	$('.passwordTipsGroup').addClass('slideup');
    	$('.nameErrorTips').css('display', 'block');
    	$('.nameError').addClass('slideup');
    });
    $('#nickname').blur(function(){
    	if($('.nickname').val() == ''){
    		$('.nameErrorTips').css('display', 'block');
    	    $('.nameErrorTips').text('昵称不可以为空');
    	    $('.nameError').removeClass('slideup');
    		$('.inputName').find('.inputPlaceholder').removeClass('slideup');
    		$('.inputName').find('.inputOk').css('display', 'none');
    	}else{
    		$('.inputName').find('.inputOk').css('display', 'block');
    	}
    });
    
    /*表单输入密码格式验证*/
    var regNull = /\s/; //空格
    var regLength = /^\s*[\s\S]{8,16}\s*$/; //8-16位
    var regClass = /(?!^[0-9]+$)(?!^[A-z]+$)(?!^[^A-z0-9]+$)^.{1,16}$/; //8~16位字符，至少包含数字.字母.符号中的2种
    $('.password').focus(function(){
    	$(this).bind('input propertychange', function(){
    		var str = $(this).val();
            if(regNull.test(str)){
            	$('#okSpace').css('background','url(img/info.png) no-repeat');
            }else{
            	$('#okSpace').css('background','url(img/green.png) no-repeat');
            }
            if(regLength.test(str)){
                $('#okLength').css('background','url(img/green.png) no-repeat');
            }else{
            	$('#okLength').css('background','url(img/info.png) no-repeat');
            }
            if(regClass.test(str)){
                $('#okClass').css('background','url(img/green.png) no-repeat');
            }else{
            	$('#okClass').css('background','url(img/info.png) no-repeat');
            }
            $('.eye').css('display','block');
        });
        $('.pswError').addClass('slideup');
    	$('.pswErrorTips').css('display', 'none');
    	$('.passwordTipsGroup').removeClass('slideup');
    });
    $('#password').blur(function(){
    	if($('.password').val() == ''){
    		$('.pswError').removeClass('slideup');
    		$('.pswErrorTips').css('display', 'block');
    		$('.pswErrorTips').text('密码不能为空');
    		$('.passwordTipsGroup').addClass('slideup');
    		$('.inputPsw').find('.inputPlaceholder').removeClass('slideup');
    		$('.eye').css('display','none');
    	}else{
    		var psw = $('.password').val();
    		if(!regNull.test(psw)){
    			if(regLength.test(psw)){
    				if(regClass.test(psw)){
    					$('.inputPsw').find('.inputOk').css('display', 'block');
    				}else{
    					$('.pswErrorTips').text('必须包含字母、数字、符号中至少2种');
    				}
    			}else{
    				$('.pswErrorTips').text('长度为8~16个字符');
    			}
    		}else{
    			$('.pswErrorTips').text('不能包括空格');
    		}
    		
    		if(regNull.test(psw)||!regLength.test(psw)||!regClass.test(psw)){
    			$('.pswError').removeClass('slideup');
    		    $('.pswErrorTips').css('display', 'block');
    		    $('.passwordTipsGroup').addClass('slideup');
    		}	
    	}
    });
    $('.eye').mousedown(function(){
    	$('.password').attr('type','text');
    	$('.eye').removeClass('close');
    });
    $('.eye').mouseup(function(){
    	$('.password').attr('type','password');
    	$('.eye').addClass('close');	
    });
    
    $('.nation').focus(function(){
    	$('.duanxin').css('display','block');
    });
    $('.nation').blur(function(){
    	if($('.nation').val() == ''){
    		$('.duanxin').css('display','none');
    		$('.nationArea').find('.inputPlaceholder').removeClass('slideup');
    	}
    });
    
    $('.code').blur(function(){
    	if($('.code').val() == ''){
    		$('.codeArea').find('.inputPlaceholder').removeClass('slideup');
    	}
    });
    
    var clickNum = 0;
    $(".selector img").click(function(){
    	clickNum++;
    	$(this).css('display','none');
    	$(this).next().css('display','inline-block');
    	$(this).prev().css('display','inline-block');
    	if(clickNum%2 == 1){
    		$('.options').css('display','block');
    	}else{
    		$('.options').css('display','none');
    	}
    });
    $('.mailItem').click(function(){
    	clickNum++;
    	var m = $(this).text();
    	$('.phone').val(m);
    	$('.options').css('display','none');
    	$('.selectorUp').css('display','none');
    	$('.selectorDown').css('display','inline-block');	
    })
    /*点击发送验证码*/
    $('.sendSms').click(function(){
    	var psw = $('.password').val();
    	if(!regNull.test(psw)&&regLength.test(psw)&&regClass.test(psw)){
    		$('.sendSms').text('发送成功');
    		$('.sendSms').css('opacity','0.5');
   	        alert('发送成功！\n请前往邮箱查看并填写验证码！');
    	}
    });
    
    
    /*页面底部图标点击事件*/
    $(".checkbox img").click(function(){
    	$(this).css('display','none');
    	$(this).next().css('display','inline-block');
    	$(this).prev().css('display','inline-block');
    });
    $('.agreeListDown').click(function(){
    	$('.agreeListDown').css('display','none');
    	$('.agreeListUp').css('display','inline-block');
    	$('.agreementList').css('visibility','visible');
    	$('.agreementList').css('opacity','1');
    });
    $('.agreeListUp').click(function(){
    	$('.agreeListDown').css('display','inline-block');
    	$('.agreeListUp').css('display','none');
    	$('.agreementList').css('visibility','hidden');
    	$('.agreementList').css('opacity','0');
    });
    
    
    var emailcode;
    var email;
    //点击发送验证码
    $('.sendSms').click(function(){
    	email = $('.nation').val()+$('.phone').val();
    	$.ajax({
	   	    type:"post",
	   	    url:"sendchecknum",
	   	    data:{
       		    url:email
       	    },
	   	    async:true,
	   	    success:function(data){	   
	   		    emailcode=data;
	   	    },
	   	    error:function(data){
	   		    console.log(data.status);
	   	    }
	    });
    });
    
    //点击注册
    $('.submit').click(function(){
    	
    	var inputcode = $('.code').val();
    	if(inputcode==emailcode){
		    var nickname = $('.nickname').val();
		    var password = $('.password').val();
		    
		   
		    $.ajax({
		   	    type:"post",
		   	    url:"registernum2",
		   	    data:{
	       		    name:nickname,
	       		    password:password,
	       		    email:email
	       	    },
		   	    async:true,
		   	    success:function(data){
		   		   if(data=="error"){
		   			   alert();
		   		   }else{
		   			   window.location.href="regsuccess?num="+data;
		   		   }
		   			
		   		    
		   	    },
		   	    error:function(data){
		   		    console.log(data.status);
		   	    }
		    });
    	}else{
    		alert("");
		    return false;
		}
    });
    
    
    
    
});

    

