package com.feicui.web.action;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.feicui.domain.Course;
import com.feicui.domain.Page;
import com.feicui.domain.Room;
import com.feicui.domain.Score;
import com.feicui.service.ICourseService;
import com.feicui.service.IRoomService;
import com.feicui.service.IScoreService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller
@Scope("prototype")
public class ScoreAction extends ActionSupport implements ModelDriven<Score> {

	@Autowired
	private ICourseService courseService;
	
	@Autowired
	private IRoomService roomService;
	
	@Autowired
	private IScoreService scoreService;
	
	
	private Score s = new Score();
	
	
	public String saveUI() {
		List<Course> courseList = courseService.find();
		List<Room> roomList = roomService.find();
		
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("courseList", courseList);
		request.setAttribute("roomList", roomList);
		
		return "saveUI";
	}
	
	public String save() {
		scoreService.save(s);
		return "success";
	}
	
	private int p; 
	
	private String cname;
	
	private String realname;
	
	private Date mindate;
	private Date maxdate;
	
	
	private Date scoreDate;
	
	public String find() {
		
		
		DetachedCriteria dc = DetachedCriteria.forClass(Score.class);
		
		if(!StringUtils.isBlank(cname)) {
			dc.createCriteria("course").add(Restrictions.like("cname", "%"+cname+"%"));
		}
		
		
		if(!StringUtils.isBlank(realname)) {
			dc.createCriteria("user").add(Restrictions.like("realname", "%"+realname+"%"));
		}
		
		if(mindate != null) {
			dc.add(Restrictions.ge("examdate", mindate));
		}
		if(maxdate != null) {
			dc.add(Restrictions.le("examdate", maxdate));
		}
		
		
		Page page = scoreService.findPageDate(dc, p, 5);
		
		ServletActionContext.getRequest().setAttribute("page", page);
		
		return "findUI";
	}
	
	
	public String reportUI() {
		
		List<Course> courseList =courseService.find();
		HttpServletRequest request = ServletActionContext.getRequest();
		request.setAttribute("courseList", courseList);
		
		
		Calendar c = Calendar.getInstance();
		c.set(scoreDate.getYear()+1900,scoreDate.getMonth(),scoreDate.getDate());
		List<Score> list = scoreService.findByExamdate(c.getTime());
		
		Map<String, List> map = new HashMap<>();
		
		for (Score score : list) {
			
			String realname = score.getUser().getRealname();
			if(map.containsKey(realname)) {
				
				List list2 = map.get(realname);
				//list2.add(score.getCourse().getCname() + "-" + score.getScore());
				
				list2.add(score.getScore());
				
			} else {
				List list2 = new ArrayList<>();
				// list2.add(score.getCourse().getCname()+"-"+score.getScore());
				list2.add(score.getScore());
				map.put(realname, list2);
				
			}
			
		}
		request.setAttribute("map", map);
		
		request.setAttribute("title", scoreDate.getYear()+1900 + "Äê" + (scoreDate.getMonth()+1) +"ÔÂ" + scoreDate.getDate()+"ÈÕ");
		
		return "reportUI";
	}
	
	
	public String reportListUI() {
		ServletActionContext.getRequest().setAttribute("scoreDateList", scoreService.findScoreDate()); 
		return "reportListUI";
	}
	
	@Override
	public Score getModel() {
		return s;
	}

	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getRealname() {
		return realname;
	}

	public void setRealname(String realname) {
		this.realname = realname;
	}

	public Date getMindate() {
		return mindate;
	}

	public void setMindate(Date mindate) {
		this.mindate = mindate;
	}

	public Date getMaxdate() {
		return maxdate;
	}

	public void setMaxdate(Date maxdate) {
		this.maxdate = maxdate;
	}

	public Date getScoreDate() {
		return scoreDate;
	}

	public void setScoreDate(Date scoreDate) {
		this.scoreDate = scoreDate;
	}
}
