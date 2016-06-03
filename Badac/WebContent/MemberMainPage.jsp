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
body {
	padding-top: 70px;
}
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
</head>
<body>
	<!-- Page Content -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<p class="lead">Menu</p>
				<div class="list-group" id="myList">
					<a href="#" onClick="menuClick('userApplication')"
						data-toggle="tab" class="list-group-item">견적 요청서</a><a href="#"
						onClick="menuClick('myApplication')" data-toggle="tab"
						class="list-group-item">신청한 제안서</a><a href="#"
						onClick="menuClick('successApplication')" data-toggle="tab"
						class="list-group-item">완료한 요청</a> <a href="#"
						class="list-group-item">우수 고객</a>
				</div>
			</div>

			<div class="tab-content" id="tabcontent">
				<div class="tab-pane active" id="userApplication" style="display:block;">
					<div class="col-md-9">
						<div class="contentwrap">
							<div class="page-header">
								<h3>
									견적 요청서 <small>목록</small>
								</h3>
							</div>

							<div id="changeimg-dialog-form" title="이미지 선택"
								style="display: none; z-index: 101;">
								<div style="width: 100%;">
									<input type="file" id="choice_main_img" style="float: right;">
								</div>
							</div>

							<!-- 견적요청서 받아오는 테이블 -->
							<div class="container">
								<!-- 테이블 시작 -->
								<table class="table table-hover" id="region_application_list"
									style="width: 75%; text-align: center;">
									<thead>
										<tr>
											<td style="width: 15%;">번호</td>
											<td style="width: 45%;">제목</td>
											<td style="width: 20%;">등록일자</td>
											<td style="width: 20%;">등록여부</td>
										</tr>
									</thead>
									<tbody id="applicationListTable"
										style="width: 75%; text-align: center;">

									</tbody>
								</table>
								<!-- 테이블 종료 -->
							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane active" id="myApplication" style="display:none;">
					<div class="col-md-9">
						<div class="contentwrap">
							<div class="page-header">
								<h3>
									신청한 제안서 <small>목록</small>
								</h3>
							</div>

							<div id="changeimg-dialog-form" title="이미지 선택"
								style="display: none; z-index: 101;">
								<div style="width: 100%;">
									<input type="file" id="choice_main_img" style="float: right;">
								</div>
							</div>
							<!-- 견적요청서 받아오는 테이블 -->

							<div class="container">
								<!-- 테이블 시작 -->
								<table class="table table-hover" id="region_application_list"
									style="width: 75%; text-align: center;">
									<thead>
										<tr>
											<td style="width: 15%;">번호</td>
											<td style="width: 45%;">제목</td>
											<td style="width: 20%;">등록일자</td>
											<td style="width: 20%;">채택여부</td>
										</tr>
									</thead>
									<tbody id="companyApplicationListTable"
										style="width: 75%; text-align: center;">

									</tbody>
								</table>
								<!-- 테이블 종료 -->

							</div>
						</div>
					</div>
				</div>

				<div class="tab-pane active" id="successApplication" style="display: none;">
					<div class="col-md-9">

						<div class="contentwrap">
							<div class="page-header">
								<h3>
									완료 요청서 <small>목록</small>
								</h3>
							</div>

							<div id="changeimg-dialog-form" title="이미지 선택"
								style="display: none; z-index: 101;">
								<div style="width: 100%;">
									<input type="file" id="choice_main_img" style="float: right;">
								</div>
							</div>

							<!-- 견적요청서 받아오는 테이블 -->

							<div class="container">
								<!-- 테이블 시작 -->
								<table class="table table-hover" id="region_application_list"
									style="width: 75%; text-align: center;">
									<thead>
										<tr>
											<td style="width: 15%;">번호</td>
											<td style="width: 45%;">제목</td>
											<td style="width: 20%;">등록일자</td>
										</tr>
									</thead>
									<tbody id="my_applicationListTable"
										style="width: 75%; text-align: center;">

									</tbody>
								</table>
								<!-- 테이블 종료 -->

							</div>
						</div>
					</div>
				</div>
				
				<div class="tab-pane active" id="goodMember" style="display:none;">
					<div class="col-md-9">
						<div class="contentwrap">
							<div class="page-header">
								<h3>
									견적 요청서 <small>목록</small>
								</h3>
							</div>

							<div id="changeimg-dialog-form" title="이미지 선택"
								style="display: none; z-index: 101;">
								<div style="width: 100%;">
									<input type="file" id="choice_main_img" style="float: right;">
								</div>
							</div>

							<!-- 견적요청서 받아오는 테이블 -->

							<div class="container">
								<!-- 테이블 시작 -->
								<table class="table table-hover" id="region_application_list"
									style="width: 75%; text-align: center;">
									<thead>
										<tr>
											<td style="width: 15%;">번호</td>
											<td style="width: 45%;">제목</td>
											<td style="width: 20%;">등록일자</td>
										</tr>
									</thead>
									<tbody id="applicationListTable"
										style="width: 75%; text-align: center;">

									</tbody>
								</table>
								<!-- 테이블 종료 -->

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
