package egovframework.example.sample.service;

import oracle.sql.DATE;

public class boardVO {
	private int boardID;
	private String userID;
	private String title;
	private String content;
	private String b_file="aa";
	private DATE regDate;
	private int viewCnt=0;


	public int getBoardID() {
		return boardID;
	}
	public void setBoardID(int boardID) {
		this.boardID = boardID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getB_file() {
		return b_file;
	}
	public void setB_file(String b_file) {
		this.b_file = b_file;
	}
	public DATE getRegDate() {
		return regDate;
	}
	public void setRegDate(DATE regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

}
