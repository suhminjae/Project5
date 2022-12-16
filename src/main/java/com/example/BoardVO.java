package com.example;

import java.util.Date;

public class BoardVO {
	private int seq;
	private String title;
	private String home;
	private String away;
	private String winner;
	private Date regdate;
	private int cnt;
	private String content;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getAway() {
		return away;
	}
	public void setAway(String away) {
		this.away = away;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getWinner() {return winner;}
	public void setWinner(String winner){ this.winner=winner;}

    public String getContent() {return content;}

	public void setContent(String content) { this.content = content;}
}
