<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>견적 요청서 목록 보기</title>
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
					data-toggle="dropdown" role="button" aria-expanded="false">사용자
						정보 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href=""><img src="http://placehold.it/130x100"
								alt=".." /></a></li>
						<li><a id="name"></a></li>
						<li><a id="email"></a></li>
						<li class="divider"></li>
						<li><a href="http://localhost:8100/Badac/user_logout">로그아웃</a></li>
						<li><a
							href="http://localhost:8100/Badac/go_user_update_information">개인정보
								수정</a></li>
						<li><a href="#">견적 요청 내역 보기</a></li>
						<li><a href="http://localhost:8100/Badac/write_application">견적
								제안서 작성</a></li>

					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<div class="container">
		<!-- 테이블 시작 -->
		<table class="table table-hover">
			<caption>견적 요청서 목록</caption>
			<colgroup>
				<col width="15%" />
				<col width="45%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody .table-hover>
				<tr>
					<td>5</td>
					<td><a href="UserMyApplicationView.jsp">Badac의 견적 요청서 5</a></td>
					<td>Badac</td>
					<td>2016-04-27</td>
				</tr>
				<tr>
					<td>4</td>
					<td><a href="UserMyApplicationView.jsp">Badac의 견적 요청서 4</a></td>
					<td>Badac</td>
					<td>2016-04-27</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="UserMyApplicationView.jsp">Badac의 견적 요청서 3</a></td>
					<td>Badac</td>
					<td>2016-04-27</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="UserMyApplicationView.jsp">Badac의 견적 요청서 2</a></td>
					<td>Badac</td>
					<td>2016-04-27</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="UserMyApplicationView.jsp">Badac의 견적 요청서 1</a></td>
					<td>Badac</td>
					<td>2016-04-27</td>
				</tr>
			</tbody>
		</table>
		<!-- 테이블 종료 -->
	</div>
</body>
</html>