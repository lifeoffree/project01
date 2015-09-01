<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
  <meta charset="euc-kr">

<title>구매 결과</title>

</head>
<style>
#a {
font-family: 굴림체;
}
</style>
<body>
<div id ="a">
  <h1>구매결과</h1>
  구매갯수 : ${count}<br>
  수령 :  ${color}<br>
  감사합니다
  <h1>수령 위치조회</h1>
  <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
  <script>
    function initialize() {
        var Y_point      = 37.494552;    // Y 좌표
        var X_point     = 127.028161;   // X 좌표

        var zoomLevel   = 17;           // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼

        var markerTitle   = "비트시계";        // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
        var markerMaxWidth  = 300;            // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

        // 말풍선 내용
        var contentString = '<div>' +
        '<h2>BiT시계</h2>'+
        '<p>정품 1위 쇼핑몰 (평생 A/S보장)<br />' +
              ' 100% 본사정품 전문매장 방문환영.<br />' + 
              '(비트교육센터 빌딩 501호)</p>' +
        '</div>';

        var myLatlng = new google.maps.LatLng(Y_point, X_point);
        var mapOptions = {
                  zoom: zoomLevel,
                  center: myLatlng,
                  mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

        var marker = new google.maps.Marker({
                            position: myLatlng,
                            map: map,
                            title: markerTitle
        });

        var infowindow = new google.maps.InfoWindow(
                              {
                                content: contentString,
                                maxWidth: markerMaxWidth
                              }
        );

        google.maps.event.addListener(marker, 'click', function() {
          infowindow.open(map, marker);
        });
      }
    </script>
  </head>
  <body onload="initialize()">
    <div id="map_view" style="width:500px; height:300px;"></div>
    <br>
    서울시 서초구 서초동 1327-15 (강남역 5번출구 50m)<br>
    비트아카데미 빌딩 501호 <br>
</div>
</body>
</html>
