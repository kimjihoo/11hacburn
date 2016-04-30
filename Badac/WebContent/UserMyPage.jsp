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
    
    s

	///////////////////////////////////////////////////////////////////
</script>

<style>
body {
    margin-top: 70px;
    background-color: #222;
}

@media(min-width:768px) {
    body {
        margin-top: 50px;
    }
}

#wrapper {
    padding-left: 0;
}

#page-wrapper {
    width: 100%;
    padding: 0;
    background-color: #fff;
}

.huge {
    font-size: 50px;
    line-height: normal;
}

@media(min-width:768px) {
    #wrapper {
        padding-left: 225px;
    }

    #page-wrapper {
        padding: 10px;
    }
}

/* Top Navigation */

.top-nav {
    padding: 0 15px;
}

.top-nav>li {
    display: inline-block;
    float: left;
}

.top-nav>li>a {
    padding-top: 15px;
    padding-bottom: 15px;
    line-height: 20px;
    color: #999;
}

.top-nav>li>a:hover,
.top-nav>li>a:focus,
.top-nav>.open>a,
.top-nav>.open>a:hover,
.top-nav>.open>a:focus {
    color: #fff;
    background-color: #000;
}

.top-nav>.open>.dropdown-menu {
    float: left;
    position: absolute;
    margin-top: 0;
    border: 1px solid rgba(0,0,0,.15);
    border-top-left-radius: 0;
    border-top-right-radius: 0;
    background-color: #fff;
    -webkit-box-shadow: 0 6px 12px rgba(0,0,0,.175);
    box-shadow: 0 6px 12px rgba(0,0,0,.175);
}

.top-nav>.open>.dropdown-menu>li>a {
    white-space: normal;
}

ul.message-dropdown {
    padding: 0;
    max-height: 250px;
    overflow-x: hidden;
    overflow-y: auto;
}

li.message-preview {
    width: 275px;
    border-bottom: 1px solid rgba(0,0,0,.15);
}

li.message-preview>a {
    padding-top: 15px;
    padding-bottom: 15px;
}

li.message-footer {
    margin: 5px 0;
}

ul.alert-dropdown {
    width: 200px;
}

/* Side Navigation */

@media(min-width:768px) {
    .side-nav {
        position: fixed;
        top: 51px;
        left: 225px;
        width: 225px;
        margin-left: -225px;
        border: none;
        border-radius: 0;
        overflow-y: auto;
        background-color: #222;
        bottom: 0;
        overflow-x: hidden;
        padding-bottom: 40px;
    }

    .side-nav>li>a {
        width: 225px;
    }

    .side-nav li a:hover,
    .side-nav li a:focus {
        outline: none;
        background-color: #000 !important;
    }
}

.side-nav>li>ul {
    padding: 0;
}

.side-nav>li>ul>li>a {
    display: block;
    padding: 10px 15px 10px 38px;
    text-decoration: none;
    color: #999;
}

.side-nav>li>ul>li>a:hover {
    color: #fff;
}
  
 
</style>
</head>
<body>
 <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">BADAC</a>
            </div>
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
                    	<li onclick="change_img_dialog()"><div id="user_main_img" style="width:130px; height:130px;"></div></li>
                    	<li><a id="name"></a></li>
                    	<li><a id="email"></a></li>
                    	<li class="divider"></li>
                    	<li><a href="http://210.118.74.159:8100/Badac/go_user_update_information">개인정보 수정</a></li>
                    	<li><a href="http://210.118.74.159:8100/Badac/go_my_application_page">견적 요청 내역 보기</a></li>
                    	<li><a href="http://210.118.74.159:8100/Badac/write_application">견적 제안서 작성</a></li>
                    	<li><a href="http://210.118.74.159:8100/Badac/user_logout">로그아웃</a></li>
                    	
                  	</ul>
                	</li>
         
                    
                </ul>
            </div>
            
            
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
         
    
   
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
                    <li class="active">
                        <a href="#"><i class="fa fa-fw fa-dashboard"></i>마이페이지</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-bar-chart-o"></i>334</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-table"></i> Tables</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-fw fa-edit"></i> Forms</a>
                    </li>
             
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">
            <p>마이페이지</p>
       
       

            

            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>