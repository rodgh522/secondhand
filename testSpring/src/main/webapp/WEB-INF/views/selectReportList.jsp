<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
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
#noticeFont {
	color: red;
	font-style: italic;
	font-weight: bold;
}

#noticeHeader {
	font-weight: bold;
}

#completeList {
	display: none;
}
</style>
</head>
<body>
	<c:if test="${sessionScope.member.memberId eq 'admin' }">
		<div class="container" id="completeList">
			<h2 id="noticeHeader">신고당한게시물(관리자페이지)</h2>
			<h7 id="noticeFont"> 신고당한 게시물입니다. 확인 후 처리해주시기 바랍니다.</h7>
			<div align="right">
				<button onclick="return fn_waithingList();">신고게시판</button>
				<button onclick="return fn_completeList();">완료게시판</button>
			</div>
			<table class="table">
				<thead>
					<tr>
						<td>No</td>
						<td>카테고리</td>
						<td>제목</td>
						<td>작성자</td>
						<td>이유</td>
						<td>신고날짜&신고자</td>
						<td>상태</td>
						<td>기능</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="r">
						<c:if test="${r.onGoing eq 'Y ' }">
							<tr>
								<td>${r.reportNo }</td>
								<td>${r.categorie }</td>
								<td><a href="/goList.do?boardNo=${r.reportBoardNo }">${r.title }</td>
								<td>${r.reportTaget }</td>
								<td>${r.reason }</td>
								<td>${r.reportDate }<br>${r.memberId }</td>
								<td><input type="hidden" value="${r.onGoing }"> <span
									class="result"> <c:if test="${r.onGoing eq 'Y ' }">
											<span style="color: green">완료!</span>
										</c:if>
								</span></td>
								<td><input type="hidden" id="N" value="${r.onGoing}">
									<button type="button" class="btn btn-dark"
										style="align-self: center;" value="${r.reportBoardNo }"
										onclick="fn_delete(${r.reportBoardNo });">삭제</button></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<hr>
		</div>
		<div class="container" id="waithingList">
			<h2 id="noticeHeader">신고당한게시물(관리자페이지)</h2>
			<h7 id="noticeFont"> 신고당한 게시물입니다. 확인 후 처리해주시기 바랍니다.</h7>
			<div align="right">
				<button onclick="return fn_waithingList();">신고게시판</button>
				<button onclick="return fn_completeList();">완료게시판</button>
			</div>
			<table class="table">
				<thead>
					<tr>
						<td>No</td>
						<td>카테고리</td>
						<td>제목</td>
						<td>작성자</td>
						<td>이유</td>
						<td>신고날짜&신고자</td>
						<td>상태</td>
						<td>기능</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="r">
						<c:if test="${r.onGoing eq 'N '}">
							<tr>
								<td>${r.reportNo }</td>
								<td>${r.categorie }</td>
								<td><a href="/goList.do?boardNo=${r.reportBoardNo }">${r.title }</td>
								<td>${r.reportTaget }</td>
								<td>${r.reason }</td>
								<td>${r.reportDate }<br>${r.memberId }</td>
								<td><input type="hidden" value="${r.onGoing }"> <span
									class="result"> <c:if test="${r.onGoing eq 'Y ' }">
											<span style="color: green">완료!</span>
										</c:if> <c:if test="${r.onGoing eq 'N ' }">
											<span style="color: red">진행중..</span>
										</c:if>
								</span></td>
								<td><input type="hidden" id="N" value="${r.onGoing}">
									<div class="dropdown">
										<button type="button" class="btn btn-primary dropdown-toggle"
											data-toggle="dropdown">처리하기</button>
										<div class="dropdown-menu" id="reason">
											<a class="dropdown-item" href="#">경고- 그 게시물에 대해 아니라고 말하기</a>
											<a class="dropdown-item" href="#">신고사유적합- 피드백?</a> <a
												class="dropdown-item" href="#">신고사유부적합-신고한사람에게 쪽지날리기</a>
										</div>
									</div>
									<div style="display: none">
										<button type="button" class="btn btn-success"
											value="${r.reportNo }" id="btnComplete"
											onclick="fn_complete(this);">처리하기</button>
									</div></td>

							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<hr>
		</div>
	</c:if>
	<script>
		function fn_delete(no){
			var chk = confirm("정말 삭제 하시겠습니까?");
			if(chk){
				location.href="/delete.do?no="+no;
			}
		}
		function fn_waithingList() {
			$("#completeList").attr('style', 'display:none');
			$("#waithingList").attr('style', 'display:block');
		}

		function fn_completeList() {
			$("#completeList").attr('style', 'display:block');
			$("#waithingList").attr('style', 'display:none');
		}

		$(".dropdown-item").click(function() {
			$(this).parent().parent().next().show();

		});

		
		function fn_complete(a) {
			var obj = $(a);
			var complete1 = a.value;
			$.ajax({
				url : "/reportComplete.do",
				data : {
					complete : complete1
				},
				dataType : "json",
				success : function(data) {
					if (data > 0) {
						obj.parent().parent().prev().children("span").css(
								"color", "green");
						obj.parent().parent().prev().children("span").html(
								"완료!");

					}
				},
				error : function() {
					alert('ajax 실패');
				}

			});
		};

		$(".btn-success").click(function() {
			$(this).parents("td").css("display", "none");
		});
		$(".btn-primary dropdown-toggle").click(function() {
			$(".btn-success").css("display", "block");
		});
	</script>
</body>
</html>