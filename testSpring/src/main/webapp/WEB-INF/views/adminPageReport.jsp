<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <script src="https://kit.fontawesome.com/47a97bc968.js" crossorigin="anonymous"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript">

    </script>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<style>
    /* The Modal (background) */
    .modal {
        display: none;
        /* Hidden by default */
        position: fixed;
        /* Stay in place */
        z-index: 1;
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
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto;
        /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        height: 600px;
        width: 400px !important;
    }

    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }

    .page-container {
        margin-right: auto;
        margin-left: auto;
        max-width: 1280px;
        min-width: 320px;
        min-height: 600px;

        padding: 32px 10px 10px;
    }

    .myPage-container {

        display: flex;
    }

    .myPage-sider {
        min-width: 184px;
        width: 25%;
        margin-right: 16px;
        margin-bottom: 16px;
        display: block;

    }

    .myPage-content {
        width: 75%;

        display: block;
    }

    .content-header {
        margin-bottom: 10px;
        padding: 0;
        margin-top: 10px;
    }

    .content-information {
        background-color: white;
        padding: 1em 0;
    }

    .content-information {
        text-align: center;
    }

    .information-detail {
        text-align: left;
        margin-left: 30px;
        width: 90%;

    }


    .my-report {
        margin-top: 20px;

    }

    .report-header {}

    .report-content {
        background-color: white;
    }

    /* 노티스 이야기들 */
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

    /* 사이드다 */

    .joinDate {
        text-align: center;
        background-color: white;
        margin-top: 20px;
    }

</style>

