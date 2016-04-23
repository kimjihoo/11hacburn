<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="utf-8" />
<title>로그인</title>
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
    	
    	function gotoSignUp(){
    		location.href = "http://localhost:8100/Badac/signup_type";
    	}
    
    </script>
</head>
<body>
	<form name="login_form">
		<input id="user" name="user" type="radio" value="normal" />일반 회원
		<input id="member" name="user" type="radio" value="company"/>가맹 업체<br />
	</form>
		이메일 <input id="login_id" type="text" placehold="input email"/><br />
		비밀번호 <input id="login_pw" type="password" placehold="input password"/><br />

		<button onclick="gotoSignUp()">SignUp</button>
		<button onclick="Login()">SignIn</button>
	
</body>
</html>