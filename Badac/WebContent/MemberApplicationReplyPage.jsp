<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='memberNav.jsp' />
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
							companyId : companyId,
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
<script>
function answerReply() {
	var tunning_reply = document.getElementById("tunning_reply");
	
	if (tunning_reply.value == "") {
		alert("답변을 입력하세요.");
		title.focus();
		return;
	}
	
	$
			.post(
					"http://210.118.74.159:8100/Badac/application_reply_regist",
					{
						tunningId : tunningId,
						tunningCompanyId : companyId,
						reply : tunning_reply.value,
					},
					function(data) {
						if (data.msg == "Success") {							
							alert("등록이 완료되었습니다.");
							location.href="http://210.118.74.159:8100/Badac/login_page";
						} else {
							alert(data.msg);
						}
					});
}
</script>
</head>
<body>
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
				<td><textarea class="form-control" id="tunning_reply" rows="10"></textarea></td>
			</tr>
		</table>
		<span style="float: right"><button class="btn btn-default"
				type="submit" onclick="answerReply()">등록</button> <a class="btn btn-default"
			href="http://210.118.74.159:8100/Badac/member_main_page" role="button">목록</a></span>
	</div>	
</body>
</html>