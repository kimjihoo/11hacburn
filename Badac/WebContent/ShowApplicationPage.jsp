<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>견적 요청서 보기</title>
<style>
body {
	padding-top: 70px;
}
</style>
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
						"http://210.118.74.159:8100/Badac/get_application_info",
						{
							tunningId : tunningId,
						},
						function(data) {
							if (data.msg == "Success") {
								document.getElementById("tunning_date").value = data.date;
								document.getElementById("tunning_id").value = data.id;
								document.getElementById("tunning_title").value = data.title;
								document.getElementById("tunning_explanation").value = data.explanation;
							} else {
								alert(data.msg);
							}
						});
	}

	function delApplication() {
		$
				.post(
						"http://210.118.74.159:8100/Badac/delete_application",
						{
							tunningId : tunningId,
						},
						function(data) {
							if (data.msg == "Success") {
								alert("제안서를 삭제했습니다.");
								location.href = "http://210.118.74.159:8100/Badac/go_my_application_page";
							} else {
								alert(data.msg);
							}
						});
	}
</script>
</head>
<body>

	<!-- /.container -->
	</nav>
	<div class="contentwrap">
		<article class="container">
		<div class="page-header">
			<h1>
				견적 요청서 <small>보기</small>
			</h1>
		</div>

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

			<table cellspacing=0 cellpadding=0 border=0 width=500>
				<tr>
					<td>
						<button class="btn btn-default" type="submit"
							onclick="delApplication()">삭제</button>
					</td>
				</tr>
			</table>
		</div>
		</article>
	</div>
</body>
</html>
