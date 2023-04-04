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
<title>Member List</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

</script>
</head>
<style>
   h2{
      text-align: center;
   }
   table{
      width:800px;
      border-collapse:collapse;
      margin-left:auto;
      margin-right:auto;
   }
   th, td{
      border : 1px solid #cccccc;
      padding:5px;
      text-align: center;
   }
   button{
      display:inline;
   }
   a{
   	   float: right;
	   text-decoration: none;
	   outline: none
   }
   #searchFrm{
   		text-align: center;
   		margin-bottom : 15px;
   }


</style>
<script >
   function fn_delete(userid){
      if( confirm("정말 삭제하겠습니까? ")){
         location="memberDelect.do?userid="+userid;
      }
   }
</script>
<body>
<a href="signUpWrite.do"> 회원가입 </a>
<a href="#"> 로그인 </a>
<h2>회원 목록</h2>
	<form id="searchFrm" name="searchFrm" method="post" action="memberList.do">
		<select name="searchGubun" id="searchGubun">
				<option value="userID">아이디</option>
				<option value="name">이름</option>
				<option value="phone">전화번호</option>
		</select>
		<input type="text" name="searchText" id="searchText">
		<button type="submit" >검색</button>
	</form>



   <table>
      <tr>
         <th></th>
         <th>아이디</th>
         <th>비밀번호</th>
         <th>이름</th>
         <th>전화번호</th>
         <th>관리</th>
      </tr>
      <!-- 반복문 -->
      <!-- items : controller에서 지정한 addAttribute메소드의 이름과 같아야 함. -->
      <c:forEach var="result" items="${resultList}" varStatus="status">
         <tr>
            <td>${ status.count } </td>
            <td>${ result.userid }</td>
            <td>${ result.password }</td>
            <td>${ result.name }</td>
            <td>${ result.phone }</td>
            <td>
               <button id = "updateData" name="update" onclick = "location='memberModify.do?userid=${result.userid}'">수정</button>
               <button onclick="fn_delete('${result.userid}')">삭제</button>
            </td>
         </tr>
      </c:forEach>
   </table>
</body>
</html>