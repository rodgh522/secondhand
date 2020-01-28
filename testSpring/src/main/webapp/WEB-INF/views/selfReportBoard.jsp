<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
          <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  <style>
      #noticeFont {
          color: red;
          font-style: italic;
          font-weight: bold;
      }
      #noticeHeader{
          font-weight: bold;
      }
    </style>
</head>
<body>

<c:if test="${sessionScope.member.memberId eq admin }"> 
<div class="container">
  <h2 id= "noticeHeader">신고당한게시물(관리자페이지)</h2>
  <h7 id= "noticeFont"> 신고당한 게시물입니다. 확인 후 처리해주시기 바랍니다.</h7>            
  <table class="table">
    <thead>
      <tr>
        <th>No</th>
        <th>카테고리</th>
        <th>제목</th>
        <th>작성자</th>
        <th>이유</th>
        <th>신고날짜&신고자</th>
        <th>상태</th>
        
      </tr>
    </thead>
    <tbody>
      <c:forEach items="${list }" var="r">
      <tr>
        <td>${r.reportNo }</td>
        <td>${r.categorie }</td>
        <td><a href="/goList.do?boardNo=${r.reportBoardNo }">${r.title }</td>
        <td>${r.reportTaget }</td>
         <td>${r.reason }</td>
        <td>${r.reportDate }<br>${r.memberId }</td>
        <td><input type="hidden" value="${r.onGoing }"><div class="dropdown">
  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">처리하기</button>
  <div class="dropdown-menu">
    <a class="dropdown-item" href="#">경고- 그 게시물에 대해 아니라고 말하기</a>
    <a class="dropdown-item" href="#">신고사유적합- 피드백?</a>
    <a class="dropdown-item" href="/reportCancel">신고사유부적합-신고한사람에게 쪽지날리기</a>
  </div>
</div></td>
      </tr>
      </c:forEach>
    </tbody>
 </table>
 <hr>
</div>
</c:if>
</body>
</html>