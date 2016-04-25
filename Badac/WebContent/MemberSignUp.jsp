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

    		var company_ownername = document.getElementById("company_ownername");
			var company_email = document.getElementById("company_email");
			var company_pw = document.getElementById("company_password");
			var company_chk_pw = document.getElementById("company_password_confirm");
			var company_name = document.getElementById("company_name");
			var company_region = document.getElementById("company_region");
			var company_telephone = document.getElementById("company_telephone");
			var company_phone = document.getElementById("company_phone");
			
			var chk=0;
			var temp = document.company_emailpush.elements['email_push'];
			var company_emailpush;
	    	var size = temp.length;
	        for(var i = 0; i < size; i++) {
	          if(temp[i].checked) {
	        	  company_emailpush = temp[i];
	        	  chk=1;
	               break;
	          }
	       	}
	        if(company_ownername.value == ""){
                alert("대표자 이름을 입력하세요.");
                company_ownername.focus();
                return;
            }
            if(regex_name.test(company_ownername.value) != true){
                alert("이름 형식이 틀렸습니다. (영문 / 한글 - 2~8글자)");
                company_ownername.value="";
                company_ownername.focus();
                return;
            }
            if(company_name.value == ""){
                alert("회사 이름을 입력하세요.");
                company_name.focus();
                return;
            }
            if(regex_name.test(company_name.value) != true){
                alert("회사 이름 형식이 틀렸습니다. (영문 / 한글 - 2~8글자)");
                company_name.value="";
                company_name.focus();
                return;
            }
            if(company_email.value == ""){
                alert("이메일을 입력하세요.");
                company_email.focus();
                return;
            }
            if(regex_email.test(company_email.value) != true){
            	alert("이메일 형식이 틀렸습니다. (xx@xx.xx)");
            	company_email.value="";
            	company_email.focus();
                return;
            }
            if(company_pw.value == ""){
                alert("비밀번호를 입력하세요.");
                company_pw.focus();
                return;
            }
            if(regex_pw.test(company_pw.value) != true){
            	alert("비밀번호 형식이 틀렸습니다. (영문 / 숫자 - 4~12글자)");
            	company_pw.value="";
            	company_pw.focus();
                return;
            }
            if(company_chk_pw.value == ""){
                alert("확인 비밀번호를 입력하세요.");
                company_chk_pw.focus();
                return;
            }
            if(regex_pw.test(company_chk_pw.value) != true){
            	alert("확인 비밀번호 형식이 틀렸습니다. (4~12글자 영문 / 숫자)");
            	company_chk_pw.value="";
            	company_chk_pw.focus();
                return;
            }
            if(!(company_pw.value == company_chk_pw.value)){
                alert("비밀번호와 확인 비밀번호가 다릅니다.");
                company_chk_pw.focus();
                return;
            }
            if(company_phone.value==""){
            	alert("핸드폰 번호를 입력하세요.");
            	company_phone.focus();
            	return;
            }
            if(regex_phone.test(company_phone.value)!=true){
            	alert("핸드폰 번호 형식이 틀렸습니다. 숫자만 입력해 주세요.");
            	company_phone.value="";
            	company_phone.focus();
            	return;
            }
            if(company_telephone.value==""){
            	alert("전화번호를 입력하세요.");
            	company_telephone.focus();
            	return;
            }
            if(regex_phone.test(company_telephone.value)!=true){
            	alert("전화번호 형식이 틀렸습니다. 숫자만 입력해 주세요.");
            	company_telephone.value="";
            	company_telephone.focus();
            	return;
            }
            if(company_region.value ==""){
            	alert("지역을 입력해 주세요.");
            	company_region.focus();
            	return;
            }
            if(chk==0){
            	alert("이메일 착신 여부를 설정해주세요");
            	return;
            }
            
            $.post("http://localhost:8100/Badac/member_sign_up", {
            	ownername : company_ownername.value,
            	email : company_email.value,
            	password : company_pw.value,
            	name : company_name.value,
            	region : company_region.value,
            	telephone : company_telephone.value,
            	phone : company_phone.value,
            	emailpush : company_emailpush.value,
            }, function(data){
            		if( data.msg == "Success" ){
            			alert("회원가입이 완료되었습니다. 승인까지 1~2일 소모되며 승인 후 로그인이 가능합니다.");
            			location.href = "http://localhost:8100/Badac/";
            		}
            		else{
            			alert(data.msg);
            		}
            });
        }

        function returnStartPage(){
            location.href = "http://localhost:8100/Badac/start_page";
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
  				<div class="form-group">
      				<label for="company_ownername">Owner Name:</label>
      				<input type="text" class="form-control input-sm" id="company_ownername">
    			</div>
    			<div class="form-group">
      				<label for="company_email">Email:</label>
      				<input type="text" class="form-control input-sm" id="company_email">
    			</div>
    			<div class="form-group">
      				<label for="company_password">Password:</label>
      				<input type="password" class="form-control input-sm" id="company_password">
    			</div>
    			<div class="form-group">
      				<label for="company_password_confirm">Password Confirm:</label>
      				<input type="password" class="form-control input-sm" id="company_password_confirm">
    			</div>
    			<div class="form-group">
      				<label for="company_name">Company Name:</label>
      				<input type="text" class="form-control input-sm" id="company_name">
    			</div>
    			<div class="form-group">
      				<label for="company_region">Company Region:</label>
      				<input type="text" class="form-control input-sm" id="company_region">
    			</div>
    			<div class="form-group">
      				<label for="company_telephone">TelePhone:</label>
      				<input type="text" class="form-control input-sm" id="company_telephone">
    			</div>
    			<div class="form-group">
      				<label for="company_phone">Phone:</label>
      				<input type="text" class="form-control input-sm" id="company_phone">
    			</div>
    			<div class="form-group">
    			<form role="form" name="company_emailpush">
            		<div class="radio">
      					<label><input type="radio" name="email_push" value=1>착신</label>
      					<label><input type="radio" name="email_push" value=0>거부</label>
    				</div>
  				</form>
    			</div>
    			<div class="btn-group btn-group-justified">
    				<div class="btn-group">
      					<button type="button" class="btn btn-primary" onclick="signUp()">Sign Up</button>
    				</div>
    				<div class="btn-group">
      					<button type="button" class="btn btn-primary" onclick="returnStartPage()">Cancel</button>
    				</div>
  				</div>
            </div>
            <div class="col-lg-4">
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

    <!-- jQuery Version 1.11.1 -->
    <script src="js/jquery.js"></script>
</body>
</html>