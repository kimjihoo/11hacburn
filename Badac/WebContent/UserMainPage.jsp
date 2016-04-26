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
유저 페이지

 
<button onclick="userLogout()">로그아웃</button>
<button onclick="writeApplication()">제안서 작성</button>
<div id="userIdDiv"></div>
<div id="userNameDiv"></div>
<div id="userEmailDiv"></div>
<div class="container">
	<div class="col-lg-3"></div>
	<div class="col-lg-6" id="map" style="width:100%;height:500px;"></div>
	<div class="col-lg-3"></div>
</div>


	<script>
		var container = document.getElementById('map');
		var options = {
			center: new daum.maps.LatLng(37.657418, 127.0463547),
			level: 3
		};
		var map = new daum.maps.Map(container, options);
	</script>

</body>
</html>