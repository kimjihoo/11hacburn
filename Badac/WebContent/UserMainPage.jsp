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
$.get("http://210.118.74.159:8100/Badac/asdf",{}, function(data){
	if(data.msg=="Success"){
		//코딩
	}
	else{
		alert(data.msg);
	}
});
</script>



<script>    
    ////////////////////////////////////////////////////////
    <% // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;
    
    int userid = 0;
    String username=null;
    String useremail=null;
    String useraddress=null;
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
            if( c.getName().equals("user_region_2") ){
            	useraddress = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    } 
    %>
 
    var userId = '<%= userid %>';
    var userName = '<%= username %>';
    var userEmail = '<%= useremail %>';
    var userAddress = '<%= useraddress %>'
    
    

	///////////////////////////////////////////////////////////////////
</script>


<script>
$(document).ready(function(){
    var add = '경기도 고양시 덕양구';
     var url ="https://apis.daum.net/local/geo/addr2coord?apikey=3a654d3947433483eca1b853767e0d03&q="+encodeURI('제주 특별자치도 제주시 첨단로 242')+"&output=json"; 

     $.getJSON(url, function(data) {
    	 
    	 var lat = data.channel.item.point_y;
      var lng = data.channel.item.point_x;
    	 alert(lat + " " + lng);
       $.each(data.channel.item, function(i,item) {
         alert(state.newAddress);
         

     });
    });
   }); 

</script>


<style>
body { padding-top: 70px; }
</style>

<script type="text/javascript">

	
	function userLogout(){
		location.href = "http://210.118.74.159:8100/Badac/user_logout";
	}
	function writeApplication(){
		location.href = "http://210.118.74.159:8100/Badac/write_application";
	}
</script>
</head>
<body>
				<!-- 지역구 기반 업체검색, 견적내역 -->
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
                    	<li>
                    	<table>
                    	<tr>
                    	<td rowspan=2 ><a href="#"><img src="http://placehold.it/100x100" alt=".."/></a></td>
                    	<td style="padding-left : 20px;"><%= username %></td>
                    	</tr>
                    	<tr>
                    	<td style="padding-left : 20px;"><%= useremail %></td>
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
			center : new daum.maps.LatLng(lat, lng),
			level : 3
		};
		var map = new daum.maps.Map(container, options);


	</script>

</body>
</html>