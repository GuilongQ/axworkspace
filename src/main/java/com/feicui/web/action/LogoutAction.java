package com.feicui.web.action;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.opensymphony.xwork2.ActionSupport;
@Controller
@Scope("prototype")
public class LogoutAction extends ActionSupport {
	
	public String logout() {
	HttpSession session = ServletActionContext.getRequest().getSession();
		session.invalidate();;
		return "input";
	}
}
