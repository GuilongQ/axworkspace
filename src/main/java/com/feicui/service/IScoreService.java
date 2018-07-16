package com.feicui.service;

import java.util.Date;
import java.util.List;

import com.feicui.domain.Score;
import com.feicui.service.base.IBaseService;

public interface IScoreService extends IBaseService<Score> {
	public List<Score> findByExamdate(Date examdate);
	
	public List<Date> findScoreDate();
}
