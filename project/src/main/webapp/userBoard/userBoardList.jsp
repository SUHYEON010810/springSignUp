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
<!-- board css 적용 안됨 -->
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/b_List.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/buttonStyle.css">
<title>게시판</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script>
	$(function(){
		/* $(".userboarda").bind("click",function(e){
			alert("dd");

		}) */


	})
	function userdetail(boardid, viewcnt, bFile){
		const userdetail = document.getElementById('userboarddetail');

		 $.ajax({
			   /* 전송 전 세팅 */
			   type : "POST",
			   data : {
				   "boardID":boardid,
				   "viewCnt":viewcnt
				   },
	           url : "userboardDet.do",
	   		   dataType : "text",

	            success: function(result){
	            	if(result == "ok"){
	            		alert("성공");


	            		$('#user_board_detail tbody').html(''); // 일단 비워

	            		if(result.length >0) { //값을 받아오면 0보단 커지지
	 	                    var detail_rt =  // tbody 내부에 넣을 html코드 작성
	 	                    '<tr>' +
	 	                    	'<td style="width:25%;"><label for="uID" >작성자</label></td>' +
	 	                    	'<td>' + ${ title } + '</td>'+
	 	                    '<tr>' +
	 	                    '<tr>' +
	 	                    	'<td style="width:25%;"><label for="title">제목</label></td>' +
	 	                    	'<td>' + ${ vo.title }+ '</td>'+
	                     	'<tr>';

	 	                    $('#user_board_detail tbody').append(detail_rt);
	 	                    console.log(success);
	            		 }




	            		user_board_detail.style.display = 'block';
	            	}else{
	            		alert("실패");
	            	}
	            },
	            error: function(){
	            	alert("오류발생");
	            }
	         })




	 }

</script>
<body>
<%@ include file="../include/boardTopmenu.jsp" %>
	<div id="listDiv">
		<h2>게시판</h2>
		<div  style="overflow:auto; width:100%; height:193px;">
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
	             <td><a href="javascript:void(0);" id = "userboarddetail" onclick="userdetail('${result.boardid}', '${result.viewcnt}', '${result.bFile}')"> ${ result.title } </a> </td>
	             <td>${ result.userid }  </td>

	             <td>${ result.regdate }  </td>
	             <td>${ result.viewcnt }  </td>
	          </tr>
	       </c:forEach>
	    </table>
		</div>

		<div id="user_board_detail" style="display:none">
			<form action="boardModify.do" encType="multipart/form-data" method="post" >
				<table id="frm_table">
					<h2>상세보기</h2>
					<tbody>
	               <!-- js 로 넣을 공간 -->
	               </tbody>
				</table>
			</form>
			 <div  id="frm_button">
		     	<button type="button" onclick="location='boardModify.do?boardID=${vo.boardID}'" id="btn_Submit" name="signUpSubmit" class="bt_css">수정</button>
				<button class="bt_css" onclick="fn_delete('${vo.boardID}')">삭제</button>
			</div>
		</div>

		<div>

		</div>

	</div>


</body>

</html>