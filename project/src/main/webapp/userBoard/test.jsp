<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
</head>
<script>
$(function(){

	$("#joinOK").click(function(){
		$.ajax({
			url : "userboardDet.do",
			type: "get",
			data : { "id" : $("#id").val() },
			success : function(responseData){
				$("#ajax").remove();
				var data = JSON.parse(responseData);

				var html = '';
				html += '<form class="form-signin" action="" id="ajax">';
				html += '이름 <input type="text" class="form-control" name="name" value="'+data.name+'">';
				html += '아이디 <input type="text" class="form-control" name="id" value="'+data.id+'">';
				html += '</form>';
				$("#container").after(html);
			}
		})
	})

})

</script>
<body>
<form action="">
		<input type="text" id = "id" name="id" />
		<button type="button" id="joinOK" >버튼</button>
		</form>

	<div id="container">

	</div>

</body>
</html>