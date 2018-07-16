package com.feicui.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.feicui.dao.IUserDao;
import com.feicui.dao.base.BaseDaoImpl;
import com.feicui.domain.User;
@Repository
public class UserDaoImpl extends BaseDaoImpl<User> implements IUserDao {

	@Override
	public User find(String username, String password) {
		Query q = getSession().createQuery("FROM User WHERE username=? AND password=? ");
		q.setParameter(0, username);
		q.setParameter(1, password);
		User user = (User) q.uniqueResult();
		return user;
	}

	@Override
	public User findByUsername(String username) {
		Query query= getSession().createQuery("FROM User WHERE username=?");
		query.setParameter(0, username);
		User user = (User) query.uniqueResult();
		return user;
	}

}
