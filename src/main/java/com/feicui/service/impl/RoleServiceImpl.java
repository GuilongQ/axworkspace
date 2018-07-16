package com.feicui.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.feicui.dao.IRoleDao;
import com.feicui.domain.Page;
import com.feicui.domain.Role;
import com.feicui.service.IRoleService;

@Service
public class RoleServiceImpl implements IRoleService {

	@Autowired
	private IRoleDao dao;
	
	@Transactional
	@Override
	public void save(Role t) {
		dao.save(t);
	}

	@Transactional
	@Override
	public void delete(Serializable id) {
		dao.delete(id);
	}

	@Transactional
	@Override
	public void update(Role t) {
		dao.update(t);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Role> find() {
		return dao.find();
	}

	@Transactional(readOnly = true)
	@Override
	public Role find(Serializable id) {
		return dao.find(id);
	}

	@Transactional(readOnly = true)
	@Override
	public Page findPageDate(DetachedCriteria dc, int p, int size) {
		int rowCount = dao.getRowCount(dc);
		Page page = new Page(p,rowCount,size);
		List<Role> list = dao.find(dc, page.getStartLine(), page.getSize());
		page.setList(list);
		return page;
	}

}
