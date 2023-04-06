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
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/mbList.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/buttonStyle.css">
<title>Member List</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>

<script >
   function fn_delete(userid){
      if( confirm("정말 삭제하겠습니까? ")){
         location="memberDelect.do?userid="+userid;
      }
   }
</script>
<body>
<%@ include file="../include/boardTopmenu.jsp" %>
	<form id="searchFrm" name="searchFrm" method="post" action="memberList.do">
		<h2>회원 목록</h2>
		<select name="searchGubun" id="searchGubun">
				<option value="userID">아이디</option>
				<option value="name">이름</option>
				<option value="phone">전화번호</option>
		</select>
		<input type="text" name="searchText" id="searchText">
		<button type="submit" class="bt_css">검색</button>
	</form>
    <table>
       <tr>
          <th></th>
          <th>아이디</th>
          <th>이름</th>
          <th>전화번호</th>
          <th>관리</th>
       </tr>
       <!-- 반복문 -->
       <!-- items : controller에서 지정한 addAttribute메소드의 이름과 같아야 함. -->
       <c:forEach var="result" items="${resultList}" varStatus="status">
          <tr>
             <td>${ result.rn } </td>
             <td>${ result.userid }</td>

             <td>${ result.name }</td>
             <td>${ result.phone }</td>
             <td>
                <button id = "updateData" name="update" class="bt_css" onclick = "location='memberModify.do?userid=${result.userid}'">수정</button>
                <button class="bt_css" onclick="fn_delete('${result.userid}')">삭제</button>
             </td>
          </tr>
       </c:forEach>
    </table>

    <div id="pagediv" style="margin-top:5px; text-align:center;" >
		<c:forEach var="i" begin="1" end="${totalPage }">
			<a href="memberList.do?viewPage=${i }">${i }</a>
		</c:forEach>
    </div>
</body>
</html>