package com.feicui.domain;
// Generated 2018-5-31 15:28:53 by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;

/**
 * Room generated by hbm2java
 */
public class Room implements java.io.Serializable {

	private Integer roomid;
	private String position;
	private Integer rent;
	private Set users = new HashSet(0);

	public Room() {
	}

	public Room(String position, Integer rent, Set users) {
		this.position = position;
		this.rent = rent;
		this.users = users;
	}

	public Integer getRoomid() {
		return this.roomid;
	}

	public void setRoomid(Integer roomid) {
		this.roomid = roomid;
	}

	public String getPosition() {
		return this.position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public Integer getRent() {
		return this.rent;
	}

	public void setRent(Integer rent) {
		this.rent = rent;
	}

	public Set getUsers() {
		return this.users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

}