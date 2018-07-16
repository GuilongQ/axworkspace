package com.feicui.service.impl;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.feicui.dao.IScoreDao;
import com.feicui.domain.Page;
import com.feicui.domain.Score;
import com.feicui.service.IScoreService;
@Service
public class ScoreServiceImpl implements IScoreService {
	@Autowired
	private IScoreDao dao;
	@Transactional
	@Override
	public void save(Score t) {
		dao.save(t);
		
	}
	@Transactional
	@Override
	public void delete(Serializable id) {
		dao.delete(id);
		
	}
	@Transactional
	@Override
	public void update(Score t) {
		dao.update(t);
		
	}
	@Transactional(readOnly=true)
	@Override
	public List<Score> find() {
		// TODO Auto-generated method stub
		return dao.find();
	}
	@Transactional(readOnly=true)
	@Override
	public Score find(Serializable id) {
		// TODO Auto-generated method stub
		return dao.find(id);
	}
	@Transactional(readOnly=true)
	@Override
	public Page findPageDate(DetachedCriteria dc, int p, int size) {
		int rowCount = dao.getRowCount(dc);
		Page page = new Page(p,rowCount,size);
		List<Score> list = dao.find(dc, page.getStartLine(), page.getSize());
		page.setList(list);
		return page;
	}
	@Transactional(readOnly=true)
	@Override
	public List<Score> findByExamdate(Date examdate) {
		return dao.findByEaxmdate(examdate);
	}
	@Override
	public List<Date> findScoreDate() {
		return dao.findScoreDate();
	}

}
