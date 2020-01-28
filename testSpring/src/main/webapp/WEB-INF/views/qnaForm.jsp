<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>
<style>
<
style>.container {
	width: 900px;
}

.card-header {
	background-color: white;
}

p {
	color: green;
	font-weight: 500;
	font-size: 20px;
}

#button {
	display: block;
	width: 200px;
	height: 60px;
}

button {
	margin-left: 60px;
}

#myModal1, #myModal2, #myModal3, #myModal4, #myModal5 {
	top: 50%;
	margin-top: -250px;
}

#qna {
	width: 180px;
	height: 190px;
}

.size1 {
	font-size: 25px;
	color: green;
	font-weight: 500;
	border: 1px solid gainsboro;
	border-radius: 7px;
	height: 60px;
	width: 1000px;
	background-color: rgba(0, 0, 0, .03);
	text-align: center;
    line-height: 2;
}

.size2 {
	font-size: 17px;
	font-weight: 400;
	/* display : none; */
	border: 1px solid lightgray;
	border-radius: 7px;
	height: 60px;
	width: 1000px;
	color: black;
	text-align: center;
    line-height: 3;
}

#add {
	margin-right: 60px;
}

.container {
	height: 100%;
}

 #del, #del1 {
	margin-right : 20%;
} 

.date{
	visibility: hidden;
	color: #fff;
	background-color: #17a2b8;
	border: 2px solid #17a2b8;;
	border-radius: 5px;
}

.delete, .delete1 {
	visibility: hidden;
	color: #fff;
	background-color: #dc3545;
	border: 2px solid #dc3545;
	border-radius: 5px;
}

.he {
	display: none;
	margin-left : 50px;
}

