<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
    #text1{
        width: 500px;
    }
  
    .input-group-text{
        width: 100px;
     
    }
    
    #qna1, #qna2, #qna3, #qna4{
        width: 55%;

    }
    #comment{
        width: 85%;
        height: 200px;
    }
    #answer1, #answer{
        width: 85%;
        height: 150px;
    }
    .input-group-text{
        font-weight: 500;     
    }
   
    </style>
</head>

<body>
<jsp:include page="headerForMember.jsp"/>

 <br><br><br>
   <div class="container">
   
    <h2 align="center"><u>문의/답변 내용</u></h2><br><br>
    <div align="center">
  <div class="input-group mb-3" id="qna1">
    <div class="input-group-prepend">
      <span class="input-group-text">제목 </span>
    </div>
      <span class="form-control" >${q.qTitle }</span>
  </div>
  
  <div class="input-group mb-3" id="qna2">
    <div class="input-group-prepend">
      <span class="input-group-text">작성자ID</span>
    </div>
      <span class="form-control" >${q.memberId }</span>
  </div>
  
 
   <div class="input-group-prepend" align="center" id="qna3">
       <span class="input-group-text">문의사항</span>   
   <span class="form-control" id="comment" >${q.qContent }</span></div>
   

  <div class="input-group-prepend" align="center" id="qna4">
      <span class="input-group-text">답변</span>
     <c:choose>
    <c:when test="${member.memberId eq 'admin' }">
      
       <textarea class="form-control" rows="10" id="answer" name="qanswer" placeholder="답변작성하기" >${q.qanswer }</textarea>
     
     </c:when>
     <c:otherwise>
     <span class="form-control" id="answer" >${q.qanswer }</span>
     </c:otherwise>
     </c:choose>
       </div>
   
    </div>
   </div>  

   
   <br>
 
    <div align="center">
    <c:choose>
    <c:when test="${member.memberId eq 'admin' }">
    <br>
    <button type="button" class="btn btn-success" onclick="answer();">답변완료</button>
    <button type="button" class="btn btn-outline-success" onclick="delete1();">삭제</button>
    <button type="button" class="btn btn-outline-success" onclick="list();">목록</button>
    <button type="button" class="btn btn-outline-success" onclick="home();">HOME</button>
    </c:when>
    <c:otherwise>
    <br>
     <button type="button" class="btn btn-outline-success" onclick="update();">수정</button>
    <button type="button" class="btn btn-outline-success" onclick="delete1();">삭제</button>
    <button type="button" class="btn btn-outline-success" onclick="list();">목록</button>
    <button type="button" class="btn btn-outline-success" onclick="home();">HOME</button>
    </c:otherwise>
    </c:choose> 
      </div>
  
  <br><br><br><br><br>
  <footer><jsp:include page="footer.html" /></footer>
    <script>
        function update() {
            location.href="/qnaUpgo.do?qNo=${q.qNo }";
        }
        function delete1(){
            location.href="/qnaDelete.do?qNo=${q.qNo }";
        }
        function list(){
            location.href="/qnaList.do?currentPage=1";
        }
        function home(){
            location.href="/Main.do";
        }
        function answer() {
			location.href="/answerup.do?qNo=${q.qNo }&qanswer="+$('#answer').val();
		}
      
        $("#search-bar").html('');
    </script>
    
</body>
</html>