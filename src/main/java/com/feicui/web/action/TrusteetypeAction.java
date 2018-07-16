package com.feicui.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.Trusteetype;
import com.feicui.service.ITrusteetypeService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class TrusteetypeAction extends ActionSupport implements ModelDriven<Trusteetype>{
	
	private Trusteetype t = new Trusteetype();
	
	@Autowired
	private ITrusteetypeService trusteetypeService;
	
	public String save() {
		trusteetypeService.save(t);
		return "success";
	}
	
	
	public String findUI() {
		ServletActionContext.getRequest().setAttribute("list", trusteetypeService.find());
		return "findUI";
	}
	
	public String delete() {
		trusteetypeService.delete(t.getTrusteetypeid());
		return "success";
	}
	
	public String updateUI() {
		ServletActionContext.getRequest().setAttribute("t", trusteetypeService.find(t.getTrusteetypeid()));
		return "updateUI";
	}
	
	public String update() {
		trusteetypeService.update(t);
		return "success";
	}
	
	
	@Override
	public Trusteetype getModel() {
		return t;
	}

}
