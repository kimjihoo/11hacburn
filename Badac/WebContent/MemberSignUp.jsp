<%@ page contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 다음 주소 api -->
<style>
body {
	font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%,rgba(0,0,0,0.3) 100%), url('img/signupbg.jpg');
    background-size: cover;
    -o-background-size: cover;
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
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
			var company_region_1 = document.getElementById("company_region_1");
			
			
			var company_address = document.getElementById("company_address");
			
			var company_address2 = document.getElementById("company_address2");
			
			
			var company_telephone1 = document.getElementById("company_telephone1");
			var company_telephone2 = document.getElementById("company_telephone2");
			var company_telephone3 = document.getElementById("company_telephone3");
			
			
			var company_phone1 = document.getElementById("company_phone1");
			var company_phone2 = document.getElementById("company_phone2");
			var company_phone3 = document.getElementById("company_phone3");
			
			var chk=0;
			var temp = document.company_emailpush.elements['email_push'];
			var company_emailpush;
			var company_x;
			var company_y;
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
            if(company_phone1.value==""){
            	alert("핸드폰 번호를 입력하세요.");
            	company_phone1.focus();
            	return;
            }
            if(company_phone2.value==""){
            	alert("핸드폰 번호를 입력하세요.");
            	company_phone2.focus();
            	return;
            }
            if(company_phone3.value==""){
            	alert("핸드폰 번호를 입력하세요.");
            	company_phone3.focus();
            	return;
            }
            
            if(regex_phone.test(company_phone1.value)!=true||regex_phone.test(company_phone2.value)!=true||regex_phone.test(company_phone3.value)!=true){
            	alert("핸드폰 번호 형식이 틀렸습니다. 숫자만 입력해 주세요.");
            	company_phone1.value="";
            	company_phone2.value="";
            	company_phone3.value="";
            	
            	company_phone1.focus();
            	return;
            }
            
            if(company_telephone1.value==""){
            	alert("전화번호를 입력하세요.");
            	company_telephone1.focus();
            	return;
            }
            if(company_telephone2.value==""){
            	alert("전화번호를 입력하세요.");
            	company_telephone2.focus();
            	return;
            }
            if(company_telephone3.value==""){
            	alert("전화번호를 입력하세요.");
            	company_telephone3.focus();
            	return;
            }
            
            if(regex_phone.test(company_telephone1.value)!=true||regex_phone.test(company_telephone2.value)!=true||regex_phone.test(company_telephone3.value)!=true){
            	alert("전화번호 형식이 틀렸습니다. 숫자만 입력해 주세요.");
            	company_telephone1.value="";
            	company_telephone2.value="";
            	company_telephone3.value="";
            	
            	company_telephone1.focus();
            	return;
            }
            if(company_region_1.value ==""){
            	alert("우편번호를 입력해 주세요.");
            	company_region_1.focus();
            	return;
            }
            if(company_address2.value ==""){
            	alert("상세주소를 입력해 주세요.");
            	company_address2.focus();
            	return;
            }
            if(chk==0){
            	alert("이메일 착신 여부를 설정해주세요");
            	return;
            }

            $.ajax({
				  dataType: "jsonp",
				  url: "http://apis.daum.net/local/geo/addr2coord?apikey=3a654d3947433483eca1b853767e0d03&q="+company_address.value + " " + company_address2.value+"&output=json",
				  async : false,
				  success : function( data ) {
					  company_x = data.channel.item[0].point_x;
					  company_y = data.channel.item[0].point_y;
													  
													  $.post("http://210.118.74.159:8100/Badac/member_sign_up", {
											            	ownername : company_ownername.value,
											            	email : company_email.value,
											            	password : company_pw.value,
											            	name : company_name.value,
											            	region_1 : company_region_1.value,
											            	region_2 : company_address.value,
											            	region_3 : company_address2.value,
											            	telephone : company_telephone1.value+"-"+company_telephone2.value+"-"+company_telephone3.value,
											            	phone : company_phone1.value+"-"+company_phone2.value+"-"+ company_phone3.value,
											            	emailpush : company_emailpush.value,
											            	
											            	lat : company_x,
											            	lng : company_y,
											            }, function(data){
											            		if( data.msg == "Success" ){
											            			alert("회원가입이 완료되었습니다. 승인까지 1~2일 소모되며 승인 후 로그인이 가능합니다.");
											            			location.href = "http://210.118.74.159:8100/Badac/";
											            		}
											            		else{
											            			alert(data.msg);
											            		}
											            });																				
												  }
												});
                   }

        function returnStartPage(){
            location.href = "http://210.118.74.159:8100/Badac/start_page";
        }
