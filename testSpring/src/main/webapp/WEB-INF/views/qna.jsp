<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<title>Insert title here</title>

<style>
    #text1{
        width: 500px;
    }
  
  
    </style>
</head>

<body>
<jsp:include page="headerForBoard.jsp" />
   
  <br><br><br>
    <form action="/insertQna.do?currentPage=1" method="post"><br><br>
    <h2 align="center"><u>문의하기</u></h2><br><br>
   <div align="center">
    <div id="text1">
    <input type="text" name="memberId" value="${member.memberId }" class="form-control" readonly><br>
    <input type="password" name="qPw" class="form-control" placeholder="비밀번호" id="pw" required><br>
    <input type="text" name="qTitle" class="form-control" placeholder="제목" required><br>
    <textarea class="form-control" rows="10" id="comment" name="qContent" placeholder="문의내용을 작성해주세요." required></textarea><br>
    <div align="center">
    <button type="submit" class="btn btn-success">문의하기</button>
    </div>
    </div>
   </div>
    </form>
    <br><br><br><br><br>
<footer><jsp:include page="footer.html" /></footer>
<script>
$("#search-bar").html('');


</script>
</body>
</html>