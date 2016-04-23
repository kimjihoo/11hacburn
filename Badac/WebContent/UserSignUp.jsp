<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>signup</title>
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
<style>
		html{
		width:100%;
		height:100%;
		}
		body{
		width:100%;
		height:100%;
		background-size:cover;
		background-repeat:no-repeat;
		background:url('image/main_background.jpg');
		}
		
	</style>
    <script type="text/javascript">
        function signUp(){
        	var regex_email = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        	var regex_pw = /^[a-z0-9]{4,12}$/;
    		var regex_name = /^[a-zA-Z0-9가-힣]{2,8}$/;
    		var regex_phone = /^[0-9]*$/;

			var user_name = document.getElementById("user_name");
			var user_email = document.getElementById("user_email");
			var user_pw = document.getElementById("user_password");
			var user_chk_pw = document.getElementById("user_password_confirm");
			var user_region = document.getElementById("user_region");
			var user_phone = document.getElementById("user_phone");
			var x = document.getElementById("user_bicycletype").selectedIndex;
			var user_bicycletype = document.getElementsByTagName("option")[x];
			
			var chk=0;
			var temp = document.user_emailpush.elements['email_push'];
			var user_emailpush;
	    	var size = temp.length;
	        for(var i = 0; i < size; i++) {
	          if(temp[i].checked) {
	        	  user_emailpush = temp[i];
	        	  chk=1;
	               break;
	          }
	       	}
			
            if(user_name.value == ""){
                alert("이름을 입력하세요.");
                user_name.focus();
                return;
            }
            if(regex_name.test(user_name.value) != true){
                alert("이름 형식이 틀렸습니다. (영문 / 한글 - 2~8글자)");
                user_name.value="";
                user_name.focus();
                return;
            }
            if(user_email.value == ""){
                alert("이메일을 입력하세요.");
                user_email.focus();
                return;
            }
            if(regex_email.test(user_email.value) != true){
            	alert("이메일 형식이 틀렸습니다. (xx@xx.xx)");
            	user_email.value="";
            	user_email.focus();
                return;
            }
            if(user_pw.value == ""){
                alert("비밀번호를 입력하세요.");
                user_pw.focus();
                return;
            }
            if(regex_pw.test(user_pw.value) != true){
            	alert("비밀번호 형식이 틀렸습니다. (영문 / 숫자 - 4~12글자)");
            	user_pw.value="";
            	user_pw.focus();
                return;
            }
            if(user_chk_pw.value == ""){
                alert("확인 비밀번호를 입력하세요.");
                user_chk_pw.focus();
                return;
            }
            if(regex_pw.test(user_chk_pw.value) != true){
            	alert("확인 비밀번호 형식이 틀렸습니다. (4~12글자 영문 / 숫자)");
            	user_chk_pw.value="";
            	user_chk_pw.focus();
                return;
            }
            if(!(user_pw.value == user_chk_pw.value)){
                alert("비밀번호와 확인 비밀번호가 다릅니다.");
                user_chk_pw.value="";
                user_chk_pw.focus();
                return;
            }
            if(user_phone.value==""){
            	alert("핸드폰 번호를 입력하세요.");
            	user_phone.focus();
            	return;
            }
            if(regex_phone.test(user_phone.value)!=true){
            	alert("핸드폰 번호 형식이 틀렸습니다. 숫자만 입력해 주세요.");
            	user_phone.value="";
            	user_phone.focus();
            	return;
            }
            if(user_region.value ==""){
            	alert("지역을 입력해 주세요.");
            	user_region.focus();
            	return;
            }
            if(chk==0){
            	alert("이메일 착신 여부를 설정해주세요");
            	return;
            }
            
            $.post("http://localhost:8100/Badac/user_sign_up", {
            	name : user_name.value,
            	email : user_email.value,
            	password : user_pw.value,
            	region : user_region.value,
            	phone : user_phone.value,
            	bicycletype : user_bicycletype.value,
            	emailpush : user_emailpush.value,
            }, function(data){
            		if( data.msg == "Success" ){
            			alert("회원가입이 완료되었습니다.");
            			location.href = "http://localhost:8100/Badac/";
            		}
            		else{
            			alert(data.msg);
            		}
            });
        }

        function toLoginPage(){
            location.href = "http://localhost:8100/Badac/login_page";
        	//location.href="LoginPage.jsp";
        }
    </script>
</head>
<body>
	이름 : <input name="user_name" id="user_name" type="text" placeholder="Enter your Name"><br />
	이메일 : <input name="user_email" id="user_email" type="email" placeholder="Enter your E-mail"><br />
	비밀번호 : <input name="user_password" id="user_password" type="password" placeholder="Enter your Password"><br />
	비밀번호 확인 : <input name="user_password_confirm" id="user_password_confirm" type="password" placeholder="Confirm Password"><br />
	지역 : <input name="user_region" id="user_region" type="text" placeholder="지역을 입력하세요"><br />
	핸드폰 번호 : <input name="user_phone" id="user_phone" type="text" placeholder="폰번호입력"><br />
	자전거 타입 : <select id="user_bicycletype">
            <option value="픽시">픽시</option>
            <option value="로드">로드</option>
            <option value="알톤">알톤</option>
            <option value="삼천리">알톤</option>
            <option value="etc">기타</option>
        </select><br />
	이메일 착신 여부 : <form name="user_emailpush">
					<input type="radio" name="email_push" value=1>착신
					<input type="radio" name="email_push" value=0>미착신
				</form><br />
	<div>
		<button onclick="toLoginPage()">Cancel</button>
        <button onclick="signUp()">Sign up</button>
    </div>
</body>
</html>