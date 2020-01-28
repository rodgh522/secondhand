<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="">

<head>
    <meta charset="utf-8">
    <script src="https://kit.fontawesome.com/008aa64115.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=853698d6-5a08-4161-962b-70fc9df74f1f"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">


    <script>
        function initTmap() {
            var map = new Tmap.Map({
                div: 'map_div',
                width: "100%",
                height: "500px",
            });

            routeLayer = new Tmap.Layer.Vector("route");
            map.addLayer(routeLayer);

            markerStartLayer = new Tmap.Layer.Markers("start");
            markerEndLayer = new Tmap.Layer.Markers("end");
            markerWaypointLayer = new Tmap.Layer.Markers("waypoint");
            markerWaypointLayer2 = new Tmap.Layer.Markers("waypoint2");
            pointLayer = new Tmap.Layer.Vector("point");

            /* 	map.addLayer(markerStartLayer);

             var size = new Tmap.Size(24, 38);
             var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
             var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_s.png' />", size, offset);
             var marker_s = new Tmap.Marker(
             new Tmap.LonLat("127.02810900563199", "37.519892712436906").transform("EPSG:4326", "EPSG:3857"), icon);
             markerStartLayer.addMarker(marker_s);

             // 도착
             map.addLayer(markerEndLayer);

             var size = new Tmap.Size(24, 38);
             var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
             var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_r_m_e.png' />", size, offset);
             var marker_e = new Tmap.Marker(new Tmap.LonLat("127.13281976335786", "37.52130314703887").transform("EPSG:4326", "EPSG:3857"), icon);
             markerEndLayer.addMarker(marker_e); */

            //경유지 마커 제거
            markerWaypointLayer.clearMarkers();
            markerWaypointLayer2.clearMarkers();

            map.addLayer(markerWaypointLayer);

            var size = new Tmap.Size(24, 38);
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
            var icon = new Tmap.IconHtml(
                "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />",
                size, offset);
            var marker = new Tmap.Marker(new Tmap.LonLat("127.07389565460413",
                "37.5591696189164").transform("EPSG:4326", "EPSG:3857"), icon);
            markerWaypointLayer.addMarker(marker);

            var size = new Tmap.Size(24, 38);
            var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
            var icon = new Tmap.IconHtml(
                "<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />",
                size, offset);
            var marker = new Tmap.Marker(new Tmap.LonLat("127.13346617572014",
                "37.52127761904626").transform("EPSG:4326", "EPSG:3857"), icon);
            markerWaypointLayer.addMarker(marker);

            markerWaypointLayer2.clearMarkers();

            var boardLocation = $("#boardLocation").val();
            var sessionLocation = $("#sessionLocation").val();

            //3.주소변환 API 요청하기
            $
                .ajax({
                    method: "GET",
                    url: "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
                    async: false,
                    data: {
                        "coordType": "WGS84GEO", //지구 위의 위치를 나타내는 좌표 타입입니다.
                        "fullAddr": boardLocation, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
                        "appKey": "853698d6-5a08-4161-962b-70fc9df74f1f", //실행을 위한 키 입니다. 발급받으신 AppKey(appKey)를 입력하세요.
                    },
                    //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
                    success: function(response) {
                        prtcl = response;

                        // 3. 마커 찍기
                        var prtclString = new XMLSerializer()
                            .serializeToString(prtcl); //xml to String	
                        xmlDoc = $.parseXML(prtclString), $xml = $(xmlDoc),
                            $intRate = $xml.find("coordinate");

                        var lon, lat;
                        if ($intRate[0].getElementsByTagName("lon").length > 0) { //구주소
                            lon = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
                            lat = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
                        } else { //신주소
                            lon = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
                            lat = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
                        }

                        var lonEntr, latEntr;
                        if ($intRate[0].getElementsByTagName("lonEntr")[0] == undefined &&
                            $intRate[0]
                            .getElementsByTagName("newLonEntr")[0] == undefined) {
                            lonEntr = 0;
                            latEntr = 0;
                        } else {
                            if ($intRate[0].getElementsByTagName("lonEntr").length > 0) { //구주소
                                lonEntr = $intRate[0]
                                    .getElementsByTagName("lonEntr")[0].childNodes[0].nodeValue;
                                latEntr = $intRate[0]
                                    .getElementsByTagName("latEntr")[0].childNodes[0].nodeValue;

                            } else { //신주소
                                lonEntr = $intRate[0]
                                    .getElementsByTagName("newLonEntr")[0].childNodes[0].nodeValue
                                latEntr = $intRate[0]
                                    .getElementsByTagName("newLatEntr")[0].childNodes[0].nodeValue
                            }
                        }

                        $
                            .ajax({
                                method: "GET",
                                url: "https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
                                async: false,
                                data: {
                                    "coordType": "WGS84GEO", //지구 위의 위치를 나타내는 좌표 타입입니다.
                                    "fullAddr": sessionLocation, //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
                                    "appKey": "853698d6-5a08-4161-962b-70fc9df74f1f", //실행을 위한 키 입니다. 발급받으신 AppKey(appKey)를 입력하세요.
                                },
                                //데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
                                success: function(response) {
                                    prtcl = response;

                                    // 3. 마커 찍기
                                    var prtclString = new XMLSerializer()
                                        .serializeToString(prtcl); //xml to String	
                                    xmlDoc = $.parseXML(prtclString),
                                        $xml = $(xmlDoc),
                                        $intRate = $xml
                                        .find("coordinate");

                                    var endlon, endlat;
                                    if ($intRate[0]
                                        .getElementsByTagName("lon").length > 0) { //구주소
                                        endlon = $intRate[0]
                                            .getElementsByTagName("lon")[0].childNodes[0].nodeValue;
                                        endlat = $intRate[0]
                                            .getElementsByTagName("lat")[0].childNodes[0].nodeValue;
                                    } else { //신주소
                                        endlon = $intRate[0]
                                            .getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
                                        endlat = $intRate[0]
                                            .getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
                                    }

                                    var endlonEntr, endlatEntr;
                                    if ($intRate[0]
                                        .getElementsByTagName("lonEntr")[0] == undefined &&
                                        $intRate[0]
                                        .getElementsByTagName("newLonEntr")[0] == undefined) {
                                        lonEntr = 0;
                                        latEntr = 0;
                                    } else {
                                        if ($intRate[0]
                                            .getElementsByTagName("lonEntr").length > 0) { //구주소
                                            endlonEntr = $intRate[0]
                                                .getElementsByTagName("lonEntr")[0].childNodes[0].nodeValue;
                                            endlatEntr = $intRate[0]
                                                .getElementsByTagName("latEntr")[0].childNodes[0].nodeValue;

                                        } else { //신주소
                                            endlonEntr = $intRate[0]
                                                .getElementsByTagName("newLonEntr")[0].childNodes[0].nodeValue
                                            endlatEntr = $intRate[0]
                                                .getElementsByTagName("newLatEntr")[0].childNodes[0].nodeValue
                                        }
                                    }

                                    map.setCenter(new Tmap.LonLat(lon, lat)
                                        .transform("EPSG:4326",
                                            "EPSG:3857"), 12);

                                    // 4. 경로 탐색 API 사용요청
                                    var startX = endlon;
                                    var startY = endlat;
                                    var endX = lon;
                                    var endY = lat;
                                    /* var passList = "127.07389565460413,37.5591696189164_127.13346617572014 , 37.52127761904626"; */
                                    var prtcl;
                                    var headers = {};
                                    headers["appKey"] = "853698d6-5a08-4161-962b-70fc9df74f1f";
                                    $
                                        .ajax({
                                            method: "POST",
                                            headers: headers,
                                            url: "https://apis.openapi.sk.com/tmap/routes?version=1&format=xml", //
                                            async: false,
                                            data: {
                                                startX: startX,
                                                startY: startY,
                                                endX: endX,
                                                endY: endY,
                                                /* 	passList : passList, */
                                                reqCoordType: "WGS84GEO",
                                                resCoordType: "EPSG3857",
                                                angle: "172",
                                                searchOption: "0",
                                                trafficInfo: "Y" //교통정보 표출 옵션입니다.
                                            },
                                            success: function(response) {
                                                prtcl = response;

                                                var innerHtml = "";
                                                var prtclString = new XMLSerializer()
                                                    .serializeToString(prtcl); //xml to String	
                                                xmlDoc = $
                                                    .parseXML(prtclString),
                                                    $xml = $(xmlDoc),
                                                    $intRate = $xml
                                                    .find("Document");

                                                var tDistance = " 총 거리 : " +
                                                    ($intRate[0]
                                                        .getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue / 1000)
                                                    .toFixed(1) +
                                                    "km,";
                                                var tTime = " 총 시간 : " +
                                                    ($intRate[0]
                                                        .getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue / 60)
                                                    .toFixed(0) +
                                                    "분";
                                                /* var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";	
                                                var taxiFare = " 예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원"; */

                                                $("#tmap-result")
                                                    .text(
                                                        tDistance +
                                                        tTime /* +tFare+taxiFare */ );
                                                //5. 경로탐색 결과 Line 그리기
                                                //출발지,도착지 마커 제거
                                                markerStartLayer
                                                    .clearMarkers();
                                                markerEndLayer
                                                    .clearMarkers();
                                                //경유지 마커 제거
                                                markerWaypointLayer
                                                    .clearMarkers();

                                                var trafficColors = {
                                                    extractStyles: true,

                                                    /* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
                                                    trafficDefaultColor: "#009900", //Default
                                                    trafficType1Color: "#009900", //원할
                                                    trafficType2Color: "#009900", //지체
                                                    trafficType3Color: "#009900" //정체

                                                };
                                                var kmlForm = new Tmap.Format.KML(
                                                        trafficColors)
                                                    .readTraffic(prtcl);
                                                routeLayer = new Tmap.Layer.Vector(
                                                    "vectorLayerID"); //백터 레이어 생성
                                                routeLayer
                                                    .addFeatures(kmlForm); //교통정보를 백터 레이어에 추가   

                                                map
                                                    .addLayer(routeLayer); // 지도에 백터 레이어 추가

                                                markerWaypointLayer2 = new Tmap.Layer.Markers(
                                                    "waypoint2");
                                                map
                                                    .addLayer(markerWaypointLayer2);

                                                /* var size = new Tmap.Size(24, 38);
                                                var offset = new Tmap.Pixel(-(size.w / 2), -size.h); 
                                                var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
                                                var marker = new Tmap.Marker(new Tmap.LonLat("127.07389565460413","37.5591696189164").transform("EPSG:4326", "EPSG:3857"), icon);
                                                markerWaypointLayer2.addMarker(marker);
                                                
                                                var size = new Tmap.Size(24, 38);
                                                var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
                                                var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
                                                var marker = new Tmap.Marker(new Tmap.LonLat("127.13346617572014", "37.52127761904626").transform("EPSG:4326", "EPSG:3857"), icon);
                                                markerWaypointLayer2.addMarker(marker); */

                                            },
                                            error: function(request,
                                                status, error) {}

                                        });

                                }
                            });
                    }
                });

        }

    </script>
    <title>Example Title</title>
    <style>
        body {
            min-width: 320px;
            color: #353535;
            background: #f4f4f4;
            font-size: .875em;
            line-height: 1.4;
            overflow-x: hidden;
            overflow-y: scroll;
            user-select: none;
        }

        :before,
        :after {
            box-sizing: inherit;
        }

        .page {
            padding: 0;
            max-width: 1280px;
            margin: 17px auto 0;
            min-height: calc(100vh - 250px);
            padding-bottom: 30px;
        }

        .head-text {
            padding: 0;
            width: 100%;
            min-width: 0px;
            max-width: 100%;
            display: flex;
            align-items: center;
            margin-right: 20px;
        }

        .link-home {
            color: inherit;
            text-decoration: none;
            font-size: 14px;
        }

        .view-item-page-related {
            flex: 1;
            min-width: 0;
            width: 100%;
        }

        .crumbs_sperator {
            color: #aeaeae;
            margin: 0 11px;
            vertical-align: middle;
            line-height: 1;
            font-size: 15px;
        }

        #react-root {
            max-width: 100%;
            overflow: hidden;
        }

        .view-item-seller-sticky {
            display: block;
            width: 425px;
            margin-left: 20px;
            margin-top: 0;
            position: relative;
        }

        .panel-body {
            background: #fff;
            border-radius: 4px;
            overflow: hidden;
        }

        .panel-body--flat-panel-shadow {
            box-shadow: 0 1px 6px rgba(0, 0, 0, .1);
        }

        .vip-ad-image {
            position: relative;
        }

        .vip-ad-image__main-image-container {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 100%;
            overflow: hidden;
            position: relative;
            height: 626.250px;
            margin-bottom: 50px;
        }

        .vip-ad-image-overlay {
            width: 100%;
            height: 100%;
            position: relative;
            z-index: 2;
        }

        .vip-ad-social-share {
            position: absolute;
            top: 24px;
            left: 24px;
        }

        ol,
        ul {
            list-style: none;
        }

        .social-share-action {
            flex-direction: column;
            display: flex;
        }

        .social-share-link {
            width: 44px;
            height: 44px;
            border-radius: 4px;
            justify-content: center;
            margin-bottom: 10px;
            margin-right: 10px;
            flex-grow: 0;
            border: none;
            display: flex;
            align-items: center;
            position: relative;
        }

        .heartbtn {
            width: 45px;
            height: 45px;
            position: absolute;
            padding: 0;
            top: 24px;
            right: 24px;
            font-size: 30px;
            color: #9a9a9a;
            transition: .2s;
            background: 0 0;
            border: none;
            display: inline-flex;
            margin: 0;
            line-height: :1;
            outline: 0;
            cursor: pointer;
            align-content: center;
            align-items: center;
            justify-content: center;
        }

        .heartbtn:hover {
            font-size: 40px;
        }

        button {
            text-rendering: auto;
            letter-spacing: normal;
            word-spacing: normal;
            text-transform: none;
            text-indent: 0px;
            text-shadow: none;
            text-align: center;
            font: 400 13.3333px Arial;
        }

        .image-overlay {
            width: 45px;
            height: 45px;
        }

        .vip-ad-image_main-image-background {
            filter: blur(15px);
            position: absolute;
            left: -5%;
            top: -5%;
            width: 110%;
            height: 110%;
            background-size: cover;
            background-repeat: no-repeat;
            background-position: 50%;
            transition: background 0.5s ease-in;
        }

        .view-item-page-content {
            display: flex;
            margin-top: 20px;
            flex-direction: row;
            flex-wrap: wrap;
        }

        .vip-ad-image-wrapper {
            position: relative;
            width: 100%;
            height: 200000%;
        }

        .vip-ad-main-image {
            opacity: 1;
            position: absolute;
            top: 0;
            width: 100%;
            height: 100%;
            object-fit: contain;
            z-index: 1;
            transition: opacity .2s;
            box-shadow: 0 0 5px 1px rgba(0, 0, 0, .1);
            display: inline;
        }

        .image-cta-right-arrow {
            right: 20px;
            color: #fff;
            width: 44px;
            height: 66px;
            border-radius: 8px;
            top: calc(50% - 33px);
            position: absolute;
            z-index: 2;
            font-size: 48px;
            line-height: 0;
            background: 0 0;
            padding: 0;
            border: none;
            display: inline-flex;
            margin: 0;
            outline: 0;
            cursor: pointer;
            align-items: center;
            justify-content: center;
            transition: background-color 0.2s ease-in;
        }

        .image-cta-left-arrow {
            left: 20px;
            color: #fff;
            width: 44px;
            height: 66px;
            border-radius: 8px;
            top: calc(50% - 33px);
            position: absolute;
            z-index: 2;
            font-size: 48px;
            line-height: 0;
            background: 0 0;
            padding: 0;
            border: none;
            display: inline-flex;
            margin: 0;
            outline: 0;
            cursor: pointer;
            align-items: center;
            justify-content: center;
            transition: background-color 0.2s ease-in;
        }

        .image-button {
            display: block;
            position: absolute;
            top: 0;
            left: ;
            width: 100%;
            height: 100%;
            z-index: 1;
            background: 0 0;
            color: #2f8828;
            padding: 0;
            border: none;
            margin: 0;
            line-height: 1;
            outline: 0;
            cursor: pointer;
            font-size: inherit;
            align-content: center;
            align-items: center;
            justify-content: center;
            transition: 3s ease-in;

        }

        .vip-ad-moreimage {
            right: 24px;
            bottom: 24px;
            display: flex;
            align-items: center;
            position: absolute;
            background-color: #fff;
            color: #242424;
            font-size: 16px;
            font-weight: 700;
            padding: 8px 16px;
            border-radius: 3px;
            z-index: 1;
            box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .5);
        }

        .more-image-button {
            font-weight: 700;
            cursor: pointer;
            color: #000;
            background: 0 0;
            padding: 0;
            border: none;
            position: relative;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            font-size: inherit;
            align-content: center;
            align-items: center;
            justify-content: center;
            transition: background-color .2s ease-in;
            cursor: none;
        }

        .more-image-button1 {
            font-weight: 700;
            cursor: pointer;
            color: #000;
            background: 0 0;
            padding: 0;
            border: none;
            position: relative;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            font-size: inherit;
            align-content: center;
            align-items: center;
            justify-content: center;
            transition: background-color .2s ease-in;
        }

        .content-container {
            padding: 24px;
        }

        .conent-header {
            display: flex;
            justify-content: space-between;
            flex-direction: row;
            align-items: flex-start;
            margin-bottom: 16px;
            padding-bottom: 16px;
            border-bottom: 1px solid #ebebeb;
        }

        .content-header-views {
            padding: 5px 0;
            color: #9a9a9a;
        }

        .content-header-action {
            text-align: right;
            width: auto;
        }

        .content-header-action-() {
            display: inline-block;
            padding-right: 0;
            padding: 0 10px;
            color: #9a9a9a;
            font-size: 14px;
        }

        .report_btn {
            color: #9a9a9a;
            display: flex;
            align-items: center;
            background: 0 0;
            padding: 0;
            border: none;
            position: relative;
            margin: 0;
            line-height: 1;
            outline: 0;
            font-size: inherit;
            justify-content: center;
            transition: background-color .2s ease-in;
        }

        .vip-ad-row {
            display: flex;
            justify-content: space-between;
            flex-direction: column;
            align-items: flex-start;
        }

        .vip-ad-content {
            display: flex;
            flex-direction: column;
            flex: 2;
            overflow: hidden;
            width: 100%;
        }

        .vip-ad-title {
            font-size: 22px;
            line-height: 1.1;
            font-weight: 400;
        }

        .vip-ad-price {
            margin: 10px 0;
            font-size: 28px;
            line-height: 1;
        }

        .vip-ad-price-price {
            color: #3baa33;
        }

        .vip-ad-price-negotiable {
            font-size: 14px;
            color: #747474;
        }

        #tmap-result {
            color: #747474;
            font-size: 16px;
        }

        #map_div {
            margin: 10px 0;
        }

        .vip-ad-description {
            margin: 15px 0 20px;
        }

        .description-content-wrapper {
            position: relative;
            overflow: hidden;
            height: 130px;
            margin-bottom: 10px;
        }

        .description-content {
            font-size: 14px;
            line-height: 22px;
            margin-top: 0;
        }

        .content-wrapped {
            font-size: 14px;
            line-height: 22px;
            overflow-wrap: break-word;
            word-break: normal;
        }

        .description-fade-out {
            position: absolute;
            bottom: 0;
            height: 50px;
            width: 100%;
            background: linear-gradient(hsla(0, 0%, 100%, 0), #fff);
        }

        .more-content-btn {
            color: #3baa33;
            padding: 8px 2px;
            font-size: 18px;
            transition: transform 5s;
            background: 0 0;
            border: none;
        }

        .more-content-btn:hover {
            line-height: 2;
        }

        .vip-ad-attributes-container {
            display: flex;
            flex-direction: column;
        }

        .vip-ad-attributes--collapsible {
            height: 180px;
            border-radius: 4px 4px 0 0;
            overflow: hidden;
            justify-content: flex-end;
            margin-bottom: 0;
            position: relative;
            border-top: 2px solid #ebebeb;
            border-left: 2px solid #ebebeb;
            border-right: 2px solid #ebebeb;
            padding: 16px 20px;
            display: flex;
            width: 100%;
            flex-grow: 0;
        }

        .vip-ad-attributes__item {
            width: 50%;
            display: flex;
            padding: 4px 0;
            line-height: 24px;
        }

        .vip-ad-attributes-list {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            list-style: none;
        }

        .item-name {
            padding-right: 8px;
            color: #9a9a9a;
            width: auto;
            display: inline-block;
            vertical-align: middle;
            word-wrap: break-word;
        }

        .item-value {
            width: auto;
            display: inline-block;
            vertical-align: middle;
            word-wrap: break-word;
        }

        .show-more-option {
            margin-top: -2px;
            border-radius: 0 0 4px 4px;
            margin-bottom: 24px;
            border-color: #3baa33;
            background: 0 0;
            color: #2f8828;
            width: 100%;
            padding: 12px;
            border: 2px solid;
            font-weight: 700;
            letter-spacing: .5px;
            text-align: center;
            vertical-align: middle;
            transition: background-color .2s, color .2s, box-shadow .2s,
                border-color .2s;
            position: relative;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            cursor: pointer;
            font-size: inherit;
            align-content: center;
            align-items: center;
            justify-content: center;
        }

        .show-more-option:hover {
            background: #3baa33;
            color: #fff;
        }

        .panel-header {
            font-size: 16px;
            padding: 30px 0 20px;
            color: #747474;
            text-transform: uppercase;
            font-weight: 700;
            letter-spacing: .5px;
            overflow: hidden;
            margin-left: 10px;
        }

        .similar ads-slider-container {
            position: relative;
            background: 0 0;
            overflow: visible;
            border-radius: 4px;
        }

        .silder-offset {
            margin: 0 -8px;
            position: relative;
        }

        .silder-button-wrapper {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            position: absolute;
            width: 850px;
        }

        .silder-prev {
            left: 0;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            height: 55px;
            width: 32px;
            display: block;
            z-index: 1;
            background: #fff;
            border: 1px solid #d6d6d6;
            border-radius: 3px;
            /* box-shadow: 10 2px 4px 0 rgba(0, 0, 0, .15); */
            color: #2f8828;
            margin: 0;
            line-height: 1;
            outline: 0;
            align-content: center;
            align-items: center;
            justify-content: center;
            font-size: inherit;
            transition: background-color .2s ease-in;
            margin-top: 120px;
        }

        .silder-prev:hover {
            box-shadow: 2px 2px 4px 0 rgba(0, 0, 0, .15);
        }

        .silder-next {
            right: 0;
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            height: 55px;
            width: 32px;
            display: block;
            z-index: 1;
            background: #fff;
            border: 1px solid #d6d6d6;
            border-radius: 3px;
            color: #2f8828;
            margin: 0;
            line-height: 1;
            outline: 0;
            align-content: center;
            align-items: center;
            justify-content: center;
            font-size: inherit;
            transition: background-color .2s ease-in;
            margin-top: 120px;
            right: 0;
        }

        .silder-next:hover {
            box-shadow: 2px 2px 4px 0 rgba(0, 0, 0, .15);
        }

        .slider-container {
            overflow: hidden;
            display: flex;
            align-items: center;
            flex-direction: row;
            width: 100%;
            position: relative;
        }

        .slider_list {
            position: absolute;
            top: 0;
            left: 0;
            height: 100%;
            width: calc(100% - 16px);
        }

        .slider-item-wrapper {
            left: 0px;
            height: 278.3px;
            display: flex;
            flex-direction: row;
            align-items: center;
            position: absolute;
            top: 0;
            transition: left .5s;
        }

        .slider-item {
            height: 100%;
            flex-shrink: 0;
        }

        .full-size-link {
            display: inline-block;
            height: 100%;
            width: 100%;
            position: relative;
            padding: 4px 4px 8px;
            overflow: hidden;
            color: inherit;
            text-decoration: none !important;
        }

        .user-ad-square-panel {
            width: auto;
            display: flex;
            flex-direction: column;
            align-items: stretch;
            padding: 8px;
            background: #fff;
            transform: translateZ(0);
            border: 1px solid #ebebeb;
            border-radius: 4px;
            height: 100%;
        }

        .user-ad-square-panel:hover {
            box-shadow: 1px 3px 2px rgba(0, 0, 1, .15);
            transition: 1s;
        }

        .user-ad-squaer-image-wrapper {
            background: #ebebeb;
            flex: 1 0 0%;
            display: flex;
            align-items: center;
            justify-content: space-around;
            overflow: hidden;
        }

        .user-ad-squaer-image-wrapper {
            color: #c2c2c2;
            line-height: .5;
        }

        .user-ad-square-image {
            flex: 0 0 100%;
            max-width: 100%;
            max-height: 100%;
            min-width: 0;
            object-fit: contain;
            opacity: 1;
            transition: opacity .2s;
        }

        .squaer-title {
            color: #3baa33;
            margin-top: 12px;
            font-size: 16px;
            line-height: 20px;
            padding-right: 30px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            font-weight: 300;
        }

        .square-floatin-price {
            position: absolute;
            height: 40px;
            top: 75%;
            left: 0;
            transform: translateY(-56px);
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 0 8px 0 16px;
            border-radius: 0 3px 3px 0;
            background-color: rgba(0, 0, 0, .7);
            line-height: 1;
        }

        .price-text {
            color: #9a9a9a;
            font-size: 18px;
        }

        .just-won {
            color: #3baa33;
            float: left;
            margin-right: 3px;
            font-size: 13px;
            line-height: 1rem;
        }

        .floatin-nego {
            display: block;
            margin-left: 8px;
            font-size: 12px;
            color: #9a9a9a;
        }

        .square-location-and-star {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-top: auto;
        }

        .square-location {
            font-size: 14px;
            line-height: 14px;
            white-space: nowrap;
            text-overflow: ellipsis;
            padding-right: 3px;
            font-weight: 300;
            color: #9a9a9a;
        }

        .square-heart-wrapper {
            font-size: 18px;
            margin: -6px;
            color: #9a9a9a;
            transition: .2s;
            padding: 5px;
            background: 0 0;
            position: relative;
            display: inline-flex;
            line-height: 1;
            outline: 0;
            cursor: pointer;
            align-content: center;
            align-items: center;
            justify-content: center;
            border: none;
        }

        .square-heart-wrapper:hover {
            font-size: 25px;
        }

        .panel-tab-set {
            margin-top: 20px;
        }

        .panel-body-shadow {
            box-shadow: 2px 1px 6px rgba(0, 0, 0, .1);
            background: #fff;
            border-radius: 4px;
            overflow: hidden;
        }

        .tab-set-wrapper {
            border-radius: 4px;
            max-height: 325px;
            overflow: hidden;
        }

        .panel-header1 {
            display: flex;
            justify-content: center;
            font-size: 14px;
            background: #fff;
            border-bottom: 1px solid #ebebeb;
            padding: 0;
            overflow: hidden;
        }

        #tab-set-header-button-recent {
            height: 50px;
            margin: 0 3%;
            border-bottom: 2px solid transparent;
            font-weight: 700;
            color: rgb(0, 0, 0);
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            background: 0 0;
            padding: 0;
            border: none;
            position: relative;
            display: inline-flex;
            line-height: 1;
            outline: 0;
            cursor: pointer;
            align-content: center;
            align-items: center;
            justify-content: center;
            transition: background-color .2s ease-in;
        }

        #tab-set-header-button-recent:hover {
            border-bottom: 3px solid #3baa33;
            color: #3baa33;
        }

        #tab-set-header-button-watch {
            height: 50px;
            margin: 0 3%;
            border-bottom: 2px solid transparent;
            font-weight: 700;
            color: rgb(0, 0, 0);
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            background: 0 0;
            padding: 0;
            border: none;
            position: relative;
            display: inline-flex;
            line-height: 1;
            outline: 0;
            cursor: pointer;
            align-content: center;
            align-items: center;
            justify-content: center;
            transition: background-color .2s ease-in;
        }

        #tab-set-header-button-watch:hover {
            border-bottom: 3px solid #3baa33;
            color: #3baa33;
        }

        .active-button {
            border-bottom: 3px solid #3baa33 !important;
            color: #3baa33 !important;
        }

        .tab-set-content {
            background: #fff;
        }

        .card-set-ad-list {
            flex-wrap: wrap;
            display: flex;
            padding: 16px 16px 0;
            min-height: 180px;
            background-color: #fafafa;
        }

        .ad-card-panel {
            display: flex;
            padding: 8px;
            background: #fff;
            transition: .2s;
            border: 1px solid #ebebeb;
            border-radius: 4px;
        }

        .ad-card-panel:hover {
            box-shadow: 2px 1px 1px rgba(0, 0, 1, .15);
        }

        .active-card {
            width: calc(33.3333% - 8px);
            margin: 4px;
            display: block;
            position: relative;
            color: inherit;
            text-decoration: none !important;
        }

        .active-card-cookie {
            width: calc(33.3333% - 8px);
            margin: 4px;
            display: block;
            position: relative;
            color: inherit;
            text-decoration: none !important;
        }

        .ad-card-image-wrapper {
            height: 60px;
            width: 80px;
            margin-right: 8px;
        }

        .ad-card-image {
            flex: 0 0 100%;
            max-width: 100%;
            max-height: 100%;
            min-width: 0;
            object-fit: contain;
            opacity: 1;
            transition: opacity .2s;
        }

        .ad-card-content {
            flex: 1;
            overflow: hidden;
            position: relative;
        }

        .ad-card-title {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            margin-top: 0;
            font-size: 14px;
        }

        .ad-card-location {
            position: absolute;
            bottom: 0;
            left: 0;
            width: calc(100% -30px);
            font-size: 12px;
            height: 13px;
            line-height: 1;
            color: #9a9a9a;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .ad-card-heart {
            position: absolute;
            bottom: -6px;
            right: -4px;
            font-size: 20px;
            color: #9a9a9a;
            transition: .2s;
            padding: 5px;
            background: 0 0;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            border: none;
            cursor: pointer;
            align-content: center;
            align-items: center;
            justify-content: center;
        }

        .ad-card-heart:hover {
            font-size: 25px;
        }

        .ad-card-watchlist {
            background: #fff;
        }

        .card-set-watchlist {
            display: none;
            flex-wrap: wrap;
            padding: 16px 16px 0;
            min-height: 180px;
            background-color: #fafafa;
        }

        .ad-card-heart-watch {
            position: absolute;
            bottom: -6px;
            right: -4px;
            font-size: 20px;
            color: red;
            transition: .2s;
            padding: 5px;
            background: 0 0;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            border: none;
            cursor: pointer;
            align-content: center;
            align-items: center;
            justify-content: center;
        }

        .thumbnail-container {
            margin-bottom: 30px;
            width: 100%;
            height: 100px;
            border-top: 2px dotted #3baa33;
            border-bottom: 2px dotted #3baa33;
            overflow: hidden;
            display: flex;
            flex-direction: row;
        }

        .image-container-ul li {
            text-align: center;
            color: #FFF;
            background-size: cover;
            background-position: center;
            display: inline;
            margin-left: 5px;
            margin-top: 10px;
            padding: 5px;
            flex-shrink: 0;
        }

        .aa {
            margin: 0;
            width: 100px;
            height: 100px;
            padding: 10px 0;
        }

        .more-image-button1:first:child {}

        .card-set-ad-empty {
            font-size: 30px;
            font-weight: 500;
            text-align: center;
            color: #3baa33;
            font: italic;
            margin-left: auto;
            margin-right: auto;
        }

        #hearticon {
            color: #9a9a9a;
        }

        .main-heart {
            color: red !important;
        }

        .just-red-main {
            color: red !important;
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            height: 650px !important;
            width: 400px !important;
        }

        .customer-review-form-wrapper {
            margin-top: 20px;
            box-showdow: 0 1px 6px rgba(0, 0, 0, .1);
            background: #fff;
            border-radius: 4px;
            overflow: hidden;
        }

        .customer-review-form-header {
            padding: 20px 32px;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #ebebeb;
            height: 52px;
            line-height: 1;
            background: #fff;
        }

        .customer-review-form-body {
            padding: 20px 32px;
            background: #fbfbfb;
        }

        .customer-panel-body-standard-shadow {
            box-shadow: 0 1px 6px rgba(0, 0, 0, .1);
            background: #fff;
            border-radius: 4px;
            overflow: hidden;
        }

        .customer-review-form-header {
            border-bottom: 1px solid #ebebeb;
            padding-bottom: 15px;
            padding: 20px 32px;
            width: 100%;
        }

        .input-vertical {
            display: flex;
            width: 100%;
        }

        .overall-rating {
            display: block;
            margin-right: 16px;
            color: #353535;
            font-size: 14px;
            margin-bottom: 5px;
            font-weight: 700;
            width: 7%;
        }

        .rating-input {
            display: block;
            width: 100%;
            border: 0;
            vertical-align: baseline;
            margin-left: -10px;
        }

        .leaf-button {
            background: 0 0;
            color: #2f8828;
            padding: 0;
            border: none;
            position: relative;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            touch-action: manipulation;
            user-select: none;
            cursor: pointer;
            font-size: inherit;
            align-content: center;
            align-items: center;
            justify-content: center;
            transition: background-color .2s ease-in;
        }

        .off {
            opacity: .3;
        }



        .rating-score-text {
            position: absolute;
            left: -10000px;
            top: auto;
            width: 1px;
            height: 1px;
            overflow: hidden;
        }

        .score-icon {
            color: #3baa33;
            font-size: 20px;
            margin-right: 8px;
            line-height: 0.2;
            vertical-align: middle;
        }

        .customer-review-form-realbody {
            border-bottom: 1px solid #ebebeb;
            display: none;
            flex-wrap: wrap;
            padding: 20px 32px;
        }

        .customer-review-form-title {
            margin-left: -10px;
            padding: 5px 0;
            width: 100%;
        }

        .input_label {
            display: block;
            color: #353535;
            font-size: 14px;
            margin-bottom: 5px;
            font-weight: 700;
        }


        .input_customer_title {
            display: block;
            width: 100%;
            height: 42px;
            padding: 9px 5px 8px 10px;
            border: 2px solid #d6d6d6;
            border-radius: 4px;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            resize: none;
            color: #353535;
            background-color: #fff;
            font-weight: 400;
            font-size: 100%;
            box-sizing: inherit;
        }

        .customer-review-form-char-limit {
            width: 100%;
            text-align: right;
            color: #ebebeb;
        }

        .input_customer_content {
            width: 100%;
            padding: 9px 5px 8px 10px;
            border: 2px solid #d6d6d6;
            border-radius: 4px;
            transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
            resize: none;
            height: auto;
            color: #353535;
            background-color: #fff;
            font-weight: 400;
            font-size: 100%;
        }

        .customer-review-form-section {
            display: none;
            padding: 20px 32px;
        }

        .customer-review-submit {
            width: auto;
            min-width: 180px;
            height: 50px;
            padding-top: 0;
            padding-bottom: 0;
            vertical-align: middle;
            border: none;
            background: #3baa33;
            color: #fff;
            padding: 17px 38px;
            font-weight: 700;
            letter-spacing: .5px;
            text-align: center;
            position: relative;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            user-select: none;
            cursor: pointer;
            font-size: inherit;
            align-content: center;
            align-items: center;
            justify-content: center;
        }

        .rating-input1 {
            display: block;
            width: 100%;
            border: 0;
            vertical-align: baseline;
            margin-left: -10px;
            margin-right: 16px;
            color: #353535;
            font-size: 14px;
            margin-bottom: 5px;
            font-weight: 700;
            color: #747474;
        }

        .customer-review-form-realbody1 {
            border-bottom: 1px solid #ebebeb;
            display: none;
            flex-wrap: wrap;
            padding: 20px 32px;
            background-color: #E0F8E0;
            transition: all 1s ease-in;
        }

        .review-id {
            right: 10;
            color: #353535;
            font-size: 14px;
            margin-bottom: 5px;
            font-weight: 700;
            color: #0B610B;
        }


        .customer-review-form-header1 {
            padding: 20px 32px;
            display: flex;
            justify-content: space-between;
            border-bottom: 1px solid #ebebeb;
            height: 52px;
            line-height: 1;
            background: #fff;
            cursor: pointer;

        }

        .customer-review-form-header2 {
            padding: 20px 32px;
            display: none;
            justify-content: space-between;
            border-bottom: 1px solid #ebebeb;
            height: 52px;
            line-height: 1;
            background: #C6E872;

        }

        .asd {
            font-size: 16px;
            font-weight: 550;
            color: #4C4C4C;
        }

        .flex {
            display: flex;
        }

        .scoreNumbering {
            font-size: 14px;
            font-weight: 700;
            color: #ebebeb;
        }

        .comment-btn {
            background: 0 0;
            color: #2f8828;
            padding: 10;
            border: none;
            position: relative;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            user-select: none;
            cursor: pointer;
            font-size: inherit;
            align-content: center;
            align-items: center;
            justify-content: center;
            transition: background-color .2s ease-in;
            color: #ebebeb;
        }

        .comment-btn-wrapper {
            margin-left: 580px;

        }

        .ifnone {
            display: none;
        }

        #commenthead {
            cursor: pointer;
        }

        #commenthead:hover {
            background-color: #3baa33;
            color: #fff;
        }

        .customer-review-form-header1:hover {
            background: #C6E872;

        }

        .comment-btn:hover {
            color: #fff;
        }

        .formUpdate {}

        .customer-review-submit1 {
            width: auto;
            min-width: 180px;
            height: 50px;
            padding-top: 0;
            padding-bottom: 0;
            vertical-align: middle;
            border: none;
            background: #3baa33;
            color: #fff;
            padding: 17px 38px;
            font-weight: 700;
            letter-spacing: .5px;
            text-align: center;
            position: relative;
            display: inline-flex;
            margin: 0;
            line-height: 1;
            outline: 0;
            user-select: none;
            cursor: pointer;
            font-size: inherit;
            align-content: center;
            align-items: center;
            justify-content: center;
        }

        .customer-review-form-realbody11 {
            padding: 20px 32px;
            display: none;
            justify-content: space-between;
            border-bottom: 1px solid #ebebeb;
            height: 52px;
            line-height: 1;
            background: #5AB344;
            color: #fff;
        }

        #origin11 {
            right: 0;
        }

    </style>
