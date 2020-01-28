<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://apis.openapi.sk.com/tmap/js?version=1&format=javascript&appKey=853698d6-5a08-4161-962b-70fc9df74f1f"></script>

<script>
function initTmap(){
	var map = new Tmap.Map({
		div:'map_div',
		width : "100%",
		height : "500px",
	});
	map.setCenter(new Tmap.LonLat("126.986072", "37.570028").transform("EPSG:4326", "EPSG:3857"), 12);
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
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
	var marker = new Tmap.Marker(new Tmap.LonLat("127.07389565460413","37.5591696189164").transform("EPSG:4326", "EPSG:3857"), icon);
	markerWaypointLayer.addMarker(marker);

	var size = new Tmap.Size(24, 38);
	var offset = new Tmap.Pixel(-(size.w / 2), -size.h);
	var icon = new Tmap.IconHtml("<img src='http://tmapapis.sktelecom.com/upload/tmap/marker/pin_b_m_p.png' />", size, offset);
	var marker = new Tmap.Marker(new Tmap.LonLat("127.13346617572014", "37.52127761904626").transform("EPSG:4326", "EPSG:3857"), icon);
	markerWaypointLayer.addMarker(marker);

	markerWaypointLayer2.clearMarkers();
	
	
	//3.주소변환 API 요청하기
 	$.ajax({
	method:"GET",
	url:"https://apis.openapi.sk.com/tmap/geo/fullAddrGeo?version=1&format=xml&callback=result", //FullTextGeocoding api 요청 url입니다.
	async:false,
	data:{
		"coordType" : "WGS84GEO",//지구 위의 위치를 나타내는 좌표 타입입니다.
		"fullAddr" : "서울시 마포구 와우산로29가길 69", //주소 정보 입니다, 도로명 주소 표준 표기 방법을 지원합니다.  
		"appKey" : "853698d6-5a08-4161-962b-70fc9df74f1f",//실행을 위한 키 입니다. 발급받으신 AppKey(appKey)를 입력하세요.
	},
	//데이터 로드가 성공적으로 완료되었을 때 발생하는 함수입니다.
	success:function(response){
		prtcl = response; 
		var lon, lat;
		if($intRate[0].getElementsByTagName("lon").length>0){//구주소
			lon = $intRate[0].getElementsByTagName("lon")[0].childNodes[0].nodeValue;
		   	lat = $intRate[0].getElementsByTagName("lat")[0].childNodes[0].nodeValue;
		}else{//신주소
			lon = $intRate[0].getElementsByTagName("newLon")[0].childNodes[0].nodeValue;
			lat = $intRate[0].getElementsByTagName("newLat")[0].childNodes[0].nodeValue;
		}
		
		 var lonEntr, latEntr;
		 if($intRate[0].getElementsByTagName("lonEntr")[0] == undefined && $intRate[0].getElementsByTagName("newLonEntr")[0] ==undefined){
			lonEntr=0;
			latEntr=0;
		}else{
			if($intRate[0].getElementsByTagName("lonEntr").length>0){//구주소
				lonEntr = $intRate[0].getElementsByTagName("lonEntr")[0].childNodes[0].nodeValue;
				latEntr = $intRate[0].getElementsByTagName("latEntr")[0].childNodes[0].nodeValue;
		    	
			}else{//신주소
				lonEntr = $intRate[0].getElementsByTagName("newLonEntr")[0].childNodes[0].nodeValue
				latEntr = $intRate[0].getElementsByTagName("newLatEntr")[0].childNodes[0].nodeValue
			}
		}
		
	}
 	});
	
	// 4. 경로 탐색 API 사용요청
	var startX = 127.02810900563199;
	var startY = 37.519892712436906;
	var endX = 127.13281976335786;
	var endY = 37.52130314703887;
	/* var passList = "127.07389565460413,37.5591696189164_127.13346617572014 , 37.52127761904626"; */
	var prtcl;
	var headers = {}; 
	headers["appKey"]="853698d6-5a08-4161-962b-70fc9df74f1f";
	$.ajax({
			method:"POST",
			headers : headers,
			url:"https://apis.openapi.sk.com/tmap/routes?version=1&format=xml",//
			async:false,
			data:{
				startX : startX,
				startY : startY,
				endX : endX,
				endY : endY,
			/* 	passList : passList, */
				reqCoordType : "WGS84GEO",
				resCoordType : "EPSG3857",
				angle : "172",
				searchOption : "0",
				trafficInfo : "Y" //교통정보 표출 옵션입니다.
			},
			success:function(response){
				prtcl = response;
				
			var innerHtml ="";
			var prtclString = new XMLSerializer().serializeToString(prtcl);//xml to String	
				xmlDoc = $.parseXML( prtclString ),
				$xml = $( xmlDoc ),
				$intRate = $xml.find("Document");
		    	
				var tDistance = " 총 거리 : "+($intRate[0].getElementsByTagName("tmap:totalDistance")[0].childNodes[0].nodeValue/1000).toFixed(1)+"km,";
				var tTime = " 총 시간 : "+($intRate[0].getElementsByTagName("tmap:totalTime")[0].childNodes[0].nodeValue/60).toFixed(0)+"분";	
				/* var tFare = " 총 요금 : "+$intRate[0].getElementsByTagName("tmap:totalFare")[0].childNodes[0].nodeValue+"원,";	
				var taxiFare = " 예상 택시 요금 : "+$intRate[0].getElementsByTagName("tmap:taxiFare")[0].childNodes[0].nodeValue+"원"; */	

				$("#result").text(tDistance+tTime/* +tFare+taxiFare */);
				//5. 경로탐색 결과 Line 그리기
				//출발지,도착지 마커 제거
				markerStartLayer.clearMarkers();
				markerEndLayer.clearMarkers();
				//경유지 마커 제거
				markerWaypointLayer.clearMarkers();
								
				var trafficColors = {
						extractStyles:true,
						
						/* 실제 교통정보가 표출되면 아래와 같은 Color로 Line이 생성됩니다. */
						trafficDefaultColor:"#009900", //Default
						trafficType1Color:"#009900", //원할
						trafficType2Color:"#009900", //지체
						trafficType3Color:"#009900"  //정체
						
					};    
				var kmlForm = new Tmap.Format.KML(trafficColors).readTraffic(prtcl);
				routeLayer = new Tmap.Layer.Vector("vectorLayerID"); //백터 레이어 생성
				routeLayer.addFeatures(kmlForm); //교통정보를 백터 레이어에 추가   
				
				map.addLayer(routeLayer); // 지도에 백터 레이어 추가
				
				markerWaypointLayer2 = new Tmap.Layer.Markers("waypoint2");
				map.addLayer(markerWaypointLayer2);
				
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
		error:function(request,status,error){
			console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
}); 
	

	
}

	

</script> 
</head>
<body onload="initTmap()">
<div id ="map_div">
</div>
<span id ="result"></span>
</body>
</html>