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

<%
	String session_uid = (String) session.getAttribute("SessionUserID");
%>
<script>

/* 글 등록 */
function userboardwrite(){
	$("#ajax").remove();
	$("#detailbtn").remove();
	$("#modifybtn").remove();
	$("#user_write").css("display","block");
}



/* 글 상세보기 */
function userdetail(boardid, viewcnt, bFile){
	$("#user_write").css("display","none");
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
			html += '<h2>상세보기</h2>';


			html += '<tr>';
			html += '<td style="width:25%;"><label for="uID" >작성자</label></td>';
			html += '<td>' + data.userID + '</td>';
			html += '</tr>';

			html += '<tr>';
			html += '<td> <label for="title" >제목</label> </td>'
			html += '<td>' + data.title + '</td>';
			html += '</tr>';

			html += '<tr style="height:200px;">';
			html += '<td > <label for="content" >내용</label> </td>';
			html += '<td >' + data.content + '</td>';
			html += '</tr>';

			html += '<input type="hidden" id="detailboardID" name="boardID"  value="'+data.boardid+'">';

			html += '</table>';
			html += '</form>';

			html += '<div id="detailbtn" style=" text-align:center; margin-top:10px;">';
			html += '<button type="button" onclick="userModify()" id="btn_Submit" name="signUpSubmit" class="bt_css" style="margin-right:8px;">수정</button>';
			html += '<button class="bt_css" onclick="userdelete()">삭제</button>';
			html += '</div>';

			$("#user_board_data").after(html);
		}
	})
}

/* 글 등록 데이터 저장 */
function userwirte(){
	alert("클릭");
	$.ajax({
		url : "userboardWriteSave.do",
		type: "post",
		data : $('#frm').serialize(),
		success : function(responseData){
			$("#ajax").remove();
			$("#detailbtn").remove();
			$("#modifybtn").remove();
			var data = JSON.parse(responseData);
		}
	})

	/* location.reload(); */

}

/* 글 수정 */
function userModify(){
	$("#user_write").css("display","none");
	var boardid =  $("#detailboardID").val();
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
				html += '<h2>수정</h2>';


				html += '<tr>';
				html += '<td style="width:25%;"><label for="uID" >작성자</label></td>';
				html += '<td><input type="text" id="userID" name="userID"  value="'+data.userID+'"  style="width:96%;" readonly></td>';
				html += '</tr>';

				html += '<tr>';
				html += '<td> <label for="title" >제목</label> </td>'
				html += '<td><input style="width:96%;" type="text" id="title" name="title"  value="'+data.title+'"></td>';
				html += '</tr>';

				html += '<tr style="height:200px;">';
				html += '<td > <label for="content" >내용</label> </td>';
				html += '<td ><textarea cols="50" rows="10" name="content" id="content"  style="width:96%;" >'+data.content+'</textarea></td>';
				html += '</tr>';

				html += '<input type="hidden" id="detailboardID" name="boardID"  value="'+data.boardid+'">';

				html += '</table>';
				html += '</form>';

				html += '<div  id="modifybtn"  style="text-align:center; margin-top:10px;">';
				html += '<button type="submit" onclick="userModifySave()" id="btn_Submit" name="signUpSubmit" class="bt_css" style="margin-right:8px;">수정</button>';
				html += '<button class="bt_css" onclick="cancell()">취소</button>';
				html += '</div>';

				$("#user_board_data").after(html);
		}
	})
}

function cancell(){
	location.reload();
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
		}
	})
	location.reload();

}

/* 삭제 */
function userdelete(){
	if( confirm ("정말 삭제하겠습니까? ")){
		var boardid =  $("#detailboardID").val();
		$.ajax({
			url : "boardDelect.do",
			type: "get",
			data : { "boardID" : boardid},
			success : function(responseData){
				$("#ajax").remove();
				$("#detailbtn").remove();
				$("#modifybtn").remove();
				var data = JSON.parse(responseData);

			}
		})
		location.reload();
     }
}

</script>
<body>
<%@ include file="../include/boardTopmenu.jsp" %>
   <div id="listDiv" >
      <h2 style="display:inline-block; ">게시판</h2>
      <button class="bt_css" id="nemuButton" onclick = "userboardwrite()"> 글 등록 </button>

      <div style="overflow:auto; width:100%; height:193px; margin-bottom:60px;">
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
                   <td> ${ status.count }</td>
                   <td><a href="javascript:void(0);" class="atag" onclick="userdetail('${result.boardid}', '${result.viewcnt}', '${result.bFile}')" > ${ result.title } </a> </td>
                   <td>${ result.userid }  </td>

                   <td>${ result.regdate }  </td>
                   <td>${ result.viewcnt }  </td>
                </tr>
             </c:forEach>
          </table>
      </div>

      <div id="user_board_data">
       	<!-- 상세보기 데이터 들어갈 곳 -->
      </div>

 	<div id = "user_write" style="display:none;">
		<form name="frm" action="" enctype="multipart/form-data" id="frm" method="post">
			<table id="frm_table">
				<h2>글 등록</h2>
				<tr>
					<td> <label for="uID" >작성자</label> </td>
					<td> <input type="text" name="userID" class="input_text" id="uID" value="<%= session_uid %>" style="width:96%;" readonly/> </td>
				</tr>
				<tr>
					<td> <label for="title" >제목</label> </td>
					<td> <input type="text" name="title" class="input_text" id="title"  style="width:96%;"/> </td>
				</tr>
				<tr>
					<td> <label for="content" >내용</label> </td>
					<td><textarea cols="50" rows="10" name="content" id="content" style="width:96%;"></textarea></td>
				</tr>

				<tr>
					<td colspan="2" id="frm_button" style="text-align:center;">
						<button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css" onclick="userwirte()">글 등록</button>
						<button type="reset" class="bt_css" onclick = "location='boardList.do'">취소</button>
					</td>
				</tr>
			</table>
		</form>
      </div>
   </div>

</body>


</html>