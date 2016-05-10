<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 
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
	<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03"></script>
	<script>
<%  
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

onload = function on_load(){
	var temp1 = document.getElementById("userIdDiv");
    var temp2 = document.getElementById('userNameDiv');
    var temp3 = document.getElementById('userEmailDiv');
    
    temp1.appendChild(document.createTextNode(userId));
    temp2.appendChild(document.createTextNode(userName));
    temp3.appendChild(document.createTextNode(userEmail));
}

function userLogout(){
	location.href = "http://localhost:8100/Badac/user_logout";
}
function writeApplication(){
	location.href = "http://localhost:8100/Badac/write_application";
}
</script>
<style>
body {
	padding-top: 70px;
}
.row{
	padding-top: 10px;
} 
</style>
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
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right" >
                    <li>
                        <a href="#">About</a>
                    </li>
                    <li>
                        <a href="#">Services</a>
                    </li>
                    <li>
                        <a href="#">Contact</a>
                    </li>
                  	<li class="dropdown">
                  		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">개인정보 내역 <span class="caret"></span></a>
                  	<ul class="dropdown-menu" role="menu">
                    	<li>
                    	<table>
                    	<tr>
                    	<td rowspan=2 ><a href="#"><img src="http://placehold.it/100x100" alt=".."/></a></td>
                    	<td style="padding-left : 20px;"><%= username %></td>
                    	</tr>
                    	<tr>
                    	<td style='padding-left : 20px;'><%= useremail %></td>
                    	</tr>
                    	</table>
                    	</li>
                    	<li>
                    	<table>
                    	<tr>
                    	<td style="text-align = center;">
                    	<a href="http://210.118.74.159:8100/Badac/go_my_application_page">견적 요청 내역 보기</a>
                    	</td>
                    	<td style="text-align = center;">
                    	<a href="http://210.118.74.159:8100/Badac/write_application">견적 제안서 작성</a>
                    	</td>
                    	</tr>
                    	</table>
                    	</li>
                    	<li class="divider"></li>

                    	<li><a href="http://210.118.74.159:8100/Badac/user_logout">로그아웃</a></li>
                    	<li><a href="http://210.118.74.159:8100/Badac/go_user_update_information">개인정보 수정</a></li>                    	

																				</ul>
                	</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">

        <!-- Portfolio Item Heading -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Company Information</h2>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Item Row -->
        <div class="row">

            <div class="col-md-8">
                <img class="img-responsive" src="http://placehold.it/750x500" alt="">
            </div>

            <div class="col-md-4">
                <h3>업체명</h3>
                <p>first company</p>
                <h3>대표자</h3>
                <p>first company</p>
                <h3>전화번호</h3>
                <p>first company</p>
                <h3>사이트</h3>
                <p>www.www</p>
                <h3>주소</h3>
                <p>first company</p>
                 
            </div>

        </div>
        <!-- /.row -->

        <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header">Company Photo</h3>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>
            </div>
            
            
            <div class="row">
            <div class="col-lg-12">
                <h3 class="page-header">Map</h3>
            </div>
	        <div class="col-md-4 col-xs-6">
            	   	<div id="map" style="height:300px;"></div>
            </div>
        </div>
        
        <div class="row">
             <div class="col-lg-12">
                <h3 class="page-header">Review</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12" id="button-page" >
            <a class="btn btn-default" href="UserSearchCompany.jsp" role="button">목록</a>
            <a class="btn btn-default" href="UserApplicationRegistPage.jsp" role="button">견적서요청</a>
            <a class="btn btn-default" href="#" role="button">즐겨찾기추가</a>
            </div>
        </div>
       
  
    </div>
	    <!-- /.container -->
    
       
    
    
    

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
     
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new daum.maps.Map(container, options);
	</script>


</body>
</html>