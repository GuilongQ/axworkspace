package com.feicui.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.feicui.dao.ICourseDao;
import com.feicui.domain.Course;
import com.feicui.domain.Page;
import com.feicui.service.ICourseService;
@Service
public class CourseServiceImpl implements ICourseService {
	@Autowired
	private ICourseDao dao;
	@Transactional
	@Override
	public void save(Course t) {
		dao.save(t);
		
	}
	@Transactional
	@Override
	public void delete(Serializable id) {
		dao.delete(id);
		
	}
	@Transactional
	@Override
	public void update(Course t) {
		dao.update(t);
		
	}
	@Transactional(readOnly=true)
	@Override
	public List<Course> find() {
		// TODO Auto-generated method stub
		return dao.find();
	}
	@Transactional(readOnly=true)
	@Override
	public Course find(Serializable id) {
		// TODO Auto-generated method stub
		return dao.find(id);
	}
	@Transactional(readOnly=true)
	@Override
	public Page findPageDate(DetachedCriteria dc, int p, int size) {
		int rowCount = dao.getRowCount(dc);
		Page page = new Page(p,rowCount,size);
		List<Course> list = dao.find(dc, page.getStartLine(), page.getSize());
		page.setList(list);
		return page;
	}

}
