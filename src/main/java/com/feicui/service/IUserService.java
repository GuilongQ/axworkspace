package com.feicui.service;

import com.feicui.domain.User;
import com.feicui.service.base.IBaseService;

public interface IUserService extends IBaseService<User>{
	public User login(String username, String password);
	public User findByUsername(String username);
}
