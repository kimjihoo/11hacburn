<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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

 <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03"></script>
<style>
.listimage{

     width:114px;
     height:114px;
     list-style-position:inside;
     list-style-image:url(/pororo.jpg);
     list-style-type:disc;
}
</style>

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
body { padding-top: 70px; }
</style>

<script type="text/javascript">
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
                  		<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">사용자 정보 <span class="caret"></span></a>
                  	<ul class="dropdown-menu" role="menu">
                    	<li><a href=""><img src="http://placehold.it/130x100" alt=".."/></a></li>
                    	<li><a id="name"></a></li>
                    	<li><a id="email"></a></li>
                    	<li class="divider"></li>
                    	<li><a href="http://localhost:8100/Badac/user_logout">로그아웃</a></li>
                    	<li><a href="http://localhost:8100/Badac/go_user_update_information">개인정보 수정</a></li>
                    	<li><a href="#">견적 요청 내역 보기</a></li>
                    	<li><a href="http://localhost:8100/Badac/write_application">견적 제안서 작성</a></li>
                    	
                  	</ul>
                	</li>
         
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

<div class="container-fluid">

	<div class="col-lg-2 col-sm-2">
					
	</div>
	<div class="col-lg-6 col-sm-6" id="map" style="height:500px;"></div>
	<div class="col-lg-4 col-sm-4">
		<table class="table table-hover">
		<tr>
			<td rowspan="4" ><img src="http://placehold.it/140x140"/></td>
			<td>삼천리sdfsdgsdfsdfsdf자전거</td>
		</tr>
		<tr>
			<td>경기도sdfsdgsdfsdgsdfsdfsdf고양시</td>
		</tr>
		<tr>
			<td>0319658sdfsdgsdfsd00</td>
		</tr>
		<tr>
			<td>맞은편</td>
		</tr>			
		</table>
</div>
</div>
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.657418, 127.0463547),
			level: 3
		};
		var map = new daum.maps.Map(container, options);
		
		
		document.getElementById("name").innerHTML = userName;
		document.getElementById("email").innerHTML = userEmail;
	</script>

</body>
</html>