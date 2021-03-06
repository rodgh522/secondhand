<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <script src="https://kit.fontawesome.com/47a97bc968.js" crossorigin="anonymous"></script>
    <!-- Bootstrap CSS -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js">
    </script>
    <meta charset="UTF-8">
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
            height: 90px;
            position: relative;
            display: flex;
            justify-content: space-around;
            color: #fff;
        }
        
        button:focus {
            outline: none;
        }

        header>div {
            margin-right: 30px;
        }

        header div button {
            background-color: inherit;
            color: #fff;
            border: none;
        }

        header div button span {
            font-size: 25px;
            opacity: 0.9;
        }

        #personal {
            line-height: 80px;
            position: relative;
        }

        #personal>a {
            color: #fff;
            font-weight: bold;
        }

        a {
            text-decoration: none;
        }

        #personal button span {
            padding-left: 10px;
            font-size: 20px;
        }

        .body {
            background-color: #f4f4f4;
            margin: 0;
        }

        #mypage {
            position: absolute;
            display: none;
            background-color: #fff;
            top: 98%;
            width: 200px;
            color: #000;
            flex-direction: column;
        }

        #mypage:after {
            content: '';
            position: absolute;
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 15px 10px;
            left: 30%;
            margin-left: 0;
            border-color: transparent transparent #fff transparent;
            top: -30px;
        }

        #mypage a {
            color: #000;
            border-bottom: 1px solid #f4f4f4;
            height: 50px;
            line-height: 50px;
        }

        a:hover {
            text-decoration: none;
        }

        .logo {
            display: inline-block;
            width: 150px;
            position: relative;
            top: 20%;
        }

        .user-action {
            display: flex;
            flex-direction: row-reverse;
        }

        ul {
            list-style: none;
            padding-left: 0;
        }

        @media (min-width:1000px) {
            #user-action-md {
                display: none;
            }
        }

        @media (max-width:1000px) {
            .user-action {
                display: none;
            }
        }

        #msg,
        #help {
            position: relative;
            top: 30%;
        }


        /* The Modal (background) */
        .modal-ms {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 100;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content-ms {
            background-color: #fefefe;
            margin: 5% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            height: 600px;
            width: 800px !important;
            background-color: #6d8d9f;
        }

        /* The Close Button */
        .close-ms {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close-ms:hover,
        .close-ms:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* The Modal end */
        .ms-warp {
            width: 750px;
            height: 500px;
            border: 1px solid white;
        }

        .ms-left {
            float: left;
            width: 20%;
            height: 100%;
            border-right: 1px solid white;
            text-align: center;
            background-color: #55859f;
            color: white;
        }

        .ms-right {
            float: left;
            width: 80%;
            height: 100%;

            /* overflow: scroll; */
        }

        .ms-left-1 {
            float: left;
            width: 100%;
            height: 20%;
            border-bottom: 1px solid white;
            padding-top: 30px;
            background-color: #2e5e78;
            color: white;
        }

        .ms-left-1:hover {
            background-color: #2e5e78;
        }

        .ms-left-2 {
            float: left;
            width: 100%;
            height: 20%;
            border-bottom: 1px solid white;
            padding-top: 30px;
            background-color: #55859f;
            color: white;
        }

        .ms-left-2:hover {
            background-color: #2e5e78;
        }

        .ms-left-3 {
            float: left;
            width: 100%;
            height: 20%;
            border-bottom: 1px solid white;
            padding-top: 30px;
            background-color: #55859f;
            color: white;
        }

        .ms-left-3:hover {
            background-color: #2e5e78;
        }

        .ms-left-4 {
            float: left;
            width: 100%;
            height: 40%;
            border-bottom: 1px solid white;
            padding-top: 50px;
            background-color: #55859f;
            color: white;
            text-align: center;
        }

        /* 새 메시지함 ######################################################## */
        .ms-div1 {
            display: block;
        }

        #ms-right-1 {
            float: left;
            width: 100%;
            height: 100%;
            border-bottom: 1px solid white;
        }

        #ms-right-1-1 {
            float: left;
            width: 100%;
            height: 10%;
            background-color: #2e5e78;
            border-bottom: 1px solid white;
            color: white;
            text-align: center;
        }

        #ms-right-1-2 {
            float: left;
            width: 100%;
            height: 70%;
            overflow: auto;
            background-color: #2e5e78;
            color: white;
        }

        #ms-right-1-3 {
            float: left;
            width: 100%;
            height: 20%;
            background-color: #2e5e78;
            color: white;
            background-image: url("../../resources/img/wave.gif");
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        /* 읽은 메시지함 ########################################################*/
        .ms-div2 {
            display: none;
        }

        #ms-right-2 {
            float: left;
            width: 100%;
            height: 100%;
        }

        #ms-right-2-1 {
            float: left;
            width: 100%;
            height: 10%;
            border-bottom: 1px solid white;
            background-color: #2e5e78;
            color: white;
            text-align: center;
        }

        #ms-right-2-2 {
            float: left;
            width: 100%;
            height: 70%;
            overflow: auto;
            background-color: #2e5e78;
            color: white;
        }

        #ms-right-2-3 {
            float: left;
            width: 100%;
            height: 20%;
            background-color: #2e5e78;
            color: white;
            background-image: url("../../resources/img/wave.gif");
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        /* 보낸 메시지함  ########################################################*/
        .ms-div3 {
            display: none;
        }

        #ms-right-3 {
            float: left;
            width: 100%;
            height: 100%;
        }

        #ms-right-3-1 {
            float: left;
            width: 100%;
            height: 10%;
            border-bottom: 1px solid white;
            background-color: #2e5e78;
            color: white;
            text-align: center;
        }

        #ms-right-3-2 {
            float: left;
            width: 100%;
            height: 70%;
            overflow: auto;
            background-color: #2e5e78;
            color: white;
        }

        #ms-right-3-3 {
            float: left;
            width: 100%;
            height: 20%;
            background-color: #2e5e78;
            color: white;
            background-image: url("../../resources/img/wave.gif");
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }

        .pTag {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 350px;
            height: 20px;
        }

        /* ReadModal ############################################################ */
        /* The Modal (background) */
        .modal-r {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 155;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content-r {
            background-color: #fefefe;
            margin: 15% auto;
            /* 15% from the top and centered */
            margin-left: 40%;
            margin-top: 10%;
            padding: 20px;
            border: 1px solid #888;
            height: 600px;
            width: 400px !important;
            background-color: #dce2f3;
        }

        /* The Close Button */
        .close-r {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close-r:hover,
        .close-r:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* ReSend ############################################################ */
        /* The Modal (background) */
        .modal-s {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 160;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content-s {
            background-color: #fefefe;
            margin: 15% auto;
            /* 15% from the top and centered */
            margin-left: 47%;
            margin-top: 9%;
            padding: 20px;
            border: 1px solid #888;
            height: 600px;
            width: 400px !important;
            background-color: #fffeea;
        }

        /* The Close Button */
        .close-s {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close-s:hover,
        .close-s:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

    </style>
</head>

<body>

    <header id="hd">
        <div class="logo"><a href="/"><span><img src="/resources/photo/logo-white.svg" alt=""></span></a></div>
        <div class="user-action">
            <div id="help"><button type="button" onclick="location.href='/adminList.do'"><span class="far fa-question-circle"></span></button></div>

            <div id="msg">
                <c:if test="${not empty sessionScope.member}">
                    <button type="button" onclick="fn_message()">
                        <span class="far fa-comment-alt"></span>
                    </button>
                </c:if>
            </div>

            <div id="personal" class="dropdown">
                <button type="button" onclick="$('#mypage').toggle(300);">
                    <span class="fab fa-creative-commons-by"></span><span>My page</span></button>
                <div id="mypage" class="dropdown-menu">

                    <div class="dropdown-item" style="border-bottom: 1px solid #f4f4f4;">
                        <span class="fab fa-creative-commons-by" style="font-size: 30px; position: relative; top:5px;"></span><span style="font-size: 30px; line-height: 20px; display: inline-block; position: relative; left:10px;">
                            <c:out value="${member.memberName }" /></span><br><span class="far fa-calendar-alt"></span>&nbsp;<span>
                            <c:out value="${member.regDate }" />가입</span></div>
                    <c:choose>
                        <c:when test="${sessionScope.member.memberId eq 'admin' }">
                            <!-- 신고게시판 -->
                            <a href="/adminPage.do" class="dropdown-item"><span class="far fa-star">&nbsp;</span>관리자정보</a>
                            <a href="/selectReportList.do" class="dropdown-item"><span class="far fa-image">&nbsp;</span> 신고게시판</a>
                            <!-- 회원전체보기 -->
                            <a href="/memberList.do" class="dropdown-item"><span class="far fa-image">&nbsp;</span>회원전체뽑기</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/myInfo.do" class="dropdown-item"><span class="fas fa-cogs">&nbsp;</span> 내 정보</a>
                            <a href="/myBoard.do" class="dropdown-item"><span class="far fa-image">&nbsp;</span> 내 게시글</a>
                            <a href="myWishList.do" class="dropdown-item"><span class="far fa-heart">&nbsp;</span> 찜 목록</a>
                            <a href="/payment.do" class="dropdown-item"><span class="fas fa-wallet">&nbsp;</span> 포인트 충전</a>
                        </c:otherwise>
                    </c:choose>
                    <a href="/logout.do" class="dropdown-item"><span class="fas fa-sign-out-alt">&nbsp;</span> 로그아웃</a>
                </div>
            </div>
        </div>
        <div id="user-action-md">
            <div id="personal" class="dropdown">
                <button type="button" onclick="$('#mypage').toggle(300);">
                    <span class="fab fa-creative-commons-by"></span><span>My page</span></button>
                <div id="mypage" class="dropdown-menu">

                    <div class="dropdown-item" style="border-bottom: 1px solid #f4f4f4;">
                        <span class="fab fa-creative-commons-by" style="font-size: 30px; position: relative; top:5px;"></span><span style="font-size: 30px; line-height: 20px; display: inline-block; position: relative; left:10px;">
                            <c:out value="${member.memberName }" /></span><br><span class="far fa-calendar-alt"></span>&nbsp;<span>
                            <c:out value="${member.regDate }" />가입</span></div>
                    <c:choose>
                        <c:when test="${sessionScope.member.memberId eq 'admin' }">
                            <!-- 신고게시판 -->
                            <a href="/adminPage.do" class="dropdown-item"><span class="far fa-star">&nbsp;</span>관리자정보</a>
                            <a href="/selectReportList.do" class="dropdown-item"><span class="far fa-image">&nbsp;</span> 신고게시판</a>
                            <!-- 회원전체보기 -->
                            <a href="/memberList.do" class="dropdown-item"><span class="far fa-image">&nbsp;</span>회원전체뽑기</a>
                        </c:when>
                        <c:otherwise>
                            <a href="/myInfo.do" class="dropdown-item"><span class="fas fa-cogs">&nbsp;</span> 내 정보</a>
                            <a href="/myBoard.do" class="dropdown-item"><span class="far fa-image">&nbsp;</span> 내 게시글</a>
                            <a href="/myMessage.do" class="dropdown-item"><span class="far fa-comment">&nbsp;</span> 메세지</a>
                            <a href="myWishList.do" class="dropdown-item"><span class="far fa-heart">&nbsp;</span> 찜 목록</a>
                            <a href="/payment.do" class="dropdown-item"><span class="fas fa-wallet">&nbsp;</span> 마일리지 충전</a>
                        </c:otherwise>
                    </c:choose>
                    <a href="/logout.do" class="dropdown-item"><span class="fas fa-sign-out-alt">&nbsp;</span> 로그아웃</a>
                </div>
            </div>
        </div>
    </header>

    <c:if test="${member == null }">
        <script>
            $('#personal').html('<a href="/goLogin.do">로그인</a>');
            $('.msg').html('');

        </script>
    </c:if>
    <!-- The Message Modal -->
    <div id="myModal-ms" class="modal-ms">

        <!-- Modal content -->
        <div class="modal-content-ms">
            <span class="close-ms">&times;</span> <br>
            <h3 style="color: white">MESSAGE BOX</h3>
            <div class="ms-warp  shadow">
                <div class="ms-left">
                    <div class="ms-left-1">
                        새 메시지함<br> <span class="newCount"></span>
                    </div>
                    <div class="ms-left-2">
                        읽은 메시지함<br> <span class="oldCount"></span>
                    </div>
                    <div class="ms-left-3">
                        보낸 메시지함<br> <span class="sendCount"></span>
                    </div>
                    <div class="ms-left-4">

                        <span class="fas fa-envelope" style="color: #dcdcdc; font-size: 70px;"></span>
                    </div>
                </div>
                <div class="ms-right">
                    <div id="ms-right-1" class="ms-div1">
                        <div id="ms-right-1-1" class="ms-div1">
                            <h4>${sessionScope.member.memberId }
                                님 환영합니다. 총 <span class="totalCount"></span>개의 메시지가 있습니다.
                            </h4>
                        </div>
                        <div id="ms-right-1-2" class="ms-div1">
                            <table id="ap"></table>
                        </div>
                        <div id="ms-right-1-3" class="ms-div1"></div>
                    </div>
                    <div id="ms-right-2" class="ms-div2">
                        <div id="ms-right-2-1" class="ms-div2">
                            <h4>${sessionScope.member.memberId }
                                님 환영합니다. 총 <span class="totalCount"></span>개의 메시지가 있습니다.
                            </h4>
                        </div>
                        <div id="ms-right-2-2" class="ms-div2">
                            <table id="ap2"></table>
                        </div>
                        <div id="ms-right-2-3" class="ms-div2"></div>
                    </div>
                    <div id="ms-right-3" class="ms-div3">
                        <div id="ms-right-3-1" class="ms-div3">
                            <h4>${sessionScope.member.memberId }
                                님 환영합니다. 총 <span class="totalCount"></span>개의 메시지가 있습니다.
                            </h4>
                        </div>
                        <div id="ms-right-3-2" class="ms-div3">
                            <table id="ap3"></table>
                        </div>
                        <div id="ms-right-3-3" class="ms-div3"></div>
                    </div>
                </div>
            </div>


        </div>

    </div>

    <form action="/newMessage.do" id="frm" method="post" style="display: none;">
        <input type="hidden" name="memberId" value="${sessionScope.member.memberId }">
    </form>



    <!-- The Read Modal #######################################################################-->
    <div id="myModal-r" class="modal-r">

        <!-- Modal content -->
        <div class="modal-content-r">
            <span class="close-r">&times;</span> <br> <span class="far fa-comment-alt">&nbsp;</span>
            <h5 style="color: #6f81f2">MessageRead</h5>
            <form action="#" id="frm_ms" method="POST">
                보내는 사람 : <input type="text" class="form-control form-control-sm" id="sender-r" value="" readonly="readonly"><br> 받는사 람
                : <input type="text" class="form-control form-control-sm" id="receiver-r" value="${sessionScope.member.memberId }" readonly="readonly"><br> 쪽지 전송일 : <span id="senderDate-r"></span>
                <hr>
                <textarea id="content-r" cols="48" rows="9" style="resize: none;" readonly="readonly"></textarea>
                <br>
            </form>

            <button type="button" class="btn btn-info" id="reSend_btn-r" onclick="fn_ReSend()">쪽지답장보내기</button>
            <input type="button" class="btn btn-danger" id="close_btn-r" value="닫기">
        </div>

    </div>

    <!-- The send Modal ########################################################################-->
    <div id="myModal-s" class="modal-s">

        <!-- Modal content -->
        <div class="modal-content-s">
            <span class="close-s">&times;</span> <br> <span class="far fa-comment-alt">&nbsp;</span>
            <h5 style="color: #6f81f2">MessageReSend</h5>
            <form action="/sendMessage.do" id="frm_rs" method="POST">
                보내는 사람 : <input type="text" name="sender" class="form-control form-control-sm" id="sender-s" value="${sessionScope.member.memberId }" readonly="readonly"><br>
                받는사 람 : <input type="text" name="receiver" class="form-control form-control-sm" id="receiver-s" value="" readonly="readonly"><br>
                <hr>
                <textarea name="content" id="content-s" cols="48" rows="9" style="resize: none;" placeholder="쪽지 내용을 입력해주세요" required></textarea>
                <br>
                <br>
            </form>

            <input type="button" class="btn btn-info" id="send_btn-s" value="보내기">
            <input type="button" class="btn btn-danger" id="close_btn-s" value="닫기">
        </div>

    </div>


    <!-- message -->
    <script>
        function fn_message() {
            $('#myModal-ms').css("display", "block");

            $.ajax({
                url: "/countMessage.do",
                success: function(data) {
                    $('.totalCount').html("(" + data[0] + ")");
                    $('.newCount').html("(" + data[1] + ")");
                    $('.oldCount').html("(" + data[2] + ")");
                    $('.sendCount').html("(" + data[3] + ")");
                },
                error: function() {
                    alert("으엉 실패");
                }
            });

            $
                .ajax({
                    url: "/newMessage.do",
                    success: function(data) {
                        $('#ap *').remove();
                        $('#ap2 *').remove();
                        for (var i = 0; i < data.length; i++) {

                            if (data[i].read == 'N') {

                                $('#ap')
                                    .append(

                                        "<tr><td>" +
                                        data[i].senderDate +
                                        " : " +
                                        "<span style='color:#3ecaa0'>" +
                                        data[i].sender +
                                        "</span>" +
                                        "님이" +
                                        "<span style='color:#f5bd00'>" +
                                        data[i].receiver +
                                        "</span>" +
                                        "님에게 쪽지가 도착했습니다.</td></tr>");
                                $('#ap')
                                    .append(
                                        "<tr><td><p class='pTag' style='color:#4eb9f9'>요약 내용 : " +
                                        data[i].content +
                                        "</p></td><td><button class='btn btn-info btn-sm' onclick='fn_msRead(this)' value='" +
                                        data[i].messageNo +
                                        "'>읽기</button></td><td><button class='btn btn-info btn-sm' onclick='fn_msDelete(this)' value='" +
                                        data[i].messageNo +
                                        "'>삭제</button></td></tr>");
                                $('#ap').append("<hr>");
                            }

                            if (data[i].read == 'Y') {

                                $('#ap2')
                                    .append(

                                        "<tr><td>" +
                                        data[i].senderDate +
                                        " : " +
                                        "<span style='color:#3ecaa0'>" +
                                        data[i].sender +
                                        "</span>" +
                                        "님이" +
                                        "<span style='color:#f5bd00'>" +
                                        data[i].receiver +
                                        "</span>" +
                                        "님에게 쪽지가 도착했습니다.</td></tr>");
                                $('#ap2')
                                    .append(
                                        "<tr><td><p class='pTag' style='color:#4eb9f9'>요약 내용 : " +
                                        data[i].content +
                                        "</p></td><td><button class='btn btn-info btn-sm' onclick='fn_msRead(this)' value='" +
                                        data[i].messageNo +
                                        "'>읽기</button></td><td><button class='btn btn-info btn-sm' onclick='fn_msDelete(this)' value='" +
                                        data[i].messageNo +
                                        "'>삭제</button></td></tr>");
                                $('#ap2').append("<hr>");
                            }
                        }
                    },
                    error: function() {
                        alert("으엉 실패");
                    }
                });

            $
                .ajax({
                    url: "/endMessage.do",
                    success: function(data) {
                        $('#ap3 *').remove();
                        for (var i = 0; i < data.length; i++) {

                            $('#ap3')
                                .append(

                                    "<tr><td>" +
                                    data[i].senderDate +
                                    " : " +
                                    "<span style='color:#f5bd00'>" +
                                    data[i].sender +
                                    "</span>" +
                                    "님이" +
                                    "<span style='color:#3ecaa0'>" +
                                    data[i].receiver +
                                    "</span>" +
                                    "님에게 보낸 쪽지입니다..</td></tr>");
                            $('#ap3')
                                .append(
                                    "<tr><td><p class='pTag' style='color:#4eb9f9'>요약 내용 : " +
                                    data[i].content +
                                    "</p></td><td><button class='btn btn-info btn-sm' onclick='fn_msRead(this)' value='" +
                                    data[i].messageNo +
                                    "'>읽기</button></td></td></tr>");
                            $('#ap3').append("<hr>");
                        }
                    },
                    error: function() {
                        alert("으엉 실패");
                    }
                });

        };

        $('.close-ms').click(function() {
            $('#myModal-ms').css("display", "none");
        });

        $(".ms-left-1").click(function() {
            $('.ms-div1').css("display", "block");
            $('.ms-left-1').css("background-color", "#2e5e78");
            $('.ms-div2').css("display", "none");
            $('.ms-left-2').css("background-color", "#55859f");
            $('.ms-div3').css("display", "none");
            $('.ms-left-3').css("background-color", "#55859f");
        });

        $(".ms-left-2").click(function() {
            $('.ms-div2').css("display", "block");
            $('.ms-left-2').css("background-color", "#2e5e78");
            $('.ms-div1').css("display", "none");
            $('.ms-left-1').css("background-color", "#55859f");
            $('.ms-div3').css("display", "none");
            $('.ms-left-3').css("background-color", "#55859f");
        });

        $(".ms-left-3").click(function() {
            $('.ms-div3').css("display", "block");
            $('.ms-left-3').css("background-color", "#2e5e78");
            $('.ms-div1').css("display", "none");
            $('.ms-left-1').css("background-color", "#55859f");
            $('.ms-div2').css("display", "none");
            $('.ms-left-2').css("background-color", "#55859f");
        });

    </script>
    <script>
        function fn_msDelete(option) {

            if (confirm("쪽지를 삭제하시겠습니까?")) {
                var msNo = option.value;

                $.ajax({
                    url: "/msDelete.do",
                    data: {
                        messageNo: msNo
                    },
                    success: function(data) {
                        if (data > 0) {
                            alert("쪽지를 삭제했습니다.");
                            fn_message();
                        } else {
                            alert("쪽지삭제 오류");
                            fn_message();
                        }

                    },
                    error: function() {
                        alert("으엉 실패");

                    }
                });
            }

        }

    </script>




    <!-- Message Read & Send script ################################################################ -->

    <script>
        $('.close-r').click(function() {
            $('#myModal-r').css("display", "none");
        });

        $('#close_btn-r').click(function() {
            $('#myModal-r').css("display", "none");
        });

        function fn_msRead(option) {
            var msNo = option.value;

            $.ajax({
                url: "/msRead.do",
                data: {
                    messageNo: msNo
                },
                success: function(data) {

                    $('#sender-r').val(data.sender);
                    $('#content-r').html(data.content);
                    $('#senderDate-r').html(data.senderDate);
                    $('#myModal-r').css("display", "block");
                    fn_message();

                },
                error: function() {
                    alert("으엉 실패");

                }
            });

        }

    </script>
    <script>
        $('.close-s').click(function() {
            $('#myModal-s').css("display", "none");
        });

        $('#close_btn-s').click(function() {
            $('#myModal-s').css("display", "none");
        });

        function fn_ReSend() {
            var re = $('#sender-r').val();

            $('#receiver-s').val(re);
            $('#myModal-s').css("display", "block");

        }

        $('#send_btn-s').click(function() {
            if ($('#content-s').val() == "") {
                alert("상대방에게 보낼 쪽지내용을 입력하세요.");
            } else {
                $.ajax({
                    url: "/sendMessage.do",
                    type: "POST",
                    data: $("#frm_rs").serialize(),
                    dataType: "html",
                    success: function(data) {
                        if (data > 0) {
                            alert("쪽지를 보냈습니다.")
                            fn_message();
                            $('#myModal-s').css("display", "none");
                        } else {
                            alert("쪽지 전송 실패.")
                            fn_message();
                            $('#myModal-s').css("display", "none");
                        }

                    },
                    error: function() {
                        alert("으엉 실패");
                    }
                });
            }
        });

    </script>
</body>

</html>
