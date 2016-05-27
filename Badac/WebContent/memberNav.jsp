<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title></title>
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
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

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
    
    function userLogout() {
		location.href = "http://210.118.74.159:8100/Badac/user_logout";
	}
    
	///////////////////////////////////////////////////////////////////
</script>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="http://210.118.74.159:8100/Badac/">BADOC</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="http://210.118.74.159:8100/Badac/go_aboutus">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"><%=companyname%>님 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" style="width: 200px; text-align: center;" role="menu">
						<li>						
							<table>
								<tr>
									<td rowspan=2><a href="#"><img
											src="http://placehold.it/100x100" alt=".." /></a></td>
									<td style="padding-left: 20px;">대표 <%=companyownername%></td>
								</tr>
								<tr>
									<td style='padding-left: 20px;'><%=companyemail%></td>
								</tr>
							</table>
						</li>
						<li><a href="http://210.118.74.159:8100/Badac/go_my_application_page">메인 메뉴</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/업체페이지">마이 페이지</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_my_bookmark_page">즐겨찾기</a></li>
						<li class="divider"></li>
						<li><a href="http://210.118.74.159:8100/Badac/member_logout">로그아웃</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_user_update_information">업체정보수정</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_delete_user_page">회원탈퇴</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

</body>
</html>