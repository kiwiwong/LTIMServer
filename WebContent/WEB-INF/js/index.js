$(document).ready(function(){
	$(".headImage").click(function(){
		$('.headList').toggle();
	});
	
	$(".chat,.friends,.files").click(function(){
		$('.chatMain').css('display', 'none');
		$('.bgChat').css('display', 'block');
		$('.friendOne').css('background', '#fafafa');
	});
	$(".chat").click(function(){
		$('.entry-trangle').css('left', '135px');
	});
	$(".friends").click(function(){
		$('.entry-trangle').css('left', '201px');
	});
	$(".files").click(function(){
		$('.entry-trangle').css('left', '265px');
	});
	//左侧滚动条显示
	$(".chatLeft").mouseover(function(){
		$(".chatLeft").css('overflow-y','auto');
	});
	$(".chatLeft").mouseleave(function(){
		$(".chatLeft").css('overflow-y','hidden');
	});
	
	
});


$(function(){
	 
	/*var mydate = new Date();
	 var minute = mydate.getMinutes();*/
	
	 var unreadnum = {};
	 var name= $('.myName').html();
	 var id = $('#componment').html();
	 var websocket = null;  
	 var audio = document.getElementById("bgMusic");
     // 判断当前浏览器是否支持WebSocket
   
     if('WebSocket' in window) {  
        var hostport=document.location.host;
        websocket = new WebSocket("ws://"+hostport+"/LTIMServer/sock/"+id);  
     }
     else{  
        alert('当前浏览器 Not support websocket')  
     }  
    // 连接发生错误的回调方法
     websocket.onerror = function () {  
             // 需要部署在Tomcat7.0.47以上的版本才能运行
        setMessageInnerHTML("WebSocket连接发生错误");  
     };  
    // 连接成功建立的回调方法
     websocket.onopen = function () {  
        setMessageInnerHTML("WebSocket连接成功");  
     }  
    // 接收到消息的回调方法
     websocket.onmessage = function (event) {
    	
    	 
    	 
    	if(event.data.substr(0,1)=="["){
    		/*****写两个方法，一个显示群组中好友的消息显示，另一个显示自己的消息，同时，样式要改，要加上好友和自己的名字******/
    		var submessage = event.data.substr(1,event.data.length);
    		var info=[];
    		info = submessage.split("┒");
    		if(info[0] == id){
    			showGroupMyMessage(info[1]);
    		}else{
    			showGroupMessage(info[0],info[1],info[2]);
    		}
    	}else{
    		var info = [];
    	    info = event.data.split("┒");
    	    
    	    //在此处添加判断接受到的消息是否为群消息，如果是群消息，则走另外一个函数
    	    if(info[0] == id){
    	    	showMyselfMessage(info[1]);
    	    }else{
    	    	showFriendMessage(info[0],info[1],1);	
    	    }
    	}
	    
	   	
	      
    }  
    // 连接关闭的回调方法
   websocket.onclose = function () {  
       setMessageInnerHTML("WebSocket连接关闭");  
    }  
    // 监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
   window.onbeforeunload = function () {  
       closeWebSocket();  
    }  
    // 将消息显示在网页上
   function setMessageInnerHTML(innerHTML) {  
      console.log(innerHTML);
    }  
    // 关闭WebSocket连接
   function closeWebSocket() {  
       websocket.close();  
    }  
    // 发送消息
   $('.sendButton').click(function(){
	   var friendid=$('.friendid').text();
	   var message = $('.inputChat').val();  
       websocket.send(friendid+"┒"+message);
       $('.inputChat').val('');
   });
   //加载左侧好友列表
   $.ajax({
   	type:"post",
   	url:"listrecentuser",
   	async:true,
   	success:function(data){
   		
   		$.each(data,function(index,item){
   			if(item.userid!=id){
   				unreadnum[item.userid]=0;
   				$('.chatLeft').append('<div class="friendOne"><img class="friendImg" src="'+item.touxiang+'"/><div class="friendInfor"><div class="friendInforCon"><p class="name">'+
   	   	   				item.name+
   	   	   				'</p><span class="leftfriendid" style="display:none;">'+item.userid+'</span><span class="message">你好你好！</span></div><div class="friendInforNum"></div></div></div>')
   			}
   			
   		});
   	},
   	error:function(data){
   		console.log(data.status);
   	}
   });
   //左侧好友栏点击事件
   $('.chatLeft').on('click','.friendOne',function(){
	    $('.messageBody').css('display', 'block');
	    $('.bgChat').css('display', 'none');
	    $('.chatMain').css('display', 'block');
	    $('.entry-trangle').css('left', '135px');
	    $(".friendName").text($(this).find(".name").text());
	    $('.friendid').text($(this).find(".leftfriendid").text())
	    $('.friendOne').css('background', 'none');
	    $(this).css('background', '#ebebec');
	    $('.messageBody').empty();
	    $(this).find('.friendInforNum').empty();
	    unreadnum[$(this).find('.leftfriendid').text()] = 0;
	    
	    
	    var leftfriendid=$(this).find(".leftfriendid").text()
		var myid = $('#componment').html();
	    //alert(myid);
	    //通过异步来获取历史聊天信息
	    if(leftfriendid>0){
	    	$.ajax({
		    	type:"post",
		       	url:"gethismessage",
		       	data:{
		       		sender:myid,
		       		receiver:leftfriendid
		       	},
		       	async:true,
		       	success:function(data){
		       		$.each(data,function(index,item){
		       			if(item.sender==myid){
			       			showMyselfMessage(item.message);
			       			
			       		}else{
			       			showFriendMessage(item.sender,item.message,0);				    	
			       		}
		       			
		       			var tmcuo = data[index].stime;
	       				var time = new Date(tmcuo);
	       				var tt=new Date(tmcuo).toLocaleString();
		       			var day = time.getDate();
		       			var me = day*24*60;
		       			if(index>0){
			       		    var mb = new Date(data[index-1].stime).getDate()*24*60;
			       		    var differ = me - mb;
			       		    /*console.log(differ);*/
			       		    if(differ>2){
			       		    	$('.messageBody').append('<div class="chatTime"><span class="chatTimeCon">'+
				           				 tt+
				           				 '</span></div>');
			       		    } 
		       			}
		       			
		       		   	$('.messageBody').scrollTop( $('.messageBody')[0].scrollHeight );	       			
		       		});
		       	},
		       	error:function(data){
		       		console.log(data.status);
		       	}
		    });//end ajax;
	    }else if(leftfriendid<0){
	    	$.ajax({
		    	type:"post",
		       	url:"getgrouphistorymessage",
		       	data:{
		       		groupid:leftfriendid
		       	},
		       	async:true,
		       	success:function(data){
		       		console.log(data);
		       		$.each(data,function(index,item){
		       			
		       			if(item.userid==myid){
		       				showGroupMyMessage(item.message);
			       			
			       		}else{
			       			showGroupMessage(item.userid,item.message,item.groupid);				    	
			       		}
		       			
		       			var tmcuo = data[index].stime;
	       				var time = new Date(tmcuo);
	       				var tt=new Date(tmcuo).toLocaleString();
		       			var day = time.getDate();
		       			var me = day*24*60;
		       			if(index>0){
			       		    var mb = new Date(data[index-1].stime).getDate()*24*60;
			       		    var differ = me - mb;
			       		    /*console.log(differ);*/
			       		    if(differ>2){
			       		    	$('.messageBody').append('<div class="chatTime"><span class="chatTimeCon">'+
				           				 tt+
				           				 '</span></div>');
			       		    } 
		       			}
		       			
		       		   	$('.messageBody').scrollTop( $('.messageBody')[0].scrollHeight );	       			
		       		});
		       	},
		       	error:function(data){
		       		console.log(data.status);
		       	}
		    });//end ajax;
	    }
	    
   });//end click;
   
   function showMyselfMessage(message){ //显示自己发的消息
	   $('.messageBody').append('<div class="myMessage chatMessage"><div class="myQipao friendQipao">'+
	            '<div class="myQipaoCon"><span class="myMessageCon">'+
	    		message+
	    		'</span><span class="mySanjiao" uk-icon="icon: triangle-right" style="color: #FFFF00;"></span></div></div><img class="myImageRight" src="'+$('.headImage')[0].src+'"/></div>');
	   $('.messageBody').scrollTop( $('.messageBody')[0].scrollHeight );
   }
   
   function showGroupMyMessage(message){ //显示群组中自己发的消息，应该加上名字
	   $('.messageBody').append('<div class="myMessage chatMessage"><div class="chatMessageMain"><span class="myMemberName">'+
			   name+
			   '</span><div class="myQipao groupFriendQipao">'+
	            '<div class="myQipaoCon"><span class="myMessageCon">'+
	    		message+
	    		'</span><span class="mySanjiao" uk-icon="icon: triangle-right" style="color: #FFFF00;"></span></div></div></div><img class="myImageRight" src="'+$('.headImage')[0].src+'"/></div>');
	   $('.messageBody').scrollTop( $('.messageBody')[0].scrollHeight );
   }
   
   function showGroupMessage(friendid,message,groupid){//显示群组中其他人发的消息，应该加上名字
	   
	   if($('.friendid').text()==groupid){
   		    var src;
	    	$('.friendOne').each(function(){
	    		if($(this).find('.leftfriendid').text()==friendid){
	    			src=$(this).find('img')[0].src;
	    			mname=$(this).find('.name').text();
	    		}
	    	})
	    	 $('.messageBody').append('<div class="chatMessage">'+
					'<img class="friendOneRight" src="'+src+'"/>'+
					'<div class="chatMessageMain">'+
					'<span class="memberName">'+
					mname+
					'</span>'+
					'<div class="groupFriendQipao">'+
				    '<div class="friendQipaoCon">'+
				    '<span class="chatBoxIcon sanjiao" uk-icon="icon: triangle-left" style="left: -17px;top: -3px;color: #FFFF00;"></span>'+
				    '<span class="friendMessageCon">'+
				    message+
				    '</span></div></div></div></div>');
	    	showRedNum(groupid,message,0);
	    	$('.messageBody').scrollTop( $('.messageBody')[0].scrollHeight );
	   	}else{
	   		showRedNum(groupid,message,1);
	   	}
	   		
   }
   
   function showFriendMessage(friendid,message,status){//显示好友发的消息
	   if($('.friendid').text()==friendid){
   		var src;
	    	$('.friendOne').each(function(){
	    		if($(this).find('.leftfriendid').text()==friendid){
	    			src=$(this).find('img')[0].src;
	    		}
	    	})
	    	 $('.messageBody').append('<div class="chatMessage">'+
					'<img class="friendOneRight" src="'+src+'"/>'+
					'<div class="friendQipao">'+
				    '<div class="friendQipaoCon">'+
				    '<span class="chatBoxIcon sanjiao" uk-icon="icon: triangle-left" style="left: -17px;top: -3px;color: #FFFF00;"></span>'+
				    '<span class="friendMessageCon">'+
				    message+
				    '</span></div></div></div>');
	    	if(status)
	    		showRedNum(friendid,message,0);
	    	$('.messageBody').scrollTop( $('.messageBody')[0].scrollHeight );
	   	}else{
	   		if(status)
	   			showRedNum(friendid,message,1);
	   	}
	   		
   }
   function showRedNum(friendid,message,flag){//显示并判断是否应该显示红色数量气泡以及置顶好友，添加收到的消息；
	   $('.friendOne').each(function(){
			if($(this).find('.leftfriendid').text()==friendid){
				$(this).find('.message').html(message);
				$(this).prependTo($(".chatLeft"));
				if(flag){
					$(this).find('.friendInforNum').empty();
					unreadnum[friendid]++;
					$(this).find('.friendInforNum').append('<div class="messageNum"><p class="messageNumCon">'+unreadnum[friendid]+'</p></div>');
					audio.play();
					audio.currentTime = 0;
					//添加提示音，但...没反应。
					/*$(this).find('.friendInforNum').append('<audio id="audio" controls="controls" autoplay="true" style="display: none;"><source src="ring2.mp3"></source></audio>');*/ 
					
				}
					
			}
	});
   }
   
})