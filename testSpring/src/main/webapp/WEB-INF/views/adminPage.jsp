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

                    <a href="/memberList.do"><button type="button" class="list-group-item list-group-item-action" onclick="fn_viewList()">
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
                <div class="content-header">
                </div>

                <!-- myInfo -->

                <div class="content-information shadow" id="viewInfo">
                    <h3>my information</h3>
                    <form action="/updateMember.do" method="post">
                        <div class="information-detail">
                            <label>Id</label><br>
                            <div class="mb-3 col-sm-5">
                                <input type="text" class="form-control" name="showId" value="${sessionScope.member.memberId}" disabled="disabled">
                                <input type="hidden" name="memberId" value="${sessionScope.member.memberId}">
                            </div>

                            <label>Password</label><br>
                            <div class="input-group mb-3 col-sm-5 ">
                                <input type="password" class="form-control" name="showPw" value="${sessionScope.member.memberPw}" disabled="disabled">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#multiCollapseExample1" aria-expanded="false" aria-controls="multiCollapseExample1" id="btn_pw">수정</button>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="collapse multi-collapse" id="multiCollapseExample1">
                                            <div class="card card-body shadow">
                                                <input type="password" class="form-control" name="memberPw" id="memberPw" value="${sessionScope.member.memberPw}" placeholder="변경할 password" required><br>
                                                <span id="resultPw"></span><br>
                                                <input type="password" class="form-control" name="memberPw2" id="memberPw2" value="${sessionScope.member.memberPw}" placeholder="변경할 password 확인" required><br>
                                                <span id="resultPw2"></span><br>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <label>Name</label><br>
                            <div class="input-group mb-3 col-sm-5 ">
                                <input type="text" class="form-control" name="showName" value="${sessionScope.member.memberName}" disabled="disabled">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#multiCollapseExample2" aria-expanded="false" aria-controls="multiCollapseExample2" id="btn_name">수정</button>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="collapse multi-collapse" id="multiCollapseExample2">
                                            <div class="card card-body shadow">
                                                <input type="text" class="form-control" name="memberName" id="memberName" value="${sessionScope.member.memberName}" placeholder="이름을 입력해주세요." required><br>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <label>Phone number</label><br>
                            <div class="input-group mb-3 col-sm-5">
                                <input type="text" class="form-control" name="showPhone" value="${sessionScope.member.phone}" disabled="disabled">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#multiCollapseExample3" aria-expanded="false" aria-controls="multiCollapseExample3" id="btn_phone">수정</button>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="collapse multi-collapse" id="multiCollapseExample3">
                                            <div class="card card-body shadow">
                                                <input type="text" class="form-control" name="phone" id="phone" value="${sessionScope.member.phone}" placeholder="Phone을 입력해주세요." required><br>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <label>Addr</label><br>
                            <div class="input-group mb-3 col-sm-5">
                                <input type="text" class="form-control" name="showAddr" value="${sessionScope.member.memberAddr}" disabled="disabled">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button" data-toggle="collapse" data-target="#multiCollapseExample4" aria-expanded="false" aria-controls="multiCollapseExample4" id="btn_addr">수정</button>
                                </div>
                                <div class="row">
                                    <div class="col">
                                        <div class="collapse multi-collapse" id="multiCollapseExample4">
                                            <div class="card card-body shadow">
                                                <input type="text" class="form-control" name="memberAddr" id="memberAddr" value="${sessionScope.member.memberAddr}" placeholder="주소를 입력해주세요." required><br>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <label>Point</label><br>
                            <div class="mb-3 col-sm-5">
                                <input type="text" class="form-control" name="showMileage" value="${sessionScope.member.mileage}" disabled="disabled">
                            </div>

                            <input type="submit" class="btn btn-success" value="정보수정">
                        </div>
                    </form>

                </div>

    <!-- 정보변경 유효성검사 -->
    <script>
        $("#memberPw2").keyup(function() {
            var pw1 = $('#memberPw').val();
            var pw2 = $('#memberPw2').val();
            if (pw1 == pw2) {
                $('#resultPw2').html("패스워드가 일치합니다.");
                $('#resultPw2').css("color", "green");
            } else if (pw1 != pw2) {
                $('#resultPw2').html("패스워드가 일치하지 않습니다.");
                $('#resultPw2').css("color", "red");
            }
        });

    </script>

    <script>
        $('#btn_pw').click(function() {

            if ($('#memberPw').val() == "${member.memberPw}") {
                $('#memberPw').val("");
                $('#memberPw2').val("");
            } else {
                $('#memberPw').val("${member.memberPw}");
                $('#memberPw2').val("${member.memberPw}");
            }

        });

        $('#btn_name').click(function() {

            if ($('#memberName').val() == "${member.memberName}") {
                $('#memberName').val("");
            } else {
                $('#memberName').val("${member.memberName}");
            }

        });

        $('#btn_phone').click(function() {
            if ($('#phone').val() == "${member.phone}") {
                $('#phone').val("");
            } else {
                $('#phone').val("${member.phone}");
            }

        });

        $('#btn_addr').click(function() {
            if ($('#memberAddr').val() == "${member.memberAddr}") {
                $('#memberAddr').val("");
            } else {
                $('#memberAddr').val("${member.memberAddr}");
            }
        });

        /* 여기부터 신고 관련 스크립 */
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

        /* 여기부터 멤버관리테이블 */

        $(function() {
            var morelist = $("#moreList")
            $("tr").slice(0, 10).show;
            $("#moreList").click(function(e) {
                e.preventDefault();
                $("tr:hidden").slice(0, 10).show();
                if ($("tr:hidden").length == 0) {
                    alert("마지막 회원목록 입니다.");
                    //버튼 사라지기 하고싶당
                }
            });
        });

        function fn_memberDelete(id) {
            var chk = confirm("정말로 추방 하시겠습니까?");
            if (chk) {
                location.href = "/memberDelete.do?id=" + id;
            }
        }
    </script>
            </div>
        </div>
    </div>

    <jsp:include page="footer.html" />
</body>

</html>
