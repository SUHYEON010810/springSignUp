package egovframework.example.sample.service;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class boardVO {
	private int boardID;
	private String userID;
	private String title;
	private String content;
	private Date regDate;
	private int viewCnt=0;

	/* 게시판 검색 및 정렬 하기위해 변수 선언*/
	private String searchText;
	private String sortGubun;

	/* 파일 처리를 위한 변수 선언*/
	private MultipartFile uploadFile;
	private String b_file;

	public String getB_file() {
		return b_file;
	}
	public void setB_file(String b_file) {
		this.b_file = b_file;
	}
	public String getSortGubun() {
		return sortGubun;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
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
