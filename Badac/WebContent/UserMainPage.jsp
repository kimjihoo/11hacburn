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
							
							var imageSrc = "http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
							 var imageSize = new daum.maps.Size(24, 35); 
							    
							    // 마커 이미지를 생성합니다    
							 var markerImage = new daum.maps.MarkerImage(imageSrc, imageSize); 
							 var memberData = {};
							 memberData[0] = {"aa":1};
							$.get("http://210.118.74.159:8100/Badac/member_list", function(data){
								if(data.msg=="Success"){
									
									var tempData = data.memberList;
									var marker={};
									for(var i = 0; i<tempData.length; i++){
										
											memberData[tempData[i].id] = {
													"company_id": tempData[i].id,
													"company_name": tempData[i].name,
													"company_address": tempData[i].region2 + " " + tempData[i].region3,
													"company_telephone" : tempData[i].telephone,
													"company_lng" : tempData[i].lng,
													"company_lat" : tempData[i].lat
													}

											var templng = parseFloat(memberData[tempData[i].id].company_lat);
											var templat = parseFloat(memberData[tempData[i].id].company_lng);
											
											positions[i] = {
																											id: memberData[tempData[i].id].company_id,
										                 latlng: new daum.maps.LatLng(templat, templng)
										                 };
											//alert(memberData[tempData[i].id].company_lat+", "+memberData[tempData[i].id].company_lng);
											//alert(positions.length);
											var markers = new daum.maps.Marker({
							                     map: map, // 마커를 표시할 지도
							                     position: positions[i].latlng, // 마커의 위치
							                     image : markerImage, // 마커 이미지 
							                     clickable: true,
							                     title: memberData[tempData[i].id].company_id,
							                 });
											marker[i] = markers;
											
											(function(i){
												daum.maps.event.addListener(marker[i], "click", function(){
													var iwContent = '<div style="padding:5px;"><table class="table table-hover" id="region_member_list"><tr><td rowspan="3"><img src="http://placehold.it/80x80"/></td><td id="'+parseInt(marker[i].getTitle())+'">'+memberData[parseInt(marker[i].getTitle())].company_name+'</td></tr><tr><td>'+ memberData[parseInt(marker[i].getTitle())].company_address +'</td></tr><tr><td>'+ memberData[parseInt(marker[i].getTitle())].company_telephone +'</td></tr></table></div>',
													iwRemoveable = true;
													document.getElementById(""+parseInt(marker[i].getTitle())+"").onclick = function(){
														var tempComId2 = $(this).attr('id');
														document.cookie = "companyID="+tempComId2;
														location.href = "http://210.118.74.159:8100/Badac/show_member";
													};
													var infoWindow = new daum.maps.InfoWindow({
														content : iwContent,
														removable : iwRemoveable
													});
													infoWindow.open(map,marker[i]);
												});
											})(i);

	           									//마커 클릭리스너
	           								/*daum.maps.event.addListener(markers, 'click', function() {
	        	   								//alert(markers.title);
	        	  								//alert(memberData[markers.title].company_id);
	        	  								alert(memberData[parseInt(markers.getTitle())].company_id);
	        	   								var table = $('#click_member_list');
	 
	        		   							$('#click_member_list').append('<tr><td rowspan="3" ><img src="http://placehold.it/140x140"/></td><td>'+ memberData[parseInt(markers.getTitle())].company_name+'</td></tr>');
	      										$('#click_member_list').append("<tr><td>"+ memberData[parseInt(markers.getTitle())].company_address +"</td></tr>");
	      										$('#click_member_list').append("<tr><td>"+ memberData[parseInt(markers.getTitle())].company_telephone+"</td></tr>"); 
	     
											});*/
										}
					
									
									for (var j = 0; j <tempData.length; j++){				// 이미지 경로 확인!
										$('#region_member_list').append('<tr><td rowspan="3"  ><img src="http://placehold.it/140x140"/></td><td id="'+memberData[tempData[j].id].company_id+'">'+ memberData[tempData[j].id].company_name +'</td></tr>');
										document.getElementById(""+memberData[tempData[j].id].company_id+"").onclick = function(){
											var tempComId = $(this).attr('id');
											document.cookie = "companyID="+tempComId;
											location.href = "http://210.118.74.159:8100/Badac/show_member";
										};
										$('#region_member_list').append("<tr><td>"+ memberData[tempData[j].id].company_address +"</td></tr>");
										$('#region_member_list').append("<tr><td>"+ memberData[tempData[j].id].company_telephone +"</td></tr>");

									} 
								}
								else{
									alert(data.msg);
								}
							});

             


	</script>

</body>
</html>