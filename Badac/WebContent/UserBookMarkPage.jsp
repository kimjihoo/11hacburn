<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>즐겨찾기</title>
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
				<p class="lead">나의 즐겨찾기 목록</p>
				<div class="list-group">
					<a href="#" class="list-group-item">삼천리 자전거</a> <a href="#"
						class="list-group-item">알톤 스포츠</a> <a href="#"
						class="list-group-item">알렉스 자전거</a>
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
									<a href="#">삼천리 자전거</a>
								</h4>
								<p>
									저희 삼천리자전거는 1944년에 창업하여 이 땅의 자전거 문화를 심고 가꾸는 데 노력하여 왔으며, 오늘날 한국
									최대의 자전거 메이커로 성장 발전해 왔습니다.<br> <a target="_blank"
										href="http://www.samchuly.co.kr">삼천리 자전거 -
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
									<a href="#">알톤 스포츠</a>
								</h4>
								<p>
									"경험해 보지 못한 스타일"이라는 모토아래 자전거 업계를 선도해온 알톤스포츠는 세계적 수준의 종합 바이크
									전문기업으로 도약하고 있습니다.<br> <a target="_blank"
										href="http://www.altonsports.com/home">알톤 스포츠 -
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
									<a href="#">알렉스 자전거</a>
								</h4>
								<p>
									안녕하세요. <br> 알렉스자전거를 방문해주셔서 감사합니다.<br> 전문산악자전거, 로드자전거
									수리 및 판매 전문점입니다. <br> <a target="_blank"
										href="http://www.alrex.co.kr/">알렉스자전거 - www.alrex.co.kr</a>.
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