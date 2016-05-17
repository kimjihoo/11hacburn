<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>

<script type="text/javascript"
	src="https://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03&libraries=services"></script>

<script>
onload = function on_load(){
$.get("http://210.118.74.159:8100/Badac/member_list", function(data){
	if(data.msg=="Success"){
		var memberData = {};
		var tempData = data.memberList;

		for(var i = 0; i<tempData.length; i++){
	
				memberData[tempData[i].id] = {
						"company_id": tempData[i].id,
						"company_name": tempData[i].name,
						"company_address": tempData[i].region2 + " " + tempData[i].region3,
						"company_telephone" : tempData[i].telephone
						}
		
			}
		for (var j = 0; j <5; j++)
			{				// 이미지 경로 확인!
				$('#region_member_list').append('<tr><td rowspan="3" ><img src="http://placehold.it/140x140"/></td><td>'+ memberData[tempData[j].id].company_name +'</td></tr>');
				$('#region_member_list').append("<tr><td>"+ memberData[tempData[j].id].company_address +"</td></tr>");
				$('#region_member_list').append("<tr><td>"+ memberData[tempData[j].id].company_telephone +"</td></tr>");
			}
	}
	else{
		alert(data.msg);
	}
});
}
</script>

<style>
body {
	padding-top: 70px;
}
</style>

<script type="text/javascript">
	
	function userLogout(){
		location.href = "http://210.118.74.159:8100/Badac/user_logout";
	}
	function writeApplication(){
		location.href = "http://210.118.74.159:8100/Badac/write_application";
	}
</script>
</head>
<body>

	<div class="container-fluid">

		<div class="col-lg-2 col-sm-2"></div>
		<div class="col-lg-6 col-sm-6" id="map" style="height: 500px;"></div>
		<div class="col-lg-4 col-sm-4">
			<table class="table table-hover" id="region_member_list">

			</table>
		</div>
	</div>

	<script>
windows.onload = function(){
		$.get("http://apis.daum.net/local/geo/addr2coord?apikey=3a654d3947433483eca1b853767e0d03&q="+userAddress+"&output=json", function(data){
					alert(data);
		});
};
</script>

	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addr2coord(userAddress, function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="padding:5px;">우리집</div>'
        });
        infowindow.open(map, marker);
        
        map.setCenter(new daum.maps.LatLng(37.537183, 127.005454));
    } 
});    
	</script>

</body>
</html>