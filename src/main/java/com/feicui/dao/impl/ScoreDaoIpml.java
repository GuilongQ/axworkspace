package com.feicui.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.feicui.dao.IScoreDao;
import com.feicui.dao.base.BaseDaoImpl;
import com.feicui.domain.Score;

@Repository
public class ScoreDaoIpml extends BaseDaoImpl<Score> implements IScoreDao {
	@Override
	public List<Score> findByEaxmdate(Date eaxmdate) {

		Query q = getSession().createQuery("FROM Score WHERE examdate = ?");
		q.setParameter(0, eaxmdate);
		return q.list();
	}

	@Override
	public List<Date> findScoreDate() {
		Query q = getSession().createQuery("SELECT DISTINCT examdate FROM Score");
		List<Date> list = q.list();
		return list;
	}
}
