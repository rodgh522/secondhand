<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <title>Insert title here</title>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<style>
    .body {
        background-color: #f4f4f4;
        margin: 0;
    }

    #container {
        width: 800px;
        margin: auto;
        text-align: center;
        padding: 0 0 200px 0;
    }

    #loginContainer {
        width: 790px;
        background-color: #fff;
        display: flex;
        padding: 80px 30px;
        justify-content: space-around;
        position: relative;
    }

    #sns {
        display: flex;
        flex-direction: column;
    }

    h2 {
        padding: 50px 0;
        margin-top: 0;
    }

    #message {
        position: absolute;
        top: 30px;
        color: #f00;
    }

</style>

<body>
    <jsp:include page="headerForMember.jsp" />
    <div class="body">
        <div id="container">
            <c:choose>
            
                <c:when test="${id == null}">
                    <h2>이메일 인증 </h2>
                    <div id="loginContainer">
                        <div id="login">
                            <h4>인증번호</h4><br>
                            <input type="text" id="check" class="form-control" placeholder="인증번호"><br><span id="pwmsg"></span><br><br><br>
                            <button id="btn_check" onclick="fn_checkMail();" class="btn btn-outline-success">인증 확인</button>
                        </div>
                    </div>
                <script>
                    $('#msg, #help, .logo').css({
                       'position' : 'relative',
                        'top' : '28px'
                    });
                    </script>
                </c:when>
                <c:otherwise>
                    <h2>이메일 찾기 </h2>
                    <div id="loginContainer">
                        <div id="login">
                            <p>회원님의 ID는</p>
                            <p><h4>${id.memberId }</h4>입니다</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
    <jsp:include page="footer.html" />
    <script>
                        function fn_checkMail() {

                            var check = $('#check').val();
                            var email = '${email}';
                            if (check == ${dice}) {
                                $.ajax({
                                    url: "/getpassword.do",
                                    data: {
                                        email,
                                        email
                                    },
                                    type: "post",
                                    success: function(data) {
                                        $('#pwmsg').html("<h5>비밀번호는 <b>" + data + "</b> 입니다.</h5>");
                                    }
                                });

                            } else {
                                $('#pwmsg').html("<b>인증번호가 일치하지 않습니다.</b>");
                            }
                        }

                    </script>
</body>

</html>
