<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>
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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/shop-item.css" rel="stylesheet">


<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
<script>    
    ////////////////////////////////////////////////////////
    <% // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;
    
    int companyid = 0;
    String companyownername=null;
    String companyname=null;
    String companyemail=null;
    
    if(cookies != null){
         
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
             
            if( c.getName().equals("company_id") ){
            	companyid = Integer.parseInt(c.getValue());
            }
            if(c.getName().equals("company_ownername")){
            	companyownername = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if( c.getName().equals("company_name") ){
            	companyname = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if( c.getName().equals("company_email") ){
            	companyemail = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    } 
    %>
 
    var companyId = '<%= companyid %>';
    var companyOwnerName = '<%= companyownername%>';
    var companyName = '<%= companyname %>';
    var companyEmail = '<%= companyemail %>';
    
	///////////////////////////////////////////////////////////////////
</script>
<script type="text/javascript">
	onload = function on_load(){
		document.getElementById("ownername").innerHTML = companyOwnerName;
		document.getElementById("email").innerHTML = companyEmail;
		document.getElementById("name").innerHTML = companyName;
		
		$.get("http://210.118.74.159:8100/Badac/application_list",{
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
							"tunning_date": tempData[i].date
						}
						tr = document.createElement('tr');
						for(var j = 0; j<3; j++){
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
	}
	
	function memberLogout(){
		location.href = "http://210.118.74.159:8100/Badac/member_logout";
	}
	
	function change_img_dialog() {
	    var dialog;

	    dialog = $("#changeimg-dialog-form").dialog({
	        /*position: ,*/
	        autoOpen: false,
	        width: 400,
	        height: 400,
	        modal: true,
	        buttons: {
	            "선택": function () {
	                    var fileSelect = document.getElementById("choice_main_img");
	                    var files = fileSelect.files;
	                    formData = new FormData();
	                    for (var i = 0; i < files.length; i++) {
	                   	     var file = files[i];
	                         formData.append('file', file, file.name);
	                    }
	                    formData.append('appId',-1);
	                    if(files.length==0){
	                    	alert('파일을 선택해주세요.');
	                    }else if(files.length!=0){
	                    	$.ajax({
	                            url: 'http://210.118.74.159:8100/Badac/upload_picture',
	                            type: 'POST',
	                            data: formData,
	                            processData: false,
	                            contentType: false,
	                            async: false,
	                            success: function (data) {
	                                if (data.msg == 'Success') {
	                                    $.get("http://210.118.74.159:8100/Badac/get_picture_list",{
	                                    	appId:-1,
	                                    }, function(data){
	                                    	if(data.msg=="Success"){
	                                    		//메인 이미지 가져온 걸로 바꿈.
	                                    		$("#member_main_img").attr("backgroundImage", "url(../"+data.pictureList[0].path+")");
	                                    		alert(data.pictureList[0].path);
	                                            $("#member_main_img").attr("name", data.pictureList[0].id);
	                                    		alert('업로드를 완료했습니다.');
	                                            dialog.dialog("close");
	                                    	}
	                                    });
	                                }else{
	                                	alert(data.msg);
	                                }
	                            },
	                            error: function(data){
	                                alert(data.msg);
	                            }
	                        });     
	                }
	                
	                //alert(path);
	                
	            },
	            "취소": function () {
	                dialog.dialog("close");
	            }
	        },
	        close: function () {
	            dialog.dialog("close");
	        }
	    });
	    dialog.dialog('open');
	}
</script>
<script>
function menuClick(divname) {
	var divset = document.getElementById(divname);
	var divarr = ["userApplication", "successApplication", "goodMember"];
	for(var i=0; i<3; i++){
		document.getElementById(divarr[i]).style.display="none";
	}
	divset.style.display="block";
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
						<li onclick="change_img_dialog()"><div id="member_main_img"
								style="width: 130px; height: 130px;"></div></li>
						<li><a id="ownername"></a></li>
						<li><a id="name"></a></li>
						<li><a id="email"></a></li>
						<li class="divider"></li>
						<li><a href="http://210.118.74.159:8100/Badac/member_logout">로그아웃</a></li>
						<li><a
							href="http://210.118.74.159:8100/Badac/go_member_update_information">개인정보
								수정</a></li>

					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Page Content -->
	<div class="container">
		<div class="row">

			<div class="col-md-3">
				<p class="lead">Menu</p>
				<div class="list-group" id="myList">
					<a href="#" onClick="menuClick('userApplication')"
						data-toggle="tab" class="list-group-item">견적 요청서</a> <a href="#"
						onClick="menuClick('successApplication')" data-toggle="tab"
						class="list-group-item">완료한 요청</a> <a href="#"
						class="list-group-item">우수 고객</a>
				</div>
			</div>

			<div class="tab-content" id="tabcontent">
				<div class="tab-pane active" id="userApplication" style="display:none;">
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

		<!-- jQuery -->
		<script src="js/jquery.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="js/bootstrap.min.js"></script>
</body>
</html>
