<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/button.css" rel="stylesheet">
<title>업체 정보</title>

<style>
body {
	padding-top: 70px;
	font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%,rgba(0,0,0,0.3) 100%), url('img/mainbg.jpg');
    background-size: cover;
    -o-background-size: cover;
}

.button-group {
	margin: 1px;
}

.footer {
	padding: 5px;
}
.col-md-4 > h3{
	font-family:  "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
	color: black;
}
#reviewtable {
	text-align:center;
    font-size:16px;
    border-collapse: collapse;
    border-spacing: 0;
	width:790px;
	background-color: #fff;
}

#reviewtable td, #reviewtable th {
    text-align: center;
    padding: 8px;
}


#reviewtable th {
    padding-top: 11px;
    padding-bottom: 11px;
    background-color: #4CAF50;
    color: white;
}
#reviewtable #header{
    background-color: #de615e;
    color:white;

}
.table #reviewtable{
	text-align:center;
}

 
</style>
<script type="text/javascript"
	src="http://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03"></script>
<script>    
    ////////////////////////////////////////////////////////
    <%// 쿠키값 가져오기
			Cookie[] cookies = request.getCookies();

    		int companyid = 0;
    		int userid = 0;

			if (cookies != null) {

				for (int i = 0; i < cookies.length; i++) {
					Cookie c = cookies[i];

					if( c.getName().equals("companyID") ){
		            	companyid = Integer.parseInt(c.getValue());
		            }
					if( c.getName().equals("user_id") ){
		            	userid = Integer.parseInt(c.getValue());
		            }
				}
			}%>
    
			var companyId = '<%= companyid %>';
			var userId = '<%= userid %>';

	///////////////////////////////////////////////////////////////////
</script>
<script>
onload = function on_load() {
	var lat = 0;
	var lng = 0;
	
	$.get("http://210.118.74.159:8100/Badac/get_member_info",
		{
			id : companyId,
		},function(data) {
			if (data.msg == "Success") {
				document.getElementById("company_name").innerHTML = data.companyName;
				document.getElementById("company_ownername").innerHTML = data.companyOwnerName;
				document.getElementById("company_telephone").innerHTML = data.companyTelephone;
				document.getElementById("company_region_1").innerHTML = data.companyRegion_1 + " " + data.companyRegion_2
				+ " " + data.companyRegion_3;
				lat = data.companyLat;
				lng = data.companyLng;
			} else {
				alert(data.msg);
			}
		});
	$.get("http://210.118.74.159:8100/Badac/check_bookmark",
			{
				user_id : userId,
				company_id : companyId,
			},function(data) {
				if (data.msg == "Success") {
					if(data.chk==-1){
						document.getElementById("bookBtn").innerHTML = "즐겨찾기 추가";
					}else{
						document.getElementById("bookBtn").innerHTML = "즐겨찾기 삭제";
					}
				} else {
					alert(data.msg);
				}
			});
	$.get("http://210.118.74.159:8100/Badac/company_review_list",{
		company_id : companyId,
	},function(data){
		if(data.msg=="Success"){
			var tempData = data.reviewList;
			var reviewList = {};
			for(var i=0; i<tempData.length; i++){
				reviewList[tempData[i].companyId] = {
						"username": tempData[i].username,
						"review":tempData[i].review,
						}
			}
			var reviewtable = document.getElementById("reviewtable");
			var tr;
			var td;
			var btn;
			for(var i=0; i<tempData.length; i++){
				tr = document.createElement('tr');
				td = document.createElement('td');
				td.appendChild(document.createTextNode(reviewList[tempData[i].companyId].username));
				tr.appendChild(td);
				td = document.createElement('td');
				td.appendChild(document.createTextNode(reviewList[tempData[i].companyId].review));
				tr.appendChild(td);
				reviewtable.appendChild(tr);
			}
		}else{
			alert(data.msg);
		}
	});
	var img_c = document.getElementById("img_c");
	var main_img_c = document.getElementById("main_img_c");
	$.get("http://210.118.74.159:8100/Badac/get_company_picture_list",{id:companyId,},
            function (data) {
                if (data.msg == 'Success') {
                    for (var g = 0; g < data.pictureList.length; g++) {
                    	if(data.pictureList[g].chk==1){
                    		var gall_img = document.createElement('img');
                        	gall_img.src=data.pictureList[g].path;
                        	gall_img.style.borderRadius="6px";
                        	gall_img.style.width="400px";
                        	gall_img.style.height="350px";
                        	
                        	gall_img.style.padding="1px";
                        	gall_img.style.border="1px solid #021a40";

                        	gall_img.style.borderRadius="5px";
                        	
                        	main_img_c.appendChild(gall_img);
                    	}else{
                    		var span_c = document.createElement('span');
                        	span_c.style.width="250px";
                        	span_c.style.height="200px";
                        	var gall_img = document.createElement('img');
                        	gall_img.src=data.pictureList[g].path;
                        	gall_img.style.borderRadius="6px";
                        	gall_img.style.width="250px";
                        	gall_img.style.height="200px";
                        	span_c.appendChild(gall_img);
                        	img_c.appendChild(span_c);
                    	}
                    }
                }
            });
}

