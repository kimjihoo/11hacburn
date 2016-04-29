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

 <script type="text/javascript" src="http://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
<script>
function change_img_dialog() {
    var dialog;

    dialog = $("#changeimg-dialog-form").dialog({
        /*position: ,*/
        autoOpen: false,
        width: 400,
        height: 400,
        modal: true,
        buttons: {
            "선택": function () {
                    var fileSelect = document.getElementById("choice_main_img");
                    var files = fileSelect.files;
                    formData = new FormData();
                    for (var i = 0; i < files.length; i++) {
                   	     var file = files[i];
                         formData.append('file', file, file.name);
                    }
                    formData.append('appId',-1);
                    if(files.length==0){
                    	alert('파일을 선택해주세요.');
                    }else if(files.length!=0){
                    	$.ajax({
                            url: 'http://210.118.74.159:8100/Badac/upload_picture',
                            type: 'POST',
                            data: formData,
                            processData: false,
                            contentType: false,
                            async: false,
                            success: function (data) {
                                if (data.msg == 'Success') {
                                    $.get("http://210.118.74.159:8100/Badac/get_picture_list",{
                                    	appId:-1,
                                    }, function(data){
                                    	if(data.msg=="Success"){
                                    		//메인 이미지 가져온 걸로 바꿈.
                                    		$("#user_main_img").attr("backgroundImage", "url(../"+data.pictureList[0].path+")");
                                    		alert(data.pictureList[0].path);
                                            $("#user_main_img").attr("name", data.pictureList[0].id);
                                    		alert('업로드를 완료했습니다.');
                                            dialog.dialog("close");
                                    	}
                                    });
                                }else{
                                	alert(data.msg);
                                }
                            },
                            error: function(data){
                                alert(data.msg);
                            }
                        });     
                }
                
                //alert(path);
                
            },
            "취소": function () {
                dialog.dialog("close");
            }
        },
        close: function () {
            dialog.dialog("close");
        }
    });
    dialog.dialog('open');
}
</script>
<style>
body { padding-top: 70px; }
</style>

<script type="text/javascript">
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
                    	<li onclick="change_img_dialog()"><div id="user_main_img" style="width:130px; height:130px;"></div></li>
                    	<li><a id="name"></a></li>
                    	<li><a id="email"></a></li>
                    	<li class="divider"></li>
                    	<li><a href="http://210.118.74.159:8100/Badac/go_user_update_information">개인정보 수정</a></li>
                    	<li><a href="#">견적 요청 내역 보기</a></li>
                    	<li><a href="http://210.118.74.159:8100/Badac/write_application">견적 제안서 작성</a></li>
                    	<li><a href="http://210.118.74.159:8100/Badac/user_logout">로그아웃</a></li>
                    	
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
<div id="changeimg-dialog-form" title="이미지 선택" style="display:none; z-index:101;">
    <div style="width:100%;">
        <input type="file" id="choice_main_img" style="float:right;">
    </div>
</div>
</body>
</html>