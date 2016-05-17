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
	onload = function on_load() {
		var temp1 = document.getElementById("userIdDiv");
		var temp2 = document.getElementById('userNameDiv');
		var temp3 = document.getElementById('userEmailDiv');

		temp1.appendChild(document.createTextNode(userId));
		temp2.appendChild(document.createTextNode(userName));
		temp3.appendChild(document.createTextNode(userEmail));
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
				<p>first company</p>
				<h3>대표자</h3>
				<p>first company</p>
				<h3>전화번호</h3>
				<p>first company</p>
				<h3>사이트</h3>
				<p>www.www</p>
				<h3>주소</h3>
				<p>first company</p>

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
		</div>

		<div class="row">
			<div class="col-lg-12" id="button-page">
				<a class="btn btn-default" href="UserSearchCompany.jsp"
					role="button">목록</a> <a class="btn btn-default"
					href="UserApplicationRegistPage.jsp" role="button">견적서요청</a> <a
					class="btn btn-default" href="#" role="button">즐겨찾기추가</a>
			</div>
		</div>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

	<script>
		var container = document.getElementById('map');
		var options = {
			center : new daum.maps.LatLng(33.450701, 126.570667),
			level : 3
		};

		var map = new daum.maps.Map(container, options);
	</script>

</body>
</html>
