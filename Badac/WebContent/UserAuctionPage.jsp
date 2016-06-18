<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래 목록</title>
<link href="css/button.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
}
</style>
<script>
	onload = function on_load() {
		$
				.get(
						"http://210.118.74.159:8100/Badac/my_application_list",
						{
							userId : userId,
						},
						function(data) {
							if (data.msg == "Success") {
								var applicationData = {};
								var tempData = data.applicationList;
								var table_c = document
										.getElementById('my_applicationListTable');
								var tr;
								var td;
								var title_var;

								for (var i = 0; i < tempData.length; i++) {
									applicationData[tempData[i].id] = {
										"tunning_id" : tempData[i].id,
										"tunning_title" : tempData[i].title,
										"tunning_date" : tempData[i].date
									}
									tr = document.createElement('tr');
									for (var j = 0; j < 3; j++) {
										td = document.createElement('td');
										switch (j) {
										case 0:
											td
													.appendChild(document
															.createTextNode(applicationData[tempData[i].id].tunning_id));
											break;
										case 1:
											title_var = document
													.createElement('p');
											title_var.style.cursor = "pointer";
											title_var.id = applicationData[tempData[i].id].tunning_id;
											title_var
													.appendChild(document
															.createTextNode(applicationData[tempData[i].id].tunning_title));
											title_var.onclick = function() {
												var tempP_id = $(this).attr(
														'id');
												document.cookie = "tunningID="
														+ tempP_id + ";";
												location.href = "http://210.118.74.159:8100/Badac/show_application"
											};
											td.appendChild(title_var);
											break;
										case 2:
											var tunningDate = applicationData[tempData[i].id].tunning_date;
											td
													.appendChild(document
															.createTextNode(tunningDate));
											break;
										default:
											break;
										}
										tr.appendChild(td);
									}
									table_c.appendChild(tr);
								}
							} else {
								alert(data.msg);
							}
						});
	}
</script>
</head>
<body>

	<div class="contentwrap">
		<article class="container">
		<div class="page-header">
			<h1>
				거래 <small>목록</small>
			</h1>
		</div>

		<div class="container">
			<!-- 테이블 시작 -->
			<table class="table table-hover"
				style="width: 100%; text-align: center;">
				<thead>
					<tr>
						<td style="width: 10%;">번호</td>
						<td style="width: 40%;">제목</td>
						<td style="width: 15%;">가격</td>
						<td style="width: 10%;">지역</td>
						<td style="width: 10%;">거래방식</td>
						<td style="width: 15%;">글쓴이</td>
					</tr>
				</thead>
				<tbody id="my_applicationListTable"
					style="width: 100%; text-align: center;">

				</tbody>
			</table>
			<!-- 테이블 종료 -->

			<!-- 등록버튼 시작 -->
			<table class="table table-hover" cellspacing=0 cellpadding=0 border=0
				width=500>
				<thead>
					<a class="btn"
						href="http://210.118.74.159:8100/Badac/write_application"
						role="button">등록</a>
				</thead>
			</table>
			<!-- 등록버튼 종료 -->
		</div>
</body>
</html>