function add_bookmark(){
	$.get("http://210.118.74.159:8100/Badac/check_bookmark",
			{
				user_id : userId,
				company_id : companyId,
			},function(data) {
				if (data.msg == "Success") {
					if(data.chk==-1){
						$.post("http://210.118.74.159:8100/Badac/add_bookmark",{
							user_id : userId,
							company_id : companyId,
						}, function(data){
							if(data.msg=="Success"){
								alert("Success Add Bookmark");
								location.href="http://210.118.74.159:8100/Badac/show_member";
							}else{
								alert(data.msg);
							}
						});
					}else{
						$.post("http://210.118.74.159:8100/Badac/delete_bookmark",{
							user_id : userId,
							company_id : companyId,
						}, function(data){
							if(data.msg=="Success"){
								alert("Success Delete Bookmark");
								location.href="http://210.118.74.159:8100/Badac/go_my_bookmark_page";
							}else{
								alert(data.msg);
							}
						});
					}
				} else {
					alert(data.msg);
				}
			});
	
}

function upload_review(){
	var reviewText = document.getElementById("reviewText");
	$.post("http://210.118.74.159:8100/Badac/upload_review",{
		company_id : companyId,
		user_id : userId,
		review : reviewText.value
	},function(data){
		if(data.msg=="Success"){
			location.href = "http://210.118.74.159:8100/Badac/show_member"
		}else{
			alert(data.msg);
		}
	});
}
</script>
<style>
.row {
	padding-top: 10px;
}
</style>
</head>
<body>

	<div class="container">
		<!-- Portfolio Item Heading -->
		<div class="row">
		<div class="jumbotron"style="margin:0 auto; background: rgb(200, 54, 54); background: rgba(169, 169, 169, 0.5); ">
			<div class="row col-lg-12">
				<h2 class="page-header">Company Information</h2>
			</div>

			<div class="col-md-8" id="main_img_c">
			</div>

			<div class="col-md-4" style='font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;'>
			
				<h3>업체명</h3>
				
				<div class="panel panel-default">
				  <div class="panel-body" id="company_name">

				  </div>
				</div>

				<h3>대표자</h3>
				<div class="panel panel-default">
				  <div class="panel-body" id="company_ownername">

				  </div>
				</div>				
				<h3>전화번호</h3>
				<div class="panel panel-default">
				  <div class="panel-body" id="company_telephone">

				  </div>
				</div>
		
				<h3>주소</h3>
				<div class="panel panel-default">
				  <div class="panel-body" id="company_region_1">

				  </div>
				</div>
			</div>
			
			<div class="row">

			<h3 class="page-header">Company Photo</h3>

			<div class="form-group">
				<div class="vCeneter" id="img_c">
					
				</div>
			</div>
			</div>
			<div class="row">

				<h3 class="page-header">Map</h3>
	
			<div class="col-lg-6">
				<div id="map" style="height:500px; width:1000px; text-align:center; margin:0 auto;"></div>
			</div>
			</div>
			<div class="row" >
			<h3 class="page-header">Review</h3>	
			<div class="table">
			<table width=700
				style="text-align:center;" id="reviewtable">
				<tr>
					<td id="header" style="width:20%;">작성자</td>
					<td id="header" style="width:80%;">리뷰</td>
				</tr>
			</table>
			</div>
			<div class="form-inline" style="text-align:center;">
				<input type="text" id="reviewText" class="form-control" style="width:790px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn-small" value="등록" onclick = "upload_review();"/>
			</div><br>

			</div>
			<div id="button-page">
				<a class="btn" href="http://210.118.74.159:8100/Badac/go_my_bookmark_page"
					role="button">목록</a> <a class="btn"
					href="http://210.118.74.159:8100/Badac/write_application" role="button">견적서요청</a> <a
					class="btn" href="#" role="button" onclick="add_bookmark();" id="bookBtn">북마크 추가</a>
			</div>
			</div>
			</div>
		</div>

	<!-- /.container -->

	<script>
	var point_x;
	var point_y;
	var memberAddress;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

var map = new daum.maps.Map(mapContainer, mapOption); 
	
	$.get("http://210.118.74.159:8100/Badac/get_member_address",{
		id: companyId,
	},function(data){
		if(data.msg=="Success"){
			point_x = data.companyLat;
			point_y = data.companyLng;
	
			map.setCenter(new daum.maps.LatLng(parseFloat(point_y), parseFloat(point_x)));
			var markerPosition  = new daum.maps.LatLng(parseFloat(point_y), parseFloat(point_x)); 

			// 마커를 생성합니다
			var marker = new daum.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			var markerPosition  = new daum.maps.LatLng(parseFloat(point_y), parseFloat(point_x)); 

	         // 마커를 생성합니다
	         var marker = new daum.maps.Marker({
	             position: markerPosition
	         });

	         // 마커가 지도 위에 표시되도록 설정합니다
	         marker.setMap(map);

		}else{
			alert(data.msg);
		}
	});
		
	</script>

</body>
</html>
