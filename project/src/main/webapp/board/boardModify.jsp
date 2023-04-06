<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/board/b_detail.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/buttonStyle.css">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../include/boardTopmenu.jsp" %>

	<table id="frm_table">
		<h2>상세보기</h2>
		<tr>
			<td style="width:25%;"> <label for="uID" >작성자</label> </td>

			<td><input type="text" name="userID" class="input_text" id="uID" value="${vo.userID }" readonly/>   </td>
		</tr>
		<tr>
			<td> <label for="title" >제목</label> </td>
			<td>${ vo.title }</td>
		</tr>
		<tr style="height:200px;">
			<td > <label for="content" >내용</label> </td>
			<td> ${vo.content} </td>
		</tr>
		<tr>
			<td> <label for="b_file" >파일</label> </td>
			<td> ${ vo.b_file } </td>
		</tr>
		<tr>
			<td colspan="2" id="frm_button">
				<button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css">수정</button>
			</td>
		</tr>
	</table>
</body>
</html>