<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
    <script   src="https://code.jquery.com/ui/1.11.4/jquery-ui.js"   integrity="sha256-DI6NdAhhFRnO2k51mumYeDShet3I8AKCQf/tf7ARNhI="   crossorigin="anonymous"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link href="css/bootstrap.min.css" rel="stylesheet">
  
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

<style>
body {
    margin-top: 70px; 
}
.lead{
	padding-left: 5px;
}

</style>
</head>
<body>
 <div id="wrapper">

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
					data-toggle="dropdown" role="button" aria-expanded="false">사용자 정보 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href=""><img src="http://placehold.it/130x100" alt=".." /></a></li>
						<li><a id="name"></a></li>
						<li><a id="email"></a></li>
						<li class="divider"></li>
						<li><a href="http://localhost:8100/Badac/user_logout">로그아웃</a></li>
						<li><a href="http://localhost:8100/Badac/go_user_update_information">개인정보 수정</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_my_application_page">견적 요청 내역 보기</a></li>
						<li><a href="http://localhost:8100/Badac/write_application">견적제안서 작성</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container -->        
            <!-- /.navbar-collapse -->
        </nav>
 

				<div class="container">
                <!-- Page Heading -->
                <div class="row"> 
                <!-- Sidebar Menu Items  -->
            <div class="col-md-3">
				<p class="lead">마이페이지</p>
				<div class="list-group">
					<a href="http://210.118.74.159:8100/Badac/go_user_update_information" class="list-group-item">개인정보수정</a> 
					<a href="http://210.118.74.159:8100/Badac/go_my_application_page"	class="list-group-item">견적요청서조회</a> 
					<a href="#" class="list-group-item">즐겨찾는매장</a>
					<a href="#" class="list-group-item">탈퇴신청</a>
				</div>
			</div>
                
                
                <div class="col-md-9">
                     
                        <h1 class="page-header">
                            마이페이지
                            <small>My Page</small>
                        </h1>
                         
                        <div class=" col-lg-4 text-center">
                        	<div class="panel panel-default">
                        		<div class="panel-body">
                        		<img id="panel-img1" alt="image" src="http://placehold.it/100x100">
                        		<a href="http://210.118.74.159:8100/Badac/go_user_update_information"><h3>개인정보수정</h3></a><hr>
                        		<p>개인정보를 수정 및 관리할 수 있습니다.</p>
                        		</div>
                        	</div> 
                        </div>
                        
                        
                        <div class=" col-lg-4 text-center">
                        	<div class="panel panel-default">
                        		<div class="panel-body">
                        		<img id="panel-img2" alt="image" src="http://placehold.it/100x100">
                        		<a href="http://210.118.74.159:8100/Badac/go_my_application_page"><h3>견적요청서조회</h3></a><hr>
                        		<p>견적요청서를 신규작성하거나 작성한 견적요청서를 조회 및 수정할 수 있습니다.</p>
                        		</div>
                        	</div>
                        
                       
                        </div>
                        <div class="col-lg-4 text-center">
                        	<div class="panel panel-default">
                        		<div class="panel-body">
                        		<img id="panel-img3" alt="image" src="http://placehold.it/100x100">
                        		<a href="#"><h3>즐겨찾는매장</h3></a><hr>
                        		<p>즐겨찾는 가맹업체의 매장 목록을 확인할 수 있습니다.</p>
                        		</div>
                        	</div> 
                        </div>
                    
                    </div>
                </div> 
                <!-- /#row -->
                </div>
                <!-- /#container -->
 
   
    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>