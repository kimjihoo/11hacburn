<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>로그인</title>
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
            
    <style>
    body {
        padding-top: 100px;
        /* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
    }
    </style>
    <script type="text/javascript">
    	function Login(){
    		var regix_email = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        	var regix_pw = /^[a-z0-9]{4,12}$/;
        	var chk=0;
        	var size = document.login_form.elements['user'].length;
            for(var i = 0; i < size; i++) {
              if(document.login_form.elements["user"][i].checked) {
            	  var user_type = document.login_form.elements['user'][i];
            	  chk=1;
                   break;
              }
           }
    		var email = document.getElementById("login_id");
    		var pw = document.getElementById("login_pw");
    		
    		if(email.value=="admin" && pw.value=="admin"){
    			location.href = "AdminPage.jsp";
    		}else{
    			if(email.value == ""){
                    alert("이메일을 입력하세요.");
                    email.focus();
                    return;
                }
                if(regix_email.test(email.value) != true){
                	alert("이메일 형식이 틀렸습니다. (xx@xx.xx)");
                	email.focus();
                    return;
                }
                if(pw.value == ""){
                    alert("비밀번호를 입력하세요.");
                    pw.focus();
                    return;
                }
                if(regix_pw.test(pw.value) != true){
                	alert("비밀번호 형식이 틀렸습니다. (영문 / 숫자 - 4~12글자)");
                	pw.focus();
                    return;
                }
                if(chk==0){
                	alert("타입을 선택하세요");
                	return;
                }
                if(user_type.value=="normal"){
                	$.post("http://localhost:8100/Badac/user_login", {
                    	email : email.value,
                    	password : pw.value,
                    }, function(data){
                    		if( data.msg == "Success" ){
                    			alert("로그인 성공");
                    			location.href = "http://localhost:8100/Badac/user_main_page";
                    		}
                    		else{
                    			alert(data.msg);
                    		}
                    });
                }else if(user_type.value=="company"){
                	$.post("http://localhost:8100/Badac/member_login", {
                		email : email.value,
                    	password : pw.value,
                    }, function(data){
                    		if( data.msg == "Success" ){
                    			alert("로그인 성공");
                    			location.href = "http://localhost:8100/Badac/member_main_page";
                    		}
                    		else{
                    			alert(data.msg);
                    		}
                    });
                }
    		}
    	}
    </script>
</head>
<body>
		<!-- Page Content -->
    <div class="container">
    	<div class="row" style="text-align:center;">
    		<h1>Sign in to BADAC</h1>
    	</div>

        <div class="row">
        	<div class="col-lg-4">
            </div>
            <div class="col-lg-4" style="border-radius:5px; border:1px solid rgb(231,231,231); padding-bottom:15px; padding-right:25px; padding-left:25px; padding-top:15px;">
            	<form role="form" name="login_form">
            		<div class="radio">
      					<label><input type="radio" name="user" id="user" value="normal">일반</label>
      					<label><input type="radio" name="user" id="member" value="company">가맹</label>
    				</div>
  				</form>
  				<div class="form-group">
      				<label for="login_id">Email:</label>
      				<input type="text" class="form-control" id="login_id">
    			</div>
    			<div class="form-group">
      				<label for="login_pw">Password:</label>
      				<input type="password" class="form-control" id="login_pw">
    			</div>
    			<button type="button" class="btn btn-success" onclick="Login()" style="width:100%;">Sign In</button>
            </div>
            <div class="col-lg-4">
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
</body>
</html>