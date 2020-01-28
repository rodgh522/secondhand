<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
					<a href="/myInfo.do"><button type="button" class="list-group-item list-group-item-action">
						<span class="fas fa-cogs">&nbsp;</span>&nbsp;내 정보</button></a> 
					<a href="/myBoard.do"><button type="button" class="list-group-item list-group-item-action">
						<span class="far fa-image">&nbsp;</span>&nbsp;내 게시글</button></a>
					<a href="/myWishList.do"><button type="button" class="list-group-item list-group-item-action">
						<span class="far fa-heart">&nbsp;</span>&nbsp;찜 목록</button></a>
					<a href="/payment.do"><button type="button" class="list-group-item list-group-item-action">
						<span class="fas fa-wallet">&nbsp;</span>&nbsp;포인트 충전</button></a>
				</div>
				<div class="joinDate shadow">
					<span>${sessionScope.member.memberName }님의 가입일</span> <br>
					<span class="far fa-calendar-alt">&nbsp;&nbsp;</span>
					<span>${sessionScope.member.regDate }</span>
				</div>
</body>
</html>