</script>
</head>
<body>
	<!-- Page Content -->
	<div class="container">
		<div class="brand">Sign up to Badoc</div>
    	<div class="address-bar">For your better bike life</div>
    	
		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4"
				style="border-radius: 5px; color: white; border: 1px solid rgb(231, 231, 231); padding-bottom: 15px; padding-right: 25px; padding-left: 25px; padding-top: 15px;">
				<div class="form-group">
					<label for="company_ownername">Owner Name:</label> <input
						type="text" class="form-control input-sm" id="company_ownername">
				</div>
				<div class="form-group">
					<label for="company_email">Email:</label> <input type="text"
						class="form-control input-sm" id="company_email">
				</div>
				<div class="form-group">
					<label for="company_password">Password:</label> <input
						type="password" class="form-control input-sm"
						id="company_password">
				</div>
				<div class="form-group">
					<label for="company_password_confirm">Password Confirm:</label> <input
						type="password" class="form-control input-sm"
						id="company_password_confirm">
				</div>
				<div class="form-group">
					<label for="company_name">Company Name:</label> <input type="text"
						class="form-control input-sm" id="company_name">
				</div>

				<div class="form-group">
					<label for="user_region_1">Region:</label>
					<div class="form-inline">
						<input type="text" class="form-control input-sm"
							id="company_region_1" placeholder="우편번호"> <input
							type="button" class="btn btn-primary btn-sm"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>
					<span id="helpBlock" class="help-block" style="color: white;">우편번호 찾기 버튼을 눌러 우편번호를
						검색하세요.</span>
				</div>
				<div class="form-group">
					<input type="text" class="form-control input-sm"
						id="company_address" placeholder="주소"> <input type="text"
						class="form-control input-sm" id="company_address2"
						placeholder="상세주소">
				</div>

				<div class="form-group">
					<label for="company_telephone">TelePhone:</label>
					<div class="row" id="company_telephone">
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm"
								id="company_telephone1">
						</div>
						<div class="col-sm-1">-</div>
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm"
								id="company_telephone2">
						</div>
						<div class="col-sm-1">-</div>
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm"
								id="company_telephone3">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="company_phone">Phone:</label>
					<div class="row" id="company_phone">
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm"
								id="company_phone1">
						</div>
						<div class="col-sm-1">-</div>
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm"
								id="company_phone2">
						</div>
						<div class="col-sm-1">-</div>
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm"
								id="company_phone3">
						</div>
					</div>
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
						<button type="button" class="btn btn-primary" onclick="signUp()">Sign
							Up</button>
					</div>
					<div class="btn-group">
						<button type="button" class="btn btn-primary"
							onclick="returnStartPage()">Cancel</button>
					</div>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
		<!-- /.row -->
	</div>
	<!-- /.container -->
	<br><br>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<p style="color: white;">Copyright &copy; Badoc Corporation 2016</p>
			</div>
		</div>
	</div>
<script> 
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('company_region_1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('company_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('company_address2').focus();
            }
        }).open();
    }
</script>
<!-- jQuery Version 1.11.1 -->
<script src="js/jquery.js"></script>
</body>
</html>