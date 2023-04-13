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
/* 글 상세보기 */
function userdetail(boardid, viewcnt, bFile){
	$.ajax({
		url : "userboardDet.do",
		type: "get",
		data : { "boardid" : boardid,
				"viewcnt" : viewcnt
		},
		success : function(responseData){
			$("#ajax").remove();
			$("#detailbtn").remove();
			$("#modifybtn").remove();

			var data = JSON.parse(responseData);


			var html = ''
			html += '<form action="" id="ajax" method="post" >';
			html += '<table id="frm_table">';
			html += '<h2>상세보기</h2>'


			html += '<tr>';
			html += '<td style="width:25%;"><label for="uID" >작성자</label></td>';
			html += '<td>' + data.userID + '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td> <label for="title" >제목</label> </td>'
			html += '<td>' + data.title + '</td>';
			html += '</tr>';

			html += '<tr style="height:200px;">';
			html += '<td > <label for="content" >내용</label> </td>'
			html += '<td >' + data.content + '</td>';
			html += '</tr>';

			html += '<input type="hidden" id="detailboardID" name="boardID"  value="'+data.boardid+'">';

			html += '</table>';
			html += '</form>';

			html += '<div id="detailbtn" style=" text-align:center">';
			html += '<button type="button" onclick="userModify()" id="btn_Submit" name="signUpSubmit" class="bt_css">수정</button>';
			html += '<button class="bt_css">삭제</button>';
			html += '</div>';

			$("#user_board_detail").after(html);
		}
	})
}

/* 글 수정 */
function userModify(){
	var boardid =  $("#detailboardID").val()
	$.ajax({
		url : "userboardMod.do",
		type: "get",
		data : { "boardid" : boardid },
		success : function(responseData){
			$("#ajax").remove();
			$("#detailbtn").remove();
			$("#modifybtn").remove();
			var data = JSON.parse(responseData);


			var html = ''
				html += '<form action="" id="ajax" method="post" >';
				html += '<table id="frm_table">';
				html += '<h2>상세보기</h2>'


					html += '<form action="" id="ajax" method="post" >';
				html += '<table id="frm_table">';
				html += '<h2>수정</h2>'


				html += '<tr>';
				html += '<td style="width:25%;"><label for="uID" >작성자</label></td>';
				html += '<td><input type="text" id="userID" name="userID"  value="'+data.userID+'" readonly></td>';
				html += '</tr>';

				html += '<tr>';
				html += '<td> <label for="title" >제목</label> </td>'
				html += '<td><input type="text" id="title" name="title"  value="'+data.title+'"></td>';
				html += '</tr>';

				html += '<tr style="height:200px;">';
				html += '<td > <label for="content" >내용</label> </td>'
				html += '<td ><textarea cols="50" rows="10" name="content" id="content" >'+data.content+'</textarea></td>';
				html += '</tr>';

				html += '<input type="hidden" id="detailboardID" name="boardID"  value="'+data.boardid+'">';

				html += '</table>';
				html += '</form>';

				html += '<div  id="modifybtn"  style=" text-align:center">';
				html += '<button type="submit" onclick="userModifySave()" id="btn_Submit" name="signUpSubmit" class="bt_css">수정</button>';
				html += '</div>';

				$("#user_board_detail").after(html);
		}
	})
}

/* 수정 데이터 저장 */
function userModifySave(){
	$.ajax({
		url : "userboardModsave.do",
		type: "get",
		data : $('#ajax').serialize(),
		success : function(responseData){
			$("#ajax").remove();
			$("#detailbtn").remove();
			$("#modifybtn").remove();
			var data = JSON.parse(responseData);


			var html = ''
			html += '<form action="" id="ajax" method="post" >';
			html += '<table id="frm_table">';
			html += '<h2>수정</h2>'


			html += '<tr>';
			html += '<td style="width:25%;"><label for="uID" >작성자</label></td>';
			html += '<td><input type="text" id="userID" name="userID"  value="'+data.userID+'" readonly></td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td> <label for="title" >제목</label> </td>'
			html += '<td><input type="text" id="title" name="title"  value="'+data.title+'"></td>';
			html += '</tr>';

			html += '<tr style="height:200px;">';
			html += '<td > <label for="content" >내용</label> </td>'
			html += '<td ><textarea cols="50" rows="10" name="content" id="content" >'+data.title+'</textarea></td>';
			html += '</tr>';

			html += '<input type="hidden" id="detailboardID" name="boardID"  value="'+data.boardid+'">';

			html += '</table>';
			html += '</form>';

			html += '<div  id="modifybtn"  style=" text-align:center">';
			html += '<button type="submit" onclick="userModifySave()" id="btn_Submit" name="signUpSubmit" class="bt_css">수정</button>';
			html += '</div>';

			$("#user_board_detail").after(html);
		}
	})



}
</script>
<body>
<%@ include file="../include/boardTopmenu.jsp" %>
	<div id="listDiv">
		<h2>게시판</h2>
		<div  style="overflow:auto; width:100%; height:193px;">
	    <table id = "listTable">
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
	          	<td> ${ status.count }</td>
	             <td><a href="javascript:void(0);" class="atag" onclick="userdetail('${result.boardid}', '${result.viewcnt}', '${result.bFile}')" > ${ result.title } </a> </td>
	             <td>${ result.userid }  </td>

	             <td>${ result.regdate }  </td>
	             <td>${ result.viewcnt }  </td>
	          </tr>
	       </c:forEach>
	    </table>
		</div>

		<div id="user_board_detail">
		</div>
			<!-- 상세보기 데이터 들어갈 곳 -->
		<div id = "user_Modify">
		</div>

		<%-- <div  id="frm_button"  style="display:none; text-align:center">
				<button type="button" onclick="userModify()" id="btn_Submit" name="signUpSubmit" class="bt_css">수정</button>
				<button class="bt_css" onclick="fn_delete('${vo.boardID}')">삭제</button>
		</div> --%>

	</div>

</body>

</html>