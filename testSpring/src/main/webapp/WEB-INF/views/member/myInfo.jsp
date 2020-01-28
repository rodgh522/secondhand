<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <script src="https://kit.fontawesome.com/47a97bc968.js" crossorigin="anonymous"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://code.jquery.com/jquery-3.3.1.js">

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

</style>

<body>
    <jsp:include page="../headerForMember.jsp" />

    <div class="page-container">
        <div class="myPage-container">
            <div class="myPage-sider">
                <jsp:include page="include_memberSider.jsp" />
            </div>

            <div class="myPage-content">
                <div class="content-header">
                    <h3>My Information</h3>
                </div>
                <div class="content-information shadow">
                    <form action="/updateMember.do" method="post" onsubmit="return validate();">
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
                                                <button type="button" id="findAddr" onclick="findAddress();">주소검색</button>

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


            </div>
        </div>
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


        function findAddress() {
            window.open("/maps.jsp", "_blank", "toolbar=no, scrollbar=yes, resizable=yes, top=20, left=500, width=1000, height=800");
        }
        
        function catchAddr(param) {
            $('[name=memberAddr]').val(param);
        }

    </script>

    <script>

    </script>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <jsp:include page="../footer.html"/>
</body>

</html>
