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
<style>
body {
	padding-top: 70px;
}
</style>
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
													'<div class="row"><div class="col-md-7"><a href="#"><img class="img-responsive" src="'+(memberData[tempData[i].companyId].company_main_picture).substring(6)+'" width="200" height="150" alt=""></a></div><div class="col-md-5">'
															+ '<h3>'
															+ memberData[tempData[i].companyId].company_name
															+ '</h3>'
															+ '<h4>'
															+ memberData[tempData[i].companyId].company_address
															+ '</h4>'
															+ '<p>'
															+ memberData[tempData[i].companyId].company_telephone
															+ '</p>'
															+ '<input type="button" class="btn btn-default btn-lg" id="'+tempData[i].companyId+'" value="업체 페이지 이동">'
															+ '</div></div>'
															+ '<hr>');
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
			<div class="page-header">
				<h1>
					My BookMark <small> List </small>
				</h1>
			</div>
		</div>

		<div class="container">
			<div id="region_member_list"></div>
			

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

</body>
</html>