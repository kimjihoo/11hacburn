<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ã��</title>
<style>
body {
	padding-top: 70px;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.3.js"
	integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">BADOC</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">�����
						���� <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href=""><img src="http://placehold.it/130x100"
								alt=".." /></a></li>
						<li><a id="name"></a></li>
						<li><a id="email"></a></li>
						<li class="divider"></li>
						<li><a href="http://localhost:8100/Badac/user_logout">�α׾ƿ�</a></li>
						<li><a
							href="http://localhost:8100/Badac/go_user_update_information">��������
								����</a></li>
						<li><a href="#">���� ��û ���� ����</a></li>
						<li><a href="http://localhost:8100/Badac/write_application">����
								���ȼ� �ۼ�</a></li>

					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<p class="lead">���� ���ã�� ���</p>
				<div class="list-group">
					<a href="#" class="list-group-item">��õ�� ������</a> <a href="#"
						class="list-group-item">���� ������</a> <a href="#"
						class="list-group-item">�˷��� ������</a>
				</div>
			</div>

			<div class="col-md-9">
				<div class="row carousel-holder">
					<div class="col-md-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<img class="slide-image" src="http://placehold.it/800x300"
										alt="">
								</div>
								<div class="item">
									<img class="slide-image" src="http://placehold.it/800x300"
										alt="">
								</div>
								<div class="item">
									<img class="slide-image" src="http://placehold.it/800x300"
										alt="">
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-example-generic"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="../images/samchuly.png" width="320" height="150" alt="" />
							<div class="caption">
								<h4 class="pull-right"></h4>
								<h4>
									<a href="#">��õ�� ������</a>
								</h4>
								<p>
									���� ��õ�������Ŵ� 1944�⿡ â���Ͽ� �� ���� ������ ��ȭ�� �ɰ� ���ٴ� �� ����Ͽ� ������, ���ó� �ѱ�
									�ִ��� ������ ����Ŀ�� ���� ������ �Խ��ϴ�.<br> <a target="_blank"
										href="http://www.samchuly.co.kr">��õ�� ������ -
										www.samchuly.co.kr</a>.
								</p>
							</div>
							<div class="ratings">
								<p class="pull-right">11 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="../images/altonsports.png" width="320" height="150"
								alt="" />
							<div class="caption">
								<h4>
									<a href="#">���� ������</a>
								</h4>
								<p>
									"������ ���� ���� ��Ÿ��"�̶�� ����Ʒ� ������ ���踦 �����ؿ� ���潺������ ������ ������ ���� ����ũ
									����������� �����ϰ� �ֽ��ϴ�.<br> <a target="_blank"
										href="http://www.altonsports.com/home">���� ������ -
										www.altonsports.com/home</a>.
								</p>
							</div>
							<div class="ratings">
								<p class="pull-right">7 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>

					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
							<img src="/Badac/WebContent/images/alexbicycle.png" width="320"
								height="150" alt="" />
							<div class="caption">
								<h4>
									<a href="#">�˷��� ������</a>
								</h4>
								<p>
									�ȳ��ϼ���. <br> �˷��������Ÿ� �湮���ּż� �����մϴ�.<br> �������������, �ε�������
									���� �� �Ǹ� �������Դϴ�. <br> <a target="_blank"
										href="http://www.alrex.co.kr/">�˷��������� - www.alrex.co.kr</a>.
								</p>
							</div>
							<div class="ratings">
								<p class="pull-right">3 reviews</p>
								<p>
									<span class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star"></span> <span
										class="glyphicon glyphicon-star-empty"></span> <span
										class="glyphicon glyphicon-star-empty"></span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /.container -->

</body>
</html>