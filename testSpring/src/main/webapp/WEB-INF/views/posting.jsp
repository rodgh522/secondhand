<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <script src="https://kit.fontawesome.com/47a97bc968.js" crossorigin="anonymous"></script>
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
            height: 90px;
            position: relative;
        }

        .body {
            background-color: #f4f4f4;
            margin: 0;
        }


        .common,
        #optionTable {
            background-color: #fff;
            width: 700px;
            margin: auto;
            padding: 0 20px;
            margin-bottom: 0;
            margin-top: 0;
        }

        h4 {
            font-size: 16px;
            font-weight: 600;
            opacity: 0.9;
            padding-top: 20px;
        }

        h4 span {
            font-size: 14px;
            font-weight: 100;
            color: grey;
            display: inline-block;
            padding-left: 10px;
        }

        form {
            padding: 20px 20px;
        }

        [name=location],
        [name=possess] {
            width: 300px;
            display: inline-block;
        }

        ul {
            list-style: none;
            display: flex;
            justify-content: space-around;
            padding-left: 0;
        }

        .grade {
            width: 250px;
            height: 220px;
            margin-right: 15px;
            border-width: 3px 2px 2px;
            border-style: solid;
            border-color: #f4f4f4;
            border-radius: 4px;
            display: inline-block;
        }

        .grade div:last-of-type {
            background-color: #fff;
            padding-bottom: 10px;
        }

        li ul {
            display: flex;
            flex-direction: column;
        }

        .line-through {
            text-decoration: line-through;
            color: grey;
        }

        li {
            text-align: center;
        }

        .btn-grade {
            margin-top: 10px;
        }

        .btn-grade button {
            width: 100px;
            background-color: #fff;
            border: 1px solid #f4f4f4;
            font-size: 16px;
        }

        #choice-grade {
            width: 700px;
            margin: auto;
            display: flex;
            flex-direction: column;
        }

        [type=submit] {
            position: relative;
            left: 42%;
            width: 250px;
        }

        .seller input {
            width: 24px;
            height: 24px;
            color: aqua;
        }

        .seller {
            background-color: #fff;
            border: none;
            display: flex;
        }

        h2 {
            text-align: center;
            padding: 40px 0;
        }

        select.form-control {
            width: 400px;
        }

        #forms {
            display: none;
        }

        input[type=text] {
            width: 300px;
        }

        #represent {
            width: 700px;
            margin: auto;
            color: #a4a4a4;
        }

        .image {
            outline: 2px dashed #92b0b3;
            outline-offset: -10px;
            text-align: center;
            transition: all .15s ease-in-out;
            width: 150px;
            height: 150px;
            background-color: gray;
        }

        .dragAndDropDiv {
            text-align: center;
            transition: all .15s ease-in-out;
            width: 150px;
            height: 150px;
            background-color: #fff;
            border: 2px solid #3baa33;
            border-radius: 0.5em;
        }

        .uploadlist {
            display: flex;
            flex-wrap: wrap;
        }

        .photos {
            border: 2px solid #3baa33;
            flex-basis: 100px;
            display: flex;
            flex-direction: column-reverse;
            margin: 5px 10px 5px 0;
            border-radius: 0.5em;
            position: relative;
        }

        .form-control[name=location] {
            display: inline-block;
            margin: 0;
        }

    </style>
</head>

