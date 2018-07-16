package com.feicui.web.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.Page;
import com.feicui.domain.Role;
import com.feicui.domain.Room;
import com.feicui.domain.Teachmode;
import com.feicui.domain.Trusteetype;
import com.feicui.domain.User;
import com.feicui.service.IRoleService;
import com.feicui.service.IRoomService;
import com.feicui.service.ITeachmodeService;
import com.feicui.service.ITrusteetypeService;
import com.feicui.service.IUserService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
@Controller
@Scope("prototype")
public class UserAction extends ActionSupport implements ModelDriven<User> {
private User user = new User();
	
	@Autowired
	private IRoleService roleService;
	
	@Autowired
	private IUserService userService;
	
	@Autowired
	private IRoomService roomService;
	
	@Autowired
	private ITeachmodeService teachService;
	
	@Autowired
	private ITrusteetypeService trusteetypeService;
	
	public String delete() {
		userService.delete(user.getUid());
		return "success";
	}
	
	public String saveUI() {
		List<Role> roleList = roleService.find();
		List<Room> roomList = roomService.find();
		List<Teachmode> teachmodeList = teachService.find();
		List<Trusteetype> trusteetypeList = trusteetypeService.find();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("roomList", roomList);
		request.setAttribute("teachmodeList", teachmodeList);
		request.setAttribute("trusteetypeList", trusteetypeList);
		request.setAttribute("roleList", roleList);
		
		return "saveUI";
	}
	
	public String editPwd() {
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(!oldpwd.equals(user.getPassword())) {
			request.setAttribute("msg", "旧密码不正确");
			return "fail";
		}
		if(newpwd.equals(newpwd2)) {
			user.setPassword(newpwd);
			userService.update(user);
			return "success";
		} else {
			request.setAttribute("msg", "两次密码不一致");
			return "fail";
		}
		
	}
		private int p;
		
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

		public String find() {
			HttpSession session = ServletActionContext.getRequest().getSession();
			
			if(p == 0) {
				Integer x = (Integer) session.getAttribute("p");
				if(x == null) {
					p = 1;
				} else {
					p = x;
				}
			}
			
			session.setAttribute("p", p);
			
			
			DetachedCriteria dc = DetachedCriteria.forClass(User.class);
			
			if(!StringUtils.isBlank(user.getRealname())) {
				dc.add(Restrictions.like("realname", "%"+user.getRealname()+"%"));
			}
			
			if(!StringUtils.isBlank(user.getCellphone())) {
				dc.add(Restrictions.like("cellphone", "%"+user.getCellphone()+"%"));
			}
			
			
			Page page = userService.findPageDate(dc, p, 10);
			ServletActionContext.getRequest().setAttribute("page",page);
			
			return "findUI";
		}
	
	public String isUsernameExists() throws IOException {
		User user2 = userService.findByUsername(user.getUsername());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		if (user2!= null) {
			out.println("{\"result\":\"1\"}");
		}else {
			out.println("{\"result\":\"0\"}");
		}
		out.close();
		return null;
	}
	private int rid;
	public String save() {
		Role role = roleService.find(rid);
		user.getRoles().add(role);
		userService.save(user);
		return "success";
	}
	public String update() {
		Role role = roleService.find(rid);
		user.getRoles().add(role);
		userService.update(user);
		return "success";
	}
	public String updateUI() {
		List<Role> roleList = roleService.find();
		List<Room> roomList = roomService.find();
		List<Teachmode> teachmodeList = teachService.find();
		List<Trusteetype> trusteetypeList = trusteetypeService.find();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("roomList", roomList);
		request.setAttribute("teachmodeList", teachmodeList);
		request.setAttribute("trusteetypeList", trusteetypeList);
		request.setAttribute("roleList", roleList);
		
		User user2 = userService.find(user.getUid());
		Set<Role> roles2 = user2.getRoles();
		Iterator<Role> iterator = roles2.iterator();
		if (iterator.hasNext()) {
			request.setAttribute("userrole", iterator.next());
		}
		request.setAttribute("user", user2);
		return "updateUI";
	}
	public String findOne() {
		ServletActionContext.getRequest().setAttribute("user", userService.find(user.getUid()));
		return "findOneUI";
	}
	public String findStudentByRoom() throws IOException {
		Room room = roomService.find(user.getRoom().getRoomid());
		Set<User> users = room.getUsers();
		List<User> list = new ArrayList<>();
		Iterator<User> it = users.iterator();
		while (it.hasNext()) {
			User user = it.next();
			Set roles = user.getRoles();
			Iterator<Role> it2 = roles.iterator();
			while (it2.hasNext()) {
				Role role = it2.next();
				if (role.getRname().equals("学生")) {
					list.add(user);
				}
			}
		}
		JsonConfig jc =  new JsonConfig();
		jc.setExcludes(new String[] {"birthday", "roles","homeworks", "scores","room", "teachmode","trusteetype"});
		String json = JSONArray.fromObject(list,jc).toString();
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(json);
		out.close();
		return null;
	}
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}

	@Override
	public User getModel() {
		return user;
	}
	
	
	private String oldpwd;
	private String newpwd;
	private String newpwd2;
	public String getOldpwd() {
		return oldpwd;
	}

	public void setOldpwd(String oldpwd) {
		this.oldpwd = oldpwd;
	}

	public String getNewpwd() {
		return newpwd;
	}

	public void setNewpwd(String newpwd) {
		this.newpwd = newpwd;
	}

	public String getNewpwd2() {
		return newpwd2;
	}

	public void setNewpwd2(String newpwd2) {
		this.newpwd2 = newpwd2;
	}
	
}
