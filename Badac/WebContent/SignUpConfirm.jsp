<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
			location.href = "http://localhost:8100/Badac/user_sign_up_page";
		}else if(choice_type.value=="company"){
			location.href = "http://localhost:8100/Badac/member_sign_up_page";
		}
	}
	
	function returnLoginPage(){
		//location.href = "http://localhost:8100/Badac/user_login_page";
		location.href="LoginPage.jsp";
	}
</script>
</head>
<body>
	약관 동의<br>
	<div style="width:200px; height:200px; border:solid 1px black;">
		약관 내용
	</div>
	<input type="checkbox" name="agree">동의<br>
	<br>
	<div style="width:200px; height:200px; border:solid 1px black;">
		약관 내용2
	</div>
	<input type="checkbox" name="agree">동의<br>
	<form name="signup_type">
		<input type="radio" name="confirm" value="normal">일반 회원
		<input type="radio" name="confirm" value="company">가맹 회원
	</form>
	<button onclick="signUp()">가입하기</button>
	<button onclick="returnLoginPage()">돌아가기</button>
</body>
</html>