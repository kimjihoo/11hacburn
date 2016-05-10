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

 <script type="text/javascript" src="https://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03&libraries=services"></script>
<script>
onload = function on_load(){
$.get("http://210.118.74.159:8100/Badac/member_list", function(data){
	if(data.msg=="Success"){
			
	}
	else{
		alert(data.msg);
	}
});
}
</script>



<script>    
    ////////////////////////////////////////////////////////
    <% // 
    Cookie[] cookies = request.getCookies() ;
    
    int userid = 0;
    String username=null;
    String useremail=null;
    String useraddress1=null;
    String useraddress2=null;
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
            	useraddress1 = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if( c.getName().equals("user_region_3") ){
            	useraddress2 = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    } 
    %>
 
    var userId = '<%= userid %>';
    var userName = '<%= username %>';
    var userEmail = '<%= useremail %>';
    var userAddress = '<%= useraddress1 %> + " " + <%= useraddress2 %>'
    
    

	///////////////////////////////////////////////////////////////////
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
				<!--  -->
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
			<td>경겨딩기ㅗdfsdgsdfsdfsdf</td>
		</tr>
		<tr>
			<td>sdfsdgsdfsdgsdfsdfsdf</td>
		</tr>
		<tr>
			<td>0319658sdfsdgsdfsd00</td>
		</tr>
		<tr>
			<td>삼천리자전거</td>
		</tr>			
		</table>
</div>
</div>





	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addr2coord(userAddress, function(status, result) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result.addr[0].lat, result.addr[0].lng);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new daum.maps.InfoWindow({
            content: '<div style="padding:5px;">우리회사</div>'
        });
        infowindow.open(map, marker);
        


    } 
});    
	</script>

</body>
</html>