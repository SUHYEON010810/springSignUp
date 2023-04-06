<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/board/b_write.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/buttonStyle.css">
<title>글등록</title>
</head>
<body>
	<%@ include file="../include/boardTopmenu.jsp" %>

		<form name="frm" method="post" action="boardWriteSave.do" id = "frm">
			<table id="frm_table">
				<h2>글 등록</h2>
				<tr>
					<td> <label for="boardID" >게시판 번호</label> </td>
					<td> <input type="text" name="boardID" class="input_text" id="boardID" /> </td>
				</tr>
				<tr>
					<td> <label for="uID" >작성자</label> </td>
					<td> <input type="text" name="userID" class="input_text" id="uID" /> </td>
				</tr>
				<tr>
					<td> <label for="title" >제목</label> </td>
					<td> <input type="text" name="title" class="input_text" id="title" /> </td>
				</tr>
				<tr>
					<td> <label for="content" >내용</label> </td>
					<td><textarea cols="50" rows="10" name="content" id="content"></textarea></td>
				</tr>
				<tr>
					<td> <label for="b_file" >파일</label> </td>
					<td> <input type="file" name="b_file" class="input_text" id="b_file" /> </td>
				</tr>
				<tr>
					<td colspan="2" id="frm_button"><button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css">글 등록</button>
					<button type="reset" class="bt_css">취소</button></td>

				</tr>
			</table>
		</form>

</body>
</html>