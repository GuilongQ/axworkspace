package com.feicui.domain;

import java.util.List;

public class Page {
	private int p;
	private int rowCount;
	private int maxPage;
	private int prev;
	private int next;
	private int startLine;
	private int size;
	private int startPage;
	private int endPage;
	private List list;
	private String controllerName;
	
	public Page(int p, int rowCount, int size) {
		this.p = p;
		this.rowCount = rowCount;
		this.size = size;
		
		this.maxPage = (this.rowCount + this.size - 1) / this.size;
		
		if(this.p > this.maxPage) this.p = this.maxPage;
		if(this.p < 1) this.p = 1;
		
		this.prev = this.p - 1;
		this.next = this.p + 1;
		
		// 计算起始行
		this.startLine = (this.p - 1) * this.size;
		
		if(this.maxPage < 10) {
			this.startPage = 1;
			this.endPage = this.maxPage;
		} else {
			this.startPage = this.p - 5;
			this.endPage = this.p + 4;
			
			if(this.startPage < 1) {
				this.startPage = 1;
				this.endPage = 10;
			} 
			if(this.endPage > this.maxPage) {
				this.startPage = this.maxPage - 9;
				this.endPage = this.maxPage;
			}
		}
	}
	
	public int getP() {
		return p;
	}

	public void setP(int p) {
		this.p = p;
	}

	public int getRowCount() {
		return rowCount;
	}

	public void setRowCount(int rowCount) {
		this.rowCount = rowCount;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getPrev() {
		return prev;
	}

	public void setPrev(int prev) {
		this.prev = prev;
	}

	public int getNext() {
		return next;
	}

	public void setNext(int next) {
		this.next = next;
	}

	public int getStartLine() {
		return startLine;
	}

	public void setStartLine(int startLine) {
		this.startLine = startLine;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public String getControllerName() {
		return controllerName;
	}

	public void setControllerName(String controllerName) {
		this.controllerName = controllerName;
	}
}
