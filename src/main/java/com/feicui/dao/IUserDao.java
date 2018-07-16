package com.feicui.dao;

import com.feicui.dao.base.IBaseDao;
import com.feicui.domain.User;

public interface IUserDao extends IBaseDao<User> {
	public User find(String username, String password);
	public User findByUsername(String username);
}
