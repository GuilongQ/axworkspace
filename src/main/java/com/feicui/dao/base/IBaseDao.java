package com.feicui.dao.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

public interface IBaseDao<T> {
	public void save(T t);
	public void delete(Serializable id);
	public void update(T t);
	public List<T> find();
	public T find(Serializable id);
	public int getRowCount(DetachedCriteria dc);
	public List<T> find(DetachedCriteria dc,int startLine,int size);
}