<body>
    <script>
        $(document).ready(function() {
            var category = '<c:out value="${category }" />';
            var categoryM = '<c:out value="${categoryM}" />';
            var target;

            switch (category) {
                case '자동차':
                    target = $('#car');
                    break;
                case 'c':
                    target = $('#car');
                    break;
                case '기타':
                    target = $('#etc');
                    break;
                case 'e':
                    target = $('#etc');
                    break;
                case '의류':
                    target = $('#cloth');
                    break;
                case 'l':
                    target = $('#cloth');
                    break;
                case '컴퓨터':
                    target = $('#computer');
                    break;
                case 'n':
                    target = $('#computer');
                    break;
                case 'p':
                    switch (categoryM) {
                        case 'p':
                            target = $('#phone');
                            break;
                        case 'r':
                            target = $('#camera');
                            break;
                        case '핸드폰':
                            target = $('#phone');
                            break;
                        case '카메라':
                            target = $('#camera');
                            break;
                    }
                    break;
                case 'f':
                    switch (categoryM) {
                        case 'f':
                            target = $('#furniture');
                            break;
                        case 'a':
                            target = $('#appliance');
                            break;
                        case '가구':
                            target = $('#furniture');
                            break;
                        case '가전':
                            target = $('#appliance');
                            break;
                    }
                    break;
                default:
                    switch (categoryM) {
                        case '핸드폰':
                            target = $('#phone');
                            break;
                        case '카메라':
                            target = $('#camera');
                            break;
                        case '컴퓨터':
                            target = $('#computer');
                            break;
                        case '노트북':
                            target = $('#notebook');
                            break;
                        case '가구':
                            target = $('#furniture');
                            break;
                        case '가전':
                            target = $('#appliance');
                            break;
                    }
            }
            if ($('#modiCat').val() == 1) {
                
                target.children('[class=form-control]').each(function(index, item) {
                    if ($(item).children().length==0) {
                        $(this).attr('value', $('.opVal').eq(index).val());
                    } else if ($(item).children().length > 1) {
                        $(this).children().each(function(index1, item1) {
                            $(this).parent().find('option:eq(0)').attr('selected', false);
                            if (item1.value == $('.opVal').eq(index).val()) {
                                $(this).parent().find(item1).attr('selected', true);
                                return;
                            }
                        });
                    } else {
                        $(this).children().remove();
                        $(this).append('<option value="' + $('.opVal').eq(index).val() + '">' + $('.opVal').eq(index).val() + '</option>');
                    }
                });
                $('[name=price]').val('${board.price}');
                $('[name=phone]').val('${board.phone}');
                $('[name=location]').val('${board.location}');
                if ($('[name=sellerType]').val() == 'p') {
                    $('[name=sellerType]').eq(0).attr('checked', true);
                } else {
                    $('[name=sellerType]').eq(1).attr('checked', true);
                }
                $('[name=possess]').each(function(index, item) {
                    if (item.value == '${board.possess}') {
                        $(item).attr('checked', true);
                        return;
                    }
                });
                if ('${board.grade}' == 'f' || '{board.grade}' == null) {
                    border(0);
                } else if ('${board.grade}' == 'p') {
                    border(1);
                } else {
                    border(2);
                }
                $('#mainfrm').attr('action', '/update.do');
            }

            $('#optionTable').html(target.html() + '<hr>');
            var addr = '${member.memberAddr}';
            split = addr.split(' ');
            address = split[0] + " " + split[1] + " " + split[2];
            $('[name=location]').val(address);
        });

    </script>
    <jsp:include page="headerForMember.jsp" />
    <div class="body">

        <c:choose>
            <c:when test="${board == null}">
                <h2>게시물 등록하기 </h2>
            </c:when>
            <c:otherwise>
                <h2>게시물 수정하기 </h2>
                <div id="tem">
                    <input type="hidden" value="1" id="modiCat">
                    <c:forEach items="${board.options }" var="b" varStatus="i">
                        <input type="hidden" name="list[${i.index}].optionName" value="${b.optionName }">
                        <input type="hidden" class="opVal" value="${b.optionValue}">
                    </c:forEach>
                </div>
            </c:otherwise>
        </c:choose>

        <a href="/goPosting.do">
            <div id="represent">카테고리 &gt;
                <c:out value="${category }" />
                <c:if test="${categoryM != null }">
                    <c:out value=" > ${categoryM }" />
                </c:if>
            </div>
        </a>
        <div class="form">
            <form action="/post.do" id="mainfrm" method="post" enctype="multipart/form-data" onsubmit="return titlecheck();">

                <div id="optionTable">z</div>
                <div class="common">
                    <input type="hidden" name="userId" required placeholder="id">
                    <h4>가격(만원) <span>필수 </span></h4>
                    <input type="text" class="form-control" style="margin-right: 0;" maxlength="10" name="price" required placeholder="만원">
                    <hr>
                    <h4>전화번호 <span>필수 </span></h4>
                    <input type="text" class="form-control" name="phone" value="${member.phone}" required placeholder="010-0000-0000"><br>
                    <h4>판매 지역 <span>필수 </span></h4>
                    <input type="text" class="form-control" name="location" value="${member.memberAddr}" placeholder="지역" required readonly>
                    <button type="button" onclick="findAddr();" class="btn btn-success">검색</button>
                    <hr>
                    <h4>판매자 <span>필수 </span></h4>
                    <div style="display: flex; padding-top: 10px;">
                        <button type="button" class="seller"><input type="radio" name="sellerType" value="p" checked><span>&nbsp;&nbsp;개인판매자</span></button>
                        <button type="button" class="seller"><input type="radio" name="sellerType" value="d"><span>&nbsp;&nbsp;전문 판매자 </span></button>
                    </div><br>
                    <hr>
                    <c:choose>
                        <c:when test="${board ne null}">
                            <h4>게시물 제목<span>필수</span></h4>
                            <input type="text" class="form-control" name="title" value="${board.title }" required placeholder="Title" maxlength="60" style="width: 600px;"><br>
                            <textarea name="content" class="form-control" id="content" cols="30" rows="10" placeholder="내용을 입력하세요 " onkeyup="checkByte(this);" required>${board.content}</textarea>
                            <div id="typing">
                                <p class="data_count"><small id="messageByte">0</small><small>/500글자</small></p>
                            </div>
                            <input type="hidden" name="regDate" value="${board.regDate}">
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="form-control" name="title" required placeholder="Title" maxlength="60" style="width: 600px;"><br>
                            <textarea name="content" class="form-control" id="content" cols="30" rows="10" placeholder="내용을 입력하세요 " onkeyup="checkByte(this);" required></textarea>
                            <div id="typing">
                                <p class="data_count"><small id="messageByte">0</small><small>/500글자</small></p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <hr>
                    <h4>사진 <span>필수</span></h4>

                    <div class="uploadlist">
                        <c:if test="${thumbnailList ne null}">
                            <c:forEach items="${thumbnailList }" var="p">
                                <div class="photos">
                                    <img src="/resources/upload${p}" style="width:150px; border : 1px solid #fff; border-radius:1em;" />
                                    <button type="button" style="background-color:#fff; border:1px solid #fff; border-radius:0.5em; position:absolute; right:0; top:0;" data-src="${p }">&nbsp;<span class="fas fa-times-circle"></span></button></div>
                            </c:forEach>
                            <input type="hidden" name="boardNo" value="${board.boardNo}">
                        </c:if>
                    </div>
                    <div id="fileUpload" class="dragAndDropDiv">

                        <label style="background-color: #fff; border : 1px solid #fff; border-radius: 0.5em; width: 100%; height: 100%; padding-top: 40px; cursor: pointer" for="fileup"><span class="far fa-images" style="font-size: 50px; display: block;"></span>
                            <span style="color: #3baa33; padding-top: 10px; display: block;">사진추가
                            </span><span style="color : #3baa33;">사진 끌어서 추가</span></label>
                        <input type="file" id="fileup" multiple style="display: none;">
                        <c:forEach items="${thumbnailList }" var="p">
                            <input type="hidden" name="filename" value="${p}">
                        </c:forEach>
                    </div>
                    <hr>
                    <h4>사용기간 <span>필수</span></h4>
                    <select name="possess" class="form-control" id="" required>
                        <option value="3month">3개월 미만 </option>
                        <option value="6month">6개월 미만 </option>
                        <option value="1year">1년 미만 </option>
                        <option value="3year">3년 미만 </option>
                        <option value="years">3년 이상 </option>

                    </select>
                    <hr>
                    <div id="personalInfo">
                        <div id="fromInfo"></div>
                    </div>
                </div>
                <c:if test="${board eq null}">
                    <div id="choice-grade">
                        <h4>게시물 등급 <span>필수</span></h4>
                        <div>
                            <ul>
                                <li class="grade">
                                    <div>
                                        <h3 style="background-color:#353535; height:50px; line-height:50px; color:#fff; border-top-left-radius: 4px; border-top-right-radius:4px; margin: 0">무료</h3>
                                    </div>
                                    <div>
                                        <h4 style="color:#353535;">Standard</h4>
                                        <ul>
                                            <li>사진 10장</li>
                                            <li class="line-through">게시물 상단 노출</li>
                                            <li class="line-through">게시물 메인 노출</li>
                                        </ul>
                                        <div class="btn-grade"><button type="button" value="f" onclick="border(0);"><span>&nbsp;</span>무료</button></div>
                                    </div>
                                </li>
                                <li class="grade">
                                    <div>
                                        <h3 style="background-color:#ee4055; height:50px; line-height:50px; color:#fff; border-top-left-radius: 4px; border-top-right-radius:4px; margin: 0;">6900원</h3>
                                    </div>
                                    <div>
                                        <h4 style="color:#353535;">HighLight</h4>
                                        <ul>
                                            <li>사진 10장</li>
                                            <li>게시물 상단 노출</li>
                                            <li class="line-through">게시물 메인 노출</li>
                                        </ul>
                                        <div class="btn-grade"><button type="button" value="p" onclick="border(1);"><span>&nbsp;</span>6900원</button></div>
                                    </div>
                                </li>
                                <li class="grade">
                                    <div>
                                        <h3 style="background-color:#00a2cd; height:50px; line-height:50px; color:#fff; border-top-left-radius: 4px; border-top-right-radius:4px; margin: 0;">9900원</h3>
                                    </div>
                                    <div>
                                        <h4 style="color:#353535;">Main</h4>
                                        <ul>
                                            <li>사진 10장</li>
                                            <li>게시물 상단 노출</li>
                                            <li>게시물 메인 노출</li>
                                        </ul>
                                        <div class="btn-grade"><button type="button" value="t" onclick="border(2);"><span>&nbsp;</span>9900원</button></div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </c:if>
                <div>
                    <p align="center" style="color:grey; padding: 30px 0 20px 0;">&#42; 게시물은 30일동안 유지 됩니다. </p>
                </div>

                <input type="hidden" name="mileage" value="${sessionScope.member.mileage }">
                <input type="hidden" id="gradePay" name="gradePay" value="0">
                <input type="hidden" name="grade">
                    <input type="submit" class="btn btn-info" value="게시물 등록하기">
            </form>
        </div>
        <br><br><br>
        <div id="forms">
            <div id="car">
                <input type="hidden" name="category" value="c">
                <h4>제조사 <span>필수 </span></h4>
                <input type="hidden" name="list[0].optionName" value="company">
                <select id="categoryB" name="list[0].optionValue" class="form-control">
                    <option value="현대">현대</option>
                    <option value="Kia">Kia</option>
                    <option value="르노삼성">르노삼성</option>
                </select>

                <h4>모델 <span>필수 </span></h4>
                <input type="hidden" name="list[1].optionName" value="carModel">
                <select id="categoryM" name="list[1].optionValue" class="form-control" onchange="toCategoryS(this)">
                    <option value="no">선택</option>
                </select>

                <h4>차종 <span>옵션 </span></h4>
                <input type="hidden" name="list[2].optionName" value="bodyType">
                <select name="list[2].optionValue" id="categoryS" class="form-control">
                    <option value="">선택</option>
                </select>

                <h4>주행거리 <span>필수 </span></h4>
                <input type="hidden" name="list[3].optionName" value="kilometer">
                <input type="text" name="list[3].optionValue" class="form-control" placeholder="KM" required>

                <h4>연식 <span>필수 </span></h4>
                <input type="hidden" name="list[4].optionName" value="연식">
                <input type="text" name="list[4].optionValue" class="form-control" placeholder="year" required>

                <h4>연료타입 <span>옵션 </span></h4>
                <input type="hidden" name="list[5].optionName" value="fuel">
                <select name="list[5].optionValue" class="form-control">
                    <option value="휘발유">휘발유 </option>
                    <option value="경유 ">경유 </option>
                </select>

                <h4>사고유무 <span>옵션 </span></h4>
                <input type="hidden" name="list[6].optionName" value="사고">
                <select name="list[6].optionValue" class="form-control">
                    <option value="없음">없음</option>
                    <option value="있음">있음</option>
                </select>

            </div>
            <div id="furniture">
                <input type="hidden" name="category" value="f">
                <input type="hidden" name="categoryM" value="f">
                <h4>카테고리 <span>필수</span></h4>
                <input type="hidden" name="list[0].optionName" value="category">
                <select name="list[0].optionValue" class="form-control">
                    <option value="침대">침대</option>
                    <option value="의자">의자</option>
                    <option value="책상">책상</option>
                    <option value="소파">소파</option>
                    <option value="기타">기타</option>
                </select>
                <input type="hidden" name="list[1].optionName" value="company">
                <h4>회사명 <span>옵션 </span></h4>
                <input type="text" name="list[1].optionValue" placeholder="회사명" class="form-control">

                <input type="hidden" name="list[2].optionName" value="m_code">
                <h4>제품코드 <span>옵션 </span></h4>
                <input type="text" name="list[2].optionValue" placeholder="code" class="form-control">

                <input type="hidden" name="list[3].optionName" value="m_cond">
                <h4>제품상태 <span>옵션 </span></h4>
                <input type="text" name="list[3].optionValue" placeholder="상중하" class="form-control">

                <input type="hidden" name="list[4].optionName" value="m_comp">
                <h4>제품구성 <span>옵션 </span></h4>
                <input type="text" name="list[4].optionValue" placeholder="추가구성품.." class="form-control">

                <input type="hidden" name="list[5].optionName" value="m_giese">
                <h4>기스/깨짐 <span>옵션 </span></h4>
                <input type="text" name="list[5].optionValue" placeholder="기스/깨짐" class="form-control">

                <input type="hidden" name="list[6].optionName" value="m_buy">
                <h4>구입경로 <span>옵션 </span></h4>
                <input type="text" name="list[6].optionValue" placeholder="구입경로" class="form-control">
            </div>
            <div id="appliance">
                <input type="hidden" name="category" value="f">
                <input type="hidden" name="categoryM" value="a">
                <h4>카테고리 <span>필수</span></h4>
                <input type="hidden" name="list[0].optionName" value="category">
                <select name="list[0].optionValue" class="form-control">
                    <option value="tv">tv</option>
                    <option value="냉장고">냉장고</option>
                    <option value="에어컨">에어컨</option>
                    <option value="세탁기">세탁기</option>
                    <option value="기타">기타</option>
                </select>
                <input type="hidden" name="list[1].optionName" value="company">
                <h4>회사명 <span>옵션 </span></h4>
                <input type="text" name="list[1].optionValue" placeholder="회사명" class="form-control">

                <input type="hidden" name="list[2].optionName" value="m_code">
                <h4>제품코드 <span>옵션 </span></h4>
                <input type="text" name="list[2].optionValue" placeholder="code" class="form-control">

                <input type="hidden" name="list[3].optionName" value="m_cond">
                <h4>제품상태 <span>옵션 </span></h4>
                <input type="text" name="list[3].optionValue" placeholder="상중하" class="form-control">

                <input type="hidden" name="list[4].optionName" value="m_comp">
                <h4>제품구성 <span>옵션 </span></h4>
                <input type="text" name="list[4].optionValue" placeholder="추가구성품.." class="form-control">

                <input type="hidden" name="list[5].optionName" value="m_giese">
                <h4>기스/깨짐 <span>옵션 </span></h4>
                <input type="text" name="list[5].optionValue" placeholder="기스/깨짐" class="form-control">

                <input type="hidden" name="list[6].optionName" value="m_buy">
                <h4>구입경로 <span>옵션 </span></h4>
                <input type="text" name="list[6].optionValue" placeholder="구입경로" class="form-control">
                
            </div>

            <div id="cloth">

                <input type="hidden" name="category" value="l">
                <h4>성별 <span>옵션 </span></h4>
                <input type="hidden" name="list[0].optionName" value="gender">
                <select name="list[0].optionValue" id="" class="form-control" style="width:100px;">
                    <option value="m">남자</option>
                    <option value="f">여자</option>
                    <option value="c">공용</option>
                </select>

                <h4>브랜드 <span>옵션 </span></h4>
                <input type="hidden" name="list[1].optionName" value="brand">
                <input type="text" name="list[1].optionValue" placeholder="브랜드" class="form-control">

                <h4>종류 <span>옵션 </span></h4>
                <input type="hidden" name="list[2].optionName" value="type">
                <input type="text" name="list[2].optionValue" placeholder="종류" class="form-control">

                <h4>사이즈 <span>옵션 </span></h4>
                <input type="hidden" name="list[3].optionName" value="size">
                <input type="text" name="list[3].optionValue" placeholder="사이즈" class="form-control">
            </div>

            <div id="etc">

                <input type="hidden" name="category" value="e">
                <h4>제품 <span>필수 </span></h4>
                <input type="hidden" name="list[0].optionName" value="m_name">
                <input type="text" name="list[0].optionValue" placeholder="제품이름" class="form-control" required>

                <h4>브랜드 <span>옵션 </span></h4>
                <input type="hidden" name="list[1].optionName" value="brend">
                <input type="text" name="list[1].optionValue" placeholder="브랜드" class="form-control" required>

                <h4>제품상태 <span>옵션 </span></h4>
                <input type="hidden" name="list[2].optionName" value="m_cond">
                <input type="text" name="list[2].optionValue" placeholder="제품상태" class="form-control" required>

                <h4>제품구성 <span>옵션 </span></h4>
                <input type="hidden" name="list[3].optionName" value="m_comp">
                <input type="text" name="list[3].optionValue" placeholder="제품구성" class="form-control" required>

                <h4>구입경로 <span>옵션 </span></h4>
                <input type="hidden" name="list[4].optionName" value="m_buy">
                <input type="text" name="list[4].optionValue" placeholder="구입경로" class="form-control" required>
            </div>

            <div id="computer">
                <input type="hidden" name="category" value="n">
                <h4>제품 <span>필수 </span></h4>
                <input type="hidden" name="list[0].optionName" value="product">
                <select name="list[0].optionValue" id="product" onchange="setCategory2()" class="form-control" required>
                    <option value="" selected>판매품을 선택하세요</option>
                    <option value="n1">컴퓨터</option>
                    <option value="n2">노트북</option>
                    <option value="n3">주변기기</option>
                </select>

                <h4>제품상세 <span>필수 </span></h4>
                <input type="hidden" name="list[1].optionName" value="part">
                <select name="list[1].optionValue" id="part" onchange="setGuideline()" class="form-control" required>
                    <option value="" selected>선택하세요</option>
                </select><br>
            </div>

            <div id="phone">

                <input type="hidden" name="category" value="p">
                <input type="hidden" name="categoryM" value="p">
                <h4>제조사 <span>필수 </span></h4>
                <input type="hidden" name="list[0].optionName" value="제조사">
                <select name="list[0].optionValue" class="form-control" onchange="doChange(this)" required>
                    <option selected hidden disabled>제조사를 선택해주세요</option>
                    <option value="Apple">Apple</option>
                    <option value="Samsung">Samsung</option>
                    <option value="LG">LG</option>
                    <option value="etc">etc</option>
                </select>

                <h4>모델 <span>필수 </span></h4>
                <input type="hidden" name="list[1].optionName" value="모델">
                <select name="list[1].optionValue" class="form-control" required>
                    <option selected hidden disabled class="model">모델을 선택해주세요</option>
                </select>

                <h4>GB <span>필수 </span></h4>
                <input type="hidden" name="list[2].optionName" value="용량">
                <select id="storage" name="list[2].optionValue" class="form-control" required>
                    <option selected hidden disabled>용량을 선택해주세요</option>
                    <option value="32GB">32GB</option>
                    <option value="64GB">64GB</option>
                    <option value="128GB">128GB</option>
                    <option value="256GB">256GB</option>
                    <option value="etc">etc</option>
                </select>

                <h4>색상 <span>필수 </span></h4>
                <input type="hidden" name="list[3].optionName" value="색상">
                <select id="Color" name="list[3].optionValue" class="form-control" required>
                    <option selected hidden disabled>색상을 선택해주세요</option>
                    <option value="black">black</option>
                    <option value="white">white</option>
                    <option value="purple">purple</option>
                    <option value="red">red</option>
                    <option value="gold">gold</option>
                    <option value="gray">gray</option>
                    <option value="pink">pink</option>
                    <option value="blue">blue</option>
                    <option value="etc">etc</option>
                </select>

                <h4>구성품 <span>옵션 </span></h4>
                <input type="hidden" name="list[4].optionName" value="구성품">
                <input type="text" name="list[4].optionValue" class="form-control" placeholder="구성품을 입력해주세요.">
            </div>

            <div id="camera">

                <input type="hidden" name="category" value="p">
                <input type="hidden" name="categoryM" value="r">
                <h4>제조사 <span>옵션 </span></h4>
                <input type="hidden" name="list[0].optionName" value="제조사">
                <select name="list[0].optionValue" class="form-control" required>
                    <option selected hidden disabled>제조사를 선택해주세요</option>
                    <option value="Cannon">Cannon</option>
                    <option value="Sony">Sony</option>
                    <option value="Nikon">Nikon</option>
                    <option value="Panasonic">Panasonic</option>
                    <option value="etc">etc</option>
                </select>

                <h4>모델 <span>옵션 </span></h4>
                <input type="hidden" name="list[1].optionName" value="모델">
                <select name="list[1].optionValue" class="model form-control" required>
                    <option selected hidden disabled>모델을 선택해주세요</option>
                    <option value="일반 디지털 카메라">일반 디지털 카메라</option>
                    <option value="DSLR">DSLR</option>
                    <option value="미러리스">미러리스</option>
                </select>

                <h4>색상 <span>옵션 </span></h4>
                <input type="hidden" name="list[2].optionName" value="색상">
                <select id="color" name="list[2].optionValue" class="form-control" required>
                    <option selected hidden disabled>색상을 선택해주세요</option>
                    <option value="black">black</option>
                    <option value="white">white</option>
                    <option value="gray">gray</option>
                    <option value="pink">pink</option>
                    <option value="etc">etc</option>
                </select>

                <h4>구성품 <span>옵션 </span></h4>
                <input type="hidden" name="list[4].optionName" value="구성품">
                <input type="text" name="list[4].optionValue" placeholder="구성품을 입력해주세요." class="form-control">
            </div>
        </div>
    </div>
    <jsp:include page="footer.html" />
    <script>
        function findAddr() {
            window.open("/maps.jsp", "_blank", "toolbar=no, scrollbar=yes, resizable=yes, top=20, left=500, width=1000, height=800");
        }

        function catchAddr(param) {
            $('[name=location]').val(param);
        }

        function toCategoryM(param) {
            $('#categoryS').find('option').remove();
            var c1 = ['아반떼', '소나타'];
            var c2 = ['K3', 'K9'];
            var c3 = ['SM3', 'SM6'];
            var d;
            var target = $('#categoryM');
            switch (param) {
                case '현대':
                    d = c1;
                    break;
                case 'Kia':
                    d = c2;
                    break;
                case '르노삼성':
                    d = c3;
                    break;
            }
            target.find('option').remove();
            for (x in d) {
                var opt = document.createElement('option');
                opt.value = d[x];
                opt.innerHTML = d[x];
                target.append(opt);
            }
        }

        $(document).on('change', '#categoryB', function() {
            toCategoryM($(this).val());
            $('#categoryS').append("<option value='소형'>소형</option>");
        });
        $(document).on('change', '#categoryM', function() {
            toCategoryS($(this).val());
        });


        function toCategoryS(param) {
            var d;
            var target = $('#categoryS');
            var compare = param;
            target.find('option').remove();
            if (compare == '아반떼' || compare == 'K3') {
                target.append("<option value='소형'>소형</option>");
            } else if (compare == '소나타' || compare == 'SM5' || compare == 'SM6') {
                target.append("<option value='중형'>중형</option>");
            } else {
                target.append("<option value='대형'>대형</option>");
            }

        }

        $(document).ready(function() {
            border(0);
        });

        $('.seller').on('click', function() {
            $(this).children('input').prop('checked', true);
        });

        function border(index) {
            var list = $('.grade');
            switch (index) {
                case 0:
                    removeCss(list);
                    $('.btn-grade span').eq(0).addClass('fas fa-check');
                    list.eq(0).css('border', '2px solid #353535');
                    $('[name=grade]').val('f');
                    break;
                case 1:
                    removeCss(list);
                    $('.btn-grade span').eq(1).addClass('fas fa-check');
                    list.eq(1).css('border', '2px solid #ee4055');
                    $('[name=grade]').val('p');
                    break;
                case 2:
                    removeCss(list);
                    $('.btn-grade span').eq(2).addClass('fas fa-check');
                    list.eq(2).css('border', '2px solid #00a2cd');
                    $('[name=grade]').val('t');
                    break;
            }
        }

        function removeCss(list) {
            list.css('border-color', '#f4f4f4');
            $('.btn-grade span').removeClass('fas fa-check');
        }

        function setCategory2() {
            var c = $('#product').val();
            var p = $('#part');
            if (c == "n1") {
                p.find('option').remove();
                p.append("<option value=''>부품을 선택하세요</option>");
                p.append("<option value='pc_finished'>완제품</option>");
                p.append("<option value='pc_monitor'>모니터</option>");
                p.append("<option value='pc_cpu'>CPU</option>");
                p.append("<option value='pc_vga'>그래픽 카드</option>");
                p.append("<option value='pc_ram'>램</option>");
                p.append("<option value='pc_case'>본체케이스</option>");
                p.append("<option value='pc_power'>파워</option>");
                p.append("<option value='pc_cooler'>쿨러</option>");
                p.append("<option value='pc_etc'>기타</option>");
            } else if (c == "n2") {
                p.find('option').remove();
                p.append("<option value=''>노트북 회사를 선택하세요</option>");
                p.append("<option value='lt_samsung'>삼성전자</option>");
                p.append("<option value='lt_lg'>LG전자</option>");
                p.append("<option value='lt_asus'>ASUS</option>");
                p.append("<option value='lt_lenovo'>레노버</option>");
                p.append("<option value='lt_apple'>APPLE</option>");
                p.append("<option value='lt_dell'>Dell</option>");
                p.append("<option value='lt_hansung'>한성</option>");
                p.append("<option value='lt_gigabite'>기가바이트</option>");
                p.append("<option value='lt_etc'>기타</option>");
            } else if (c == "n3") {
                p.find('option').remove();
                p.append("<option value=''>주변기기를 선택하세요</option>");
                p.append("<option value='pd_mouse'>마우스</option>");
                p.append("<option value='pd_keyboard'>키보드</option>");
                p.append("<option value='pd_speaker'>스피커</option>");
                p.append("<option value='pd_headset'>헤드셋</option>");
                p.append("<option value='pd_printer'>프린트(복합기)</option>");
                p.append("<option value='pd_etc'>기타</option>");
            } else if (c == "") {
                p.find('option').remove();
                p.append("<option value=''>선택하세요</option>");
            }
        }

        /* product 에 따른 textarea에 출력되는 Guideline */
        function setGuideline() {
            var c = $('#product').val();
            var p = $('#part').val();
            var t = $('#content');
            if (p == "pc_finished") {
                var msg = "완제품 세부정보\n" + "[cpu] : \n" + "[ram] : \n" + "[그래픽카드] : \n" + "[본체] : \n" + "[케이스] : \n" + "[파워] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pc_monitor") {
                var msg = "모니터 세부정보\n" + "[제조사] : \n" + "[화면 비율] : \n" + "[크기] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pc_cpu") {
                var msg = "CPU 세부정보\n" + "[제조사] : \n" + "[CPU종류] : \n" + "[코어] : \n" + "[메모리 지원규격] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pc_vga") {
                var msg = "그래픽카드 세부정보\n" + "[제조사] : \n" + "[그래픽카드 모델] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pc_ram") {
                var msg = "램 세부정보\n" + "[제조사] : \n" + "[메모리용량] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pc_case") {
                var msg = "케이스 세부정보\n" + "[제조사] : \n" + "[파워포함 유무] : \n" + "[케이스 크기] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pc_power") {
                var msg = "파워 세부정보\n" + "[제조사] : \n" + "[제품 분류] : \n" + "[정격 출력] : \n" + "[팬 개수] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pc_cooler") {
                var msg = "쿨러 세부정보\n" + "[제조사] : \n" + "[냉각방식] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pc_etc") {
                var msg = "기타 세부정보\n" + "[제조사] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            }

            if (c == "n2") {
                var msg = "노트북 세부정보\n" + "[제조사] : \n" + "[CPU] : \n" + "[코어형태] : \n" + "[화면크기] : \n" + "[화면비율] : \n" + "[해상도] : \n" + "[메모리타입] : \n" + "[메모리용량] : \n" + "[GPU종류] : \n" + "[용도] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            }

            if (p == "pd_mouse") {
                var msg = "마우스 세부정보\n" + "[제조사] : \n" + "[연결방식] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pd_keyboard") {
                var msg = "키보드 세부정보\n" + "[제조사] : \n" + "[접점방식] : \n" + "[기타 세부정보] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pd_speaker") {
                var msg = "스피커 세부정보\n" + "[제조사] : \n" + "[정격출력] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pd_headset") {
                var msg = "헤드셋 세부정보\n" + "[제조사] : \n" + "[연결방식] : \n" + "[채널지원] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pd_printer") {
                var msg = "프린터(복합기) 세부정보\n" + "[제조사] : \n" + "[제품구분] : \n" + "[출력색상] : \n" + "[인쇄방식] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            } else if (p == "pd_etc") {
                var msg = "노트북 세부정보\n" + "[제조사] : \n" + "[기타 세부정보] : \n";
                t.val(msg);
            }
        }



        function doChange(e) {
            var val = e.options[e.selectedIndex].value;
            var target = $(e).siblings('select')[0];
            // var target = document.getElementById(id);
            //var target = document.getElementById('model');
            removeAll(target);
            $(target).html('<option selected disabled>선택해주세요</option>');
            if (val == 'Apple') {
                addOption('iPhoneX ~ iPhone8', target);
                addOption('iPhone7 ~', target);
                addOption('iPad', target);
                addOption('웨어러블', target);
            } else if (val == 'Samsung') {
                addOption('갤럭시 Note', target);
                addOption('갤럭시 S', target);
                addOption('갤럭시 TAB', target);
                addOption('웨어러블', target);
                addOption('etc', target);
            } else if (val == 'LG') {
                addOption('V series', target);
                addOption('Q series', target);
                addOption('G series', target);
                addOption('etc', target);
            } else if (val == 'etc') {
                addOption('etc', target);
            }
        }



        function addOption(value, e) {
            var o = new Option(value); //<option value="iPhoneX ~ iPhone8">iPhoneX ~ iPhone8</option>
            try {
                e.add(o);
            } catch (ee) {
                e.add(o, null);
            }
        }

        function removeAll(e) {
            for (var i = 0, limit = e.options.length; i < limit - 1; i++) {
                e.remove(1);
            }
        }


        $(document).ready(function() {
            var objDragAndDrop = $(".dragAndDropDiv, #fileup");

            $(document).on("dragenter", ".dragAndDropDiv", function(e) {
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on("dragover", ".dragAndDropDiv", function(e) {
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on("drop", ".dragAndDropDiv", function(e) {
                e.preventDefault();
                files = e.originalEvent.dataTransfer.files;
                handleFileUpload(files, objDragAndDrop);
            });
            $(document).on("change", "#fileup", function() {
                files = $(this)[0].files;
                handleFileUpload(files, objDragAndDrop);
            });

            $(document).on('dragenter', function(e) {
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on('dragover', function(e) {
                e.stopPropagation();
                e.preventDefault();
            });
            $(document).on('drop', function(e) {
                e.stopPropagation();
                e.preventDefault();
            });



            function handleFileUpload(files, obj) {

                for (var i = 0; i < files.length; i++) {
                    var fd = new FormData();
                    fd.append('file', files[i]);

                    if (!files[0].type.match(/image.*/)) {
                        alert('이미지 파일이 아닙니다.');
                        return;
                    }
                    sendFileToServer(fd);
                }
            }

            var rowCount = 0;

            function sendFileToServer(formData) {
                var uploadURL = "/filepost.do";
                var extraData = {};
                var jqXHR = $.ajax({
                    xhr: function() {
                        var att = $.ajaxSettings.xhr();
                        if (att.upload) {
                            att.upload.addEventListener('progress', function(event) {
                                var percent = 0;
                                var position = event.loaded || event.position;
                                var total = event.total;
                                if (event.lengthComputable) {
                                    percent = Math.ceil(position / total * 100);
                                }
                            }, false);
                        }
                        return att;
                    },
                    url: uploadURL,
                    type: "POST",
                    contentType: false,
                    processData: false,
                    cache: false,
                    data: formData,
                    success: function(data) {
                        var str = "";
                        str = "<div class='photos'>"
                        str += "<img src='/resources/upload" + data + "' style='width:150px; border : 1px solid #fff; border-radius:1em;'>"
                        str += "<button type='button' style='background-color:#fff; border:1px solid #fff; border-radius:0.5em; position:absolute; right:0; top:0;' data-src='" + data + "'>&nbsp;<span class='fas fa-times-circle'></span></button></div>";
                        $(".uploadlist").append(str);
                        submit(data);
                    }
                });
            }

            function submit(data) {
                var form = $("#fileUpload");

                var hiddeninput = document.createElement("input");
                hiddeninput.setAttribute("type", "hidden");
                hiddeninput.setAttribute("name", "filename");
                hiddeninput.setAttribute("value", data);
                form.append(hiddeninput);
            }

            // 사진 지우기 
            $(".uploadlist").on("click", "button", function(event) {
                var that = $(this);
                var fileN = $(this).attr("data-src");
                $.ajax({
                    url: "/deleteFile.do",
                    type: "post",
                    data: {
                        fileName: fileN
                    },
                    dataType: "text",
                    success: function(result) {
                        var fileName = that.prev().attr('src');
                        var str = fileName.substring(17);
                        $('#fileUpload').children().each(function(index, item) {
                            if (item.value == str) {
                                $(item).remove();
                            }
                        });
                        if (result == "deleted") {
                            that.parent("div").remove();
                        }
                    }
                });
            });
        });

        var limitByte = 500;

        function checkByte(frm) {
            var totalByte = 0;
            var message = frm.value;

            for (var i = 0; i < message.length; i++) {
                var currentByte = message.charCodeAt(i);
                if (currentByte > 1600) totalByte += 1;
                else totalByte++;
            }
            $('#messageByte').text(totalByte);

            if (totalByte > limitByte) {
                $(frm).val(message.substring(0, limitByte));
                alert(limitByte + '글자까지 가능합니다.');
            }
        }

        /*  추가할부분 ##################################################### */
        function titlecheck() {
            var gradeCheck = $('[name=grade]').val();
            var myPointCheck = '${sessionScope.member.mileage}';

            /* grade = p */
            if (gradeCheck == 'p') {
                var moneyCheck = 6900 - myPointCheck;
                var moneyResult = myPointCheck - 6900;
                if (myPointCheck < 6900) {
                    var con_grade = confirm("나의 현재 포인트는 : " + myPointCheck + " Point입니다. \n" + moneyCheck + "point가 부족합니다.\n point충전소로 이동하겠습니까?");
                    if (con_grade == true) {
                        location.href = "/payment.do";
                        return false;
                    } else if (con_grade == false) {
                        alert("취소");
                        return false;
                    }
                } else {
                    var con_finalCheck = confirm("나의 현재 포인트는 : " + myPointCheck + " Point입니다. \n 등록후" + moneyResult + "point가 남게됩니다. \n point를 사용해서 등록하겠습니까?");
                    if (con_finalCheck == true) {
                        $('#gradePay').val("6900");
                        return true;
                    } else if (con_finalCheck == false) {
                        return false;
                    }
                }
            }
            /* grade = t */
            if (gradeCheck == 't') {
                var moneyCheck = 9900 - myPointCheck;
                var moneyResult = myPointCheck - 9900;
                if (myPointCheck < 9900) {
                    var con_grade = confirm("나의 현재 포인트는 : " + myPointCheck + " Point입니다. \n" + moneyCheck + "point가 부족합니다.\n point충전소로 이동하겠습니까?");
                    if (con_grade == true) {
                        location.href = "/payment.do";
                        return false;
                    } else if (con_grade == false) {
                        alert("취소");
                        return false;
                    }
                } else {
                    var con_finalCheck = confirm("나의 현재 포인트는 : " + myPointCheck + " Point입니다. \n 등록후" + moneyResult + "point가 남게됩니다. \n point를 사용해서 등록하겠습니까?");
                    if (con_finalCheck == true) {
                        $('#gradePay').val("9900");
                        return true;
                    } else if (con_finalCheck == false) {
                        return false;
                    }
                }
            }
            var phone = $('[name=phone]');
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
            if (rexCheck(rex_phone, phone)) {
                return false;
            } 
            if($('.photos').length > 7){
                alert('사진은 7장까지 가능합니다');
                return false;
            }
            return true;
            
        }

        function rexCheck(rex, what) {
            if (rex.test(what.val())) {
                return false;
            } else {
                action(what);
                return true;
            }
        }

    </script>
</body>

</html>
