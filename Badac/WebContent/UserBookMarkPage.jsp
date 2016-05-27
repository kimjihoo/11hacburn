<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>즐겨 찾기</title>

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
	function toCompany() {
		var tempComId = $(this).attr(tempData[i].companyId);
		document.cookie = "companyID=" + tempComId;
		location.href = "http://210.118.74.159:8100/Badac/show_member";
	};
</script>
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
															"company_lat" : data.companyLng
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
													'<div class="row"><div class="col-md-7"><a href="#"><img class="img-responsive" src="http://placehold.it/700x300" alt=""></a></div><div class="col-md-5">'
															+ '<h3>'
															+ memberData[tempData[i].companyId].company_name
															+ '</h3>'
															+ '<h4>'
															+ memberData[tempData[i].companyId].company_address
															+ '</h4>'
															+ '<p>'
															+ memberData[tempData[i].companyId].company_telephone
															+ '</p>'
															+ '<button type="button" class="btn btn-default btn-lg" onclick="toCompany()"> <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 업체 페이지 </button>'
															+ '</div></div>'
															+ '<hr>');
									/* document.getElementById(""
											+ tempData[i].companyId + "").onclick = function() {
										var tempComId = $(this).attr('id');
										document.cookie = "companyID="
												+ tempComId;
										location.href = "http://210.118.74.159:8100/Badac/show_member";
									}; */
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
					<button type="button" class="btn btn-default btn-lg" id="' + tempData[i].companyId'"> <span class="glyphicon glyphicon-star" aria-hidden="true"></span> 업체 페이지 </button>
			<!-- Pagination -->
			<div class="row text-center">
				<div class="col-lg-12">
					<ul class="pagination">
						<li><a href="#">&laquo;</a></li>
						<li class="active"><a href="#">1</a></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&raquo;</a></li>
					</ul>
				</div>
			</div>
			<!-- /.row -->

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