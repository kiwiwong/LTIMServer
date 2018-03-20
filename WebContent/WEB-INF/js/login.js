$(function(){
	//UIkit.icon('.toprightico').svg.then(function(svg) { svg.querySelector('path').style.stroke = 'white'; })
	
	$('#loginbtn').click(function(){
		window.location.href = "login1?name="+$('#num').val()+"&psw="+$("#pwd").val();
	});
	$('.register').click(function(){
		window.location.href = "register";
	});
})
