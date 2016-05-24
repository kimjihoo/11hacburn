<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>signup</title>
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
   		 function confirmOut(){
   			 if(confirm("정말로 탈퇴하시겠습니까?")) {
    		   DropOut();
   			 }
   		 }
   	</script>
    <script type="text/javascript">
        function DropOut(){
        	var regex_pw = /^[a-z0-9]{4,12}$/;
			var user_pw = document.getElementById("user_password");
			
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
												
												$.ajax({
													  dataType: "jsonp",
													  url: "http://apis.daum.net/local/geo/addr2coord?apikey=3a654d3947433483eca1b853767e0d03&q="+user_address.value + " " + user_address2.value+"&output=json",
													  async : false,
													  success : function( data ) {														  
														  $.post("http://210.118.74.159:8100/Badac/user_sign_up", {
							            	password : user_pw.value,
												            	
						            }, function(data){
						            		if( data.msg == "Success" ){
						            			alert("탈퇴처리가 완료되었습니다. Badoc을 이용해주셔서 감사합니다.");
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
	<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">BADOC</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

    	<!-- Page Content -->
    <div class="container">
    	<div class="row" style="text-align:center;">
    		<h1>BADOC 회원탈퇴</h1>
    	</div>

        <div class="row">
        	<div class="col-lg-4">
            </div>
            <div class="col-lg-4" style="border-radius:5px; border:1px solid rgb(231,231,231); padding-bottom:15px; padding-right:25px; padding-left:25px; padding-top:15px;">
    			<div class="form-group">
      				<label for="user_password">Password:</label>
      				<input type="password" class="form-control input-sm" id="user_password">
    			</div>    			
    			<div class="btn-group btn-group-justified">
    				<div class="btn-group">
      					<button type="button" class="btn btn-primary" onclick="confirmOut()">회원탈퇴</button>
    				</div>
    				<div class="btn-group">
      					<button type="button" class="btn btn-primary" onclick="returnStartPage()">취소</button>
    				</div>
  				</div>
            </div>
            <div class="col-lg-4">
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
</body>
</html>