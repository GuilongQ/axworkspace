package com.feicui.domain;

import java.io.Serializable;

public class Email implements Serializable {
	private String from;
	private String password;
	private String to;
	private String server;
	private String title;
	private String nick;
	private String content;
	public Email() {
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTo() {
		return to;
	}
	public void setTo(String to) {
		this.to = to;
	}
	public String getServer() {
		return server;
	}
	public void setServer(String server) {
		this.server = server;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "Email [from=" + from + ", password=" + password + ", to=" + to + ", server=" + server + ", title="
				+ title + ", nick=" + nick + ", content=" + content + "]";
	}
	
	
}
