<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script src="https://code.jquery.com/jquery-2.2.3.js"
	integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<link href="css/business-casual.css" rel="stylesheet">
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
<!-- Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
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
    
    function userLogout() {
		location.href = "http://210.118.74.159:8100/Badac/user_logout";
	}
    
	///////////////////////////////////////////////////////////////////
</script>
<script>
onload = function on_load(){
	var profile_c = document.getElementById("profile_c");
	$.get("http://210.118.74.159:8100/Badac/get_picture_list",{appId:-1,},
            function (data) {
                if (data.msg == 'Success') {
                	var gall_img = document.createElement('img');
                	gall_img.src=data.pictureList[0].path;
                	gall_img.style.borderRadius="6px";
                	gall_img.style.width="100%";
                	gall_img.style.height="100%";
                	profile_c.appendChild(gall_img);
                	
                    /*for (var g = 0; g < data.pictureList.length; g++) {
                    	var temp_div = document.createElement('div');
                    	temp_div.style.width="100%";
                    	temp_div.style.height="100%";
                    	//temp_div.style.borderRadius="6px";
                    	var gall_img = document.createElement('img');
                    	gall_img.src=data.pictureList[g].path;
                    	gall_img.style.borderRadius="6px";
                    	gall_img.style.width="100%";
                    	gall_img.style.height="100%";
                    	temp_div.appendChild(gall_img);
                    	gallery_c.appendChild(temp_div);
                    }*/
                }
            });
}
function uploadUserFile(){
	var user_img = $("#choice_profile_img").val();
	if(user_img==""){
		alert("사진을 선택하세요");
	}else{
		switch(user_img.substring(user_img.lastIndexOf('.')+1).toLowerCase()){
		case 'gif': case 'jpg': case 'png': case 'bmp':
			var fileSelect = document.getElementById("choice_profile_img");
            var files = fileSelect.files;

            if (files.length == 0) {
                alert("파일을 선택하세요.");
            }
            else {
                var formData = new FormData();
                for (var i = 0; i < files.length; i++) {
                    var file = files[i];

                    formData.append('file', file, file.name);
                }
				formData.append('appId', -1);
                $.ajax({
                    url: 'http://210.118.74.159:8100/Badac/upload_picture',
                    type: 'POST',
                    data: formData,
                    processData: false,
                    contentType: false,
                    async: false,
                    success: function (data) {
                        if (data.msg == 'Success') {
                            location.reload();
                        }else{
                        	alert(data.msg);
                        }
                    }
                });
            }
			
			break;
			default:
				$("#choice_profile_img").val('');
			alert('Not an Image format');
			break;
		}
	}
}
function change_profile_dialog() {
    var dialog;

    dialog = $("#profile-dialog-form").dialog({
        /*position: ,*/
        autoOpen: false,
        width: 700,
        height: 520,
        modal: true,
        buttons: {
            "선택": function () {
            	location.reload();
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
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top " role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="http://210.118.74.159:8100/Badac/member_main_page">BADOC</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="http://210.118.74.159:8100/Badac/go_aboutus">About</a></li>
				<li><a href="http://210.118.74.159:8100/Badac/go_aboutus">Services</a></li>
				<li><a href="http://210.118.74.159:8100/Badac/go_aboutus">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"><%=companyname%>님 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" style="width: 200px;" role="menu">
						<li>						
							<table>
								<tr>
									<td rowspan=2><div style="width:100px; height:100px;" id="profile_c"onclick="change_profile_dialog();"></div></td>
									<td style="padding-left: 20px;">대표 <%=companyownername%></td>
								</tr>

							</table>
						</li>
					 <li class="divider"></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_my_application_page"><img src="img/applicationplus.png" style="width:20px;height:20px;">&nbsp&nbsp메인 메뉴</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/member_main_page"><img src="img/applicationview.png" style="width:20px;height:20px;">&nbsp&nbsp마이 페이지</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_my_bookmark_page"><img src="img/star.png" style="width:20px;height:20px;">&nbsp&nbsp즐겨찾기</a></li>
						<li class="divider"></li>
						<li><a href="http://210.118.74.159:8100/Badac/member_logout"><img src="img/logout.png" style="width:20px;height:20px;">&nbsp&nbsp로그아웃</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_user_update_information"><img src="img/profile.png" style="width:20px;height:20px;">&nbsp&nbsp업체정보수정</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_delete_user_page"><img src="img/x.png" style="width:20px;height:20px;">&nbsp&nbsp회원탈퇴</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
<div id="profile-dialog-form" title="이미지 선택" style="display:none;">
    <div style="width:100%;">
        <img class="opcity_img" src="images/upload_btn.png" width="60" height="30" id="upload_btn" style="float:right; margin-top:-3px;margin-left:5px;" onclick="uploadUserFile()">
        <input type="file" id="choice_profile_img" style="float:right;">
    </div>
</div>
</body>
</html>