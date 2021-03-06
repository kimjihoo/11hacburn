<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>약관 동의</title>
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
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css">
    <link href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic" rel="stylesheet" type="text/css">

<style>
body {
	font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
    -webkit-background-size: cover;
    background: linear-gradient(-90deg, red, yellow);
    -moz-background-size: cover;
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%,rgba(0,0,0,0.3) 100%), url('img/signupbg.jpg');
    background-size: cover;
    -o-background-size: cover;
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}
</style>
<script type="text/javascript">
	function signUp(){
		var agree = document.getElementsByName('agree');
		var agreeCnt=0;
		for(var i = 0; i<agree.length; i++){
			if(agree[i].checked==true){
				agreeCnt++;
			}
		}
		var chk=0;
		var signup_type = document.signup_type.elements['confirm'];
		var choice_type;
    	var size = signup_type.length;
        for(var i = 0; i < size; i++) {
          if(signup_type[i].checked) {
        	  choice_type = signup_type[i];
        	  chk=1;
               break;
          }
       	}
        
        if(agreeCnt!=agree.length){
        	alert("약관에 동의하셔야 가입이 가능합니다.");
        	return;
        }
        if(chk==0){
        	alert("가입 종류를 선택해주셔야 합니다.");
        	return;
        }
		if(choice_type.value=="normal"){
			location.href = "http://210.118.74.159:8100/Badac/user_sign_up_page";
		}else if(choice_type.value=="company"){
			location.href = "http://210.118.74.159:8100/Badac/member_sign_up_page";
		}
	}
	
	function returnStartPage(){
		location.href = "http://210.118.74.159:8100/Badac/start_page";
	}
</script>
</head>
<body>
	<!-- Page Content -->
	
	<div class="brand">Welcome to Badoc !</div>
    <div class="address-bar">For your better bike life</div>
	
	<div class="container">
		<div class="row" style="text-align: center; color: white;">
			<h1>약관 동의</h1>
		</div>


		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4"
				style="border-radius: 5px; border: 1px solid rgb(231, 231, 231); color: white; padding-bottom: 15px; padding-right: 25px; padding-left: 25px; padding-top: 15px;">
				<form>
					<div
						style="width: 100%; height: 200px; border-radius: 5px; border: 1px solid rgb(231, 231, 231);">
						약관 내용</div>
					<div class="checkbox">
						<label><input type="checkbox" name="agree">동의</label>
					</div>
					<div
						style="width: 100%; height: 200px; border-radius: 5px; border: 1px solid rgb(231, 231, 231);">
						약관 내용2</div>
					<div class="checkbox">
						<label><input type="checkbox" name="agree">동의</label>
					</div>
				</form>
				<form role="form" name="signup_type">
					<div class="radio">
						<label><input type="radio" name="confirm" value="normal">일반</label>
						<label><input type="radio" name="confirm" value="company">가맹</label>
					</div>
				</form>
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<button type="button" class="btn" onclick="signUp()">Continue</button>
					</div>
					<div class="btn-group">
						<button type="button" class="btn"
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
	<!-- jQuery Version 1.11.1 -->
	<script src="js/jquery.js"></script>
</body>
</html>