</style>
<body>

	<jsp:include page="headerForMember.jsp" />

	<div>
		<img src="../../resources/img/quse.png" width="100%" height="450px">
	</div>

	<br>
	<br>

	<h1 align="center">
		<u>simple guide</u>
	</h1>
	<div align="center">

		<br> <br>
		<button type="button" class="btn btn-outline-light text-dark"
			data-toggle="modal" data-target="#myModal1">
			<div>
				<img src="../../resources/img/sell.PNG">
			</div>
			<p>Gumtree guide</p>
		</button>

		<div class="modal" id="myModal1">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title">Gumtree guide</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<h5>Q. 문의는 어디서 하나요?</h5>
						<h6>- 게시판에 상품문의를 클릭하면 볼 수 있습니다.</h6>
						<br>

						<h5>Q. 비밀번호를 잊어버렸어요.</h5>
						<h6>- 로그인 페이지에서 비밀번호 찾기를 클릭하시면 됩니다.</h6>
						<br>

						<h5>Q. 물건을 주웠는데 판매해도 괜찮아요?</h5>
						<h6>- 분실/도난 신고가 된 제품은 불가능합니다. 고의로 판매시 법적 제재를 받으실 수 있습니다.</h6>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


		<button type="button" class="btn btn-outline-light text-dark"
			data-toggle="modal" data-target="#myModal2">
			<div>
				<img src="../../resources/img/buy.PNG">
			</div>
			<p>Seller's guide</p>
		</button>

		<div class="modal" id="myModal2">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title">Seller's guide</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<h5>Q. 판매는 어떻게 하나요?</h5>
						<h6>- 카테고리를 선택하여 판매하기 글을 작성하시면 됩니다.</h6>
						<br>

						<h5>Q. 직거래를 하기로 했어요</h5>
						<h6>- gumtree는 직거래 과정에서 발생할 수 있는 불편사항으로 부터 자유로울 수 있도록 택배를 통한
							거래를 권장하고 있습니다.</h6>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


		<button type="button" class="btn btn-outline-light text-dark"
			data-toggle="modal" data-target="#myModal3">
			<div>
				<img src="../../resources/img/gum.PNG">
			</div>
			<p>Buyer's guide</p>
		</button>

		<div class="modal" id="myModal3">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title">Buyer's guide</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<h5>Q. 단순변심 환불도 가능한가요?</h5>
						<h6>- 제품에 문제가 없을경우 단순변심 환불은 불가능합니다. 판매자와 상의하세요.</h6>
						<br>

						<h5>Q. 결제는 어떻게 하나요?</h5>
						<h6>- 핸드폰 결제와 카카오 결제를 이용하시면 됩니다.</h6>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>


		<button type="button" class="btn btn-outline-light text-dark"
			data-toggle="modal" data-target="#myModal5">
			<div>
				<img src="../../resources/img/email.png">
			</div>
			<p>Question</p>
		</button>

		<c:choose>
			<c:when test="${member.memberId eq 'admin' }">
				<div class="modal" id="myModal5">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title">Question</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
								<h5>관리자는 문의작성 할 수 없습니다.</h5>
							</div>

							<div class="modal-footer">
								<a href="javascript:question1();" class="btn btn-danger"> 확인
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:when>

			<c:when test="${member eq '' || member eq null}">
				<div class="modal" id="myModal5">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title">Question</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
								<h5>로그인 후 이용 가능합니다.</h5>
							</div>

							<div class="modal-footer">
								<a href="javascript:question2();" class="btn btn-danger"> 확인
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:when>

			<c:otherwise>
				<div class="modal" id="myModal5">
					<div class="modal-dialog">
						<div class="modal-content">

							<div class="modal-header">
								<h4 class="modal-title">Question</h4>
								<button type="button" class="close" data-dismiss="modal">&times;</button>
							</div>

							<div class="modal-body">
								<h5>문의 작성하시겠습니까?</h5>
							</div>

							<div class="modal-footer">
								<a href="javascript:question();" class="btn btn-danger"> 확인
								</a>
							</div>
						</div>
					</div>
				</div>
			</c:otherwise>
		</c:choose>

		<div class="modal" id="myModal5">
			<div class="modal-dialog">
				<div class="modal-content">

					<div class="modal-header">
						<h4 class="modal-title">Question</h4>
						<button type="button" class="close" data-dismiss="modal">&times;</button>
					</div>

					<div class="modal-body">
						<h5>문의 작성하시겠습니까?</h5>
					</div>

					<div class="modal-footer">
						<a href="javascript:question();" class="btn btn-danger"> 확인 </a>
					</div>
				</div>
			</div>
		</div>


		<button type="button" class="btn btn-outline-light text-dark"
			data-toggle="modal" data-target="#myModal4" onclick="go();" id="qna">
			<br>
			<div>
				<p>
					<u id="qna2">Q&A 게시판<br>바로가기→
					</u>
				</p>
			</div>
		</button>
		<br> <br> <br>


