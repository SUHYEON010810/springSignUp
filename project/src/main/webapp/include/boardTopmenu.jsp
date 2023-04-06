<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	#topmenuDiv{
		text-align:center;
		background-color: #D8D8D8;
		padding-bottom : 50px;
		margin-bottom : 70px;
		font-size:20px;
	}

	#topmenuDiv_left{
		float:left;
	}

	#topmenuDiv_right{
		float:right;
	}


</style>
</head>
<%
	String USERID = (String) session.getAttribute("SessionUserID");
%>
<body>
	<div id="topmenuDiv">
		<div id="topmenuDiv_left">
			<a href="memberList.do">회원</a>
			<a href="boardList.do">게시판</a>
		</div>
		<div id="topmenuDiv_right">
			<% if(USERID == null){ %>
				<a class="topMenuA" href="/project/loginWrite.do">로그인</a>
			<% }else{ %>
				<a class="topMenuA" href="/project/logout.do"> 로그아웃</a>
			<%} %>
		</div>
	</div>
</body>
</html>