<body>
    <jsp:include page="headerForMember.jsp" />

    <div class="page-container">
        <div class="myPage-container">
            <div class="myPage-sider">
                <div class="list-group shadow">
                    <a href="/adminPage.do"><button type="button" id="viewInfo" class="list-group-item list-group-item-action">
                            <span class="far fa-star">&nbsp;</span>관리자정보</button></a>

                    <a href="/memberList.do"><button type="button" class="list-group-item list-group-item-action">
                            <span class="fas fa-list">&nbsp;</span>&nbsp;전체회원관리</button></a>

                    <a href="/selectReportList.do"><button type="button" id="viewReport" class="list-group-item list-group-item-action">
                            <span class="far fa-image">&nbsp;</span>&nbsp;신고게시판관리</button></a>

                    <a href="#"><button type="button" class="list-group-item list-group-item-action">
                            <span class="far fa-comment">&nbsp;</span>&nbsp;메세지</button></a>

                </div>
                <div class="joinDate shadow">
                    <span>${sessionScope.member.memberName }님 환영합니다.</span> <br>
                    <span class="far fa-calendar-star">&nbsp;&nbsp;</span>
                    <span>admin</span>
                </div>
            </div>

            <div class="myPage-content">
                <div class="content-header"></div>
                <!-- 신고신고띠 -->
                <div class="my-report" id="viewReport">
                    <div class="report-header">
                        <br>
                    </div>
                    <div class="report-content shadow">
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
                                        <c:forEach items="${rlist }" var="r">
                                            <c:if test="${r.onGoing eq 'Y ' }">
                                                <tr>
                                                    <td>${r.reportNo }</td>
                                                    <td>${r.categorie }</td>
                                                    <td><a href="/goList.do?boardNo=${r.reportBoardNo }">${r.title }</td>
                                                    <td>${r.reportTaget }</td>
                                                    <td>${r.reason }</td>
                                                    <td>${r.reportDate }<br>${r.memberId }</td>
                                                    <td><input type="hidden" value="${r.onGoing }">
                                                        <span class="result">
                                                            <c:if test="${r.onGoing eq 'Y ' }">
                                                                <span style="color: green">완료!</span>
                                                            </c:if>
                                                        </span></td>
                                                    <td><input type="hidden" id="N" value="${r.onGoing}">
                                                        <button type="button" class="btn btn-dark" style="align-self: center;" value="${r.reportBoardNo }" onclick="fn_delete(${r.reportBoardNo });">삭제</button></td>
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
                                        <c:forEach items="${rlist }" var="r">
                                            <c:if test="${r.onGoing eq 'N '}">
                                                <tr>
                                                    <td>${r.reportNo }</td>
                                                    <td>${r.categorie }</td>
                                                    <td><a href="/goList.do?boardNo=${r.reportBoardNo }">${r.title }</td>
                                                    <td>${r.reportTaget }</td>
                                                    <td>${r.reason }</td>
                                                    <td>${r.reportDate }<br>${r.memberId }</td>
                                                    <td><input type="hidden" value="${r.onGoing }"> <span class="result">
                                                            <c:if test="${r.onGoing eq 'Y ' }">
                                                                <span style="color: green">완료!</span>
                                                            </c:if>
                                                            <c:if test="${r.onGoing eq 'N ' }">
                                                                <span style="color: red">진행중..</span>
                                                            </c:if>
                                                        </span></td>
                                                    <td><input type="hidden" id="N" value="${r.onGoing}">
                                                        <div class="dropdown">
                                                            <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">처리하기</button>
                                                            <div class="dropdown-menu" id="reason">
                                                                <a class="dropdown-item"><button type="button" class="btn btn-link" value="${r.reportTaget }" onclick="fn_clickOne(this);">경고(게시글작성자에게))</button></a>
                                                                <a class="dropdown-item"><button type="button" class="btn btn-link" value="${r.memberId}" onclick="fn_clickTwo(this);">신고사유적합(피드백 신고자에게)</button></a>
                                                                <a class="dropdown-item"><button type="button" class="btn btn-link" value="${r.memberId}" onclick="fn_clickThree(this);">신고사유부적합(피드백 신고자에게)</button></a>
                                                            </div>
                                                        </div>
                                                        <div style="display: none">
                                                            <button type="button" class="btn btn-success" value="${r.reportNo }" id="btnComplete" onclick="fn_complete(this);">처리하기</button>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </c:if>
                                        </c:forEach>
                                    </tbody>
                                </table>
                                <hr>
                            </div>
                        </c:if>
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" class="dropdown-item" id="king" value="${sessionScope.member.memberId }">

    <!-- The board message -->
    <div id="myModal" class="modal">

        <!-- message content -->
        <div class="modal-content">
            <span class="close">&times;</span> <br>

            <span class="far fa-comment-alt">&nbsp;</span>
            <h5 style="color: #6f81f2">Message</h5>
            <form action="/sendMessage.do" id="frm_t" method="POST">
                보내는 사람 : <input type="text" name="sender" id="sender" class="form-control" value="${sessionScope.member.memberId }" readonly="readonly"><br>
                받는사 람 : <input type="text" name="receiver" class="form-control" id="receiver" value="" readonly="readonly"><br>
                <hr>
                <textarea name="content" id="content" cols="48" rows="12" style="resize: none;" placeholder="쪽지 내용을 입력해주세요"></textarea><br><br>
            </form>
            <div>
                <input type="button" class="btn btn-info" id="send_btn-t" value="보내기" size="20px">
                <input type="button" class="btn btn-danger" id="close_btn" value="닫기" size="20px">
            </div>
        </div>

    </div>
    <jsp:include page="footer.html" />
    <script>
        /* 여기부터 신고 관련 스크립 */

        /* 종료버튼 */

        $('.close').click(function() {
            $('#myModal').css("display", "none");
        });

        $('#close_btn').click(function() {
            $('#myModal').css("display", "none");
        });


        /* 보내는 함수 */

        $('#send_btn').click(function() {
            $.ajax({
                url: "/sendMessage.do",
                type: "POST",
                data: $("#frm_ms").serialize(),
                dataType: "html",
                success: function(data) {
                    if (data > 0) {
                        alert("쪽지를 보냈습니다.")
                        $('#myModal').css("display", "none");
                    } else {
                        alert("쪽지 전송 실패.")
                        $('#myModal').css("display", "none");
                    }

                },
                error: function() {
                    alert("으엉 실패");
                }
            });

        });


        /* 신고처리 기능 해주쎼용~ */
        function fn_clickOne(option) {
            //1번 이유	
            var a = option.value;
            var king = $("#king").val();
            $('#sender').val(king);
            $('#receiver').val(a);
            $('#content').val("게시물 경고입니다. 글이 삭제 될 수 있습니다.");



            $('#myModal').css("display", "block");



        };




        function fn_clickTwo(b) {
            //2번 이유
            var a = b.value;
            var king = $("#king").val();
            $('#sender').val(king);
            $('#receiver').val(a);
            $("#content").val("신고조치완료했습니다. 3일 이내로 삭제될 예정입니다.");

            $('#myModal').css("display", "block");
        }

        function fn_clickThree(c) {
            //3번 이유
            var a = c.value;
            var king = $("#king").val();
            $("sender").val(king);
            $("#receiver").val(a);
            $("#content").val("신고사유가 적합하지 않습니다.");

            $('#myModal').css("display", "block");
        }


        function fn_delete(no) {
            var chk = confirm("정말 삭제 하시겠습니까?");
            if (chk) {
                location.href = "/delete.do?no=" + no;
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
                url: "/reportComplete.do",
                data: {
                    complete: complete1
                },
                dataType: "json",
                success: function(data) {
                    if (data > 0) {
                        obj.parent().parent().prev().children("span").css(
                            "color", "green");
                        obj.parent().parent().prev().children("span").html(
                            "완료!");

                    }
                },
                error: function() {
                    alert('ajax 실패');
                }

            });
        };

        $("#btnComplete").click(function() {
            $(this).parents("td").css("display", "none");
            location.reload();
        });
        $(".btn-primary dropdown-toggle").click(function() {
            $("#btnComplete").css("display", "block");
        });


        $('#send_btn-t').click(function() {
            if ($('#content').val() == "") {
                alert("상대방에게 보낼 쪽지내용을 입력하세요.");
            } else {
                $.ajax({
                    url: "/sendMessage.do",
                    type: "POST",
                    data: $("#frm_t").serialize(),
                    dataType: "html",
                    success: function(data) {
                        if (data > 0) {
                            alert("쪽지를 보냈습니다.")

                            $('#myModal').css("display", "none");
                        } else {
                            alert("쪽지 전송 실패.")

                            $('#myModal').css("display", "none");
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
