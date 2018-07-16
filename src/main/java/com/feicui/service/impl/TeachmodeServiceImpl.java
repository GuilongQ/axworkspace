package com.feicui.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.feicui.dao.ITeachmodeDao;
import com.feicui.domain.Page;
import com.feicui.domain.Role;
import com.feicui.domain.Teachmode;
import com.feicui.service.ITeachmodeService;

@Service
public class TeachmodeServiceImpl implements ITeachmodeService {

	@Autowired
	private ITeachmodeDao dao;
	
	@Transactional
	@Override
	public void save(Teachmode t) {
		dao.save(t);
	}

	@Transactional
	@Override
	public void delete(Serializable id) {
		dao.delete(id);
	}

	@Transactional
	@Override
	public void update(Teachmode t) {
		dao.update(t);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Teachmode> find() {
		return dao.find();
	}
	
	@Transactional(readOnly = true)
	@Override
	public Teachmode find(Serializable id) {
		return dao.find(id);
	}

	@Transactional(readOnly = true)
	@Override
	public Page findPageDate(DetachedCriteria dc, int p, int size) {
		int rowCount = dao.getRowCount(dc);
		Page page = new Page(p,rowCount,size);
		List<Teachmode> list = dao.find(dc, page.getStartLine(), page.getSize());
		page.setList(list);
		return page;
	}

}
