<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
	div, a{
		float:right;
	}
	label{
		padding-right:7px;
	}
</style>

<%
	String USERID = (String) session.getAttribute("SessionUserID");
%>
<body>
			<% if(USERID == null){ %>
					<a href="/project/loginWrite.do">로그인</a>
			<% }else{ %>
					<div>
						<label><%= USERID %>님 환영합니다.</label>
						<a href="/project/logout.do"> 로그아웃</a>
					</div>

			<%} %>
</body>
</html>