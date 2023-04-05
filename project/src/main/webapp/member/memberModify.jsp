<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- jstl -->
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/reset.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/buttonStyle.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/mbSignUp.css">
<title>수정</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<%@ include file="../include/topmenu.jsp" %>

	<form name="frm" method="post" action="memberModifySave.do" id = "frm" style="padding-top : 40px;" >
		<h2>BUMIL</h2>
		<table>
			<tr>
				<td>
					<input type="text" name="userID" class="input_text" id="uID" value="${ vo.userID }" readonly/>

				</td>
			</tr>
			<tr>
				<td> <input type="password" name="password" id="uPass" class="input_text" value="${ vo.password }"/> </td>
			</tr>
			<tr>
				<td><input type="text" id="uName" value="${ vo.name }" class="input_text" name="name" required/></td>
			</tr>

			<tr>
                <td> <input type="text" name="phone"  id="tel_ch" class="input_text"  value="${ vo.phone }" required/></td>
            </tr>
			<tr>
				<td>
					<button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css" >수정</button>
					<button type="reset" class="bt_css" onclick = "location='memberList.do'" >취소</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>