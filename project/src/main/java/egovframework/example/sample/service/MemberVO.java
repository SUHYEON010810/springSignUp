package egovframework.example.sample.service;

import java.time.LocalDate;

public class MemberVO {
	private String userID;
	private String password;
	private String name;
	private String phone;
	private int mem_div;

	/* memberList에 search를 하기위해 변수 선언( 변수명은 memberList의 name와 같아야 함.) */
	private String searchGubun;
	private String searchText;

	/*페이징 처리를 위한 변수 선언*/
	private int viewPage = 1;
	private int startIndex = 1;
	private int endIndex = 10;

/*	 날짜 변수 선언
	private LocalDate udate;*/


	/* get/set 메소드 */
	public String getSearchGubun() {
		return searchGubun;
	}
	public void setSearchGubun(String searchGubun) {
		this.searchGubun = searchGubun;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getViewPage() {
		return viewPage;
	}
	public void setViewPage(int viewPage) {
		this.viewPage = viewPage;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	public int getMem_div() {
		return mem_div;
	}
	public void setMem_div(int mem_div) {
		this.mem_div = mem_div;
	}

	@Override
	public String toString() {
		return "MemberVO [userID=" + userID + ", password=" + password + ", name=" + name + ", phone=" + phone
				+ ", mem_div=" + mem_div + ", searchGubun=" + searchGubun + ", searchText=" + searchText + ", viewPage="
				+ viewPage + ", startIndex=" + startIndex + ", endIndex=" + endIndex + "]";
	}



/*	public LocalDate getUdate() {
		return udate;
	}
	public void setUdate(LocalDate udate) {
		this.udate = udate;
	}*/



}
