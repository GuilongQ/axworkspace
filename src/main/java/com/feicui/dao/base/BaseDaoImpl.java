package com.feicui.dao.base;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class BaseDaoImpl<T> implements IBaseDao<T> {
	private Class clazz;
	public BaseDaoImpl() {
		ParameterizedType pt = (ParameterizedType) this.getClass().getGenericSuperclass();
		Type[] types = pt.getActualTypeArguments();
		clazz = (Class) types[0];
	}
	@Autowired
	private SessionFactory sf;
	protected Session getSession() {
		return sf.getCurrentSession();
	}
	@Override
	public void save(T t) {
		getSession().save(t);
		
	}

	@Override
	public void delete(Serializable id) {
		T t = (T) getSession().get(clazz, id);
		getSession().delete(t);
	}

	@Override
	public void update(T t) {
		getSession().update(t);
		
	}

	@Override
	public List<T> find() {
		Query query = getSession().createQuery("FROM "+clazz.getName());
		return query.list();
	}

	@Override
	public T find(Serializable id) {
		T t = (T) getSession().get(clazz, id);
		return t;
	}

	@Override
	public int getRowCount(DetachedCriteria dc) {
		Criteria c = dc.getExecutableCriteria(getSession());
		c.setProjection(Projections.rowCount());
		long l = (long) c.uniqueResult();
		return (int) l;
	}

	@Override
	public List<T> find(DetachedCriteria dc, int startLine, int size) {
		dc.setProjection(null);
		Criteria c = dc.getExecutableCriteria(getSession());
		c.setFirstResult(startLine);
		c.setMaxResults(size);
		return c.list();
	}

}
