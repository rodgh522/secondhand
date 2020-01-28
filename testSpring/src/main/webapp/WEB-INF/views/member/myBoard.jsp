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

    .information-detail {
        text-align: left;
        margin-left: 30px;
        width: 90%;

    }

    /* myboard */
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
                    <h3>My BoardList</h3>
                </div>
                <div class="content-information shadow">
                    <div class="main">
                        <c:if test="${empty myBoard}">
                            <p style="color:#3baa33; font-size: 20px; text-align: center; line-height: 5;">내가 작성한 게시글이 존재하지않습니다.</p>
                        </c:if>
                        <c:forEach items="${myBoard }" var="board">
                            <!-- 게시물 단위 -->
                            <a href="/goList.do?boardNo=${board.boardNo }" class="each-ad">
                                <div class="ad-image-container">
                                    <div class="ad-image-wrapper"><img class="ad-image" src="/resources/upload/${board.files.get(0) }" alt="" /></div>
                                </div>
                                <div class="ad-detail">
                                    <div class="ad-detail-info">
                                        <p class="ad-title">${board.title }</p>
                                        <div class="ad-price-wrapper"><span class="ad-price">${board.price }원</span>
                                        </div>
                                        <p class="ad-content">${board.content }</p>
                                    </div>
                                    <div class="ad-detail-extra">
                                        <div class="ad-location-wrapper"><span class="ad-location">${board.location }</span><span class="ad-distance"></span></div>
                                        <p class="ad-regdate">${board.regDate }</p>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>

                </div>

                <div class="my-report">
                    <div class="report-header">
                        <h3>My ReportList</h3>
                    </div>
                    <div class="report-content shadow">
                        <c:if test="${empty myReport }">
                            <p style="color:#3baa33; font-size: 20px; text-align: center; line-height: 5;">내가쓴 신고글이 존재하지않습니다.</p>
                        </c:if>

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
                                <c:forEach items="${myReport }" var="r">

                                    <tr>
                                        <td>${r.reportNo }</td>
                                        <td>${r.categorie }</td>
                                        <td><a href="/goList.do?boardNo=${r.reportBoardNo }">${r.title }</a></td>
                                        <td>${r.reportTaget }</td>
                                        <td>${r.reason }</td>
                                        <td>${r.reportDate }<br>${r.memberId }</td>
                                        <td>
                                            <c:if test="${r.onGoing eq 'Y ' }">
                                                <span class="result" style="color: green">접수내용 처리완료</span>
                                            </c:if>
                                            <c:if test="${r.onGoing eq 'N ' }">
                                                <span class="result" style="color: red">신고접수 처리중..</span>
                                            </c:if>
                                        </td>
                                        <td>
                                            <c:if test="${r.onGoing eq 'N ' }">
                                                <button type="button" class="btn btn-dark" style="align-self: center;" onclick="fn_delete(${r.reportNo });">신고 취소</button>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form action="/deleteMyReport.do" method="post" id="frm_delete" onsubmit="return confirm('정말 신고를 취소 하시겠습니까?')">
        <input type="hidden" id="reportNo" name="reportNo" value="">
    </form>

    <script>
        function fn_delete(num) {
            $('#reportNo').val(num);
            $('#frm_delete').submit();
        }

    </script>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <jsp:include page="../footer.html"/>
</body>

</html>
