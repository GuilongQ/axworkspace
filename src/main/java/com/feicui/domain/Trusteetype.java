package com.feicui.domain;
// Generated 2018-5-31 15:28:53 by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;

/**
 * Trusteetype generated by hbm2java
 */
public class Trusteetype implements java.io.Serializable {

	private Integer trusteetypeid;
	private String tname;
	private String info;
	private Set users = new HashSet(0);

	public Trusteetype() {
	}

	public Trusteetype(String tname, String info, Set users) {
		this.tname = tname;
		this.info = info;
		this.users = users;
	}

	public Integer getTrusteetypeid() {
		return this.trusteetypeid;
	}

	public void setTrusteetypeid(Integer trusteetypeid) {
		this.trusteetypeid = trusteetypeid;
	}

	public String getTname() {
		return this.tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public String getInfo() {
		return this.info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Set getUsers() {
		return this.users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

}
