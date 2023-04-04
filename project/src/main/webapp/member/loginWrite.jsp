<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>

 <script>
 	$(function(){
 		$("#btn_Submit").click(function(){
 			var userid = $.trim($("#userID").val());
 			var pass = $.trim($("#password").val());

 			if(userid ==""){
 				alert("아이디를 입력해 주세요");
 				return false;
 			}else if (pass == ""){
 				alert("비밀번호를 입력해 주세요");
 				return false;
 			}

 	})
 </script>
</head>
<body>
	<form name="frm" method="post" action="logincheck.do" id = "frm">
		<h2>BUMIL</h2>
		<table>
			<tr>
				<th><label for="userid"> 아이디 </label></th>
				<td> <input type="text" name="userID" id="userID" placecholder="아이디 입력"> </td>
			</tr>
			<tr>
				<th><label for="pass"> 비밀번호 </label></th>
				<td> <input type="password" name="password" id="password" placecholder="아이디 입력"> </td>
			</tr>
		</table>
		<div>
			<button type="submit" id="btn_Submit" name="loginSubmit" >로그인</button>
			<button type="reset" >초기화</button>
		</div>

	</form>
</body>
</html>