<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03"></script>


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
		var temp1 = document.getElementById("companyIdDiv");
		var temp2 = document.getElementById("companyOwnerNameDiv");
	    var temp3 = document.getElementById('companyNameDiv');
	    var temp4 = document.getElementById('companyEmailDiv');
	    
	    temp1.appendChild(document.createTextNode(companyId));
	    temp2.appendChild(document.createTextNode(companyOwnerName));
	    temp3.appendChild(document.createTextNode(companyName));
	    temp4.appendChild(document.createTextNode(companyEmail));
	}
	
	function memberLogout(){
		location.href = "http://localhost:8100/Badac/member_logout";
	}
</script>
</head>
<body>
회사 페이지
<button onclick="memberLogout()">로그아웃</button>
<div id="companyIdDiv"></div>
<div id="companyOwnerNameDiv"></div>
<div id="companyNameDiv"></div>
<div id="companyEmailDiv"></div>
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
                  		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">사용자 정보 <span class="caret"></span></a>
                  	<ul class="dropdown-menu" role="menu">
                    	<li><a href=""><img src="http://placehold.it/130x100" alt=".."/></a></li>
                    	<li><a id="name"></a></li>
                    	<li><a id="email"></a></li>
                    	<li class="divider"></li>
                    	<li><a href="http://localhost:8100/Badac/member_logout">로그아웃</a></li>
                    	<li><a href="http://localhost:8100/Badac/go_member_update_information">개인정보 수정</a></li>
                    	<li><a href="#">견적 요청 내역 보기</a></li><!-- 요청 지역에 대한 견적요청내역 보기 -->
                    	<li><a href="#">견적 제안서 작성</a></li>
                  	</ul>
                	</li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
<div class="container-fluid" >
<div class="col-lg-2 col-sm-2"></div>
	<div class="col-lg-6 col-sm-6" id="map" style="height:500px;"></div>
</div>
<script>
var container = document.getElementById('map');
var options = {
	center: new daum.maps.LatLng(37.657418, 127.0463547),
	level: 3
};
var map = new daum.maps.Map(container, options);



						document.getElementById("name").innerHTML = companyName;
						document.getElementById("email").innerHTML = companyEmail;
</script>



</body>
</html>