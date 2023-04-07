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
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/board/b_List.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/buttonStyle.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<title>게시판</title>
</head>

<script>
/*  $(function() {

	    $("#sortGubun").change(function() {
	        var data = $(this).val();
	        onclick = "location='boardWrite.do'"
	    });
	}); */


</script>

<body>
	<%@ include file="../include/boardTopmenu.jsp" %>
	<div id="listDiv">
		<h2>게시판</h2>
	<div id="nemu_div">
		<form id="searchFrm" class="nemu__data" name="searchFrm" method="post" action="boardList.do">

			<input type="text" name="searchText" id="searchText" placeholder="제목">
			<button type="submit" class="bt_css">검색</button>
		</form >

		<form id="sortFrm" name="sortFrm" class="nemu__data" method="post" action="boardList.do">
			<select name="sortGubun" id="sortGubun"" onchange="this.form.submit()">
					<option value="title">제목순</option>
					<option value="viewCnt">조회순</option>
					<option value="regDate">등록 날짜 순</option>
			</select>
		</form>

		<button class="bt_css" class="nemu__data"id="nemuButton" onclick = "location='boardWrite.do'"> 글 등록 </button>
	</div>


    <table>
       <tr>
          <th></th>
          <th>제목</th>
          <th>작성자</th>
          <th>등록날짜</th>
          <th>조회수</th>
       </tr>
       <!-- 반복문 -->
       <!-- items : controller에서 지정한 addAttribute메소드의 이름과 같아야 함. -->
       <c:forEach var="result" items="${resultList}" varStatus="status">

          <tr>
          	<td>${ status.count }</td>
             <td><a href="boardDetail.do?boardID=${result.boardid}&viewCnt=${result.viewcnt}"> ${ result.title } </a> </td>
             <td>${ result.userid }</td>

             <td>${ result.regdate }</td>
             <td>${ result.viewcnt }</td>
          </tr>
       </c:forEach>
    </table>
	</div>

</body>
</html>