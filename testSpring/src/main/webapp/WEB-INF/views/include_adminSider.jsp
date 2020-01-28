<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript">
function fn_viewReport(){
	$("#viewInfo").attr('style','display:none');
	$("#viewReport").attr('style','display:block');
}

</script>
</head>
<style>
	.joinDate{

	text-align: center;
	background-color: white;
	margin-top: 20px;
}
</style>
<body>
				<div class="list-group shadow">
					<a href="/adminPage.do" ><button type="button" id="viewInfo"class="list-group-item list-group-item-action" onclick="fn_veiwInfo()">
						<span class="far fa-star">&nbsp;</span>관리자정보</button></a>
						
					<a href="/memberList.do"><button type="button" class="list-group-item list-group-item-action">
						<span class="fas fa-list">&nbsp;</span>&nbsp;전체회원관리</button></a> 
					
					<a href="/selectReportList.do"><button type="button" id="viewReport"class="list-group-item list-group-item-action" onclick="fn_viewReport()">
						<span class="far fa-image">&nbsp;</span>&nbsp;신고게시판관리</button></a>
				</div>
				<div class="joinDate shadow">
					<span>${sessionScope.member.memberName }님의 가입일</span> <br>
					<span class="far fa-calendar-alt">&nbsp;&nbsp;</span>
					<span>${sessionScope.member.regDate }</span>
				</div>
<scirpt>

</scirpt>
</body>
</html>