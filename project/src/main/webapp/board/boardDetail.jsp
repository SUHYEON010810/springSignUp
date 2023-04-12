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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>상세보기</title>
</head>
<script >
   function fn_delete(boardID){
      if( confirm ("정말 삭제하겠습니까? ")){
         location="boardDelect.do?boardID="+boardID;
      }
   }
</script>
<body>
<%@ include file="../include/boardTopmenu.jsp" %>
	<form action="boardModify.do" encType="multipart/form-data" method="post">
		<table id="frm_table">
			<h2>상세보기</h2>
			<tr>
				<td style="width:25%;"> <label for="uID" >작성자</label> </td>
				<td> ${vo.userID } </td>
			</tr>
			<tr>
				<td> <label for="title" >제목</label> </td>
				<td>${ vo.title }</td>
			</tr>
			<tr style="height:200px;">
				<td > <label for="content" >내용</label> </td>
				<td> ${vo.content} </td>
			</tr>
			<c:if test="${vo.b_file ne null}">
				<tr>
					<td> <label for="b_file" >파일</label> </td>
					<td><a href="fileDownload.do?b_file=${vo.b_file}" ><input type="text" id="b_file" value="${vo.b_file}" name="b_file" readonly="readonly" /></a></td>
				</tr>
			</c:if>
		</table>
	</form>
	 <div  id="frm_button">
     	<button type="button" onclick="location='boardModify.do?boardID=${vo.boardID}'" id="btn_Submit" name="signUpSubmit" class="bt_css">수정</button>
		<button class="bt_css" onclick="fn_delete('${vo.boardID}')">삭제</button>
	</div>
</body>
</html>