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
<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
<style>
    .wrap2 {left: 0;bottom: 40px;width: 288px;height: 132px;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap2 * {padding: 0;margin: 0;}
    .wrap2 .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap2 .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info2 .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info2 .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info2 .close:hover {cursor: pointer;}
    .info2 .body {position: relative;overflow: hidden;}
    .info2 .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info2 .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info2:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('http://i1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info2 .link {color: #5085BB;}
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

		<div class="container">


		<div class="col-lg-8 col-sm-8" id="map" style="height: 800px;"></div>
		<div class="col-lg-4 col-sm-4" style="overflow-y:scroll; height:800px;">
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
													"company_address_1":tempData[i].region2,
													"company_address_2":tempData[i].region3,
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
													//var iwContent = '<div style="padding:5px;"><table class="table table-hover" id="region_member_list"><tr><td rowspan="3"><img src="http://placehold.it/80x80"/></td><td id="'+parseInt(marker[i].getTitle())+'">'+memberData[parseInt(marker[i].getTitle())].company_name+'</td></tr><tr><td>'+ memberData[parseInt(marker[i].getTitle())].company_address +'</td></tr><tr><td>'+ memberData[parseInt(marker[i].getTitle())].company_telephone +'</td></tr></table></div>',
													var content = '<div class="wrap">'+
																		'<div class="info">'+
																			'<div class="title">'
																			memberData[parseInt(marker[i].getTitle())].company_name+
																				'<div class="close" onclick="closeOverlay()" title="닫기"></div>'+
																				+ '<div class="comID" id ="'+memberData[parseInt(marker[i].getTitle())].company_id+'" style="visibility:hidden;"></div>' +
																				'</div>'+
																				'<div class="body">'+
																					'<div class="img">'+
																						'<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'+
																					'</div>'+
																					'<div class="desc">'+
																						'<div class="ellipsis">'+
																						memberData[parseInt(marker[i].getTitle())].company_address_1+'</div>'+
																						'<div class="jibun ellipsis">'+
																						memberData[parseInt(marker[i].getTitle())].company_address_2+'</div>'+
																						'<div><input type="button" value="업체 페이지 방문" id="'+memberData[parseInt(marker[i].getTitle())].company_id+'" onclick="document.cookie= "companyID="+'+$(this).attr('id')+';location.href="http://210.118.74.159:8100/Badac/show_member";"/></div>'+
																					'</div>'+
																					'</div>'+
																					'</div>'+
																					'</div>';
																				
													//iwRemoveable = true;
													/*var infoWindow = new daum.maps.InfoWindow({
														content : iwContent,
														removable : iwRemoveable
													});
													infoWindow.open(map,marker[i]);*/
													

													var overlay=new daum.maps.CustomOverlay({
														content:content,
														map:map,
														position:marker[i].getPosition()
													});

													document.getElementByClassName("title").onclick = function(){
														var tempComId = $('.comID').attr('id');
														$('#click_member_list').html('<tr><td rowspan="3" ><img src="http://placehold.it/140x140"/></td><td>'+ memberData[parseInt(tempComId)].company_name+'</td></tr><tr><td>'+ memberData[parseInt(tempComId)].company_address +'</td></tr><tr><td>'+ memberData[parseInt(tempComId)].company_telephone+'</td></tr>');
				  			
													};
													
													overlay.setMap(map);
													
													function closeOverlay(){
														overlay.setMap(null);
													}
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
					
									
									/*for (var j = 0; j <tempData.length; j++){				// 이미지 경로 확인!
										$('#region_member_list').append('<tr><td rowspan="3"  ><img src="http://placehold.it/140x140"/></td><td id="'+memberData[tempData[j].id].company_id+'">'+ memberData[tempData[j].id].company_name +'</td></tr>');
										document.getElementById(""+memberData[tempData[j].id].company_id+"").onclick = function(){
											var tempComId = $(this).attr('id');
											document.cookie = "companyID="+tempComId;
											location.href = "http://210.118.74.159:8100/Badac/show_member";
										};
										$('#region_member_list').append("<tr><td>"+ memberData[tempData[j].id].company_address +"</td></tr>");
										$('#region_member_list').append("<tr><td>"+ memberData[tempData[j].id].company_telephone +"</td></tr>");

									} */
									for (var j = 0; j <tempData.length; j++){				// 이미지 경로 확인!
										$('#region_member_list').append('<tr><td><div class="wrap2">'+
												'<div class="info2">'+
												'<div class="title">'+
												memberData[tempData[j].id].company_name+
													'</div>'+
													'<div class="body">'+
														'<div class="img">'+
															'<img src="http://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">'+
														'</div>'+
														'<div class="desc">'+
															'<div class="ellipsis">'+
															memberData[tempData[j].id].company_address_1+'</div>'+
															'<div class="jibun ellipsis">'+
															memberData[tempData[j].id].company_address_2+'</div>'+
															'<div><input type="button" value="업체 페이지 방문" id="'+memberData[tempData[j].id].company_id+'"/></div>'+
														'</div>'+
														'</div>'+
														'</div>'+
														'</div></td></tr>');
										document.getElementById(""+memberData[tempData[j].id].company_id+"").onclick = function(){
											var tempComId = $(this).attr('id');
											document.cookie = "companyID="+tempComId;
											location.href = "http://210.118.74.159:8100/Badac/show_member";
										};
										
	
										
    		   							
								}}
								else{
									alert(data.msg);
								}
							});

	</script>

</body>
</html>