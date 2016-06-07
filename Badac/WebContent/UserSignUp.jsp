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
			var user_region_1 = document.getElementById("user_region_1");
			var user_address = document.getElementById("user_address");
			var user_address2 = document.getElementById("user_address2");
			
			var user_phone1 = document.getElementById("user_phone1");
			var user_phone2 = document.getElementById("user_phone2");
			var user_phone3 = document.getElementById("user_phone3");
			
			var x = document.getElementById("user_bicycletype").selectedIndex;
			var user_bicycletype = document.getElementsByTagName("option")[x];
			
			var chk=0;
			var temp = document.user_emailpush.elements['email_push'];
			var user_emailpush;
			var user_x;
			var user_y;
			
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
            if(user_phone1.value==""){
            	alert("핸드폰 번호를 입력하세요.");
            	user_phone1.focus();
            	return;
            }
            if(user_phone2.value==""){
            	alert("핸드폰 번호를 입력하세요.");
            	user_phone2.focus();
            	return;
            }
            if(user_phone3.value==""){
            	alert("핸드폰 번호를 입력하세요.");
            	user_phone3.focus();
            	return;
            }
            
            if(regex_phone.test(user_phone1.value)!=true||regex_phone.test(user_phone2.value)!=true||regex_phone.test(user_phone3.value)!=true){
            	alert("핸드폰 번호 형식이 틀렸습니다. 숫자만 입력해 주세요.");
            	user_phone1.value="";
            	user_phone2.value="";
            	user_phone3.value="";
            	user_phone1.focus();
            	return;
            }
            
            if(user_region_1.value ==""){
            	alert("우편번호를 입력해주세요.");
            	user_region_1.focus();
            	return;
            }
            if(user_address2.value ==""){
            	alert("상세주소를 입력해주세요.");
            	user_address2.focus();
            	return;
            }
            if(chk==0){
            	alert("이메일 착신 여부를 설정해주세요");
            	return;
            }
												
												$.ajax({
													  dataType: "jsonp",
													  url: "http://apis.daum.net/local/geo/addr2coord?apikey=3a654d3947433483eca1b853767e0d03&q="+user_address.value + " " + user_address2.value+"&output=json",
													  async : false,
													  success : function( data ) {
														  user_x = data.channel.item[0].point_x;
														  user_y = data.channel.item[0].point_y;
														  
														  $.post("http://210.118.74.159:8100/Badac/user_sign_up", {
							            	name : user_name.value,
							            	email : user_email.value,
							            	password : user_pw.value,
							            	region_1 : user_region_1.value,
							            	region_2 : user_address.value,
							            	region_3 : user_address2.value,
							            	phone : user_phone1.value+"-"+user_phone2.value+"-"+user_phone3.value,
							            	bicycletype : user_bicycletype.value,
							            	emailpush : user_emailpush.value,
							            	lat : user_x,
							            	lng : user_y,
												            	
						            }, function(data){
						            		if( data.msg == "Success" ){
						            			alert("회원가입이 완료되었습니다.");
						            			location.href = "http://210.118.74.159:8100/Badac/login_page";
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
        	//location.href="LoginPage.jsp";
        }
    </script>
</head>
<body>
	<!-- Navigation -->
<!-- 	<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
		<div class="container">
			Brand and toggle get grouped for better mobile display
			<div class="navbar-header">
				<a class="navbar-brand" href="#">BADOC</a>
			</div>
			Collect the nav links, forms, and other content for toggling
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">About</a></li>
					<li><a href="#">Services</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</div>
			/.navbar-collapse
		</div>
		/.container
	</nav> -->

	<!-- Page Content -->
	<div class="container">
		<div class="brand">Sign up to Badoc</div>
    	<div class="address-bar">For your better bike life</div>

		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4"
				style="border-radius: 5px; color: white; border: 1px solid rgb(231, 231, 231); padding-bottom: 15px; padding-right: 25px; padding-left: 25px; padding-top: 15px;">
				<div class="form-group">
					<label for="user_name">Name:</label> <input type="text"
						class="form-control input-sm" id="user_name">
				</div>
				<div class="form-group">
					<label for="user_email">Email:</label> <input type="text"
						class="form-control input-sm" id="user_email">
				</div>
				<div class="form-group">
					<label for="user_password">Password:</label> <input type="password"
						class="form-control input-sm" id="user_password">
				</div>
				<div class="form-group">
					<label for="user_password_confirm">Password Confirm:</label> <input
						type="password" class="form-control input-sm"
						id="user_password_confirm">
				</div>

				<div class="form-group">
					<label for="user_region_1">Region:</label>
					<div class="form-inline">
						<input type="text" class="form-control input-sm"
							id="user_region_1" placeholder="우편번호"> <input
							type="button" class="btn btn-primary btn-sm"
							onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
					</div>
					<span id="helpBlock" class="help-block" style="color: white;">우편번호 찾기 버튼을 눌러 우편번호를
						검색하세요.</span>
				</div>
				<div class="form-group">
					<input type="text" class="form-control input-sm" id="user_address"
						placeholder="주소"> <input type="text"
						class="form-control input-sm" id="user_address2"
						placeholder="상세주소">
				</div>
				<div class="form-group">
					<label for="user_phone">Phone:</label>
					<div class="row">
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm" id="user_phone1">
						</div>
						<div class="col-sm-1">-</div>
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm" id="user_phone2">
						</div>
						<div class="col-sm-1">-</div>
						<div class="col-sm-3">
							<input type="text" class="form-control input-sm" id="user_phone3">
						</div>
					</div>
				</div>
				<div class="form-group">
					<label for="user_bicycletype">Bicycle Type:</label> <select
						class="form-control" id="user_bicycletype">
						<option value="픽시">픽시</option>
						<option value="로드">로드</option>
						<option value="알톤">알톤</option>
						<option value="삼천리">삼천리</option>
						<option value="etc">etc</option>
					</select>
				</div>
				<div class="form-group">
					<form role="form" name="user_emailpush">
						<div class="radio">
							<label><input type="radio" name="email_push" value=1>착신</label>
							<label><input type="radio" name="email_push" value=0>거부</label>
						</div>
					</form>
				</div>
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<button type="button" class="btn btn-primary" onclick="signUp()">Sign
							up</button>
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
	<br><br><br>
	<div class="container">
		<div class="row">
			<div class="col-lg-8 col-lg-offset-2 text-center">
				<p style="color: white;">Copyright &copy; Badoc Corporation 2016</p>
			</div>
		</div>
	</div>

	<!-- jQuery Version 1.11.1 -->
	<script src="js/jquery.js"></script>

	<!-- 다음 주소 api -->
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
                document.getElementById('user_region_1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('user_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('user_address2').focus();
            }
        }).open();
    }
</script>
</body>
</html>