<br>
		<!-- 회원인 경우 -->
		<c:if test="${member.memberId ne 'admin' }">
			<div class="she">
				<div id="q" align="center">
					<button id="button" type="button" class="btn btn-outline-success"
						data-toggle="collapse" data-target="#demo">자주 묻는 질문</button>
				</div>
				<div id="demo" class="collapse">
					<table>
						<c:forEach items="${list}" var="a" varStatus="i">
							<tr>
								<td><input type="hidden" name="adno" value="${i.count }" />
								</td>
							</tr>
							<tr class="addinput size3">
								<td><p class="size1">${a.question }</p></td>
							</tr>
							<tr class="addinput">
								<td><p class="size2">${a.answer }</p></td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</c:if>


		<!-- 관리자인경우 -->
		<c:if test="${member.memberId eq 'admin' }">

			<div class="she">
				<div id="q" align="center" class="container">
					<button id="button" type="button" class="btn btn-outline-success"
						data-toggle="collapse" data-target="#demo">자주 묻는 질문</button>
				</div>
				<div id="demo" class="collapse">
					<div id="up1"  align="right">
						<button onclick="up();" class="btn btn-info" id="update">수정</button>
						<button class="btn btn-danger" id="del" >삭제</button>
					</div>
					<table>
						<c:forEach items="${list}" var="a" varStatus="i">
							<tr>
								<td><input type="hidden" name="adno" value="${i.count }" />
								</td>
							</tr>
							<tr class="addinput size3">
								<td><p class="size1">${a.question }</p></td>
							</tr>
							<tr class="addinput">
								<td><p class="size2">${a.answer }</p></td>
							</tr>
							<tr><td align="right"><a href="/adminDel.do?adNo=${a.adNo }" class="delete" >삭제하기</a></td></tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</c:if>







		<!-- 수정 눌렀을시 나오는곳 -->
		<div class="he">
		<div id="q" align="center">
				<button id="button" type="button" class="btn btn-outline-success"
					data-toggle="collapse" data-target="#demo">자주 묻는 질문</button>
			</div>

			<div id="demo" class="collapse">

				<div id="up" align="right">
					<button onclick="up();" class="btn btn-info" id="update" >수정</button>
					<button class="btn btn-danger" id="del1">삭제</button>
				</div>

				<table>
					<c:forEach items="${list}" var="a" varStatus="i">
							<tr>
								<td><input type="hidden" name="adno" value="${i.count }" />
								</td>
							</tr>
							<form action="/adminUp.do?adNo=${a.adNo }" method="post">
							<tr class="addinput size3">
								<td><input type="text" value="${a.question }" name="question" class="size1" required/></td>
							</tr>
							<tr class="addinput">
								<td><input type="text" value="${a.answer }" class="size2" name="answer" required/></td>
							</tr>
							<tr>
								<td align="right"><input type="submit" class="date" value="수정하기"></td>
								</form>
								<td align="right"><a href="/adminDel.do?adNo=${a.adNo }" class="delete1" >삭제하기</a></td>
							</tr>
					</c:forEach>
				</table>
			</div>
		</div>





		<!-- admin인 경우에만 보이게 -->
		<div class="container">
			<c:if test="${member.memberId eq 'admin' }">
				<form action="/adminQ.do" method="post">
					<table>
						<tr>
							<td><input type="hidden" name="adno" value="${i.count }"></td>
						</tr>
						<tr class="addinput size3">
							<td><input type="text" name="question"
								placeholder="질문을 입력하세요" class="size1" required></td>
						</tr>
						<tr class="addinput">
							<td><input type="text" name="answer" placeholder="답변을 입력하세요"
								class="size2" required></td>

						</tr>
					</table>
					<br> <input type="submit" value="등록" class="btn btn-success">
				</form>
				<div align="right" id="add">
					<button name="add" class="btn btn-success">추가</button>
				</div>
				<br>
			</c:if>
		</div>
<br><br><br><br>
<footer> <jsp:include page="footer.html" /></footer>
		<script>
			function question() {
				location.href = "qna.do"
			}

			function question1() {
				location.href = "qnaForm.do"
			}
			$("#search-bar").html('');

			function question2() {
				location.href = "qnaForm.do"
			}

			function go() {
				location.href = "qnaList.do?currentPage=1"
			}

			$(document)
					.on(
							"click",
							"button[name=add]",
							function() {
								var addText = '<tr class="addinput">'
										+ '<td>'
										+ '<input type="text" name="question" placeholder="질문을 입력하세요" class="size size1">'
										+ '</td>'
										+ '</tr>'
										+ '<form action="/adminUp.do?adNo=${a.adNo }" method="post">'
										+ '<tr class="addinput">'
										+ '<td>'
										+ '<input type="text" name="answer" placeholder="답변을 입력하세요" class="size size2">'
										+ '</td>' + '</tr>' + '<tr>' + '<td>'
										+ '<button class="date" value="수정">'
										+ '</form>'
										+ '</button>'
										+ '<button class="delete1" value="삭제">'
										+ '</button>' + '</td>' + '</tr>';
								var trHtml = $("tr[class=addinput]:last");
								trHtml.after(addText);
							});

			$("#update").click(function() {
				$(".date").css("visibility", "visible");

			});

			$("#del").click(function() {
				$(".delete").css("visibility", "visible");
				
			});

			$("#update").click(function() {
				$(".he").css("display", "block");
				$(".she").css("display", "none");
			});
			
			$("#del1").click(function() {
				$(".delete1").css("visibility", "visible");
			});

			
		</script>
</body>
</html>
