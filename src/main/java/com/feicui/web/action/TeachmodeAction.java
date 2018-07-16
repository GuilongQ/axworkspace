package com.feicui.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.Teachmode;
import com.feicui.service.ITeachmodeService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class TeachmodeAction extends ActionSupport implements ModelDriven<Teachmode> {
	private Teachmode t = new Teachmode();
	
	@Autowired
	private ITeachmodeService teachmodeService;
	
	public String save() {
		teachmodeService.save(t);
		return "success";
	}
	
	public String find() {
		ServletActionContext.getRequest().setAttribute("list", teachmodeService.find());
		return "findUI";
	}
	
	public String delete() {
		teachmodeService.delete(t.getTeachmodeid());
		return "success";
	}
	
	public String updateUI() {
		ServletActionContext.getRequest().setAttribute("t", teachmodeService.find(t.getTeachmodeid()));
		return "updateUI";
	}
	
	public String update() {
		teachmodeService.update(t);
		return "success";
	}
	
	
	@Override
	public Teachmode getModel() {
		return t;
	}

}
