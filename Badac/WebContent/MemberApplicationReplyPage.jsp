<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>견적 요청서 답변</title>
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
	crossorigin="anonymous">
</script>
<script>    
    ////////////////////////////////////////////////////////
    <%// 쿠키값 가져오기
			Cookie[] cookies = request.getCookies();

			int tunningid = 0;

			if (cookies != null) {

				for (int i = 0; i < cookies.length; i++) {
					Cookie c = cookies[i];

					if (c.getName().equals("tunningID")) {
						tunningid = Integer.parseInt(c.getValue());
					}
				}
			}%>
    
    var tunningId = '<%=tunningid%>';

	///////////////////////////////////////////////////////////////////
</script>	
<script>
	onload = function on_load() {
		$
				.get(
						"http://210.118.74.159:8100/Badac/get_application_info_2",
						{
							tunningId : tunningId,
						},
						function(data) {
							if (data.msg == "Success") {
								document.getElementById("tunning_date").value = data.date;
								document.getElementById("tunning_id").value = data.id;
								document.getElementById("tunning_name").value = data.name;
								document.getElementById("tunning_title").value = data.title;
								document.getElementById("tunning_explanation").value = data.explanation;
							} else {
								alert(data.msg);
							}
						});
	}
</script>
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
		<table class="table table-hover" width=700
				style="text-align: center;">
				<tr>
					<td style="width: 35%;"><b>날짜</b></td>
					<td><input class="form-control" type="text" id="tunning_date"
						readonly></td>
				</tr>
				<tr>
					<td style="width: 35%;"><b>코드</b></td>
					<td><input class="form-control" type="text" id="tunning_id"
						readonly></td>
				</tr>
				<tr>
					<td style="width: 35%;"><b>이름</b></td>
					<td><input class="form-control" type="text" id="tunning_name"
						readonly></td>
			</tr>
				<tr>
					<td style="width: 35%;"><b>제목</b></td>
					<td><input class="form-control" type="text" id="tunning_title"
						readonly></td>
				</tr>
				<tr>
					<td style="width: 35%;"><b>이미지</b></td>
					<td><div class="form-group">
							<div class="vCeneter">
								<span> <img src="http://placehold.it/340x180"
									class="img-responsive" id="tunning_image"
									alt="Responsive image"></span>
							</div>
						</div>
						<p class="help-block">첨부된 자전거 사진</p> <br /></td>
				</tr>
				<tr>
					<td style="width: 35%;"><b>내용</b></td>
					<td width=350><input class="form-control" type="text"
						id="tunning_explanation" readonly></td>
				</tr>
			</table>
		<br> <br> <br>

		<table class="table table-hover" width=700 style="text-align: center;">
			<tr>
				<td style="width: 35%;"><b>답변</b></td>
				<td><textarea class="form-control" rows="10"></textarea></td>
			</tr>
		</table>
		<span style="float: right"><button class="btn btn-default"
				type="submit">등록</button> <a class="btn btn-default"
			href="MemberMainPage.jsp" role="button">목록</a></span>
	</div>
	
	
</body>
</html>