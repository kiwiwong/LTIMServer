package com.test.mybatis.mapper;

import java.util.List;
import java.util.Map;

import com.test.mybatis.po.Ptphismes;
import com.test.webpo.groupHistoryMessage;

public interface myselfMapper {
	//获取私聊消息
	List<Ptphismes> getPtpMessage(Map<String, Object> param);
	
	//获取群聊历史消息
	List<groupHistoryMessage> getGroupHistoryMessage(Integer groupid);
}
