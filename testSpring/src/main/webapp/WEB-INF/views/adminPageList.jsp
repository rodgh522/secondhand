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

    .aa {
        display: none;
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
                <div class="content-header">
                </div>

                <div class="container">
                    <h2>회원관리페이지</h2>
                    <p style="color: red">회원을 관리하는 페이지 입니다.</p>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>아이디</th>
                                <th>비밀번호</th>
                                <th>이름</th>
                                <th>주소</th>
                                <th>핸드폰번호</th>
                                <th>가입날짜</th>
                                <th>마일리지</th>
                                <th>관리</th>
                            </tr>
                        </thead>
                        <tbody id="list">
                            <c:forEach var="m" items="${mlist }">
                                <tr class="aa">
                                    <th>${m.memberId }</th>
                                    <th>${m.memberPw }</th>
                                    <th>${m.memberName }</th>
                                    <th>${m.memberAddr }</th>
                                    <th>${m.phone }</th>
                                    <th>${m.regDate }</th>
                                    <th>${m.mileage }</th>
                                    <th>
                                        <button class="button" value="${m.memberId }" onclick="fn_memberDelete('${m.memberId }');">추방</button>
                                    </th>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <button id="moreList">더보기</button>
                </div>
                <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            </div>
        </div>
    </div>


    <!-- 정보변경 유효성검사 -->
    <script>
        /* 여기부터 멤버관리테이블 */

        $(function() {
            var morelist = $("#moreList")
            $("tr").slice(0, 5).show;
            $("#moreList").click(function(e) {
                e.preventDefault();
                $(".aa:hidden").slice(0, 5).show();
                if ($(".aa:hidden").length == 0) {
                    alert("마지막 회원목록 입니다.");
                    morelist.css('display', 'hidden');
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
<jsp:include page="footer.html" />
</body>

</html>
