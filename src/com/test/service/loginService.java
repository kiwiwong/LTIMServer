package com.test.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.test.mybatis.mapper.GhistorymessageMapper;
import com.test.mybatis.mapper.PtphismesMapper;
import com.test.mybatis.mapper.TUserMapper;
import com.test.mybatis.mapper.UsergroupMapper;
import com.test.mybatis.mapper.myselfMapper;
import com.test.mybatis.po.Ghistorymessage;
import com.test.mybatis.po.Ptphismes;
import com.test.mybatis.po.PtphismesExample;
import com.test.mybatis.po.TUser;
import com.test.mybatis.po.TUserExample;
import com.test.mybatis.po.Usergroup;
import com.test.mybatis.po.UsergroupExample;
import com.test.webpo.groupHistoryMessage;

@Service("loginService")
public class loginService {

	@Autowired
	TUserMapper tUserMapper;
	@Autowired
	UsergroupMapper usergroupMapper;
	@Autowired
	GhistorymessageMapper ghistorymessageMapper;
	@Autowired
	PtphismesMapper ptphismesMapper;
	@Autowired
	myselfMapper myselfMapper;
	
	//登录验证
	@Transactional
	public Boolean checklogin(Model model,String name, String psw){
		TUserExample example = new TUserExample();
		TUserExample.Criteria criteria = example.createCriteria();
		criteria.andTnumEqualTo(name);
		criteria.andPasswordEqualTo(psw);
		List<TUser> list = tUserMapper.selectByExample(example);
		
		if(list.size()>0){
			model.addAttribute("id", list.get(0).getUserid());
			model.addAttribute("name",list.get(0).getName());
			model.addAttribute("touxiang", list.get(0).getTouxiang());
		}
		else
			return false;
		return true;
	}
	
	/**
	 * 显示左边聊过天的用户
	 * @return
	 */
	@Transactional
	public List<TUser> listallusers(){
		TUserExample example = new TUserExample();
		List<TUser> list = tUserMapper.selectByExample(example);
		TUser tUser = new TUser();
		tUser.setUserid(-1);
		tUser.setName("TIM");
		tUser.setTouxiang("img/touxiang.jpg");
		list.add(tUser);
		return list;
	}
	
	/**
	 * 往数据库里面插入群组消息
	 * @param groupid
	 * @param userid
	 * @param message
	 * @return
	 */
	@Transactional
	public Boolean insertgroupmessage(Integer groupid,Integer userid,String message){
		UsergroupExample example = new UsergroupExample();
		UsergroupExample.Criteria criteria =example.createCriteria();
		criteria.andGroupidEqualTo(groupid);
		criteria.andUseridEqualTo(userid);
		
		List<Usergroup> list = usergroupMapper.selectByExample(example);
		
		if(list.size()==1){
			Integer usergroupid = list.get(0).getUsergroupid();
			
			Ghistorymessage ghistorymessage = new Ghistorymessage();
			ghistorymessage.setMessage(message);
			ghistorymessage.setStime(new Date());
			ghistorymessage.setUsergroupid(usergroupid);
			try {
				ghistorymessageMapper.insertSelective(ghistorymessage);
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			
		}
		return true;
	}
	
	/**
	 * 插入私聊的历史消息
	 * @param sender
	 * @param receiver
	 * @param message
	 * @param isSend
	 * @return
	 */
	@Transactional
	public Boolean insertptpmessage(Integer sender,Integer receiver,String message,Boolean isSend){
		Ptphismes ptphismes = new Ptphismes();
		ptphismes.setIssend(isSend);
		ptphismes.setMessage(message);
		ptphismes.setReceiver(receiver);
		ptphismes.setSender(sender);
		ptphismes.setStime(new Date());
		
		try {
			ptphismesMapper.insertSelective(ptphismes);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
			// TODO: handle exception
		}
		return true;
	}
	/**
	 * 获取私聊的历史消息
	 * @param sender
	 * @param receiver
	 * @return
	 */
	@Transactional
	public List<Ptphismes> getPtpmessage(Integer sender,Integer receiver){
		HashMap<String, Object> param = new HashMap<>();
		param.put("sender", sender);
		param.put("receiver", receiver);
		List<Ptphismes> list = myselfMapper.getPtpMessage(param);
		return list;
	}
	
	@Transactional
	public List<groupHistoryMessage> getGroupHistoryMessage(Integer groupid){
		return myselfMapper.getGroupHistoryMessage(groupid);
	}

	//注册
		@Transactional
		public boolean register(String name,String password,String email,String tnum){
			TUser tUser =  new TUser();
			tUser.setEmaile(email);
			tUser.setName(name);
			tUser.setPassword(password);
			tUser.setTnum(tnum);
			tUser.setTouxiang("img/default.jpg");
			try {
				tUserMapper.insertSelective(tUser);
				return true;
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}
			
		}

}
