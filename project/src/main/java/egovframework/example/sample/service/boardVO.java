package egovframework.example.sample.service;

import java.util.Date;

public class boardVO {
	private int boardID;
	private String userID;
	private String title;
	private String content;
	private String b_file;
	private Date regDate;
	private int viewCnt=0;

	/* memberList에 search를 하기위해 변수 선언( 변수명은 memberList의 name와 같아야 함.) */
	private String searchText;
	private String sortGubun;


	public String getSortGubun() {
		return sortGubun;
	}
	public void setSortGubun(String sortGubun) {
		this.sortGubun = sortGubun;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getViewCnt() {
		return viewCnt;
	}
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}
	@Override
	public String toString() {
		return "boardVO [boardID=" + boardID + ", userID=" + userID + ", title=" + title + ", content=" + content
				+ ", b_file=" + b_file + ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", searchText=" + searchText
				+ ", sortGubun=" + sortGubun + "]";
	}

}
