<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>업체 정보</title>
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
			alert("등록을 완료했습니다.");
			location.href = "http://210.118.74.159:8100/Badac/show_member"
		}else{
			alert(data.msg);
		}
	});
}
</script>
<style>
body {
	padding-top: 70px;
}

.row {
	padding-top: 10px;
}
</style>
</head>
<body>

	<div class="container">

		<!-- Portfolio Item Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h2 class="page-header">Company Information</h2>
			</div>
		</div>
		<!-- /.row -->

		<!-- Portfolio Item Row -->
		<div class="row">

			<div class="col-md-8">
				<img class="img-responsive" src="http://placehold.it/750x500" alt="">
			</div>

			<div class="col-md-4">
				<h3>업체명</h3>
				<p class="form-control" id="company_name"></p>
				<h3>대표자</h3>
				<p class="form-control" id="company_ownername"></p>
				<h3>전화번호</h3>
				<p class="form-control" id="company_telephone"></p>				
				<h3>주소</h3>
				<p class="form-control" id="company_region_1"></p>

			</div>

		</div>
		<!-- /.row -->

		<!-- Related Projects Row -->
		<div class="row">

			<div class="col-lg-12">
				<h3 class="page-header">Company Photo</h3>
			</div>

			<div class="col-sm-3 col-xs-6">
				<a href="#"> <img class="img-responsive portfolio-item"
					src="http://placehold.it/500x300" alt="">
				</a>
			</div>

			<div class="col-sm-3 col-xs-6">
				<a href="#"> <img class="img-responsive portfolio-item"
					src="http://placehold.it/500x300" alt="">
				</a>
			</div>

			<div class="col-sm-3 col-xs-6">
				<a href="#"> <img class="img-responsive portfolio-item"
					src="http://placehold.it/500x300" alt="">
				</a>
			</div>

			<div class="col-sm-3 col-xs-6">
				<a href="#"> <img class="img-responsive portfolio-item"
					src="http://placehold.it/500x300" alt="">
				</a>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">Map</h3>
			</div>
			<div class="col-md-4 col-xs-6">
				<div id="map" style="height: 300px;"></div>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">Review</h3>
			</div>
			<div style="width:100%; text-align:center;">
				<textarea id="reviewText" class="col-lg-6"></textarea><input type="button" value="등록" onclick = "upload_review();"/>
			</div>
			<table class="table table-hover" width=700
				style="text-align: center;" id="reviewtable">
				<tr>
					<td style="width:20%;">작성자</td>
					<td style="width:80%;">리뷰</td>
				</tr>
			</table>
		</div>

		<div class="row">
			<div class="col-lg-12" id="button-page">
				<a class="btn btn-default" href="http://210.118.74.159:8100/Badac/go_my_bookmark_page"
					role="button">목록</a> <a class="btn btn-default"
					href="http://210.118.74.159:8100/Badac/write_application" role="button">견적서요청</a> <a
					class="btn btn-default" href="#" role="button" onclick="add_bookmark();" id="bookBtn"></a>
			</div>
		</div>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<script>
	var point_x;
	var point_y;
	var memberAddress;
	var container = document.getElementById('map');
	var options;
	var map;
	$.get("http://210.118.74.159:8100/Badac/get_member_address",{
		id:companyId,
	},function(data){
		if(data.msg=="Success"){
			point_x = data.companyLat;
			point_y = data.companyLng;
			var temp_x = parseFloat(point_x);
			var temp_y = parseFloat(point_y);
			container = document.getElementById('map');
			options = {
				center : new daum.maps.LatLng(temp_x, temp_y),
				level : 3
			};

			map = new daum.maps.Map(container, options);
		}else{
			alert(data.msg);
		}
	});
		
	</script>

</body>
</html>
