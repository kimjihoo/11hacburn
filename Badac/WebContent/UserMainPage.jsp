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


		<div class="col-lg-6 col-sm-6" id="map" style="height: 500px;"></div>
		<div class="col-lg-3 col-sm-3" style="overflow-y:scroll; height:800px;">
			<table class="table table-hover" id="region_member_list">

			</table>
		</div>
				<div class="col-lg-3 col-sm-3">
							<table class="table table-hover" id="click_member_list">

							</table>
				</div>
		
	</div>



	<script>
	// 수정!(지도 좌표받아오기)
			
					var point_x;
					var point_y;

						$.ajax({
						  dataType: "jsonp",
						  url: "http://apis.daum.net/local/geo/addr2coord?apikey=3a654d3947433483eca1b853767e0d03&q="+userAddress+"&output=json",
						  async : false,
						  success : function( data ) {
							  /* alert(data.channel.item[0].point_x); */
							  point_x = data.channel.item[0].point_x;
							  point_y = data.channel.item[0].point_y;
						  }
						});
						var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
						 var imageSize = new daum.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						 var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
						
						
						
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(point_x, point_x), // 지도의 중심좌표
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
								        
								        map.setCenter(new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng));
								
								    } 
								});
							
							var positions = [];
							$.get("http://210.118.74.159:8100/Badac/member_list", function(data){
								if(data.msg=="Success"){
									var memberData = {};
									var tempData = data.memberList;

									for(var i = 0; i<tempData.length; i++){

										//alert(lng_x+", "+lat_y);
											memberData[tempData[i].id] = {
													"company_id": tempData[i].id,
													"company_name": tempData[i].name,
													"company_address": tempData[i].region2 + " " + tempData[i].region3,
													"company_telephone" : tempData[i].telephone,
													"company_lng" : tempData[i].lng,
													"company_lat" : tempData[i].lat
													}
											positions[i] = {id : memberData[tempData[i].id].company_id,
										                 latlng: new daum.maps.LatLng(memberData[tempData[i].id].company_lat, memberData[tempData[i].id].company_lng)
										                 };
											alert(memberData[tempData[i].id].company_lat+", "+memberData[tempData[i].id].company_lng);
											alert(positions.length);
											var marker = new daum.maps.Marker({
							                     map: map, // 마커를 표시할 지도
							                     position: positions[i].latlng, // 마커의 위치
							                     clickable : true,
							                     image : markerImage // 마커 이미지 
							                 });
											var infowindow = new daum.maps.InfoWindow({
							                     content: positions[i].content // 인포윈도우에 표시할 내용
							                 });
											marker.setMap(map); 
							                 // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
							                 // 이벤트 리스너로는 클로저를 만들어 등록합니다 
							                 // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							                 daum.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
							                 daum.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
							                 
							                 //마커 클릭리스너
							                 daum.maps.event.addListener(marker, 'click', function() {
																       			$('#click_member_list').append('<tr><td rowspan="3" ><img src="http://placehold.it/140x140"/></td><td>'+ memberData[position[i].id].company_name +'</td></tr>');
																      				$('#click_member_list').append("<tr><td>"+ memberData[position[i].id].company_address +"</td></tr>");
																      				$('#click_member_list').append("<tr><td>"+ memberData[position[i].id].company_telephone +"</td></tr>");   
							               		});  
										}
									
									
									for (var j = 0; j <tempData.length; j++){				// 이미지 경로 확인!
										$('#region_member_list').append('<tr><td rowspan="3" ><img src="http://placehold.it/140x140"/></td><td>'+ memberData[tempData[j].id].company_name +'</td></tr>');
										$('#region_member_list').append("<tr><td>"+ memberData[tempData[j].id].company_address +"</td></tr>");
										$('#region_member_list').append("<tr><td>"+ memberData[tempData[j].id].company_telephone +"</td></tr>");
									} 
								}
								else{
									alert(data.msg);
								}
							});

             // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
             function makeOverListener(map, marker, infowindow) {
                 return function() {
                     infowindow.open(map, marker);
                 };
             }

             // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
             function makeOutListener(infowindow) {
                 return function() {
                     infowindow.close();
                 };
             }


	</script>

</body>
</html>