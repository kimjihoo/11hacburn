<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
    <!-- Bootstrap Core CSS -->
 <script   src="https://code.jquery.com/jquery-2.2.3.js"   integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="   crossorigin="anonymous"></script>
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
 

.col-md-12{
	margin-bottom:20px;
}

 
.item {
    border-radius: 4px;
}

.caption {
    height: 130px;
    overflow: hidden;
}

.caption h4 {
    white-space: nowrap;
}

.thumbnail img {
    width: 100%;
}

.ratings {
    padding-right: 10px;
    padding-left: 10px;
    color: #d17581;
}

.thumbnail {
    padding: 0;
}

.thumbnail .caption-full {
    padding: 9px;
    color: #333;
}
 
footer {
    margin: 30px 0;
}
</style>
</head>

<body>
<%

//request.setCharacterEncoding("utf-8"); 
	//MemberInfoDAO mdao = new MemberInfoDAO();
	//MemberInfo minfo = new MemberInfo();
	
	//List<MemberInfo> list = mdao.selectMemberInfoByCompanyEmail();
	
	//for(int i=0; i<list.size(); i++){
	//	MemberInfo info = list.get(i);
	%>
	
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

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3 navbar-right">
                <p class="lead">Badoc</p>
                <div class="list-group">
                    <a href="#" class="list-group-item">서울</a>
                    <a href="#" class="list-group-item">경기</a>
                    <a href="#" class="list-group-item">인천</a>
                    <a href="#" class="list-group-item">강원</a>
                    <a href="#" class="list-group-item">대전</a>
                    <a href="#" class="list-group-item">충청</a>
                    <a href="#" class="list-group-item">부산</a>
                    <a href="#" class="list-group-item">울산</a>
                    <a href="#" class="list-group-item">경상</a>
                    <a href="#" class="list-group-item">대구</a>
                    <a href="#" class="list-group-item">광주</a>
                    <a href="#" class="list-group-item">전라</a>
                    <a href="#" class="list-group-item">제주</a>
                </div>
            </div>
       
            <div class="col-md-9">
            	<div class="col-md-12">
            	   	<div id="map" style="height:500px;"></div>
               	</div>
               	
               	
               	
                	
                <div class="row">

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4><a href="#">first</a></h4>
                                <p>See more snippets like this online store item at <a target="_blank" href="http://www.bootsnipp.com">http://bootsnipp.com</a>.</p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4><a href="#">Second Company</a></h4>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">12 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4><a href="#">Third Company</a></h4>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">31 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4><a href="#">Fourth Company</a></h4>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">6 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4><a href="#">Fifth Company</a></h4>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="http://placehold.it/320x150" alt="">
                            <div class="caption">
                                <h4><a href="#">sixth Company</a></h4>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">18 reviews</p>
                                <p>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star"></span>
                                    <span class="glyphicon glyphicon-star-empty"></span>
                                </p>
                            </div>
                        </div>
                    </div>
                    
                    <nav>
                    <ul class="pagination">
                    	<li><a href="#"><span aria-hidden="true">«</span><span class="sr-only">Previous</span></a></li>
					    <li><a href="#">1</a></li>
				    	<li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					    <li><a href="#">4</a></li>
					    <li><a href="#">5</a></li>
	    				<li><a href="#"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                    </ul>
                    </nav>

                </div>

            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Badoc 2016</p>
                </div>
            </div>
        </footer>

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