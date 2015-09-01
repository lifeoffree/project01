<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=true"></script>
<script type="text/javascript">
var infoWin = new google.maps.InfoWindow(); //말풍선

window.onload = initLocation;

function initLocation(){
  var myLoc = getLocation();
  if(myLoc == null) return false;
  
  myLocation(myLoc);
}

function getLocation(){
  if(navigator.geolocation){  // geolocation 객체지원여부
    return navigator.geolocation;
  }
  document.getElementById("map_show").innerHTML = "<b>위치정보 지원 안함</b>";
  return null;
}


function myLocation(myLoc){
  myLoc.getCurrentPosition(function(position){// getCurrentPosition() 최초 위치를 얻음
    //var lat = position.coords.latitude; //위도를 얻음
    //var lon = position.coords.longitude;  //경도를 얻음
    //console.log('======>'+lat);
    //console.log('=>>>>>>'+lon);
    //구글맵사용
    var initLoc = new google.maps.LatLng(37.545776, 127.104906);
    
    console.log('=>>>>>>'+initLoc);
    var map = new google.maps.Map(
      document.getElementById("map_show"),
      {
        zoom: 16,
        mapTypeId:google.maps.MapTypeId.ROADMAP // 2d
//        mapTypeId:google.maps.MapTypeId.SATELLITE //위성사진
      }
    );
    map.setCenter(initLoc); // 현재 위치를 지도 중앙에 표시
    
    //말풍선
    infoWin.setContent("me : " + lat + "," + lon);
    infoWin.setPosition(initLoc);
    infoWin.open(map);
  }); 
}
</script>
</head>
<body>
<h2>GoogleMap</h2>
<div id="map_show" style="width:100%; height:100%;"></div>
</body>
</html>