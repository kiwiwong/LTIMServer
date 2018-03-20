package com.test.Singleton;

import static org.hamcrest.CoreMatchers.nullValue;
import com.test.untity.*;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class SendMail {
	
	Properties props = new Properties();
	MimeMessage message = null;
	
	private static volatile SendMail sendMail;
	private SendMail(){
		  // 表示SMTP发送邮件，必须进行身份验证
        props.put("mail.smtp.auth", "true");
        //此处填写SMTP服务器
        props.put("mail.smtp.host", "smtp.qq.com");
        //端口号，QQ邮箱给出的端口，587
        props.put("mail.smtp.port", "587");
        // 此处填写你的账号
        props.put("mail.user", "1565845039@qq.com");
        // 此处的密码就是前面说的16位STMP口令
        props.put("mail.password", "hiuhmoqbmrjgiajb");

        // 构建授权信息，用于进行SMTP进行身份验证
        Authenticator authenticator = new Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {
                // 用户名、密码
                String userName = props.getProperty("mail.user");
                String password = props.getProperty("mail.password");
                return new PasswordAuthentication(userName, password);
            }
        };
        // 使用环境属性和授权信息，创建邮件会话
        Session mailSession = Session.getInstance(props, authenticator);
        // 创建邮件消息
        message = new MimeMessage(mailSession);
	}
	public static SendMail getmail(){
		if(sendMail == null){
			synchronized (SendMail.class) {
				if(sendMail == null){
					sendMail = new SendMail();
				}
			}
		}
		
		return sendMail;
	}
	
	public boolean sendMail(String url,String content){
		
      
        // 设置发件人
        InternetAddress form;
		try {
			form = new InternetAddress(
			        props.getProperty("mail.user"));
	
	        message.setFrom(form);
	
	        // 设置收件人的邮箱
	        InternetAddress to = new InternetAddress(url);
	        message.setRecipient(RecipientType.TO, to);
	
	        // 设置邮件标题
	        message.setSubject("注册验证");
	        // 设置邮件的内容体
	        message.setContent(unchange.first+content+unchange.second+content+unchange.third, "text/html;charset=UTF-8");
	
	        // 最后当然就是发送邮件啦
	        Transport.send(message);
	        return true;
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
        
	}
}
