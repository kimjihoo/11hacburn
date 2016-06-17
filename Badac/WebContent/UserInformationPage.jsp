<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정</title>
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

<!-- Fonts -->
<link
	href="http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
	rel="stylesheet" type="text/css">
<link
	href="http://fonts.googleapis.com/css?family=Josefin+Slab:100,300,400,600,700,100italic,300italic,400italic,600italic,700italic"
	rel="stylesheet" type="text/css">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<style>
body {
	padding-top: 100px;
	font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%,rgba(0,0,0,0.3) 100%), url('img/bikebg.jpg');
    background-size: cover;
    -o-background-size: cover;
	/* Required padding for .navbar-fixed-top. Remove if using .navbar-static-top. Change if height of navigation changes. */
}
</style>
<script>
	////////////////////////////////////////////////////////
<%// 쿠키값 가져오기
			Cookie[] cookies = request.getCookies();

			int userid = 0;
			String username = null;
			String useremail = null;
			String userpassword = null;
			String userregion_1 = null;
			String userregion_2 = null;
			String userregion_3 = null;
			String userphone = null;
			String userbicycletype = null;
			int useremailpush = 0;

			if (cookies != null) {

				for (int i = 0; i < cookies.length; i++) {
					Cookie c = cookies[i];

					if (c.getName().equals("user_id")) {
						userid = Integer.parseInt(c.getValue());
					}
					if (c.getName().equals("user_name")) {
						username = URLDecoder.decode(c.getValue(), "UTF-8");
					}
					if (c.getName().equals("user_email")) {
						useremail = c.getValue();
					}
					if (c.getName().equals("user_password")) {
						userpassword = c.getValue();
					}
					if (c.getName().equals("user_region_1")) {
						userregion_1 = c.getValue();
					}
					if (c.getName().equals("user_region_2")) {
						userregion_2 = URLDecoder.decode(c.getValue(), "UTF-8");
					}
					if (c.getName().equals("user_region_3")) {
						userregion_3 = URLDecoder.decode(c.getValue(), "UTF-8");
					}
					if (c.getName().equals("user_phone")) {
						userphone = c.getValue();
					}
					if (c.getName().equals("user_bicycletype")) {
						userbicycletype = URLDecoder.decode(c.getValue(), "UTF-8");
					}
					if (c.getName().equals("user_emailpush")) {
						useremailpush = Integer.parseInt(c.getValue());
					}
				}
			}%>
 
    var userId = '<%= userid %>';
    var userName = '<%= username %>';
    var userEmail = '<%= useremail %>';
    var userPassword = '<%= userpassword %>';
    var userRegion_1 = '<%= userregion_1 %>';
    var userRegion_2 = '<%= userregion_2 %>';
    var userRegion_3 = '<%= userregion_3 %>';
    var userPhone = '<%= userphone %>';
    var userBicycletype = '<%= userbicycletype %>';
    var userEmailpush = '<%= useremailpush %>';
    
	///////////////////////////////////////////////////////////////////
</script>
<script type="text/javascript">
		onload = function on_load(){
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
			
			$.get("http://210.118.74.159:8100/Badac/get_user_info",{
				id:userId,
				},function(data){
					if(data.msg=="Success"){
						user_name.value = data.userName;
						user_email.value = data.userEmail;
						user_region_1.value = data.userRegion_1;
						user_address.value = data.userRegion_2;
						user_address2.value = data.userRegion_3;
						
						var p_idx=0;
						for(var i=0; i<data.userPhone.length; i++){
							var temp = data.userPhone[i];
							if(temp=="-"){
								p_idx++;
								continue;
							}
							if(p_idx==0){
								user_phone1.value+=temp;
							}else if(p_idx==1){
								user_phone2.value+=temp;
							}else if(p_idx==2){
								user_phone3.value+=temp;
							}
						}
						for(var i=0; i<5; i++){
							if(data.userBicycletype==document.getElementsByTagName("option")[i].value){
								document.getElementById("user_bicycletype").selectedIndex = ""+i;
								break;
							}
						}
						
						if(data.userEmailpush=="0"){
							document.getElementById("email_push_2").checked = true;
						}else if(data.userEmailpush=="1"){
							document.getElementById("email_push_1").checked = true;
						}
					}else{
						alert(data.msg);
					}
			});
		}
        function updateInfo(){
        	var regex_email = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        	var regex_pw = /^[a-z0-9]{4,12}$/;
        	var regex_name = /^[a-zA-Z0-9가-힣]{2,8}$/;
    		var regex_phone = /^[0-9]*$/;

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
			
			var user_x;
			var user_y;
			
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
												
										  
           $.post("http://210.118.74.159:8100/Badac/user_update_information", {
           	id : userId,
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
           			alert("회원정보 수정이 완료되었습니다.");
           			location.href = "http://210.118.74.159:8100/Badac/user_main_page";
           		}
           		else{
           			alert(data.msg);
           		}
           });
										  
									  }
									});
					            
            

        }

        function returnMainPage(){
            location.href = "http://210.118.74.159:8100/Badac/user_main_page";
        }
    </script>
</head>
<body>

	<!-- Page Content -->
	<div class="container">
		<div class="brand" style="text-align: center;">Update Information</div>

		<div class="row">
			<div class="col-lg-4"></div>
			<div class="col-lg-4"
				style="border-radius: 5px; color: white; border: 1px solid rgb(231, 231, 231); padding-bottom: 15px; padding-right: 25px; padding-left: 25px; padding-top: 15px;">
				<div class="form-group">
					<label for="user_name">Name:</label> <input type="text"
						class="form-control input-sm" id="user_name" disabled>
				</div>
				<div class="form-group">
					<label for="user_email">Email:</label> <input type="text"
						class="form-control input-sm" id="user_email" disabled>
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
							<label><input type="radio" name="email_push"
								id="email_push_1" value=1>착신</label> <label><input
								type="radio" name="email_push" id="email_push_2" value=0>거부</label>
						</div>
					</form>
				</div>
				<div class="btn-group btn-group-justified">
					<div class="btn-group">
						<button type="button" class="btn btn-primary"
							onclick="updateInfo()">Update</button>
					</div>
					<div class="btn-group">
						<button type="button" class="btn btn-primary"
							onclick="returnMainPage()">Cancel</button>
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