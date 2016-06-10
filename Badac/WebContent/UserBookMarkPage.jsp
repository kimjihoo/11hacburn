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
</head>
<script>
	onload = function on_load() {
		var len = 0;

		$
				.get(
						"http://210.118.74.159:8100/Badac/show_my_bookmark",
						{
							user_id : userId,
						},
						function(data) {
							if (data.msg == "Success") {
								var tempData = data.bookmarkList;
								var memberData = {};

								for (var i = 0; i < tempData.length; i++) {
									$
											.ajax({
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
													'<div class="col-md-3 col-sm-6 hero-feature"><div class="thumbnail"><img src="'+(memberData[tempData[i].companyId].company_main_picture).substring(6)+'" width=200px, height=200px>'
															+ '<div class="caption">'
															+ '<h3>'
															+ memberData[tempData[i].companyId].company_name
															+ '</h3>'
															+ '<h4>'
															+ memberData[tempData[i].companyId].company_address
															+ '</h4>'
															+ '<br>'
															+ '<p>'
															+ memberData[tempData[i].companyId].company_telephone
															+ '</p>'
															+ '<input type="button" class="btn btn-primary" id="'+tempData[i].companyId+'" value="업체 페이지 이동">'
															+ '</div></div></div>');
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
		<div class="container">
			<!-- Jumbotron Header -->
			<header class="jumbotron hero-spacer" style="text-align: center;">
			<h1>My BookMark List</h1>
			<h3>What your Favorite</h3>
			</header>
			<div class="row text-center" style="text-align: center; margin:0 auto;">
				<div id="region_member_list"></div>
			</div>
			
			<hr>
			
			<!-- Footer -->
			<footer>
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