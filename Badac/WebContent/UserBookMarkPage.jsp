<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨 찾기</title>
<!-- Custom CSS -->
<link href="css/one-page-wonder.css" rel="stylesheet">
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
													'<div class="featurette"><img class="featurette-image img-circle img-responsive pull-right" src="'+(memberData[tempData[i].companyId].company_main_picture).substring(6)+'" width="500" height="500">'
															+ '<h2 class="featurette-heading">'
															+ memberData[tempData[i].companyId].company_name
															+ '<span class="text-muted">'
															+ memberData[tempData[i].companyId].company_telephone
															+ '</span>'
															+ '</h2>'
															+ '<p class="lead">'
															+ memberData[tempData[i].companyId].company_address
															+ '</p>'
															+ '<input type="button" class="btn btn-default btn-lg" id="'+tempData[i].companyId+'" value="업체 페이지 이동">'
															+ '</div>'
															+ '<hr class="featurette-divider">');
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
		<!-- Full Width Image Header -->
		<header class="header-image">
		<div class="headline">
			<div class="container">
				<h1>My BookMark List</h1>
				<h2>What your Favorite</h2>
			</div>
		</div>
		</header>
		<div class="container">
			<hr class="featurette-divider">
			<div id="region_member_list"></div>
			
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