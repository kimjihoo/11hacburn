<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나의 견적 요청서 목록</title>

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
<script>    
    ////////////////////////////////////////////////////////
    <% // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;
    
    int userid = 0;
    String username=null;
    String useremail=null;
    
    if(cookies != null){
         
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
             
            if( c.getName().equals("user_id") ){
            	userid = Integer.parseInt(c.getValue());
            }
            if( c.getName().equals("user_name") ){
            	username = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if( c.getName().equals("user_email") ){
            	useremail = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    } 
    %>
 
    var userId = '<%= userid %>';
    var userName = '<%= username %>';
    var userEmail = '<%= useremail %>';
    
    

	///////////////////////////////////////////////////////////////////
</script>
<script>
	onload = function on_load(){
		$.get("http://localhost:8100/Badac/my_application_list",{
			userId:userId,
		},
			function(data){
				if(data.msg=="Success"){
					var applicationData = {};
					var tempData = data.applicationList;
					var table_c = document.getElementById('my_applicationListTable');
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
									location.href="http://210.118.74.159:8100/Badac/show_application"
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
						<li><a href="http://210.118.74.159:8100/Badac/user_logout">로그아웃</a></li>
						<li><a
							href="http://210.118.74.159:8100/Badac/go_user_update_information">개인정보
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
	
	<div class="contentwrap">
		<article class="container">
    <div class="page-header">
	  <h1> 견적 요청서 <small>목록</small></h1>
    </div>
    
	<div class="container">
		<!-- 테이블 시작 -->
		<table class="table table-hover" style="width:100%; text-align:center;">
			<thead>
				<tr>
					<td style="width:15%;">번호</td>
					<td style="width:45%;">제목</td>
					<td style="width:20%;">등록일자</td>
				</tr>
			</thead>
			<tbody id="my_applicationListTable" style="width:100%; text-align:center;">
				
			</tbody>
		</table>
		<!-- 테이블 종료 -->

		<!-- 등록버튼 시작 -->
		<table class="table table-hover" cellspacing=0 cellpadding=0 border=0 width=500>
			<thead>
					<a class="btn btn-default" href="http://210.118.74.159:8100/Badac/write_application"
						role="button">등록</a>
			</thead>
		</table>
		<!-- 등록버튼 종료 -->
	</div>
</body>
</html>

