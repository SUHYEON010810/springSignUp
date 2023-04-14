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
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/userBoard/ubwrite.css">
<link rel="stylesheet" type="text/css" href = " ${pageContext.request.contextPath}/css/memberTable/buttonStyle.css">
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 <script src="https://code.jquery.com/jquery-latest.min.js"></script>
<title> 카드형 리스트 </title>
<style>
	h1{
		text-align: center;
		color : #586E9E;
	}
	#content_list{
		padding:0px 20%;
		text-align: center;
		margin-bottom :6px;

	}
	.content_list_div{
		text-align: right;
	}
	.content_list_data{
		display: inline-block;
		width: calc(100% / 5);
		height: 80px;
		border: 1px solid rgba(0, 0, 0, 0.5);
		border-radius: 7%;
		margin-bottom :6px;
		padding:30px;
	}
	.carduser{
		margin-top: 10px;
		display: block;
		text-align: left;
		margin-bottom:5px;
		font-size: 13px;

	}
	.cardtitle{
		display: block;
		font-size: 20px;
		text-align: left;
		margin-bottom:10px;
	}

	.cardDC{
		text-align: left;
		color: rgba(0, 0, 0, 0.5);
		font-size: 11px;
	}
	.carddate{
		margin-right: 10px;
	}

</style>
</head>
<script>
$(function(){
	    $(".content_list_data").click(function(){
			alert("클릭");
	    })
	})
</script>
<body>
<%@ include file="../include/boardTopmenu.jsp" %>
<h1>게시판</h1>
	<div id="content_list">
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<div class="content_list_data">
				<span class="carduser"  > ${ result.userid }      </span>
				<span class="cardtitle" > ${ result.title } </span>
				<div class="cardDC">
					<span class="carddate"  >${ result.regdate }          </span>
					<i class="fa-solid fa-eye"></i>
					<span class="cardcnt"   >  ${ result.viewcnt }        </span>
				</div>
			</div>
	   </c:forEach>
	</div>
	 <div id="pagediv" style="margin-top:5px; text-align:center;" >
		<c:forEach var="i" begin="1" end="${totalPage }">
			<a href="cardBoardList.do?viewPage=${i }">${i }</a>
		</c:forEach>
    </div>
 <script
        src="https://kit.fontawesome.com/493cc16663.js"
        crossorigin="anonymous">
    </script>
</body>

</html>