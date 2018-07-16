package com.feicui.web.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.Role;
import com.feicui.service.IRoleService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class RoleAction extends ActionSupport implements ModelDriven<Role> {

	private Role r = new Role();
	
	@Autowired
	private IRoleService roleService;
	
	public String save() {
		roleService.save(r);
		return "success";
	}
	
	public String delete() {
		roleService.delete(r.getRid());
		return "success";
	}
	
	public String updateUI() {
		
		ServletActionContext.getRequest().setAttribute("r", roleService.find(r.getRid()));
		return "updateUI";
	}

	public String update() {
		roleService.update(r);
		return "success";
	}
	
	public String find() {
		
		List<Role> list = roleService.find();
		ServletActionContext.getRequest().setAttribute("list", list);
		return "findUI";
	}
	
	
	@Override
	public Role getModel() {
		return r;
	}

}
