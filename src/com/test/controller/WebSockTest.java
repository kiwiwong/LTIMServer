package com.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;
import org.springframework.web.context.ContextLoader;

import com.test.service.loginService;
import com.test.webpo.user;

@Controller
@ServerEndpoint(value = "/sock/{param}")
public class WebSockTest{
	
	loginService us = (loginService) ContextLoader.getCurrentWebApplicationContext().getBean("loginService");
	//private final static List<Session> sessions =Collections.synchronizedList(new ArrayList<Session>());
	//private final static Map<String, Session> namesess = new HashMap<>();
	
	private final static List<user> list = Collections.synchronizedList(new ArrayList<user>());
	@OnMessage
	public void onMessage(String message ,Session session,@PathParam(value="param") Integer param) throws IOException, InterruptedException{
		String[] info = null;
		Integer friendid=null;
		if(message.contains("┒")){
			info= message.split("┒");
			friendid = Integer.parseInt(info[0]);
			if(friendid.intValue()>0){
				SendToUser(friendid,param,info[1]);
			}else if (friendid.intValue()==-1) {
				sendToAll(info[1], param,friendid);
			}
			
		}else{
			sendToAll(message,param,friendid);
		}
	}
	
	 @OnOpen
	 public void onOpen(Session session ,@PathParam(value="param") Integer param) throws IOException {
	     System.out.println("Client connected");
	     user u = new user();
	     u.setName(param);
	     u.setSession(session);
	     list.add(u);
	 }

	 @OnClose
	 public void onClose(Session session ,@PathParam(value="param") Integer param) {
	     
		 System.out.println("Connection closed");
	     
		 Iterator<user> iterator = list.iterator();
         while(iterator.hasNext()){
             user integer = iterator.next();
             if(integer.getName()==param && integer.getSession()==session)
                 iterator.remove();   //注意这个地方
         }
	 }
	 
	 private void SendToUser(Integer receive,Integer sender,String message) throws IOException{
		 
		 
		 System.out.println("Received："+message);
		 
		 int flag=0;
		 
		 for(user item:list){
				if(item.getSession().isOpen()&&(item.getName()==receive || item.getName()==sender)){
					item.getSession().getBasicRemote().sendText(sender+"┒"+message);
					if(item.getName() != sender){
						flag=1;
					}
				}
		}
		 
		if (flag==1) {
			us.insertptpmessage(sender, receive, message, true);
		} else {
			us.insertptpmessage(sender, receive, message, false);
		}
	 }
	 private void sendToAll(String message,Integer sender,Integer groupid) throws IOException{
		 System.out.println("Received:"+message);
		 us.insertgroupmessage(groupid, sender, message);
		 for(user item:list){
				if(item.getSession().isOpen()){
					item.getSession().getBasicRemote().sendText("["+sender+"┒"+message+"┒"+groupid);
					System.out.println("Send to"+item.getName()+":"+"["+sender+"┒"+message+"┒"+groupid);
					
				}
		}
	 }
}