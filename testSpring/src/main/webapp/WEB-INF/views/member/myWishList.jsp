<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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


    /* myWish */
    a {
        vertical-align: baseline;
        margin: 0;
        padding: 0;
        border: 0;
        text-decoration: none;
    }

    a:hover {
        background-color: #fcfcfc;
    }

    a:hover .ad-title {
        text-decoration: underline;
    }

    .each-ad {
        display: flex;
        align-items: stretch;
        padding: 20px 15px 20px 20px;
        background: #fff;
        transition: .2s;
        min-height: 90px;
        overflow: hidden;
        transform: translate(0);
        z-index: 0;
        border-bottom: 1px solid #ebebeb;
        max-width: 1428px;
        margin: auto;
    }

    .ad-image-container {
        width: 240px;
        margin-right: 10px;
    }

    .ad-image-wrapper {
        border: 1px solid #ebebeb;
        background: #fbfbfb;
        width: 210px;
        height: 135px;
    }

    .ad-image {
        max-width: 100%;
        max-height: 100%;
        flex: 0 0 auto;
        transition: opacity .2s;
    }

    .ad-detail {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    .ad-title {
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        font-size: 16px;
        line-height: 19px;
        margin-top: 5px;
        font-weight: 700;
        margin-bottom: 0;
    }

    .ad-price-wrapper {
        font-size: 18px;
        line-height: 1;
        color: #3baa33;

    }

    .ad-content {
        max-height: 4.2em;
        display: block;
        margin-top: 10px;
        line-height: 1.4em;
        overflow: hidden;
        min-width: 468px;
    }

    .ad-detail-extra {
        width: 30%;
        flex-direction: column;
        justify-content: space-between;
        height: auto;
        margin-left: 20px;
        margin-top: 0;
        display: flex;
        padding-right: 20px;
    }

    .ad-detail-info {
        display: flex;
        flex-direction: column;
        justify-content: space-around;
        width: 70%;
    }

    .ad-location-wrapper {
        color: #747474;
    }

    .ad-location {
        display: block;
    }

    .ad-distance {
        display: block;
    }

    .ad-regdate {
        color: #747474;
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
                    <h3>my WishList</h3>
                </div>
                <div class="content-information shadow">
                    <div class="main">
                        <c:if test="${empty myWishBoardList}">
                            <p style="color:#3baa33; font-size: 20px; text-align: center; line-height: 5;">내가 찜한 게시글이 존재하지않습니다.</p>
                        </c:if>
                        <c:forEach items="${myWishBoardList }" var="wish">
                            <!-- 게시물 단위 -->
                            <a href="/goList.do?boardNo=${wish.boardNo }" class="each-ad">
                                <div class="ad-image-container">
                                    <div class="ad-image-wrapper"><img class="ad-image" src="/resources/upload/${wish.files.get(0) }" alt="" /></div>
                                </div>
                                <div class="ad-detail">
                                    <div class="ad-detail-info">
                                        <p class="ad-title">${wish.title }</p>
                                        <div class="ad-price-wrapper"><span class="ad-price">${wish.price }원</span>
                                        </div>
                                        <p class="ad-content">${wish.content }</p>
                                    </div>
                                    <div class="ad-detail-extra">
                                        <div class="ad-location-wrapper"><span class="ad-location">${wish.location }</span><span class="ad-distance"></span></div>
                                        <p class="ad-regdate">${wish.regDate }</p>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>

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

    </script>






    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <jsp:include page="../footer.html"/>
</body>

</html>
