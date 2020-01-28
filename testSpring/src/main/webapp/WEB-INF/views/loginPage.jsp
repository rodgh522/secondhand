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
    <style>
        body {
            margin: 0;
            font-size: .875em;
            font-family: ProximaNova-Regular, Arial, Helvetica, sans-serif;
            font-weight: 400;
            line-height: 1.4em;
        }

        header {
            background-color: #36263b;
            position: relative;
        }

        .body {
            background-color: #f4f4f4;
            margin: 0;
        }

        footer {
            background-color: #36263b;
            height: 150px;
            position: relative;
            width: 100%;
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

        [type=submit] {
            width: 280px;
        }

        .sns-login {
            border: 2px solid #f4f4f4;
            background-color: #fff;
            border-radius: 2px;
            margin-bottom: 15px;
            width: 280px;
            padding: 0;
            line-height: 35px;
            background-color: #0bf;
            color: #fff;
        }

        .sns-login span {
            display: inline-block;
            width: 50px;
            height: 35px;
            background-color: aqua;
            float: left;
        }

        #findAddr {
            margin: 10px;
            float: left;
            padding: 5px;
        }

        #message {
            position: absolute;
            top: 30px;
            color: #f00;
        }

    </style>
</head>

<body>
    <jsp:include page="headerForMember.jsp" />
    <div class="body">
        <c:if test="${dice != null}">
            <div id="container">
                <h2>이메일 인증 </h2>
                <div id="loginContainer">
                    <div id="login">
                        인증번호 : <input type="text" id="check" placeholder="인증번호">
                        <button id="btn_check" onclick="fn_checkMail();">인증 확인</button>
                    </div>
                </div>
            </div>
            <script>
                function fn_checkMail() {

                    var check = $('#check').val();
                    if (check == $ {
                            dice
                        }) {
                        alert("인증되었습니다.");
                        location.href = "goLogin.do"
                    } else {
                        alert("일치하지 않습니다.");
                    }
                }

            </script>
        </c:if>
        <c:if test="${email ne null}">
            <div id="container">
                <h2>회원 가입 </h2>
                <div id="loginContainer">
                    <div id="login">
                        <form action="/signIn.do" method="post" onsubmit="return validate();"><input type="text" placeholder="email address" name="memberId" value="${email}" required><br><input type="password" name="memberPw" placeholder="password 8자이상" value="${id }" required><br><input type="password" id="repw" placeholder="password Check" required>
                            <hr><input type="text" placeholder="memberName" name="memberName" value="${name}" required><br><input type="text" name="memberAddr" placeholder="Address" readonly><button type="button" id="findAddr" onclick="findAddress();">주소검색</button><br><input type="text" name="phone" placeholder="phone"><br><button type="submit" class="btn btn-success">회원가입</button></form>
                            <br><span>회원이신가요? </span><a href="">로그인</a>
                    </div>
                    <div><br>|<br>Or<br>|</div>
                    <div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png" /></a></div>
                </div>
            </div>
        </c:if>
    </div>
    <jsp:include page="footer.html" />
    <script>
        $(document).ready(function() {

            var id = '<c:out value="${exist }" />';

            var html = '';
            if (id == 1) {
                html = '<p id="message"> ID가 존재합니다.<br>해당 ID로 로그인</p>';
            } else if (id == 2) {
                html = '<p id="message"> 로그인 정보가 틀립니다.</p>';
            } else if (id == 3) {
                html = '<p id="message"> 조회된 정보가 없습니다. </p>';
            }
            $('.body').html('<div id="container"><h2>로그인 </h2><div id="loginContainer">        <div id="login"><form action="/login.do" method="post">' + html + '<input type="text" name="memberId" placeholder="email address" required><br><input type="password" placeholder="password" name="memberPw" required><br><span>비밀번호를 잊으셨나요? </span><a href="javascript:findPw();">비밀번호 찾기</a><br><br><button type="submit" class="btn btn-success">로그인</button></form><br><span>회원이 아니신가요?</span> <a href="javascript:signIn();">회원가입</a></div><div><br>|<br>Or<br>|</div><div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div></div>');
            addC();
        });

        function findPw() {
            $('.body').html('<div id="container"><h2>아이디 / 비밀번호 찾기 </h2><div id="loginContainer"><div id="findId"><h4>아이디 찾기</h4><form action="/login.do" method="post"><input type="text" name="memberName" placeholder="이름" required><br><input type="text" placeholder="전화번호" name="phone" required><br><button type="submit" class="btn btn-success">아이디 찾기</button></form><hr><div id="findPw"><h4>비밀번호 찾기</h4><form action="" method="post"><input type="text" id="emailId" placeholder="email" required><span id="emailmsg" style="color : red;"></span><br><a href="javascript:sendEmail();" class="btn btn-success">이메일 인증</a><br><hr><span>회원이 아니신가요?</span> <a href="javascript:signIn();">회원가입</a></div><div></div>')
            addC();
        }

        function sendEmail() {
            var email = $('#emailId').val();
            /* 이메일 */
            var rex_email = /^\w{6,15}\@[a-z]{4,10}\.[a-z]{2,3}$/;
            if (rex_email.test(email)) {
                $.ajax({
                    url: "/idCheck.do",
                    type: "get",
                    data: {
                        email: email
                    },
                    success: function(data) {
                        if (data) {
                            location.href = "/send.do?e_mail=" + email;
                        } else {
                            $('#emailmsg').html('존재하지 않는 ID<br>');
                        }
                    }
                });
            } else {
                $('#emailmsg').html('올바른 양식이 아닙니다.<br>');
            }
        }

        function addC() {
            $('input').addClass('form-control');
            $('input').css('border-width', '2px');
        }

        function signIn() {
            $('.body').html('<div id="container"><h2>회원 가입 </h2><div id="loginContainer"><div id="login"><form action="/signIn.do" method="post" onsubmit="return validate();"><input type="text" placeholder="email address" name="memberId" required><br><input type="password" name="memberPw" placeholder="password 8자이상" required><br><input type="password" id="repw" placeholder="password Check" required><hr><input type="text" placeholder="memberName" name="memberName" required><br><input type="text" name="memberAddr" placeholder="Address" readonly><button type="button" id="findAddr"  onclick="findAddress();">주소검색</button><br><input type="text" name="phone" placeholder="phone"><br><button type="submit" class="btn btn-success">회원가입</button></form><br><span>회원이신가요? </span><a href="">로그인</a></div><div><br>|<br>Or<br>|</div><div id="naver_id_login" style="text-align:center"><a href="${url}"><img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div></div>');
            addC();
        }

        function findAddress() {
            window.open("/maps.jsp", "_blank", "toolbar=no, scrollbar=yes, resizable=yes, top=20, left=500, width=1000, height=800");
        }

        function catchAddr(param) {
            $('[name=memberAddr]').val(param);
        }

        $(document).on('keydown', 'input', function() {
            $(this).css('color', '#000');
        });

        function validate() {
            var email = $('[name=memberId]').eq(1);
            email.val(email.val().toLowerCase());
            var pw = $('[name=memberPw]');
            var name = $('[name=memberName]');
            var phone = $('[name=phone]');
            /* 이메일 */
            var rex_email = /^\w{6,15}\@[a-z]{4,10}\.[a-z]{2,3}$/;

            /* Pw */
            var rex_pw = /^[A-Za-z0-9\~\!\@\#\$\%\^\&\*]{8,16}$/;

            /* name */
            var rex_name = /^[A-Za-z가-힣]{2,10}$/;

            /* phone */
            var num = phone.val();
            var result = phone.val();
            if (num.indexOf('-') == -1) {
                if (num.indexOf(' ') == -1) {} else {
                    result = num.substr(0, num.indexOf(' '));
                    result += num.substring(num.indexOf(' ') + 1, num.lastIndexOf(' '));
                    result += num.substring(num.lastIndexOf(' ') + 1, num.length);
                }
            } else {
                result = num.substr(0, num.indexOf('-'));
                result += num.substring(num.indexOf('-') + 1, num.lastIndexOf('-'));
                result += num.substring(num.lastIndexOf('-') + 1, num.length);
            }
            phone.val(result);
            var rex_phone = /^[0-9]{11}$/;

            if (rexCheck(rex_email, email)) {
                return false;
            } else if (rexCheck(rex_pw, pw)) {
                return false;
            } else if (pw.val() != $('#repw').val()) {
                action($('#repw'));
                return false;
            } else if (rexCheck(rex_name, name)) {
                return false;
            } else if (rexCheck(rex_phone, phone)) {
                return false;
            } else {
                return true;
            }
        }

        function rexCheck(rex, what) {
            if (rex.test(what.val())) {
                return false;
            } else {
                action(what);
                return true;
            }
        }

        function action(what) {
            what.focus();
            what.attr('placeholder', '올바른 양식이 아닙니다');
            what.css('color', '#f00');
        }

    </script>
</body>

</html>
