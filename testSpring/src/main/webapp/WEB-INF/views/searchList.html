<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=39f8014361e23d91766a671257125c2b&libraries=services"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <style>
        body {
            margin: 17px auto 0;
            max-width: 1280;
            background: #f4f4f4;
        }

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

        .each-ad, .each-adP {
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
        .each-adP {
            background-color: #f9f3e5;
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
            width: 100%;
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
            padding:0  20px;
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

        .ad-watchlist {
            position: absolute;
            bottom: 13px;
            right: 10px;
            font-size: 20px;
            color: #9a9a9a;
            transition: .2s;
            padding: 5px;
            background: 0 0;
            border: none;
            display: inline-flex;
            line-height: 1;
            margin: 0;
            outline: 0;
            cursor: pointer;
            align-content: center;
            align-items: center;
            justify-content: center;
        }

        .page-navi {
            z-index: 2;
            position: relative;
            width: 19%;
        }

        .main {
            z-index: 3;
            position: relative;
            opacity: 0.99;
            width: 79%;
        }

        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .page-filter button {
            background-color: inherit;
            border: none;
            font-weight: bold;
            font-size: 15px;
        }

        .price-search {
            width: 60px;
            height: 40px;
            border: 1.5px solid #a4a4a4;
            border-radius: 0.5em;
            margin-top: 5px;
        }

        .filter-price input[type=submit] {
            color: #3baa33;
            padding: 7px;
            margin-left: 10px;
            border: 2px solid #3baa33;
            background-color: #fff;
            border-radius: 0.5em;
        }

        #filter-categories,
        #filter-location {
            display: none;
        }

        .page-filter .fa-chevron-down {
            position: absolute;
            right: 0;
            top: 5px;
            font-size: 10px;
        }

        .categoryText {
            font-weight: 300;
            text-decoration: underline;
        }

        .filter {
            position: relative;
        }

        .filter button span:first-of-type {
            position: absolute;
            left: 0;
        }

        .filter ul li {
            padding-left: 20px;
            font-weight: 400;
            color: #3baa33;
            cursor: pointer;
        }

        .filter li span:hover {
            background-color: #c4c4c4;
            border: 1px solid #c4c4c4;
            border-radius: 0.3em;
        }

        .filter li span {
            display: block;
            width: 100%;
        }

        .categoryM {
            display: none;
        }

        .filter-categories>ul>li:active .categoryS {
            display: block;
        }

        .categoryS {
            display: none;
            padding-left: 20px;
        }

        .categoryText {
            font-size: 13px;
            display: block;
            padding-left: 80px;
        }

        #forms,
        .filter-detail-options {
            display: none;
        }

        .filter-detail>button {
            display: flex;
            justify-content: space-around;
            flex-direction: row;
            width: 100%;
        }

        .filter-detail-options li {
            list-style-type: none;
        }

        .optionV {
            display: none;
        }

        .filter-category a span,
        .filter-detail-options span {
            color: #3baa33;
        }

    </style>
</head>

<body>
    <jsp:include page="headerForBoard.jsp" />
    <div class="page">
        <div class="container">
            <div class="page-navi">
                <div class="page-filter">
                    <h4>상세 검색</h4>
                    <hr>
                    <div class="filter-category filter">
                        <button type="button" onclick="$('#filter-categories').toggle(300);" style="display:flex; justify-content:space-around; flex-direction: row; width: 100%;"><span>카테고리</span><span class="categoryText">&nbsp;</span><span class="fas fa-chevron-down"></span></button>
                        <div id="filter-categories">
                            <ul>
                                <li><a href="javascript:detail(0);"><span>자동차</span></a></li>
                                <li><a href="javascript:$('#phoneDetaile').toggle(300);detail(1);"><span>핸드폰 &amp; 카메라</span></a>
                                    <ul class="categoryM" id="phoneDetaile">
                                        <li><a href="javascript:detail(1);"><span>핸드폰</span></a></li>
                                        <li><a href="javascript:detail(2);"><span>카메라</span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="javascript:detail(3);"><span>컴퓨터 &amp; 노트북</span></a></li>
                                <li><a href="javascript:$('#furDetail').toggle(300);detail(4);"><span>가구 &amp; 가전</span></a>
                                    <ul class="categoryM" id="furDetail">
                                        <li><a href="javascript:detail(4);"><span>가구</span></a></li>
                                        <li><a href="javascript:detail(5);"><span>가전</span></a></li>
                                    </ul>
                                </li>
                                <li><a href="javascript:detail(6);"><span>의류</span></a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <hr>
                    <form action="/searchDetail.do" method="get" onsubmit="return valid();">
                        <div id="filter-attached"></div>
                        <div class="filter-price filter">
                            <span><b>&nbsp;가격 (만원) </b></span><br>

                            <input type="text" placeholder="from" name="min" class="price-search">&nbsp;
                            <input type="text" placeholder="to" name="max" class="price-search">
                            <input type="text" id="cat" name="category" class="optionV">
                            <input type="text" name="categoryM" class="optionV">
                            <input type="submit" value="검색"><br>
                            <span id="pricemsg"></span>
                        </div>
                    </form>
                    <div id="forms">
                        <div id="car">
                            <div>
                                <input type="hidden" name="list[0].optionName" value="company">
                                <div>
                                    <ul class="detail-list">
                                        <li><a href="javascript:secondOption(0);"><span>현대</span></a></li>
                                        <li><a href="javascript:secondOption(1);"><span>Kia</span></a></li>
                                        <li><a href="javascript:secondOption(2);"><span>르노삼성</span></a></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[0].optionValue">
                            </div>
                            <div>
                                <input type="hidden" name="list[1].optionName" value="carModel">
                                <div>
                                    <ul>
                                        <li><a href="#"><span>선택</span></a></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[1].optionValue">
                            </div>
                            <div>
                                <input type="hidden" name="list[2].optionName" value="bodyType">
                                <div>
                                    <ul>
                                        <li><span>소형</span></li>
                                        <li><span>준중형</span></li>
                                        <li><span>중형</span></li>
                                        <li><span>대형</span></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[2].optionValue">
                            </div>
                            <div>
                                <input type="hidden" name="list[3].optionName" value="kilometer">
                                <div>
                                    <input type="text" name="list[3].optionValue" class="form-control" placeholder="KM">
                                </div>
                            </div>
                            <div>
                                <input type="hidden" name="list[4].optionName" value="연식">
                                <div>
                                    <input type="text" name="list[4].optionValue" class="form-control" placeholder="year">
                                </div>
                            </div>
                            <div>
                                <input type="hidden" name="list[5].optionName" value="fuel">
                                <div>
                                    <ul>
                                        <li><span>휘발유</span></li>
                                        <li><span>경유</span></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[5].optionValue">
                            </div>
                            <div>
                                <input type="hidden" name="list[6].optionName" value="사고">
                                <div>
                                    <ul>
                                        <li><span>있음</span></li>
                                        <li><span>없음</span></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[6].optionValue">
                            </div>
                        </div>
                        <div id="furniture">
                            <div>
                                <input type="hidden" name="list[0].optionName" value="category">
                                <div>
                                    <ul>
                                        <li><span>침대</span></li>
                                        <li><span>의자</span></li>
                                        <li><span>책상</span></li>
                                        <li><span>소파</span></li>
                                        <li><span>기타</span></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[0].optionValue">
                            </div>
                        </div>
                        <div id="appliance">
                            <div>
                                <input type="hidden" name="list[0].optionName" value="category">
                                <div>
                                    <ul>
                                        <li><span>tv</span></li>
                                        <li><span>냉장고</span></li>
                                        <li><span>에어컨</span></li>
                                        <li><span>세탁기</span></li>
                                        <li><span>기타</span></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[0].optionValue">
                            </div>
                        </div>

                        <div id="cloth">

                            <div>
                                <input type="hidden" name="list[0].optionName" value="gender">
                                <div>
                                    <ul class="pickOp">
                                        <li><span name="m">남자</span></li>
                                        <li><span name="f">여자</span></li>
                                        <li><span name="c">공용</span></li>
                                    </ul>
                                </div>
                                <input type="text" name="list[0].optionValue" class="optionV">
                            </div>

                            <div>
                                <input type="hidden" name="list[1].optionName" value="brand">
                                <div>
                                    <input type="text" name="list[1].optionValue" placeholder="브랜드" class="form-control">
                                </div>
                            </div>

                            <div>
                                <input type="hidden" name="list[2].optionName" value="type">
                                <div>
                                    <input type="text" name="list[2].optionValue" placeholder="종류" class="form-control">
                                </div>
                            </div>

                            <div>
                                <input type="hidden" name="list[3].optionName" value="size">
                                <div>
                                    <input type="text" name="list[3].optionValue" placeholder="사이즈" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div id="computer">
                            <input type="text" name="optionV" value="n">
                            <div>
                                <input type="hidden" name="list[0].optionName" value="product">
                                <div>
                                    <ul class="pickOp">
                                        <li><a href="javascript:secondOption(7)"><span name="n1">컴퓨터</span></a></li>
                                        <li><a href="javascript:secondOption(8)"><span name="n2">노트북</span></a></li>
                                        <li><a href="javascript:secondOption(9)"><span name="n3">주변기기</span></a></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[0].optionValue">
                            </div>

                            <div>
                                <input type="hidden" name="list[1].optionName" value="part">
                                <div>
                                    <ul>
                                        <li></li>
                                        <li></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[1].optionValue">
                            </div>
                            <br>
                        </div>

                        <div id="phone">
                            <div>
                                <input type="hidden" name="list[0].optionName" value="제조사">
                                <div>
                                    <ul>
                                        <li><a href="javascript:secondOption(3);"><span>Apple</span></a></li>
                                        <li><a href="javascript:secondOption(4);"><span>Samsung</span></a></li>
                                        <li><a href="javascript:secondOption(5);"><span>LG</span></a></li>
                                        <li><a href="javascript:secondOption(6);"><span>etc</span></a></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[0].optionValue">
                            </div>
                            <div>
                                <input type="hidden" name="list[1].optionName" value="모델">
                                <div>
                                    <ul>
                                        <li></li>
                                        <li></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[1].optionValue">
                            </div>

                            <div>
                                <input type="hidden" name="list[2].optionName" value="용량">
                                <div>
                                    <ul>
                                        <li>
                                            <span>32GB</span>
                                            <span>64GB</span>
                                            <span>128GB</span>
                                            <span>256GB</span>
                                            <span>etc</span>
                                        </li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[2].optionValue">
                            </div>


                            <div>
                                <input type="hidden" name="list[3].optionName" value="색상">
                                <div>
                                    <ul>
                                        <li>
                                            <span>black</span>
                                            <span>white</span>
                                            <span>purple</span>
                                            <span>red</span>
                                            <span>gold</span>
                                            <span>gray</span>
                                            <span>pink</span>
                                            <span>blue</span>
                                            <span>etc</span>
                                        </li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[3].optionValue">
                            </div>

                            <div>
                                <input type="hidden" name="list[4].optionName" value="구성품">
                                <div>
                                    <input type="text" name="list[4].optionValue" class="form-control" placeholder="구성품을 입력해주세요.">
                                </div>
                            </div>
                        </div>

                        <div id="camera">
                            <div>
                                <input type="hidden" name="list[0].optionName" value="제조사">
                                <div>
                                    <ul>
                                        <li><span>Cannon</span></li>
                                        <li><span>Sony</span></li>
                                        <li><span>Nikon</span></li>
                                        <li><span>Panasonic</span></li>
                                        <li><span>etc</span></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[0].optionValue">
                            </div>

                            <div>
                                <input type="hidden" name="list[1].optionName" value="모델">
                                <div>
                                    <ul>
                                        <li><span>일반 디지털 카메라</span></li>
                                        <li><span>DSLR</span></li>
                                        <li><span>미러리스</span></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[1].optionValue">
                            </div>

                            <div>
                                <input type="hidden" name="list[2].optionName" value="색상">
                                <div>
                                    <ul>
                                        <li><span>black</span></li>
                                        <li><span>white</span></li>
                                        <li><span>gray</span></li>
                                        <li><span>pink</span></li>
                                        <li><span>etc</span></li>
                                    </ul>
                                </div>
                                <input type="text" class="optionV" name="list[2].optionValue">
                            </div>

                            <div>
                                <input type="hidden" name="list[3].optionName" value="구성품">
                                <div>
                                    <input type="text" name="list[3].optionValue" placeholder="구성품을 입력해주세요." class="form-control">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr>
                <div></div>
            </div>
            <div class="main">
               <c:if test="${listP.size() ne 0}">
                   <div style="margin-bottom: 30px;">
                   <span id="bp" style="color:#3baa33;">프리미엄 게시물</span>
                       <c:set var="flag" value="false" />
                   <c:forEach items="${listP }" var="board" varStatus="i">
                       <c:if test="${not flag}">
                       <c:if test="${i.index == 3}">
                           <c:set var="flag" value="true" />
                       </c:if>
                       <script>
                        var coordx, coordy;
                        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                        function placesSearchCB(data, status) {
                            if (status === kakao.maps.services.Status.OK) {

                                coordx = data[0].y;
                                coordy = data[0].x;
                            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                                alert('검색 결과가 존재하지 않습니다.');
                                return;

                            } else if (status === kakao.maps.services.Status.ERROR) {

                                alert('검색 결과 중 오류가 발생했습니다.');
                                return;

                            }
                        }

                        var distanceS = '${search.distance}';
                        var locationS = '${search.location}';
                        var coordS;

                        function getMap() {
                            return new Promise((resolve, reject) => {
                                if (locationS != '') {
                                    // 장소 검색 객체를 생성합니다
                                    var ps = new kakao.maps.services.Places();

                                    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                                    ps.keywordSearch(locationS, placesSearchCB);
                                        mapOption = [coordx, coordy];
                                        resolve(mapOption);
                                } else {
                                    // 주소-좌표 변환 객체를 생성합니다
                                    var geocoder = new kakao.maps.services.Geocoder();
                                    var location = '${member.memberAddr}';
                                    geocoder.addressSearch(location, function(result, status) {
                                        if (status === kakao.maps.services.Status.OK) {
                                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                            mapOption = [coords.Ha, coords.Ga];
                                            resolve(mapOption);
                                        }
                                    });
                                }
                            });
                        }
                        // param 은 현재 좌표 or 가입시 주소 좌표
                        getMap().then(function(param) {
                            // 주소-좌표 변환 객체를 생성합니다
                            var geocoder = new kakao.maps.services.Geocoder();
                            var addr = '${board.location}';
                            // 게시물의 주소를 좌표로 변환
                            geocoder.addressSearch(addr, function(result, status) {
                                var x, y;
                                if (status === kakao.maps.services.Status.OK) {
                                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                    y = coords.Ga;
                                    x = coords.Ha;

                                    // 두 장소를 배열로 묶어서 처리
                                    var coord = [new kakao.maps.LatLng(param[0], param[1]), new kakao.maps.LatLng(x, y)];
                                    
                                    // poly 함수로 두 장소의 거리 측정
                                    var poly = new kakao.maps.Polyline({
                                        path: coord, // 선을 구성하는 좌표배열 입니다
                                        strokeWeight: 5, // 선의 두께 입니다
                                        strokeColor: '#FFAE00', // 선의 색깔입니다
                                        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                                        strokeStyle: 'solid' // 선의 스타일입니다
                                    });
                                    
                                    // 두 장소의 거리 distance에 km단위로 저장
                                    distance = Math.floor(poly.getLength()) / 1000;
                                    if(distanceS == 0 ){
                                       
                                    }else if (distanceS < distance || distance == NaN) {
                                        $(".test${i.index}").remove();
                                    }
                                }
                            });
                        });

                    </script>
                        <!-- 게시물 단위 -->
                    <a href="/goList.do?boardNo=${board.boardNo }" class="each-adP test${i.index}">
                        <div class="ad-image-container">
                            <div class="ad-image-wrapper" style="text-align: center;"><img class="ad-image" src="/resources/upload/${board.files.get(0) }" alt="" /></div>
                        </div>
                        <div class="ad-detail">
                            <div class="ad-detail-info">
                                <p class="ad-title">${board.title }</p>
                                <div class="ad-price-wrapper"><span class="ad-price">${board.price }만원</span>
                                </div>
                                <p class="ad-content">${board.content }</p>
                            </div>
                            <div class="ad-detail-extra">
                                <div class="ad-location-wrapper"><span class="ad-location">${board.location }</span><span class="ad-distance"></span></div>
                                <p class="ad-regdate">${board.regDate }</p>
                            </div>
                        </div>
                    </a>
                    </c:if>
                   </c:forEach>
                   </div>
               </c:if>
               <c:choose>
                <c:when test="${list.size() eq 0}">
                    <p style="color:#3baa33; font-size: 20px; text-align: center; line-height: 5;">검색 결과가 없습니다.</p>
                    <div style="height: 300px;"></div>
                </c:when>
                <c:otherwise>
                <div>
                <span id="bn" style="color:#3baa33;">일반 게시물</span>
                <c:forEach items="${list }" var="board" varStatus="i">
                    <script>
                        var coordx, coordy;
                        // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
                        function placesSearchCB(data, status) {
                            if (status === kakao.maps.services.Status.OK) {

                                coordx = data[0].y;
                                coordy = data[0].x;
                            } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

                                alert('검색 결과가 존재하지 않습니다.');
                                return;

                            } else if (status === kakao.maps.services.Status.ERROR) {

                                alert('검색 결과 중 오류가 발생했습니다.');
                                return;

                            }
                        }

                        var distanceS = '${search.distance}';
                        var locationS = '${search.location}';
                        var coordS;

                        function getMap() {
                            return new Promise((resolve, reject) => {
                                if (locationS != '') {
                                    // 장소 검색 객체를 생성합니다
                                    var ps = new kakao.maps.services.Places();

                                    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
                                    ps.keywordSearch(locationS, placesSearchCB);

                                        mapOption = [coordx, coordy];
                                        resolve(mapOption);

                                } else {
                                    // 주소-좌표 변환 객체를 생성합니다
                                    var geocoder = new kakao.maps.services.Geocoder();
                                    var location = '${member.memberAddr}';
                                    geocoder.addressSearch(location, function(result, status) {
                                        if (status === kakao.maps.services.Status.OK) {
                                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                            mapOption = [coords.Ha, coords.Ga];
                                            reject(mapOption);
                                        }
                                    });
                                }
                            });
                        }
                        // param 은 현재 좌표 or 가입시 주소 좌표
                        getMap().then(function(param) {
                            // 주소-좌표 변환 객체를 생성합니다
                            var geocoder = new kakao.maps.services.Geocoder();
                            var addr = '${board.location}';
                            // 게시물의 주소를 좌표로 변환
                            geocoder.addressSearch(addr, function(result, status) {
                                var x, y;
                                if (status === kakao.maps.services.Status.OK) {
                                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                                    y = coords.Ga;
                                    x = coords.Ha;
                                    // 두 장소를 배열로 묶어서 처리
                                    var coord = [new kakao.maps.LatLng(param[0], param[1]), new kakao.maps.LatLng(x, y)];
                                    
                                    // poly 함수로 두 장소의 거리 측정
                                    var poly = new kakao.maps.Polyline({
                                        path: coord, // 선을 구성하는 좌표배열 입니다
                                        strokeWeight: 5, // 선의 두께 입니다
                                        strokeColor: '#FFAE00', // 선의 색깔입니다
                                        strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
                                        strokeStyle: 'solid' // 선의 스타일입니다
                                    });

                                    // 두 장소의 거리 distance에 km단위로 저장
                                    distance = Math.floor(poly.getLength()) / 1000;
                                    if (distanceS < distance) {
                                        $("#test${i.index}").remove();
                                    }
                                }
                            });
                        });

                    </script>

                    <!-- 게시물 단위 -->
                    <a href="/goList.do?boardNo=${board.boardNo }" class="each-ad" id="test${i.index}">
                        <div class="ad-image-container">
                            <div class="ad-image-wrapper" style="text-align: center;"><img class="ad-image" src="/resources/upload/${board.files.get(0) }" alt="" /></div>
                        </div>
                        <div class="ad-detail">
                            <div class="ad-detail-info">
                                <p class="ad-title">${board.title }</p>
                                <div class="ad-price-wrapper"><span class="ad-price">${board.price }만원</span>
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
                </c:otherwise>
                </c:choose>
            </div>
        </div><br>
        <br>
        <br>

        <jsp:include page="footer.html" />
    </div>

    <script>
            
        function secondOption(index) {
            var carOp = $('[value=carModel]').next();
            var phoOp = $('[value=모델]').next();
            var comOp = $('[value=part]').next();
            switch (index) {
                case 0:
                    carOp.html('<ul><li><span>아반떼</span></li><li><span>소나타</span></li><li><span>그랜져</span></li></ul>');
                    break;
                case 1:
                    carOp.html('<ul><li><span>K3</span></li><li><span>K5</span></li><li><span>K9</span></li></ul>');
                    break;
                case 2:
                    carOp.html('<ul><li><span>SM3</span></li><li><span>SM5</span></li><li><span>SM6</span></li></ul>');
                    break;
                case 3:
                    phoOp.html('<ul><li><span>iPhoneX ~ iPhone8</span></li><li><span>iPhone7~</span></li><li><span>iPad</span></li><li><span>웨어러블</span></li></ul>');
                    break;
                case 4:
                    phoOp.html('<ul><li><span>갤럭시 Note</span></li><li><span>갤럭시 S</span></li><li><span>갤럭시 TAB</span></li><li><span>웨어러블</span></li><li><span>etc</span></li></ul>');
                    break;
                case 5:
                    phoOp.html('<ul><li><span>V series</span></li><li><span>Q series</span></li><li><span>G series</span></li><li><span>etc</span></li></ul>');
                    break;
                case 6:
                    phoOp.html('<ul><li><span>etc</span></li></ul>');
                    break;
                case 7:
                    comOp.html('<ul class="pickOp"><li><span name="pc_finished">완제품</span></li><li><span name="pc_monitor">모니터</span></li><li><span name="pc_cpu">CPU</span></li><li><span name="pc_vga">그래픽 카드</span></li><li><span name="pc_ram">램</span></li><li><span name="pc_case">본체케이스</span></li><li><span name="pc_power">파워</span></li><li><span name="pc_cooler">쿨러</span></li><li><span name="pc_etc">기타</span></li></ul>');
                    break;
                case 8:
                    comOp.html('<ul class="pickOp"><li><span name="lt_samsung">삼성</span></li><li><span name="lt_apple">Apple</span></li><li><span name="lt_lg">LG</span></li><li><span name="lt_asus">ASUS</span></li><li><span name="lt_lenovo">레노보</span></li><li><span name="lt_dell">Dell</span></li><li><span name="lt_hansung">한성</span></li><li><span name="lt_gigabite">기가바이트</span></li><li><span name="lt_etc">기타</span></li></ul>');
                    break;
                case 9:
                    comOp.html('<ul class="pickOp"><li><span name="pd_mouse">마우스</span></li><li><span name="pd_keyboard">키보드</span></li><li><span name="pd_speaker">스피커</span></li><li><span name="pd_headset">헤드셋</span></li><li><span name="pd_printer">프린터(복합기)</span></li><li><span name="pd_etc">기타</span></li></ul>');
                    break;

            }
        }

        function valid() {
            var target = $('.price-search');
            var rex = /^\d*$/;
            for (var i = 0; i < 2; i++) {
                if (!rex.test(target[i].value)) {
                    $('#pricemsg').html('<b>숫자를 입력해주세요</b>');
                    return false;
                }
            }
            return true;
        }

        function detail(param) {
            var cat = $('input[name=category]');
            var catM = $('input[name=categoryM]');
            cat.val('');
            catM.val('');
            switch (param) {
                case 0:
                    setSearch('#car');
                    cat.val('c');
                    break;
                case 1:
                    setSearch('#phone');
                    cat.val('p');
                    catM.val('p');
                    break;
                case 2:
                    setSearch('#camera');
                    cat.val('p');
                    catM.val('r');
                    break;
                case 3:
                    setSearch('#computer');
                    cat.val('n');
                    break;
                case 4:
                    setSearch('#furniture');
                    cat.val('f');
                    catM.val('f');
                    break;
                case 5:
                    setSearch('#appliance');
                    cat.val('f');
                    catM.val('a');
                    break;
                case 6:
                    setSearch('#cloth');
                    cat.val('l');
                    break;
                case 7:
                    setSearch('#etc');
                    cat.val('e');
                    break;


            }
        }

        function setSearch(param) {
            var prehtml = '<div class="filter-detail filter"><button type="button" class="setOption" onclick="toggller(this);"><span>';
            var posthtml = '</span><span class="categoryText">&nbsp;</span><span class="fas fa-chevron-down"></span></button><div class="filter-detail-options">';
            $('#filter-attached').html('');
            $(param).children('div').children('input[type=hidden]').each(function(index, item) {
                var html = '';

                if ($(item).next().children().children().length == 0) {
                    html = '<div class="filter-detail filter"><span><b>' + item.value + '</b></span>' + $(item).parent().html() + '</div><hr>';
                    $('#filter-attached').append(html);
                } else {
                    html += prehtml + item.value + posthtml + $(item).parent().html() + "</div></div><hr>";
                    $('#filter-attached').append(html);
                }
            });

        }

        function toggller(param) {
            $(param).siblings('div').toggle(300);
        }
        $(document).ready(function(){
           if($('.each-adP').length == 0){
               $('#bp').remove();
           } 
            if($('.each-ad').length == 0){
                $('$bn').remove();
            }
        });

        $('li span').on('click', function() {
            $(this).parent().children('ul').toggle(300);
        });
        $('.categoryM li').on('click', function() {
            $(this).children('div').toggle(300);
        });
        $('#filter-categories span').on('click', function() {
            $('#filter-categories').siblings('button').children('.categoryText').text($(this).text());
            $('[name=searchCategory]').val($(this).text());
        });
        $(document).on('click', '.filter-detail-options span', function() {
            $(this).parents('.filter-detail').children('button').children('.categoryText').text($(this).text());
            $(this).parents('div').next().val($(this).text());
        });
        $(document).on('click', '.pickOp span', function() {
            $(this).parents('div').next().val($(this).attr('name'));
        });

    </script>
</body>

</html>
