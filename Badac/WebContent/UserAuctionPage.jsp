<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�ŷ� ���</title>
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
				�ŷ� <small>���</small>
			</h1>
		</div>

		<div class="container">
			<!-- ���̺� ���� -->
			<table class="table table-hover"
				style="width: 100%; text-align: center;">
				<thead>
					<tr>
						<td style="width: 10%;">��ȣ</td>
						<td style="width: 40%;">����</td>
						<td style="width: 15%;">����</td>
						<td style="width: 10%;">����</td>
						<td style="width: 10%;">�ŷ����</td>
						<td style="width: 15%;">�۾���</td>
					</tr>
				</thead>
				<tbody id="my_applicationListTable"
					style="width: 100%; text-align: center;">

				</tbody>
			</table>
			<!-- ���̺� ���� -->

			<!-- ��Ϲ�ư ���� -->
			<table class="table table-hover" cellspacing=0 cellpadding=0 border=0
				width=500>
				<thead>
					<a class="btn"
						href="http://210.118.74.159:8100/Badac/write_application"
						role="button">���</a>
				</thead>
			</table>
			<!-- ��Ϲ�ư ���� -->
		</div>
</body>
</html>
