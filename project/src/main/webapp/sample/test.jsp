<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form name="frm" method="post" action="loginWriteSave.do">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="userID"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="dname"></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>휴대번호</th>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<th colspan="2">
				<button type="submit">회원가입</button>
				</th>
			</tr>

		</table>
	</form>
</body>
</html>