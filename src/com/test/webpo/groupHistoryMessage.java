package com.test.webpo;

import java.util.Date;

public class groupHistoryMessage {
	Integer userid;
	Integer groupid;
	Integer id;
	Integer usergroupid;
	String message;
	Date stime;
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Integer getId() {
		return id;
	}
	public Integer getGroupid() {
		return groupid;
	}
	public void setGroupid(Integer groupid) {
		this.groupid = groupid;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUsergroupid() {
		return usergroupid;
	}
	public void setUsergroupid(Integer usergroupid) {
		this.usergroupid = usergroupid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getStime() {
		return stime;
	}
	public void setStime(Date stime) {
		this.stime = stime;
	}
	
}
