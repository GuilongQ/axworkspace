package com.feicui.service.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.feicui.dao.IRoomDao;
import com.feicui.domain.Page;
import com.feicui.domain.Room;
import com.feicui.service.IRoomService;

@Service
public class RoomServiceImpl implements IRoomService {

	@Autowired
	private IRoomDao dao;
	
	@Transactional
	@Override
	public void save(Room t) {
		dao.save(t);
	}

	@Transactional
	@Override
	public void delete(Serializable id) {
		dao.delete(id);
	}

	@Transactional
	@Override
	public void update(Room t) {
		dao.update(t);
	}

	@Transactional(readOnly = true)
	@Override
	public List<Room> find() {
		return dao.find();
	}

	@Transactional(readOnly = true)
	@Override
	public Room find(Serializable id) {
		// TODO Auto-generated method stub
		return dao.find(id);
	}

	@Transactional(readOnly = true)
	@Override
	public Page findPageDate(DetachedCriteria dc, int p, int size) {
		int rowCount = dao.getRowCount(dc);
		Page page = new Page(p,rowCount,size);
		List<Room> list = dao.find(dc, page.getStartLine(), page.getSize());
		page.setList(list);
		return page;
	}

}
