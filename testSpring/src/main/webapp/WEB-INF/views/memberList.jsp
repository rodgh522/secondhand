<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	          <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bootstrap Example</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<style>
	#aa{display : none;}
</style>
</head>
<body>
	<div class="container">
		<h2>회원관리페이지</h2>
		<p style="color: red">회원을 관리하는 페이지 입니다.</p>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>아이디</th>
					<th>비밀번호</th>
					<th>이름</th>
					<th>주소</th>
					<th>핸드폰번호</th>
					<th>가입날짜</th>
					<th>평가등급?</th>
					<th>관리</th>
				</tr>
			</thead>
			<tbody id="list">
			<c:forEach var="m" items="${list }">
				<c:if test="${m.memberId eq 'admin' }">
				<tr id="aa">
					<th>${m.memberId }</th>
					<th>${m.memberPw }</th>
					<th>${m.memberName }</th>
					<th>${m.memberAddr }</th>
					<th>${m.phone }</th>
					<th>${m.regDate }</th>
					<th>${m.evaluation }</th>
					<th>
						<button class="button" 
								value="${m.memberId }" 
								onclick="fn_memberDelete('${m.memberId }');">추방</button>
					</th>
				</tr>
				</c:if>
			</c:forEach>
			</tbody>
		</table>
		<button id="moreList">더보기</button>
	</div>
<script>
	$(function(){
		var morelist = $("#moreList")
		$("tr").slice(0,10).show;
		$("#moreList").click(function(e){
			e.preventDefault();
			$("tr:hidden").slice(0,10).show();
			if($("tr:hidden").length==0){
				alert("마지막 회원목록 입니다.");
				//버튼 사라지기 하고싶당
				/* $("#morelist").css("display","none"); */
			}
		});
	});
	function fn_memberDelete(id){
		var chk = confirm("정말로 추방 하시겠습니까?");
		if(chk){
			location.href="/memberDelete.do?id="+id;
		}
	}
</script>

</body>
</html>
