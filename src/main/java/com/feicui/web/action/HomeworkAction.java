package com.feicui.web.action;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.Homework;
import com.feicui.domain.Page;
import com.feicui.service.IHomeworkService;
import com.feicui.service.IRoomService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class HomeworkAction extends ActionSupport implements ModelDriven<Homework> {
	private Homework t = new Homework();
	@Autowired
	private IRoomService roomService;
	@Autowired
	private IHomeworkService homeworkService;
	public String saveUI() {
		ServletActionContext.getRequest().setAttribute("roomlist", roomService.find());
		return "saveUI";
	}
	public String save() {
		t.setCdate(new Date());
		homeworkService.save(t);
		return "success";
	}
	private int p;
	private String realname;
	public String find() {
		DetachedCriteria dc = DetachedCriteria.forClass(Homework.class);
		if(!StringUtils.isBlank(t.getInfo())) {
			dc.add(Restrictions.like("info", "%"+realname+"%"));
		}
		if (!StringUtils.isBlank(realname)) {
			dc.add(Restrictions.like("realname", "%"+realname+"%", MatchMode.EXACT));
		}
		Page page = homeworkService.findPageDate(dc, p, 10);
		page.setControllerName("homework");
		ServletActionContext.getRequest().setAttribute("page", page);
		return "findUI";
	}
	public String delete() {
		homeworkService.delete(t.getHomeworkid());
		return "success";
	}
	public String updateUI() {
		
		return "updateUI";
	}
	public String update() {
		
		return "success";
	}
	/**
	 * @return the p
	 */
	public int getP() {
		return p;
	}
	/**
	 * @param p the p to set
	 */
	public void setP(int p) {
		this.p = p;
	}
	/**
	 * @return the realname
	 */
	public String getRealname() {
		return realname;
	}
	/**
	 * @param realname the realname to set
	 */
	public void setRealname(String realname) {
		this.realname = realname;
	}
	@Override
	public Homework getModel() {
		// TODO Auto-generated method stub
		return t;
	}

}
