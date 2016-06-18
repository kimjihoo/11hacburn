<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS --> 
<link href="css/button.css" rel="stylesheet">
<link href="css/business-casual.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-2.2.3.js"
	integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
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
<style>
body {
	padding-top: 100px;
	font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
    background: url('img/bikebg.jpg') no-repeat center center fixed;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%,rgba(0,0,0,0.3) 100%), url('img/bikebg.jpg');
    background-size: cover;
    -o-background-size: cover;
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}
</style>
<script src="https://code.jquery.com/jquery-2.2.3.js"
	integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous">
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 다음 주소 api -->
<script>
	////////////////////////////////////////////////////////
<%// 쿠키값 가져오기
			Cookie[] cookies = request.getCookies();

			int userid = 0;

			if (cookies != null) {

				for (int i = 0; i < cookies.length; i++) {
					Cookie c = cookies[i];

					if (c.getName().equals("user_id")) {
						userid = Integer.parseInt(c.getValue());
					}
				}
			}%>
 
    var userId = '<%= userid %>';
    
	///////////////////////////////////////////////////////////////////
</script>
<script type="text/javascript">
		
        function deleteUser(){
        	var user_pw = document.getElementById("user_password");
    		var user_pw_confirm = document.getElementById("user_password_confirm");
        	
        	if(user_pw.value==""){
        		alert("비밀번호를 입력하세요");
        	}
        	else if(user_pw_confirm.value==""){
        		alert("비밀번호를 확인하세요");
        	}
        	else if(user_pw.value != user_pw_confirm.value){
        		alert("비밀번호가 같지 않습니다");
        	}
        	else if(user_pw.value!=null && user_pw_confirm.value!=null && user_pw.value==user_pw_confirm.value){
        		if(confirm("정말로 탈퇴하시겠습니까?")) {
        			$.post("http://210.118.74.159:8100/Badac/delete_userinfo",{
            			user_id : userId,
            			user_pw : user_password.value
            		},function(data){
            			if(data.msg=="Success"){
            				alert("탈퇴가 정상적으로 진행되었습니다.");
            				location.href = "http://210.118.74.159:8100/Badac/user_logout";
            			}else{
            				alert(data.msg);
            			}
            		});
        		}
        		
        		
        	}
        }

        function returnMainPage(){
            location.href = "http://210.118.74.159:8100/Badac/user_main_page";
        }
    </script>
</head>
<body>
	<!-- Page Content -->
	<div class="container">
		<div class="brand">Drop out Badoc</div>
    	<div class="address-bar">Thank you</div>
    	
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4"
				style="border-radius: 5px; color: white; border: 1px solid rgb(231, 231, 231); padding-bottom: 15px; padding-right: 25px; padding-left: 25px; padding-top: 15px;">
				<div class="form-group">
					<label for="user_password">Password:</label> <input type="password"
						class="form-control input-sm" id="user_password">
				</div>
				<div class="form-group">
					<label for="user_password_confirm">Password Confirm:</label> <input
						type="password" class="form-control input-sm"
						id="user_password_confirm">
				</div>
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<button type="button" class="btn"
							onclick="deleteUser()">Ok</button>
					</div>
					<div class="btn-group">
						<button type="button" class="btn"
							onclick="returnMainPage()">Cancel</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->	
</body>
</html>