</head>

<body onload="initTmap()">
    <jsp:include page="headerForBoard.jsp"></jsp:include>
    <script>
        $(document).ready(function() {
            $("#search-bar").css("display", "none");
        });

    </script>

    <div id="react-root">
        <div class="page">
            <div class="head-text">
                <span> <a href="/" class="link-home">Home</a> <span class="crumbs_sperator" aria-hidden="true"> <i class="fas fa-angle-right"></i>
                    </span>
                </span> <span> <a href="#" class="link-home">${options[0].optionValue }</a>
                    <span class="crumbs_sperator" aria-hidden="true"> <i class="fas fa-angle-right"></i>
                    </span>
                </span> <span> <a href="#" class="link-home">${options[1].optionValue }</a>
                    <span class="crumbs_sperator" aria-hidden="true"> <i class="fas fa-angle-right"></i>
                    </span>
                </span> <span> <span display="inline" class="link-home" aria-hidden="true"> ${board.boardNo } </span>
                </span> <input type="hidden" value="${board.location }" id="boardLocation">
                <input type="hidden" value="${sessionScope.member.memberAddr }" id="sessionLocation">

            </div>

            <!--header text 끝-->
            <c:choose>
                <c:when test="${member ne null and member.memberId eq 'admin'}">
                    <a href="javascript:void(0);" onclick="return deleteBoard();" class="btn btn-outline-success">삭제</a>
                </c:when>
                <c:when test="${member ne null and member.memberId eq board.userId}">
                    <a href="goModify.do?boardNo=${board.boardNo }" class="btn btn-outline-success">수정</a>
                    <a href="javascript:void(0);" onclick="return deleteBoard();" class="btn btn-outline-success">삭제</a>
                </c:when>
            </c:choose>

            <div class="view-item-page-content">
                <div class="view-item-page-related">
                    <div class="panel-body panel-body--flat-panel-shadow">
                        <div class="vip-ad-image">
                            <!--imgcontainer시작-->
                            <div class="vip-ad-image__main-image-container">
                                <div class="vip-ad-image-overlay">
                                    <div class="vip-ad-social-share">
                                        <ul class="social-share-action">
                                            <li class="social-share-link"></li>
                                            <li class="social-share-link"></li>
                                            <li class="social-share-link"></li>
                                            <li class="social-share-link"></li>
                                        </ul>
                                    </div>
                                    <c:if test="${member ne null && member.memberId eq wish.memberId }">
                                        <button id="heart" type="button" class="heartbtn">
                                            <div class="image-overlay">
                                                <span id="redheart"><i class="fas fa-heart main-heart" id="hearticon"></i></span>
                                            </div>
                                        </button>
                                    </c:if>
                                    <c:if test="${wish.memberId != sessionScope.member.memberId || member eq null}">
                                        <button id="heart" type="button" class="heartbtn">
                                            <div class="image-overlay">
                                                <span id="redheart"><i class="far fa-heart" id="hearticon"></i></span>
                                            </div>
                                        </button>
                                        <c:if test="${member eq null}">
                                            <script>
                                                $('#heart').click(function() {
                                                    if (confirm('로그인이 필요합니다')) {
                                                        location.href = "/login.do?";
                                                    }
                                                });

                                            </script>
                                        </c:if>
                                    </c:if>
                                </div>

                                <input type="hidden" id="inputboardNo" name="boardNo" value="${board.boardNo }"> <input type="hidden" id="inputmemberId" name="memberId" value="${sessionScope.member.memberId }"> <input type="hidden" id="inputwishList" name="wishList" value="${board.wishList }">
                                <div style="background-image : url('resources/upload/${board.files[0]}')" class="vip-ad-image_main-image-background"></div>
                                <div class="vip-ad-image-wrapper">
                                    <img class="vip-ad-main-image" src="resources/upload/${board.files[0] }">
                                    <!-- <button type="button" class="image-cta-right-arrow">
										<i class="fas fa-chevron-right"></i>
									</button>
									<button type="button" class="image-cta-left-arrow">
										<i class="fas fa-chevron-left"></i>
									</button> -->
                                    <button type="button" class="image-button"></button>
                                    <div class="vip-ad-moreimage">
                                        <button type="button" class="more-image-button">
                                            <i class="far fa-images"></i>&nbsp;&nbsp;${fn:length(board.files) }&nbsp;images
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <!--imgconatiner끝-->
                            <div class="thumbnail-container">
                                <ul class="image-container-ul">
                                    <c:forEach items="${thumbnailList }" var="file" varStatus="i">
                                        <li class="image-container-li">
                                            <button type="button" class="more-image-button1">
                                                <img class="aa" src="resources/upload/${file }">
                                            </button>
                                        </li>
                                    </c:forEach>


                                </ul>
                            </div>


                            <!--contentcontainer시작-->
                            <div class="content-container">
                                <div class="conent-header">
                                    <div class="content-header-views">${board.readCount }&nbsp;Views</div>
                                    <div class="content-header-action">
                                        <ul>
                                            <li class="content-header-action-report">
                                                <button role class="report_btn" data-target="#layerpop" data-toggle="modal">
                                                    <i class="far fa-flag"></i>&nbsp;Report Ad
                                                </button>
                                                <form action="/report.do" method="post" onsubmit="return valid();">
                                                    <div class="modal fade" id="layerpop">
                                                        <div class="modal-dialog">

                                                            <div class="modal-content">
                                                                <!-- header -->
                                                                <div class="modal-header">
                                                                    <!-- 해더 -->
                                                                    <h3 class="modal-title">신고게시판</h3>
                                                                    <!-- 닫기버튼~ -->
                                                                    <button type="button" class="close" data-dismiss="modal">x</button>
                                                                </div>
                                                                <!-- 바디~ -->
                                                                <div class="modal-body" align="center">
                                                                    <h2>신고사유</h2>
                                                                    <p id="reson">※신고사유를 입력하세요</p>
                                                                    <select id="report" name="reason">
                                                                        <option value="none" disabled>신고사유를 선택하세요.</option>
                                                                        <option value="부적절한게시물">1.부적절한 게시물</option>
                                                                        <option value="허위매물">2.허위 매물</option>
                                                                        <option value="게시판에 맞지 않습니다.">3.게시판에 맞지 않습니다.</option>
                                                                        <option value="기타 이유">4.기타 이유</option>
                                                                    </select>
                                                                </div>
                                                                <input type="hidden" name="memberId" value="${member.memberId }">
                                                                <input type="hidden" name="category" value="${board.category }">
                                                                <input type="hidden" name="reportBoardNo" value="${board.boardNo }">
                                                                <input type="hidden" name="title" value="${board.title }">
                                                                <input type="hidden" name="reportTaget" value="${board.userId }">
                                                                <div class="modal-footer">
                                                                    <button type="submit" class="btn btn-success" onclick="return submit()">신고</button>
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
                                                                </div>
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--content-header 끝-->




                                <div class="vip-ad-row">
                                    <div class="vip-ad-content">
                                        <h1 class="vip-ad-title">${board.title }</h1>
                                        <div class="vip-ad-price">
                                            <span class="vip-ad-price-price"> ￦ ${board.price } 만원 </span> <span class="vip-ad-price-negotiable"> 네고가능여부 </span><br> <br>
                                            <div id="map_div"></div>
                                            <span id="tmap-result"><i>거리 , 시간 출력 하는곳</i></span>
                                            <div class="vip-ad-description">
                                                <div class="description-content-wrapper">
                                                    <div class="description-content" style="height: 200px; border : 1px solid #ebebeb; background-color: #fffbf3;">
                                                        <span class="content-wrapped"> ${board.content } </span>
                                                    </div>
                                                    <div class="description-fade-out"></div>
                                                </div>
                                                <c:if test="$('.content-wrapped').css(height) > 150">
                                                    <button class="more-content-btn">
                                                        More&nbsp;<i class="far fa-plus-square"></i>
                                                    </button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--vip-ad-row끝-->
                                <div class="vip-ad-attributes-container">
                                    <div class="vip-ad-attributes--collapsible">
                                        <ul class="vip-ad-attributes-list">
                                            <c:forEach items="${options }" var="option">
                                                <li class="vip-ad-attributes__item"><span class="item-name">${option.optionName }</span> <span class="item-value">${option.optionValue }</span></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                    <button id type="button" class="show-more-option">Show
                                        All</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--flat-panel-shadow 끝-->
                    <div class="customer-review-form-wrapper">
                        <div class="customer-review-form-header">
                            Your Comment
                        </div>
                        <div class="customer-review-form-body">
                            <div class="customer-panel-body-standard-shadow">
                                <form action="/insertComment.do" method="POSt" class="customer-reivew-form" onsubmit="return valid();">
                                    <input type="hidden" value="${board.boardNo }" name="reviewBoardNo">
                                    <div aria-hidden="true" class="customer-review-form-header">
                                        <div class="input-vertical">
                                            <label class="overall-rating">평점 : </label>
                                            <span class="rating-input">
                                                <button type="button" class="leaf-button on"><span class="score-icon"><i class="fas fa-leaf"></i></span></button>
                                                <button type="button" class="leaf-button on"><span class="score-icon"><i class="fas fa-leaf"></i></span></button>
                                                <button type="button" class="leaf-button on"><span class="score-icon"><i class="fas fa-leaf"></i></span></button>
                                                <button type="button" class="leaf-button on"><span class="score-icon"><i class="fas fa-leaf"></i></span></button>
                                                <button type="button" class="leaf-button on"><span class="score-icon"><i class="fas fa-leaf"></i></span></button>
                                            </span>
                                            <input type="hidden" class="rating-score-text" name="ratingScore">
                                        </div>
                                    </div>
                                    <div style="background-color:#fff;" class="customer-review-form-realbody">
                                        <div class="customer-review-form-title">
                                            <label class="input_label">
                                                제목
                                            </label>
                                            <input name="inputTitle" class="input_customer_title" maxlength="50" placeholder="Please insert title" required>
                                        </div>
                                        <div class="customer-review-form-char-limit">
                                            50 characters
                                        </div>
                                        <div class="rating-input">
                                            <label class="input_label">
                                                내용
                                            </label>
                                            <textarea name="inputContent" class="input_customer_content" rows="4" maxlength="500" placeholder="Please insert content" required></textarea>
                                        </div>
                                        <div class="customer-review-form-char-limit">
                                            500 characters
                                        </div>
                                    </div>
                                    <div style="background-color:#fff;" class="customer-review-form-section">
                                        <button type="submit" class="customer-review-submit">댓글 작성</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div style="margin-top : 20px;" class="customer-review-form-wrapper">
                        <div class="customer-review-form-header" id="commenthead">
                            Comment&nbsp;<b>(${fn:length(commentList) })</b>
                        </div>
                        <div class="ifnone">
                            <c:forEach items="${commentList }" var="comment">
                                <div class="customer-review-form-body">
                                    <div class="customer-panel-body-standard-shadow">
                                        <div class="customer-review-form-header1">
                                            <div class="input-vertical">
                                                <span class="rating-input1">${comment.commentTitle }</span>
                                                <span class="review-id">${comment.commentId }</span>
                                            </div>
                                        </div>
                                        <div class="customer-review-form-realbody1">
                                            <span class="asd">${comment.commentContent }</span>
                                        </div>
                                        <c:forEach items="${recommentList }" var="recomment">
                                            <c:if test="${comment.commentNo == recomment.regCommentNo }">
                                                <div class="customer-review-form-header2">
                                                    <span class="asd">${recomment.recommentContent }</span>
                                                    <span style="margin-left : 570px; right : 0;" class="review-id" id="origin11">${recomment.reCommentId }</span>
                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <span style="cursor : pointer; top:0;" class="deleteRecomment">
                                                        <i class="fas fa-times"></i>
                                                    </span>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                        <div class="customer-review-form-realbody11">
                                            <div class="input-vertical">
                                                <i style="color: #ebebeb" class="fas fa-leaf">&nbsp;<span class="scoreNumbering">${comment.score }</span></i>
                                                <span class="comment-btn-wrapper">
                                                    <c:if test="${sessionScope.member.memberId == comment.commentId || sessionScopre.member.memberId == board.userId}">
                                                        <button class="comment-btn" name="insertRecomment"><i class="fas fa-comments"></i></button>
                                                    </c:if>
                                                    <c:if test="${sessionScope.member.memberId == comment.commentId }">
                                                        <button class="comment-btn" name="updateComment"><i class="fas fa-pen-fancy"></i></button>
                                                        <button class="comment-btn" name="deleteComment"><i class="fas fa-trash-alt"></i></button>
                                                    </c:if>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="/commentUpdate.do" method="POST" id="formUpdate">
                                        <input type="hidden" value="${board.boardNo }" name="reviewBoardNo">
                                        <input type="hidden" value="${comment.commentNo }" name="commentNo">
                                        <div class="customer-review-form-realbody">
                                            <div class="customer-review-form-title">
                                                <label class="input_label">
                                                    제목
                                                </label>
                                                <input name="inputTitle" class="input_customer_title" maxlength="50" placeholder="Please insert title" value="${comment.commentTitle }" required>
                                            </div>
                                            <div class="customer-review-form-char-limit">
                                                50 characters
                                            </div>
                                            <div class="rating-input">
                                                <label class="input_label">
                                                    내용
                                                </label>
                                                <textarea name="inputContent" class="input_customer_content" rows="4" maxlength="500" placeholder="Please insert content" required>${comment.commentContent }</textarea>
                                            </div>
                                            <div class="customer-review-form-char-limit">
                                                500 characters
                                            </div>
                                        </div>
                                        <div class="customer-review-form-section">
                                            <button type="submit" class="customer-review-submit">리뷰 작성</button>
                                        </div>
                                    </form>
                                    <!-- 대댓글입력창 -->
                                    <form action="/insertRecomment.do" method="post">
                                        <input type="hidden" value="${board.boardNo }" name="reviewBoardNo">
                                        <input type="hidden" value="${comment.commentNo }" name="commentNo1">
                                        <div class="customer-review-form-realbody">
                                            <div class="rating-input">
                                                <label class="input_label">
                                                    내용
                                                </label>
                                                <textarea name="commentContent1" class="input_customer_content" rows="4" maxlength="500" placeholder="Please insert content" required></textarea>
                                            </div>
                                            <div class="customer-review-form-char-limit">
                                                500 characters
                                            </div>
                                        </div>
                                        <div class="customer-review-form-section" id="closeReset">
                                            <button type="submit" class="customer-review-submit">Recomment Submit</button>
                                            <button style="margin-left : 100px; color : " type="button" class="customer-review-submit1">Close</button>
                                        </div>
                                    </form>
                                </div>
                            </c:forEach>
                        </div>

                    </div>
                    <div class="panel">
                        <div class="panel-header">관련 게시물</div>
                        <div class="similar ads-slider-container">
                            <div class="slider-offset">
                                <div class="silder-button-wrapper">
                                    <button disabled="disabled" type="button" class="silder-prev" role>
                                        <i class="fas fa-chevron-left"></i>
                                    </button>
                                    <button type="button" class="silder-next" role>
                                        <i class="fas fa-chevron-right"></i>
                                    </button>
                                </div>
                                <div class="slider-container" style="height: 278.3px;">
                                    <div class="slider_list" style="margin: 0px 8px; overflow-x: hideen;">
                                        <ul class="slider-item-wrapper" style="left: 0px; height: 278.3px;">
                                            <c:forEach items="${boardList}" var="b" varStatus="i">
                                                <li class="slider-item" style="width: 278.333px;"><a href="/goList.do?boardNo=${b.boardNo }" class="full-size-link">
                                                        <div class="user-ad-square-panel">
                                                            <div class="user-ad-squaer-image-wrapper">
                                                                <img class="user-ad-square-image" src="/resources/upload/${b.files[0] }">
                                                            </div>
                                                            <p class="squaer-title">${b.title }</p>
                                                            <p class="square-floatin-price">
                                                                <span class="price-text"> <span class="just-won">
                                                                        ￦ </span> ${b.price } 만원
                                                                </span> <span class="floatin-nego"> 아 네고 씹가능 </span>
                                                            </p>
                                                            <div class="square-location-and-star">
                                                                <p class="square-location">${b.location }</p>
                                                            </div>
                                                        </div>
                                                    </a></li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel-tab-set">
                        <div class="panel-body-shadow">
                            <div class="tab-set-wrapper">
                                <div class="panel-header1">
                                    <button id="tab-set-header-button-recent" class="active-button">최근
                                        본 글</button>
                                    <button id="tab-set-header-button-watch">내가 찜한 글</button>
                                </div>
                                <div class="tab-set-content">
                                    <div class="card-set-ad-list">
                                        <c:forEach items="${history }" var="bbb">
                                            <c:if test="${not empty cookieList }">
                                                <a href="/goList.do?boardNo=${bbb.boardNo }" class="active-card-cookie">
                                                    <div class="ad-card-panel">
                                                        <div class="ad-card-image-wrapper">
                                                            <img class="ad-card-image" src="/resources/upload/${bbb.files[0] }">
                                                        </div>
                                                        <div class="ad-card-content">
                                                            <p class="ad-card-title">${bbb.title }</p>
                                                            <p class="ad-card-location">${bbb.location }</p>
                                                        </div>
                                                    </div>
                                                </a>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div class="ad-card-watchlist">
                                        <div class="card-set-watchlist">


                                            <c:forEach items="${wishList }" var="wishboard">
                                                <c:if test="${wishboard == null }">
                                                    <div class="card-set-ad-empty">
                                                        <i class="far fa-sad-tear fa-3x"></i>
                                                    </div>
                                                </c:if>
                                                <c:if test="${wishboard != null }">
                                                    <a href="/goList.do?boardNo=${wishboard.boardNo }" class="active-card">
                                                        <div class="ad-card-panel">
                                                            <div class="ad-card-image-wrapper">
                                                                <img class="ad-card-image" src="resources/upload/${wishboard.files[0] }">
                                                            </div>
                                                            <div class="ad-card-content">
                                                                <p class="ad-card-title">${wishboard.title }</p>
                                                                <p class="ad-card-location">${wishboard.location }</p>
                                                                <button class="ad-card-heart-watch">
                                                                    <i class="fas fa-heart"></i>
                                                                    <input type="hidden" value="${wishboard.boardNo }" id="historyboardNo">
                                                                </button>
                                                            </div>
                                                        </div>
                                                    </a>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="view-item-seller-sticky">
                    <!-- The board message -->
                    <div style="position: fixed;" class="myModal" id="myModal">
                        <!-- message content -->
                        <div class="modal-content">
                            <span class="far fa-comment-alt">&nbsp;</span>
                            <h5 style="color: #6f81f2">Message</h5>
                            <form action="/sendMessage.do" id="frm_ms" method="POST">
                                보내는 사람 : <input type="text" name="sender" class="form-control" value="${sessionScope.member.memberId }" readonly="readonly"><br>
                                받는사 람 : <input type="text" name="receiver" class="form-control" id="receiver" value="${board.userId }" readonly="readonly"><br>
                                <hr>
                                <textarea name="content" id="content" cols="48" rows="10" style="resize: none;" placeholder="쪽지 내용을 입력해주세요"></textarea>
                                <br>
                                <br>
                            </form>

                            <input type="button" class="btn btn-info" id="send_btn" value="보내기">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script>
            /* $('.heartbtn').click(function() {
			var color = $(this).css("color");

			if (color == 'rgb(154, 154, 154)') {
				$("#hearticon").css("color", "red");
				$("#hearticon").css("transition-duration", "0.5s")
				$(this).css("color", "red");
				$("#hearticon").removeClass("far fa-heart");
				$("#hearticon").addClass("fas fa-heart");

			} else {
				$("#hearticon").css("color", "#9a9a9a");
				$(this).css("color", "#9a9a9a");
				$("#hearticon").removeClass("fas fa-heart");
				$("#hearticon").addClass("far fa-heart");

			}
		}); */
            $('#send_btn').click(function() {
                if (valid()) {


                    var sender = $('[name=sender]').val();
                    var receiver = $('#receiver').val();
                    var content = $('#content').val();
                    if ($('#content').val() == "") {
                        alert("상대방에게 보낼 쪽지내용을 입력하세요.");
                    } else {
                        $.ajax({
                            url: "/sendMessage.do",
                            type: "POST",
                            data: {
                                sender: sender,
                                receiver: receiver,
                                content: content
                            },
                            dataType: "json",
                            success: function(data) {
                                if (data > 0) {
                                    alert("쪽지를 보냈습니다.")

                                } else {
                                    alert("쪽지 전송 실패.")

                                }

                            },
                            error: function() {
                                alert("으엉 실패");
                            }
                        });
                    }
                }
            });

            $(".more-content-btn").click(function() {
                $(".description-content-wrapper").css("overflow", "inherit");
                $(".description-content-wrapper").css("height", "inherit");
                $(".more-content-btn").css("display", "none");
                $(".description-fade-out").css("display", "none");
            });

            $(".show-more-option").click(function() {
                if ($(".show-more-option").html() != "Show Less") {
                    $(".vip-ad-attributes--collapsible").css("height", "inherit");
                    $(".show-more-option").html("Show Less");
                } else if ($(".show-more-option").html() == "Show Less") {
                    $(".vip-ad-attributes--collapsible").css("height", "180px");
                    $(".show-more-option").html("Show All");
                }
            });

            var totallength = $(".slider-item-wrapper").width();
            var leftlength = $(".slider-offset").width();
            var current = Math.abs($(".slider-item-wrapper").css("left"));


            if (totallength < 850) {
                $(".silder-next").css("display", "none");
                $(".silder-prev").css("display", "none");
            }
            $(".silder-next")
                .click(
                    function() {
                        $(".silder-next").prop("disabled", true);
                        $(".silder-prev").prop("disabled", true);
                        var currentVal = $(".slider-item-wrapper").css(
                            "left");
                        var test = Number(currentVal.substr(0,
                            currentVal.length - 2));
                        var ableft = Math.abs(test);

                        (ableft < (totallength - 1114)) ? (ableft < totallength - 836) ? $(
                            ".slider-item-wrapper").css("left",
                            Number(test - 836)): $(".slider-item-wrapper").css("left",
                            Number(test - 558)): $(".slider-item-wrapper").css("left",
                            Number(test - 278));

                        setTimeout(function() {
                            $(".silder-prev").prop("disabled", false);
                        }, 500);

                        if (ableft >= (totallength - 1150)) {
                            $(".silder-next").prop("disabled", true);
                        } else {
                            setTimeout(function() {
                                $(".silder-next").prop("disabled", false);
                            }, 500);
                        }

                    });

            /* else if (ableft < totallength){
            $(".slider-item-wrapper").css("left", Number(test-836));
            }else if (ableft < (totallength -1153.33)){
            $(".slider-item-wrapper").css("left", Number(test-558));
            }else if(ableft < (totallength - 1431.66)){
            $(".slider-item-wrapper").css("left", Number(test-280));
            } */

            $(".silder-prev")
                .click(
                    function() {
                        $(".silder-next").prop("disabled", true);
                        $(".silder-prev").prop("disabled", true);
                        var start = 0;
                        var currentVal = $(".slider-item-wrapper").css(
                            "left");
                        var test = Number(currentVal.substr(0,
                            currentVal.length - 2));

                        (test < -558) ? (test < -836) ? $(
                                ".slider-item-wrapper").css("left",
                                test + 836): $(".slider-item-wrapper")
                            .css("left", test + 558): $(
                                ".slider-item-wrapper").css("left",
                                test + 278);

                        setTimeout(function() {
                            $(".silder-next").prop("disabled", false);
                        }, 500);

                        if ((start - 500) < test) {
                            $(".silder-prev").prop("disabled", true);
                        } else {
                            setTimeout(function() {
                                $(".silder-prev").prop("disabled", false);
                            }, 500);
                        }

                    });

            /* 	$(".square-heart-wrapper").click(function() {
            		var color = $(this).css("color");
            		$(this).parent().click(function() {
            			return false;
            		});

            		if (color == 'rgb(154, 154, 154)') {
            			$(this).css("color", "red");
            			$(this).children("i").css("color", "red");
            			$(this).children("i").removeClass("far fa-heart");
            			$(this).children("i").addClass("fas fa-heart");
            			$(this).children("i").css("transition-duration", "0.5s")
            		} else {
            			$(this).css("color", "#9a9a9a");
            			$(this).children("i").css("color", "#9a9a9a");
            			$(this).children("i").removeClass("fas fa-heart");
            			$(this).children("i").addClass("far fa-heart");
            		}

            		$(this).parent().click(function() {
            			return true;
            		});

            	}); */

            var recent = $("#tab-set-header-button-recent");
            var watch = $("#tab-set-header-button-watch");

            var recentdiv = $(".card-set-ad-list");
            var watchdiv = $(".card-set-watchlist");

            recent.click(function() {
                recent.addClass("active-button");
                watch.removeClass("active-button");
                recentdiv.css("display", "flex");
                watchdiv.css("display", "none");
            });

            watch.click(function() {
                recent.removeClass("active-button");
                watch.addClass("active-button");
                recentdiv.css("display", "none");
                watchdiv.css("display", "flex");
            })

            /* $(".ad-card-heart").click(function(event) {
            	var color = $(this).css("color");

            	$(this).parent().click(function() {
            		return false;
            	});

            	if (color == 'rgb(154, 154, 154)') {
            		$(this).css("color", "red");
            		$(this).children("i").css("color", "red");
            		$(this).children("i").removeClass("far fa-heart");
            		$(this).children("i").addClass("fas fa-heart");
            		$(this).children("i").css("transition-duration", "0.5s")
            	} else {
            		$(this).css("color", "#9a9a9a");
            		$(this).children("i").css("color", "#9a9a9a");
            		$(this).children("i").removeClass("fas fa-heart");
            		$(this).children("i").addClass("far fa-heart");
            	}

            	$(this).parent().click(function() {
            		return true;
            	});
            }); */

            $(".more-image-button1").click(
                function() {
                    var newImage = $(this).children('img').attr('src');

                    var path = newImage.substring(0, 29);
                    var name = newImage.substring(31, newImage.length);

                    var trueImage = path + name;


                    $(".vip-ad-main-image").attr('src', trueImage);

                    $(".vip-ad-image_main-image-background").css(
                        'background-image', 'url(' + trueImage + ')');
                });



            $(".heartbtn")
                .click(
                    function() {
                        var className = $("#hearticon").attr("class");
                        var boardNo = $("#inputboardNo").val();
                        var memberId = $("#inputmemberId").val();
                        var wishList = $("#inputwishList").val();

                        if (className == "far fa-heart") {
                            $
                                .ajax({
                                    url: "/insertheart.do",
                                    method: "GEt",
                                    data: {
                                        boardNo: boardNo,
                                    },
                                
                                    dataType: "JSON",
                                    success: function(result) {
                                        if (result > 0) {

                                            $("#hearticon").css(
                                                "color", "red");
                                            $("#hearticon")
                                                .css(
                                                    "transition-duration",
                                                    "0.5s")
                                            $(".heartbtn").css("color",
                                                "red");
                                            $("#hearticon")
                                                .removeClass(
                                                    "far fa-heart");
                                            $("#hearticon").addClass(
                                                "fas fa-heart");

                                            $
                                                .ajax({
                                                    url: "/selectHeart.do",
                                                    method: "get",
                                                    data: {
                                                        boardNo: boardNo
                                                    },
                                                    dataType: "json",
                                                    success: function(
                                                        result) {
                                                        var a = $('<a href="/goList.do?boardNo=' +
                                                            boardNo +
                                                            '" class="active-card">');
                                                        var div1 = $('<div class="ad-card-panel">');
                                                        var div2 = $('<div class="ad-card-image-wrapper">');
                                                        var img = $('<img class="ad-card-image" src="resources/upload/' + result.files[0] + '">');
                                                        div2
                                                            .append(img);
                                                        var div3 = $('<div class="ad-card-content">');
                                                        var p1 = $('<p class="ad-card-title">' +
                                                            result.title +
                                                            '</p>');
                                                        var p2 = $('<p class="ad-card-location">' +
                                                            result.location +
                                                            '</p>');
                                                        var btn = $('<button class="ad-card-heart-watch"><i class="fas fa-heart"></i></button>');
                                                        div3
                                                            .append(
                                                                p1)
                                                            .append(
                                                                p2)
                                                            .append(
                                                                btn);
                                                        div1
                                                            .append(
                                                                div2)
                                                            .append(
                                                                div3);
                                                        a
                                                            .append(div1);
                                                        $(
                                                                ".card-set-watchlist")
                                                            .append(
                                                                a);

                                                    }
                                                });

                                        }

                                    }
                                });
                        } else if (className = "fas fa-heart main-heart") {
                            $.ajax({
                                url: "/deleteheart.do",
                                method: "get",
                                data: {
                                    boardNo: boardNo,
                                    memberId: memberId
                                },
                                dataType: "JSON",
                                success: function(result) {

                                    if (result > 0) {

                                        $("#hearticon").css("color",
                                            "#9a9a9a");
                                        $(".heartbtn").css("color",
                                            "#9a9a9a");
                                        $("#hearticon").css(
                                            "transition-duration",
                                            "0.5s")
                                        $("#hearticon").removeClass(
                                            "fas fa-heart main-heart");
                                        $("#hearticon").addClass(
                                            "far fa-heart");

                                        $(".active-card:last-child").css(
                                            "display", "none")
                                    }
                                }
                            });

                        }
                    });

            function valid() {
                var mem = '${member}';
                if (mem == '') {
                    if (confirm('로그인이 필요합니다')) {
                        location.href = "/login.do";
                    }
                    return false;
                } else {
                    return true;
                }
            }

            /* $(document).on('click', '.ad-card-heart', function(){ */
            $(".ad-card-heart")
                .click(
                    function() {
                        $(this).parents('a').click(function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            return false;
                        });

                        alert($(this).parents('a').attr('href'));

                        var histroyboardNo = $(this).children('input')
                            .val();
                        var memberId = $("#inputmemberId").val();
                        var className = $(this).children('i').attr("class");

                        if (className == "far fa-heart") {
                            $
                                .ajax({
                                    url: "/insertheart.do",
                                    method: "GEt",
                                    data: {
                                        boardNo: histroyboardNo
                                    },
                                    dataType: "JSON",
                                
                                    context: this,
                                    success: function(result) {
                                        if (result > 0) {

                                            $(this).css("color", "red");
                                            $(this).children("i").css(
                                                "color", "red");
                                            $(this)
                                                .children("i")
                                                .removeClass(
                                                    "far fa-heart");
                                            $(this)
                                                .children("i")
                                                .addClass(
                                                    "fas fa-heart main-heart");
                                            $(this)
                                                .children("i")
                                                .css(
                                                    "transition-duration",
                                                    "0.5s");

                                            $
                                                .ajax({
                                                    url: "/selectHeart.do",
                                                    method: "get",
                                                    data: {
                                                        boardNo: histroyboardNo
                                                    },
                                                    dataType: "json",
                                                    success: function(
                                                        result) {
                                                        var a = $('<a href="/goList.do?boardNo=' +
                                                            histroyboardNo +
                                                            '" class="active-card">');
                                                        var div1 = $('<div class="ad-card-panel">');
                                                        var div2 = $('<div class="ad-card-image-wrapper">');
                                                        var img = $('<img class="ad-card-image" src="resources/upload/' + result.files[0] + '">');
                                                        div2
                                                            .append(img);
                                                        var div3 = $('<div class="ad-card-content">');
                                                        var p1 = $('<p class="ad-card-title">' +
                                                            result.title +
                                                            '</p>');
                                                        var p2 = $('<p class="ad-card-location">' +
                                                            result.location +
                                                            '</p>');
                                                        var btn = $('<button class="ad-card-heart-watch"><i class="fas fa-heart"></i></button>');
                                                        div3
                                                            .append(
                                                                p1)
                                                            .append(
                                                                p2)
                                                            .append(
                                                                btn);
                                                        div1
                                                            .append(
                                                                div2)
                                                            .append(
                                                                div3);
                                                        a
                                                            .append(div1);
                                                        $(
                                                                ".card-set-watchlist")
                                                            .append(
                                                                a);

                                                    }
                                                });
                                        }

                                    }
                                });
                        } else if (className = "fas fa-heart main-heart") {
                            $.ajax({
                                url: "/deleteheart.do",
                                method: "get",
                                data: {
                                    boardNo: histroyboardNo,
                                    memberId: memberId
                                },
                                dataType: "JSON",
                                context: this,
                                success: function(result) {

                                    if (result > 0) {

                                        $(this).children('i').css("color",
                                            "#9a9a9a");
                                        $(this).css("color", "#9a9a9a");
                                        $(this).children('i').css(
                                            "transition-duration",
                                            "0.5s")
                                        $(this).children('i').removeClass(
                                            "fas fa-heart main-heart");
                                        $(this).children('i').addClass(
                                            "far fa-heart");

                                        $(".active-card:last-child").css(
                                            "display", "none")
                                    }
                                }
                            });

                        }
                    });

            $(".square-heart-wrapper")
                .click(
                    function() {
                        $(this).parents('a').click(function(e) {
                            e.preventDefault();
                            e.stopPropagation();
                            return false;
                        });

                        alert($(this).parents('a').attr('href'));

                        var boardNo = $(this).children('input').val();
                        var memberId = $("#inputmemberId").val();
                        var className = $(this).children('i').attr("class");

                        if (className == "far fa-heart") {
                            $
                                .ajax({
                                    url: "/insertheart.do",
                                    method: "GEt",
                                    data: {
                                        boardNo: boardNo
                                    },
                                    dataType: "JSON",
                                    context: this,
                                    success: function(result) {
                                        if (result > 0) {

                                            $(this).css("color", "red");
                                            $(this).children("i").css(
                                                "color", "red");
                                            $(this)
                                                .children("i")
                                                .removeClass(
                                                    "far fa-heart");
                                            $(this)
                                                .children("i")
                                                .addClass(
                                                    "fas fa-heart main-heart");
                                            $(this)
                                                .children("i")
                                                .css(
                                                    "transition-duration",
                                                    "0.5s");

                                            $
                                                .ajax({
                                                    url: "/selectHeart.do",
                                                    method: "get",
                                                    data: {
                                                        boardNo: boardNo
                                                    },
                                                    dataType: "json",
                                                    success: function(
                                                        result) {
                                                        var a = $('<a href="/goList.do?boardNo=' +
                                                            boardNo +
                                                            '" class="active-card">');
                                                        var div1 = $('<div class="ad-card-panel">');
                                                        var div2 = $('<div class="ad-card-image-wrapper">');
                                                        var img = $('<img class="ad-card-image" src="resources/upload/' + result.files[0] + '">');
                                                        div2
                                                            .append(img);
                                                        var div3 = $('<div class="ad-card-content">');
                                                        var p1 = $('<p class="ad-card-title">' +
                                                            result.title +
                                                            '</p>');
                                                        var p2 = $('<p class="ad-card-location">' +
                                                            result.location +
                                                            '</p>');
                                                        var btn = $('<button class="ad-card-heart-watch"><i class="fas fa-heart"></i></button>');
                                                        div3
                                                            .append(
                                                                p1)
                                                            .append(
                                                                p2)
                                                            .append(
                                                                btn);
                                                        div1
                                                            .append(
                                                                div2)
                                                            .append(
                                                                div3);
                                                        a
                                                            .append(div1);
                                                        $(
                                                                ".card-set-watchlist")
                                                            .append(
                                                                a);

                                                    }
                                                });
                                        }

                                    }
                                });
                        } else if (className = "fas fa-heart main-heart") {
                            $.ajax({
                                url: "/deleteheart.do",
                                method: "get",
                                data: {
                                    boardNo: boardNo,
                                    memberId: memberId
                                },
                                dataType: "JSON",
                                context: this,
                                success: function(result) {

                                    if (result > 0) {

                                        $(this).children('i').css("color",
                                            "#9a9a9a");
                                        $(this).css("color", "#9a9a9a");
                                        $(this).children('i').css(
                                            "transition-duration",
                                            "0.5s")
                                        $(this).children('i').removeClass(
                                            "fas fa-heart main-heart");
                                        $(this).children('i').addClass(
                                            "far fa-heart");

                                        $(".active-card:last-child").css(
                                            "display", "none")
                                    }
                                }
                            });

                        }

                    });


            $(".ad-card-heart-watch").click(function() {
                $(this).parents('a').click(function(e) {
                    e.preventDefault();
                    e.stopPropagation();
                    return false;
                });

                var boardNo = $(this).children('input').val();
                var memberId = $("#inputmemberId").val();
                var className = $(this).children('i').attr("class");

                if (className == "fas fa-heart") {
                    $.ajax({
                        url: "/deleteheart.do",
                        method: "get",
                        data: {
                            boardNo: boardNo,
                            memberId: memberId
                        },
                        dataType: "JSON",
                        context: this,
                        success: function(result) {
                            if (result > 0) {
                                $("#hearticon").css("color",
                                    "#9a9a9a");
                                $(".heartbtn").css("color",
                                    "#9a9a9a");
                                $("#hearticon").css(
                                    "transition-duration",
                                    "0.5s")
                                $("#hearticon").removeClass(
                                    "fas fa-heart main-heart");
                                $("#hearticon").addClass(
                                    "far fa-heart");
                                $(this).parents(".active-card").css("display", "none");
                            }

                        }

                    });
                }
            });


            $(".leaf-button").click(function() {

                $(this).parents(".customer-review-form-header").next().css("display", "flex")
                $(this).parents(".customer-review-form-header").next().next().css("display", "block")
                $(".leaf-button").removeClass('on');
                $(".leaf-button").removeClass('off');

                $(this).addClass('on').prevAll('button').addClass('on');
                $(this).addClass('on').nextAll('button').addClass('off');

                var numbering = $(".on").length;

                var finalScore = numbering * 2;
                $("[name=ratingScore]").val(finalScore);

            });

            var customerClass = $(".customer-review-form-realbody1").css("display")

            $(".customer-review-form-header1").click(function() {
                $(this).next().toggle();
                $(this).next().next().toggle();
                $(this).next().next().next().toggle();

            });

            $("#commenthead").click(function() {
                $(".ifnone").toggle();
            });


            $("[name=updateComment]").click(function() {
                $(this).parents(".customer-panel-body-standard-shadow").css("display", "none");
                $(this).parents(".customer-panel-body-standard-shadow").next().children("div").css("display", "flex");
                $(this).parents(".customer-panel-body-standard-shadow").next().children(".customer-review-form-header").css("display", "flex");
            });


            $("[name=deleteComment]").click(function() {
                var check = confirm("삭제하시겠습니까?");
                var commentNo = $("[name=commentNo]").val();
                var reviewboardNo = $("[name=reviewBoardNo]").val();
                if (check) {
                    location.href = "/deleteComment.do?commentNo=" + commentNo + "&reviewboardNo=" + reviewboardNo;
                } else {
                    return false;
                }

            });


            $("[name=insertRecomment]").click(function() {
                $(this).parents(".customer-panel-body-standard-shadow").next().next().children("div").css("display", "flex");
            });

            $(".customer-review-submit1").click(function() {
                $(this).parents("#closeReset").css("display", "none");
                $(this).parents("#closeReset").prev().css("display", "none");
            });


            $(".deleteRecomment").click(function() {
                var check = confirm("삭제하시겠습니까?");
                var commentNo = $("[name=commentNo]").val();
                var reviewboardNo = $("[name=reviewBoardNo]").val();
                if (check) {
                    location.href = "/deleteRecomment.do?commentNo=" + commentNo + "&reviewboardNo=" + reviewboardNo;
                } else {
                    return false;
                }

            });

            function deleteBoard() {
                if (confirm("삭제하시겠습니까?")) {
                    location.href = "/deleteBoard.do?boardNo=${board.boardNo}";
                    return true;
                } else {
                    return false;
                }
            }
            $(document).on('mousewheel', '#myModal', function() {
                var wheel = $(window).scrollTop();
                // 스크롤 값을 가져온다.
                if (wheel > 120 && wheel < 2340) {
                    $(this).css({
                        'position': 'fixed',
                        'top': '0'
                    });
                } else if (wheel < 120) {
                    $(this).css({
                        'position': 'absolute',
                        'top': '-58px'
                    });
                } else {
                    $(this).css({
                        'position': 'absolute',
                        'bottom': '-120px',
                        'top': 'auto'
                    });
                }
            });
            //신고 확인
            function submit() {
                var check = window.confirm("정말 신고하시겠습니까?");
                if (check) {
                    return true;
                } else {
                    return false;
                }
            }

        </script>
        <jsp:include page="footer.html" />
    </div>
</body>

</html>
