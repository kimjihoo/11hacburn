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
        	var regix_email = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        	var regix_pw = /^[a-z0-9]{4,12}$/;
    		var regix_name = /^[a-zA-Z0-9가-힣]{2,8}$/;

    		var company_ownername = document.getElementById("company_ownername");
			var company_email = document.getElementById("company_email");
			var company_pw = document.getElementById("company_password");
			var company_chk_pw = document.getElementById("company_password_confirm");
			var company_name = document.getElementById("company_name");
			var company_region = document.getElementById("company_region");
			var company_telephone = document.getElementById("company_telephone");
			var company_phone = document.getElementById("company_phone");
			var company_photo = document.getElementById("company_photo");
			
            if(company_name.value == ""){
                alert("이름을 입력하세요.");
                company_name.focus();
                return;
            }
            if(regix_name.test(company_name.value) != true){
                alert("이름 형식이 틀렸습니다. (영문 / 한글 - 2~8글자)");
                company_name.focus();
                return;
            }
            if(company_email.value == ""){
                alert("이메일을 입력하세요.");
                company_email.focus();
                return;
            }
            if(regix_email.test(company_email.value) != true){
            	alert("이메일 형식이 틀렸습니다. (xx@xx.xx)");
            	company_email.focus();
                return;
            }
            if(company_pw.value == ""){
                alert("비밀번호를 입력하세요.");
                company_pw.focus();
                return;
            }
            if(regix_pw.test(company_pw.value) != true){
            	alert("비밀번호 형식이 틀렸습니다. (영문 / 숫자 - 4~12글자)");
            	company_pw.focus();
                return;
            }
            if(company_chk_pw.value == ""){
                alert("확인 비밀번호를 입력하세요.");
                company_chk_pw.focus();
                return;
            }
            if(regix_pw.test(company_chk_pw.value) != true){
            	alert("확인 비밀번호 형식이 틀렸습니다. (4~12글자 영문 / 숫자)");
            	company_chk_pw.focus();
                return;
            }
            if(!(company_pw.value == company_chk_pw.value)){
                alert("비밀번호와 확인 비밀번호가 다릅니다.");
                company_chk_pw.focus();
                return;
            }
            
            /* alert(company_email.value);
            alert(company_pw.value);
            alert(company_name.value); */
            
            $.post("http://localhost:8100/Badac/member_sign_up", {
            	ownername : company_ownername.value,
            	email : company_email.value,
            	password : company_pw.value,
            	name : company_name.value,
            	region : company_region.value,
            	telephone : company_telephone.value,
            	phone : company_phone.value,
            	photo : company_photo.value,
            }, function(data){
            		if( data.msg == "Success" ){
            			alert("회원가입이 완료되었습니다.");
            			location.href = "http://localhost:8100/Badac/member";
            		}
            		else{
            			alert(data.msg);
            		}
            });
        }

        function toLoginPage(){
            location.href = "http://localhost:8100/Badac/member_login_page";
        }
    </script>
</head>
<body>

<table id="login_Table" style="width:100%">
    <tbody>
    <tr style="width:100%">
        <td style="width:40%"></td>
        <td style="width:20%; padding-top:5%;">
            <div style="width:100%;">
        <div style="width:60%; margin:auto;">
        <div class="form-group">
                    <input name="company_onwername" id="company_ownername" type="text" class="form-control" placeholder="Enter your Name">
                </div>
                <div class="form-group">
                    <input name="company_email" id="company_email" type="email" class="form-control" placeholder="Enter your E-mail">
                </div>
                <div class="form-group">
                    <input name="company_password" id="company_password" type="password" class="form-control" placeholder="Enter your Password">
                </div>
                <div class="form-group">
                    <input name="company_password_confirm" id="company_password_confirm" type="password" class="form-control" placeholder="Confirm Password">
                </div>
                <div class="form-group">
                    <input name="company_name" id="company_name" type="text" class="form-control" placeholder="Enter your CompanyName">
                </div>
                <div class="form-group">
                    <input name="company_region" id="company_region" type="text" class="form-control" placeholder="지역을 입력하세요">
                </div>
                <div class="form-group">
                    <input name="company_telephone" id="company_telephone" type="text" class="form-control" placeholder="가게번호입력">
                </div>
                <div class="form-group">
                    <input name="company_phone" id="company_phone" type="text" class="form-control" placeholder="폰번호입력">
                </div>
                <div class="form-group">
                    <input name="company_photo" id="company_photo" type="text" class="form-control" placeholder="그림">
                </div>
            <div>
                <button style="float:right;" class="btn btn-default" onclick="toLoginPage()">Cancel</button>
                <button style="margin-right:10px; float:right;" class="btn btn-default" onclick="signUp()">Sign up</button>
            </div>
            </div>
            </div>
        </td>
        <td style="width:40%"></td>
    </tr>
    </tbody>
</table>
</body>
</html>