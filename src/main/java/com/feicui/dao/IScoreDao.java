package com.feicui.dao;

import java.util.Date;
import java.util.List;

import com.feicui.dao.base.IBaseDao;
import com.feicui.domain.Score;

public interface IScoreDao extends IBaseDao<Score> {
	public List<Score> findByEaxmdate(Date examdate);

	public List<Date> findScoreDate();
}
