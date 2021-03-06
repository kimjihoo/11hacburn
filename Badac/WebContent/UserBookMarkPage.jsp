<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>즐겨 찾기</title>
<!-- Custom CSS -->
<link href="css/heroic-features.css" rel="stylesheet">
<script type="text/javascript"
	src="https://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03&libraries=services">	
</script>
<link href="css/button.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
	font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
    background: url('img/simplebikebg.png') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%,rgba(0,0,0,0.3) 100%), url('img/bookmarkbg.jpg');
    background-size: cover;
    -o-background-size: cover;
}
</style>
</head>
<script>
	onload = function on_load() {
		var len = 0;

		$.get(
		"http://210.118.74.159:8100/Badac/show_my_bookmark",
			{
				user_id : userId,
			},
			function(data) {
				if (data.msg == "Success") {
					var tempData = data.bookmarkList;
					var memberData = {};

					for (var i = 0; i < tempData.length; i++) {
						$.ajax({
									url : 'http://210.118.74.159:8100/Badac/get_member_info',
									type : 'GET',
									data : {
										id : tempData[i].companyId
									},
									async : false,
									success : function(data) {
										if (data.msg == 'Success') {
											memberData[tempData[i].companyId] = {
												"company_name" : data.companyName,
												"company_address" : data.companyRegion_2
														+ " "
														+ data.companyRegion_3,
												"company_telephone" : data.companyTelephone,
												"company_lng" : data.companyLat,
												"company_lat" : data.companyLng,
												"company_main_picture" : data.main_picture
											}
										} else {
											alert(data.msg);
										}
									},
									error : function(data) {
										alert(data.msg);
									}
								});
					}
					for (var i = 0; i < tempData.length; i++) {

						$('#region_member_list')
								.append(
										'<div class="col-md-3 col-sm-6 hero-feature" style="background-color: rgba(255, 255, 255, 0.8); width: 305px; height: 420px; border: 1px solid silver; border-radius: 3px; margin: 5px 3px 5px 3px; padding: 2px 2px 2px 2px;"><div class="caption" style="width: 300px; height: 320px;"><img src="'+(memberData[tempData[i].companyId].company_main_picture).substring(6)+'" width=180px, height=150px>'
												+ '<h3>'
												+ memberData[tempData[i].companyId].company_name
												+ '</h3>'
												+ '<h4>'
												+ memberData[tempData[i].companyId].company_address
												+ '</h4>'
												+ '</div>'
												+ '<div style="width: 300px; height: 80px;">'
												+ '<p>'
												+ memberData[tempData[i].companyId].company_telephone
												+ '</p>'
												+ '<input type="button" class="btn" id="'+tempData[i].companyId+'" value="업체 페이지 이동">'
												+ '</div></div>');
						document.getElementById(""
								+ tempData[i].companyId + "").onclick = function() {
							var tempComId = $(this).attr('id');
							document.cookie = "companyID="
									+ tempComId;
							location.href = "http://210.118.74.159:8100/Badac/show_member";
						};
					}

				} else {
					alert(data.msg);
				}
			});
	}
</script>
<body>
	<div class="contentwrap">		
		<div class="container" style="text-align: center; margin:0 auto;">
			<!-- Jumbotron Header -->
			<header class="jumbotron hero-spacer" style="width: 80%; text-align: center; margin:0 auto;">
			<h1>My BookMark List</h1>
			<h3>What your Favorite</h3>
			</header>
			<div class="row text-center" style="width:936px; text-align: center; left:0; right:0; margin-left:auto; margin-right:auto;">
				<div id="region_member_list"></div>
			</div>
			
			<hr>
			
			<!-- Footer -->
			<footer style="width: 80%; text-align: center; margin:0 auto; border-radius: 5px;">
			<div class="row">
				<div class="col-lg-12">
					<p>Copyright &copy; Badoc Corporation 2016</p>
				</div>
			</div>
			<!-- /.row -->
			</footer>
		</div>
	</div>
	
	<!-- jQuery -->
    <script src="js/jquery.js"></script>

</body>
</html>