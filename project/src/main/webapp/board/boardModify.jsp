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
<title>수정</title>
</head>
<body>
   	<%@ include file="../include/boardTopmenu.jsp" %>
	<form name="frm" method="post" action="boardModifySave.do" id = "frm">
 	  	<table id="frm_table">
	      <h2>상세보기</h2>
	      <tr>
	         <td style="width:25%;"> <label for="uID" >작성자</label> </td>
	         <td>${vo.userID }</td>
	      </tr>
	      <tr>
	         <td> <label for="title" >제목</label> </td>
	         <td><input type="text" name="title" class="input_text" value="${ vo.title }" id="title" /></td>
	      </tr>
	      <tr style="height:200px;">
	         <td > <label for="content" >내용</label> </td>
	         <td><textarea cols="50" rows="10" name="content" id="content" >${vo.content}</textarea>  </td>
	      </tr>
	      <tr>
	         <td> <label for="b_file" >파일</label> </td>
	         <td>  <input type="file" value="${ vo.b_file }" name="b_file" class="input_text" id="b_file" /></td>
	         <td><input type="hidden" name="boardID" value="${ vo.boardID }"></td>
	      </tr>
	      <tr>
	         <td colspan="2" id="frm_button">
	            <button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css">수정</button>
	         </td>
	      </tr>
	   </table>
   </form>
</body>
</html>