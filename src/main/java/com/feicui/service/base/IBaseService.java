package com.feicui.service.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;

import com.feicui.domain.Page;

public interface IBaseService<T> {
	public void save(T t);
	public void delete(Serializable id);
	public void update(T t);
	public List<T> find();
	public T find(Serializable id);
	public Page findPageDate(DetachedCriteria dc,int p,int size);
}
