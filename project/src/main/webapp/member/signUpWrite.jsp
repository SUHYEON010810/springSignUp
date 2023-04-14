<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>회원가입</title>
	<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/reset.css">
	<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/buttonStyle.css">
	<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/mbSignUp.css">
</head>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(document).ready(function(){
		/* id 중복확인 검증 변수 선언. */
		var idch;
		/* 비밀번호 검증 변수 선언 */
		var pwch;

		/* id 중복확인 */
	   $("input[name='idCheck']").click(function(){
		   var userid = $.trim($("#uID").val());
		   if(userid == ""){
			   alert("아이디를 입력해 주세요");
			   $("#uID").focus();
			   return false;
		   }
		   $.ajax({
			   /* 전송 전 세팅 */
			   type : "POST",
			   data : "userid="+userid,
	           url : "idcheck.do",
	   		   dataType : "text",

	            success: function(result){
	            	if(result == "ok"){
	            		alert("사용 가능한 아이디 입니다.");
	            		idch = "idOK";
	            	}else{
	            		alert("이미 사용중인 아이디 입니다.");
	            	}
	            },
	            error: function(){
	            	alert("오류발생");
	            }
	         })
	   })

	   /* password 검증 */
	   $("#uPass").keyup(function() {
		   var pass = $.trim($("#uPass").val());
		   var pattern = /^(?=.*\d)(?=.*[a-z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;

		   if(pass.match(pattern) == null){
			   $("#chValue").text("비밀번호는 영문, 숫자, 특수문자를 1개 이상 포함해주세요 ");
		   }else{
			   $("#chValue").text("비밀번호가 정상적으로 입력되었습니다.");
			   pwch = "pwok";
		   }




		});

		/* 전화번호 하이픈 */
		$("input[name='phone']").keyup(function(){
			var phone = $.trim($("#tel_ch").val());

			phone = phone.replace(/[^0-9]/g, '');
			phone = phone.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, '$1-$2-$3');
			phone = phone.replace(/(\-{1,2})$/g, "");

			$("#tel_ch").val(phone);


		})

	   /* ID 중복확인 검사, 비밀번호 검사 */
	    $("button[name='signUpSubmit']").click(function(){
	    	 var pass = $.trim($("#uPass").val());
	    	 var passchk = $.trim($("#passchk").val());

	    	 if(idch != "idOK"){
	    		 alert("아이디 중복확인을 해주세요.");
	    		 $("#uID").focus();
	             return false;
	    	 }else if(pass != passchk){
	    		 alert("비밀번호를 확인해 주세요.");
	    		 $("#passchk").focus();
	             return false;

	    	 }else if(pwch != "pwok"){
	    		 alert("비밀번호가 조건에 맞는지 확인해 주세요.");
	    		 return false;
	    	 }
		   })



	});

</script>
<body>
	<form name="frm" method="post" action="signUpWriteSave.do" id = "frm">
		<h2>회원가입</h2>
		<table>
			<tr>
				<td>
					<input type="text" name="userID" class="input_text" id="uID" placeholder="아이디" maxlength="15"/>

				</td>
				<td><input class="bt_css" type="button"   name="idCheck" value="중복 확인" /></td>
			</tr>
			<tr>
				<td> <input type="password" name="password" id="uPass" class="input_text" placeholder="비밀번호" maxlength="15" /> </td>
			</tr>
			<tr>
				<td>
					<p id="chValue" style="margin:0;  color: #808080; font-size:8px;" > 비밀번호는 영문, 숫자, 특수문자를 1개 이상 포함해주세요</p>
				</td>
			</tr>
			<tr>
				<td><input type="password" id="passchk" name="password_confirm" class="input_text" placeholder="비밀번호 확인" maxlength="15"/></td>
			</tr>

			<tr>
				<td><input type="text" id="uName" placeholder="이름" class="input_text" name="name" required maxlength="15"/></td>
			</tr>

			<tr>
                <td> <input type="text" name="phone"  id="tel_ch" class="input_text"  placeholder="전화번호" required maxlength="13" maxlength="15"/></td>
            </tr>
           <tr>
           		<td>
	           		<select name="mem_div" id="mem_div"">
							<option value="1">사용자</option>
							<option value="0">관리자</option>
					</select>
				</td>
           </tr>
			<tr>
				<td>
					<button type="submit" id="btn_Submit" name="signUpSubmit" class="bt_css">회원가입</button>
					<button type="reset" class="bt_css">초기화</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>