package com.feicui.web.action;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.Room;
import com.feicui.domain.Teachmode;
import com.feicui.service.IRoomService;
import com.feicui.service.ITeachmodeService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

@Controller
@Scope("prototype")
public class RoomAction extends ActionSupport implements ModelDriven<Room> {
	private Room t = new Room();
	
	@Autowired
	private IRoomService roomService;
	
	public String save() {
		roomService.save(t);
		return "success";
	}
	
	public String find() {
		ServletActionContext.getRequest().setAttribute("list", roomService.find());
		return "findUI";
	}
	
	public String delete() {
		roomService.delete(t.getRoomid());
		return "success";
	}
	
	public String updateUI() {
		ServletActionContext.getRequest().setAttribute("t", roomService.find(t.getRoomid()));
		return "updateUI";
	}
	
	public String update() {
		roomService.update(t);
		return "success";
	}
	
	
	@Override
	public Room getModel() {
		return t;
	}

}
