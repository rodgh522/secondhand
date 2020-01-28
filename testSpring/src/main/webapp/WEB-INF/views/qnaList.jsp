<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->

	


<title>Insert title here</title>
<style>
    #hd {
        display: flex;
        flex-direction: row;
        justify-content: space-around;
    }
#size {
	width: 800px;
}

table {
	text-align: center;
}


#tree {
	width: 100%;
	height: 100px;
}

#text {
	color: black;
}

.pagi{
	padding : 8px;
	color : blue;
	border : 1px solid gray;
}

#info{
	height:35px;
}

th{
	font-family : Lucida Console; 
}


</style>
</head>
<body>



	<jsp:include page="headerForMember.jsp" />
<br><br><br>
<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
		integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
		crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
		integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
		integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
		crossorigin="anonymous"></script>

	<div align="center">

		<br>
		<br>
		<h2 id="text">
			<u>문의사항 게시판</u>
		</h2>
		<br>
		<br>
		<table class="table table-hover" id="size">
			<thead>
				<tr>
				<th>번호</th>
					<%-- <th><input type="hidden" name="q_no" value="${i.count }"></th> --%>
					
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변 확인</th>

				</tr>
			</thead>
			<tbody>

				<c:forEach items="${list }" var="q" varStatus="i">

					<tr>
					<td>${i.count }</td>
						<%-- <td><input type="hidden" name="qno" value="${i.count }"></td> --%>
						
						<c:choose>
							<c:when test="${member.memberId eq 'admin' }">
								<td class="title"><a href="/qnaOne.do?qNo=${q.qNo }">${q.qTitle }</a></td>
							</c:when>
							<c:otherwise>
								<td id="title"><a href="#" onclick="ckPassword(this);">
										${q.qTitle }</a> <input type="hidden" value="${q.qNo }" /></td>
							</c:otherwise>
						</c:choose>

						<td>${q.memberId }</td>
						<td>${q.regDate }</td>
						<c:if test="${q.qanswer != null}">
							<td>답변완료</td>
						</c:if>
						<c:if test="${q.qanswer == null}">
							<td>답변 미완료</td>
						</c:if>


					</tr>
				</c:forEach>

				<!-- Modal -->
				<div class="modal fade" id="exampleModalCenter" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalCenterTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">비밀글입니다.</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body" align="center">
								<form action="/passCheck.do" method="post">
									<div class="form-group form-group-sm mx-sm-2 mb-2">
										<label for="inputPassword2" class="sr-only">비밀번호를
											입력하세요</label> <input type="password" class="form-control" name="qPw"
											placeholder="Password">
									</div>
									<input type="hidden" name="qNo">
									<button type="submit" id="checkPass"
										class="btn btn-primary mb-2">확인</button>
									<br>
								</form>
							</div>
							<div class="modal-footer"></div>
						</div>
					</div>
				</div>
			</tbody>
		</table>

	</div>

<br>

<div class="justify-content-center" align="center" >${pageNavi }</div>

<div class="container" align="right">
	<c:choose>
		 <c:when test="${member.memberId eq 'admin' }">
			
		</c:when> 
		<c:when test="${member eq '' || member eq null}">
			<div>
				<button class="btn btn-success" onclick="login();">작성</button>
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<button class="btn btn-success" onclick="location.href = '/qna.do'">작성</button>
			</div>
		</c:otherwise>
	</c:choose>
</div>
<br>
<div align="center">
<form action="/searchBoard.do">
<select name="select">
	<option value="title">제목</option>
	<option value="memberId">작성자</option>
</select>
	<input type ="hidden" name="currentPage" value="1">
	<input type="text" name="keyword" value="${keyword }">
	<input type="submit" value="검색" class="btn btn-info">
	</form>
</div>
<br><br><br><br><br><br><br><br>

<footer><jsp:include page="footer.html" /></footer>
	<script>
		function password() {
			location.href = "qnaOne.do"
		}

		$("#search-bar").html('');

		function ckPassword(e) {
			var qNo = $(e).siblings('input').val();

			$('[name=qNo]').val(qNo);
			console.log($('#exampleModalCenter')[0]);
			$('#exampleModalCenter').modal('show');
			

		}


		function login() {
			alert("로그인 후 이용 가능합니다.")
			location.href = "goLogin.do"
		}
	</script>
</body>
</html>