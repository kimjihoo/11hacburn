<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
<style>
body {
	padding-top: 100px;
}
</style>

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
		<div class="row" style="text-align: center;">
			<h1>Update Information</h1>
		</div>

		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4"
				style="border-radius: 5px; border: 1px solid rgb(231, 231, 231); padding-bottom: 15px; padding-right: 25px; padding-left: 25px; padding-top: 15px;">
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
						<button type="button" class="btn btn-primary"
							onclick="deleteUser()">Ok</button>
					</div>
					<div class="btn-group">
						<button type="button" class="btn btn-primary"
							onclick="returnMainPage()">Cancel</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- jQuery Version 1.11.1 -->
	<script src="js/jquery.js"></script>

	
</body>
</html>