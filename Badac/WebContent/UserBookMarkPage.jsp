<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���ã��</title>
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
</style>
</head>
<body>

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
							<img src="./Badac/WebContent/images/samchuly.png" width="320" height="150" alt="" />
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
							<img src="/Badac/WebContent/images/altonsports.png" width="320" height="150"
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
							<img src="/Badac/WebContent/images/alrexbicycle.png" width="320"
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