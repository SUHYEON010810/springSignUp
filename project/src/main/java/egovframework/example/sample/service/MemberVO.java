package egovframework.example.sample.service;

public class MemberVO {
	private String userID;
	private String password;
	private String name;
	private String phone;

	/* memberList에 search를 하기위해 변수 선언( 변수명은 memberList의 name와 같아야 함.) */
	private String searchGubun;
	private String searchText;

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


}
