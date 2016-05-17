<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이 페이지</title>

<style>
body {
	margin-top: 70px;
}

.lead {
	padding-left: 5px;
}
</style>
</head>
<body>
	<div id="wrapper">

		<div class="container">
			<!-- Page Heading -->
			<div class="row">
				<!-- Sidebar Menu Items  -->
				<div class="col-md-3">
					<p class="lead">마이페이지</p>
					<div class="list-group">
						<a
							href="http://210.118.74.159:8100/Badac/go_user_update_information"
							class="list-group-item">개인정보수정</a> <a
							href="http://210.118.74.159:8100/Badac/go_my_application_page"
							class="list-group-item">견적요청서조회</a> <a href="#"
							class="list-group-item">즐겨찾는매장</a> <a href="#"
							class="list-group-item">탈퇴신청</a>
					</div>
				</div>

				<div class="col-md-9">

					<h1 class="page-header">
						마이페이지 <small>My Page</small>
					</h1>

					<div class=" col-lg-4 text-center">
						<div class="panel panel-default">
							<div class="panel-body">
								<img id="panel-img1" alt="image"
									src="http://placehold.it/100x100"> <a
									href="http://210.118.74.159:8100/Badac/go_user_update_information"><h3>개인정보수정</h3></a>
								<hr>
								<p>개인정보를 수정 및 관리할 수 있습니다.</p>
							</div>
						</div>
					</div>


					<div class=" col-lg-4 text-center">
						<div class="panel panel-default">
							<div class="panel-body">
								<img id="panel-img2" alt="image"
									src="http://placehold.it/100x100"> <a
									href="http://210.118.74.159:8100/Badac/go_my_application_page"><h3>견적요청서조회</h3></a>
								<hr>
								<p>견적요청서를 신규작성하거나 작성한 견적요청서를 조회 및 수정할 수 있습니다.</p>
							</div>
						</div>


					</div>
					<div class="col-lg-4 text-center">
						<div class="panel panel-default">
							<div class="panel-body">
								<img id="panel-img3" alt="image"
									src="http://placehold.it/100x100"> <a href="#"><h3>즐겨찾는매장</h3></a>
								<hr>
								<p>즐겨찾는 가맹업체의 매장 목록을 확인할 수 있습니다.</p>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- /#row -->
		</div>
		<!-- /#container -->

	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
