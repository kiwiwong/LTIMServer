package com.test.controller;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.Singleton.Checknum;
import com.test.Singleton.RegisterNum;
import com.test.Singleton.SendMail;
import com.test.mybatis.po.Ptphismes;
import com.test.mybatis.po.TUser;
import com.test.service.loginService;
import com.test.webpo.groupHistoryMessage;
@Controller
public class testController {
	
	@Autowired
	loginService loginService;
	
	@RequestMapping("/")
	public String Index(){
		return "login";
	}
	
	@RequestMapping("/login1")
	public String rootframe(Model model,String name,String psw){
		Boolean flag = loginService.checklogin(model, name, psw);
		if(flag)
			return "index";
		else
			return "error";
		
	}
	
	@RequestMapping("/login")
	public String login(){
		
		return "login";
	}
	
	@RequestMapping("/register")
	public String register(){
		
		return "register";
	}
	
	@RequestMapping("/regsuccess")
	public String regsuccess(Model model,String num){
		model.addAttribute("num", num);
		return "regsuccess";
	}
	
	@RequestMapping(value="/listrecentuser",method = RequestMethod.POST)
	@ResponseBody
	public List<TUser> listrecentuse(){
		return loginService.listallusers();
	}
	
	@RequestMapping(value="/gethismessage",method = RequestMethod.POST)
	@ResponseBody
	public List<Ptphismes> getHistoryMessage(Integer sender,Integer receiver){
		return loginService.getPtpmessage(sender, receiver);
	}
	
	@RequestMapping(value="/getgrouphistorymessage",method = RequestMethod.POST)
	@ResponseBody
	public List<groupHistoryMessage> getGroupHisMessage(Integer groupid){
		return loginService.getGroupHistoryMessage(groupid);
	}
	@RequestMapping(value="/sendchecknum")
	@ResponseBody
	public Integer sendchecknum(String url){
		Checknum checknum = Checknum.getChecknum();
		SendMail mail = SendMail.getmail();
		Integer num = checknum.getnum();
		mail.sendMail(url, num.toString());
		return num;
	}
	
	@RequestMapping(value="/registernum2")
	@ResponseBody
	public String register(String name,String password,String email){
		RegisterNum num = RegisterNum.getRegisterNum();
		Integer tnum = num.getRegisternum();
		System.out.println(tnum.toString());
		
		if(loginService.register(name, password, email, tnum.toString())){
			return tnum.toString();
		}else{
			return "error";
		}
		
	}



}
