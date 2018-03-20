package com.test.Singleton;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ContextLoader;

import com.test.mybatis.mapper.TUserMapper;
import com.test.mybatis.po.TUser;
import com.test.mybatis.po.TUserExample;
import com.test.service.loginService;

/** 
* @author: yh
* @date：2018年1月8日 下午8:34:21 
* @version 1.0 
* @parameter  
* @since  
* @return  
*/
public class RegisterNum {
	
	TUserMapper mapper = (TUserMapper) ContextLoader.getCurrentWebApplicationContext().getBean("TUserMapper");
	
	String tnum=null; 
	
	private static volatile RegisterNum registerNum;
	
	private RegisterNum(){
		TUserExample example = new TUserExample();
		example.setOrderByClause("tnum desc");
		
		List<TUser> list = mapper.selectByExample(example);
		tnum = list.get(0).getTnum();
	}
	
	public static RegisterNum getRegisterNum(){
		if(registerNum == null){
			synchronized (RegisterNum.class) {
				if(registerNum == null){
					registerNum = new RegisterNum();
				}
			}
		}
		
		return registerNum;
	}
	
	public Integer getRegisternum(){
		
		
		Integer te = (Integer.parseInt(tnum)+1);
		tnum = te.toString();
		return (Integer.parseInt(tnum)+1);
	}
}
