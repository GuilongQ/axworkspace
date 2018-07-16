package com.feicui.service.impl;

import java.io.Serializable;
import java.util.List;


import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.feicui.dao.IUserDao;
import com.feicui.domain.Page;
import com.feicui.domain.User;
import com.feicui.service.IUserService;
@Service
public class UserServiceImpl implements IUserService {
	@Autowired
	private IUserDao dao;
	@Transactional
	@Override
	public void save(User t) {
		dao.save(t);

	}
	@Transactional
	@Override
	public void delete(Serializable id) {
		dao.delete(id);

	}
	@Transactional
	@Override
	public void update(User t) {
		dao.update(t);

	}
	@Transactional(readOnly=true)
	@Override
	public List<User> find() {
		// TODO Auto-generated method stub
		return dao.find();
	}
	@Transactional(readOnly=true)
	@Override
	public User find(Serializable id) {
		// TODO Auto-generated method stub
		return dao.find(id);
	}
	@Transactional(readOnly=true)
	@Override
	public Page findPageDate(DetachedCriteria dc, int p, int size) {
		int rowCount = dao.getRowCount(dc);
		Page page = new Page(p, rowCount, size);
		List<User> list = dao.find(dc, page.getStartLine(), size);
		page.setList(list);
		return page;
	}
	@Transactional(readOnly=true)
	@Override
	public User login(String username, String password) {
		return dao.find(username, password);
	}
	@Transactional(readOnly=true)
	@Override
	public User findByUsername(String username) {
		User user = dao.findByUsername(username);
		return user;
	}

}
