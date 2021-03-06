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
    onload = function on_load(){
    	var profile_c = document.getElementById("profile_c");
    	$.get("http://210.118.74.159:8100/Badac/get_picture_list",{appId:-1,},
                function (data) {
                    if (data.msg == 'Success') {
                    	profile_c.innerHTML = "";
                    	var gall_img = document.createElement('img');
                    	gall_img.src=data.pictureList[0].path;
                    	gall_img.style.borderRadius="6px";
                    	gall_img.style.width="100%";
                    	gall_img.style.height="100%";
                    	profile_c.appendChild(gall_img);
                    }
                });    	
    }
 
    var userId = '<%= userid %>';
    var userName = '<%= username %>';
    var userEmail = '<%= useremail %>';
    var userAddress = '<%= useraddress1 %> + " " + <%= useraddress2 %>';
   
	function userLogout() {
		location.href = "http://210.118.74.159:8100/Badac/user_logout";
	}
	function writeApplication() {
		location.href = "http://210.118.74.159:8100/Badac/UserApplicationRegistPage";
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
	///////////////////////////////////////////////////////////////////
</script>
<script type="text/javascript">
        $(function() {
            $("#choice_profile_img").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                    $('#blah').attr('src', e.target.result);
                }

              reader.readAsDataURL(input.files[0]);
            }
        }


    </script>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-default navbar-fixed-top " role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="http://210.118.74.159:8100/Badac/user_main_page">BADOC</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="http://210.118.74.159:8100/Badac/go_aboutus">About</a></li>
				<li><a href="http://210.118.74.159:8100/Badac/go_aboutus">Services</a></li>
				<li><a href="http://210.118.74.159:8100/Badac/go_aboutus">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false"><%=username%>님 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" style="width: 200px;" role="menu">
						<li>
							<table>
								<tr>
									<td rowspan=2><div class="img-thumbnail" style="width:100px; height:100px;" id="profile_c" onclick="change_profile_dialog();">사진 추가 하시려면 클릭하세요!</div></td>
									<td style="padding-left: 20px;"><%=username%> 님</td>
								</tr>
							</table>
						</li>
						<li class="divider"></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_my_application_page"><img src="img/applicationview.png" style="width:20px;height:20px;">&nbsp&nbsp나의 요청서 보기</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/write_application"><img src="img/applicationplus.png" style="width:20px;height:20px;">&nbsp&nbsp견적 요청서 작성</a></li>
						<li><a href="http://210.118.74.159:8100/Badac/go_my_bookmark_page"><img src="img/star.png" style="width:30px;height:30px;">&nbsp&nbsp즐겨찾기</a></li>
						<li class="divider"></li>

						<li><a href="http://210.118.74.159:8100/Badac/user_logout"><img src="img/logout.png" style="width:20px;height:20px;">&nbsp&nbsp로그아웃</a></li>
						<li><a
							href="http://210.118.74.159:8100/Badac/go_user_update_information"><img src="img/profile.png" style="width:20px;height:20px;">&nbsp&nbsp개인정보
								수정</a></li>
						<li><a
							href="http://210.118.74.159:8100/Badac/go_delete_user_page"><img src="img/x.png" style="width:20px;height:20px;">&nbsp&nbsp회원탈퇴
							</a></li>

					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>
<div id="profile-dialog-form" title="이미지 선택" style="display:none;">
    <div style="width:100%;">
        <input type="file" id="choice_profile_img" style="float:right;">
    </div>
    <img id="blah" src="#" alt="your image" width="150" height="150" />
</div>
</body>
</html>