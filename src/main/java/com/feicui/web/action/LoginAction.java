package com.feicui.web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.User;
import com.feicui.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;
@Controller
@Scope("prototype")
public class LoginAction extends ActionSupport {
	
	@Autowired
	private IUserService userService;
	
	public String login() {
		User user = userService.login(username, password);
		if(user == null) {
			return "input";
		}
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.setAttribute("user", user);
		return "success";
	}
	
	private String username;
	private String password;
	
	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}
}
