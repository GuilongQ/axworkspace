package com.feicui.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.Course;
import com.feicui.service.ICourseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class CourseAction extends ActionSupport implements ModelDriven<Course> {
	Course t = new Course();
	
	@Autowired
	private ICourseService courseService;
	
	public String save() {
		courseService.save(t);
		return "success";
	}
	
	public String find() {
		ServletActionContext.getRequest().setAttribute("list", courseService.find());
		return "findUI";
	}
	
	public String delete() {
		courseService.delete(t.getCourseid());
		return "success";
	}
	
	public String updateUI() {
		ServletActionContext.getRequest().setAttribute("t", courseService.find(t.getCourseid()));
		return "updateUI";
	}
	
	public String update() {
		courseService.update(t);
		return "success";
	}
	@Override
	public Course getModel() {
		// TODO Auto-generated method stub
		return t;
	}

}
