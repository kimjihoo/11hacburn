<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<jsp:include page='memberNav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
<style>
.listimage {
	width: 114px;
	height: 114px;
	list-style-position: inside;
	list-style-image: url(/pororo.jpg);
	list-style-type: disc;
}
</style>
<script type="text/javascript">
	onload = function on_load(){
		$.get("http://210.118.74.159:8100/Badac/application_list",{
			id : companyId
		},
			function(data){
				if(data.msg=="Success"){
					var applicationData = {};
					var tempData = data.applicationList;
					var table_c = document.getElementById('applicationListTable');
					var tr;
					var td;
					var title_var;
					
					for(var i = 0; i<tempData.length; i++){
						applicationData[tempData[i].id] = {
							"tunning_id": tempData[i].id,
							"tunning_title": tempData[i].title,
							"tunning_date": tempData[i].date,
							"tunning_chk": tempData[i].chk
						}
						tr = document.createElement('tr');
						for(var j = 0; j<4; j++){
							td = document.createElement('td');
							switch(j){
							case 0:
								td.appendChild(document.createTextNode(applicationData[tempData[i].id].tunning_id));
								break;
							case 1:
								title_var = document.createElement('p');
								title_var.style.cursor="pointer";
								title_var.id = applicationData[tempData[i].id].tunning_id;
								title_var.appendChild(document.createTextNode(applicationData[tempData[i].id].tunning_title));
								title_var.onclick = function () {
									var tempP_id = $(this).attr('id');
									document.cookie = "tunningID="+tempP_id+";";
									location.href="http://210.118.74.159:8100/Badac/application_reply"
			                    };
								td.appendChild(title_var);
								break;
							case 2:
								var tunningDate = applicationData[tempData[i].id].tunning_date;
								td.appendChild(document.createTextNode(tunningDate));
								break;
							case 3:
								if(applicationData[tempData[i].id].tunning_chk==0){
									td.appendChild(document.createTextNode("NO"));
								}else if(applicationData[tempData[i].id].tunning_chk==1){
									td.appendChild(document.createTextNode("YES"));
								}
								break;
								default:
									break;
							}
							tr.appendChild(td);
						}
						table_c.appendChild(tr);
					}
				}else{
					alert(data.msg);
				}
		});
		
		$.get("http://210.118.74.159:8100/Badac/company_application_list",{
			id : companyId
		},
			function(data){
				if(data.msg=="Success"){
					var applicationData = {};
					var tempData = data.applicationList;
					var table_c = document.getElementById('companyApplicationListTable');
					var tr;
					var td;
					var title_var;
					
					for(var i = 0; i<tempData.length; i++){
						applicationData[tempData[i].id] = {
							"tunning_id": tempData[i].id,
							"tunning_title": tempData[i].title,
							"tunning_date": tempData[i].date,
							"tunning_chk": tempData[i].chk
						}
						tr = document.createElement('tr');
						for(var j = 0; j<4; j++){
							td = document.createElement('td');
							switch(j){
							case 0:
								td.appendChild(document.createTextNode(applicationData[tempData[i].id].tunning_id));
								break;
							case 1:
								title_var = document.createElement('p');
								title_var.style.cursor="pointer";
								title_var.id = applicationData[tempData[i].id].tunning_id;
								title_var.appendChild(document.createTextNode(applicationData[tempData[i].id].tunning_title));
								title_var.onclick = function () {
									var tempP_id = $(this).attr('id');
									document.cookie = "tunningID="+tempP_id+";";
									location.href="http://210.118.74.159:8100/Badac/go_company_application_page"
			                    };
								td.appendChild(title_var);
								break;
							case 2:
								var tunningDate = applicationData[tempData[i].id].tunning_date;
								td.appendChild(document.createTextNode(tunningDate));
								break;
							case 3:
								if(applicationData[tempData[i].id].tunning_chk==0){
									td.appendChild(document.createTextNode("미채택"));
								}else if(applicationData[tempData[i].id].tunning_chk==1){
									td.appendChild(document.createTextNode("채택"));
								}
								break;
								default:
									break;
							}
							tr.appendChild(td);
						}
						table_c.appendChild(tr);
					}
				}else{
					//alert(data.msg);
				}
		});
	}
</script>
<script>
function menuClick(divname) {
	var divset = document.getElementById(divname);
	var divarr = ["userApplication","myApplication", "successApplication", "goodMember"];
	for(var i=0; i<4; i++){
		document.getElementById(divarr[i]).style.display="none";
	}
	divset.style.display="block";
}
</script>

<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">
<style>
body {
	padding-top: 150px;
	font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
	background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.3) 0%,
		rgba(0, 0, 0, 0.3) 100%), url('img/memberbg.jpg');
	-webkit-background-size: cover;
	-moz-background-size: cover;
	background-size: cover;
	-o-background-size: cover;
}

.button-group {
	margin: 1px;
}

.footer {
	padding: 5px;
}
</style>

</head>
<body>
	<!-- Page Content -->
	<div class="top-content">
		<div class="inner-bg">
			<div class="container-fluid">
				<div class="row">
					<div class="col-md-6">
						<div class="col-sm-8 col-sm-offset-2 text">
							<h1>
								<strong>견적 요청서</strong>| Estimate List
							</h1>
							등록된 나의 견적 요청서 목록입니다.
						</div>
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2 form-box">
								<div class="form-top">
									<div class="form-top-left">
										<h3>Estimate List</h3>
									</div>
								</div>
								<div class="form-bottom">
									<div class="form-group">
										<!-- 테이블 시작 -->
										<table class="table table-hover"
											style="width: 100%; color:white; text-align: center;">
											<thead>
												<tr>
													<td style="width: 15%;">번호</td>
													<td style="width: 45%;">제목</td>
													<td style="width: 20%;">등록일자</td>
													<td style="width: 20%;">등록여부</td>
												</tr>
											</thead>
											<tbody id="applicationListTable"
												style="width: 100%; color: white; text-align: center;">

											</tbody>
										</table>
										<!-- 테이블 종료 -->
									</div>
									<div class="footer">
										<center style="color:white;">
											<hr>
											Copyright &copy; Badoc Corporation 2016
										</center>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="col-sm-8 col-sm-offset-2 text">
							<h1>
								<strong> 답변 요청서</strong>| Replied Application List
							</h1>
							답변한 견적 요청서 목록입니다.
						</div>
						<div class="row">
							<div class="col-sm-8 col-sm-offset-2 form-box">
								<div class="form-top">
									<div class="form-top-left">
										<h3>Replied Application List</h3>
									</div>
								</div>
								<div class="form-bottom">
									<div class="form-group">
										<!-- 테이블 시작 -->
										<table class="table table-hover"
											style="width: 100%; color:white; text-align: center;">
											<thead>
												<tr>
													<td style="width: 15%;">번호</td>
													<td style="width: 45%;">제목</td>
													<td style="width: 20%;">등록일자</td>
													<td style="width: 20%;">채택여부</td>
												</tr>
											</thead>
											<tbody id="companyApplicationListTable"
												style="width: 100%; color: white; text-align: center;">

											</tbody>
										</table>
										<!-- 테이블 종료 -->
									</div>
									<div class="footer">
										<center style="color:white;">
											<hr>
											Copyright &copy; Badoc Corporation 2016
										</center>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
