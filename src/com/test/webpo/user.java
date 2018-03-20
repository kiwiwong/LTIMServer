package com.test.webpo;

import javax.websocket.Session;

public class user {
	Integer name;
	Session session;
	public Integer getName() {
		return name;
	}
	public void setName(Integer name) {
		this.name = name;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
	
}
