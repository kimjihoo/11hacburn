<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래 등록</title>

<style>
body {
	padding-top: 70px;
}
</style>
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
	<script>    
    ////////////////////////////////////////////////////////
    <% // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;
    
    int userid = 0;
    String username=null;
    String useremail=null;
    
    if(cookies != null){
         
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
             
            if( c.getName().equals("user_id") ){
            	userid = Integer.parseInt(c.getValue());
            }
            if( c.getName().equals("user_name") ){
            	username = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if( c.getName().equals("user_email") ){
            	useremail = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    } 
    %>
 
    var userId = '<%= userid %>';
    var userName = '<%= username %>';
    var userEmail = '<%= useremail %>';

	///////////////////////////////////////////////////////////////////
	</script>
<script>
	function count_the_hours() {
		var today = new Date();

		//시작일이 내일이라 치면
		var startDay = new Date(2010, 8 // 0 부터 시작 따라서 0 = 1월
		, today.getDate(), today.getHours(), today.getMinutes(), today
				.getSeconds());

		//마침은 시작일로 부터 언제 ~>
		var endDay = new Date(startDay.getFullYear(), startDay.getMonth(),
				startDay.getDate() + 0, 13, 6, 00);

		//밀리 세컨트로 바꿔주고 
		var gtToday = today.getTime();
		var gtStartDay = startDay.getTime();
		var gtEndDay = endDay.getTime();

		// 1/1000는 자름
		var timeGap = Math.floor((gtEndDay - gtToday) / 1000);

		//일시분초 초로 계산된값 
		var secound = 1;
		var minute = secound * 60;
		var hour = minute * 60;
		var day = hour * 24;

		//남은 일 시 분 
		var ReDay = Math.floor(timeGap / day);
		var ReHour = Math.floor((timeGap - (ReDay * day)) / hour);
		var ReMinute = Math.floor((timeGap - ((ReDay * day) + (ReHour * hour)))
				/ minute);
		var ReSecond = Math
				.floor((timeGap - ((ReDay * day) + (ReHour * hour) + (ReMinute * minute)))
						/ secound);

		var str = '남은 시간 ' + ReHour + ':' + ReMinute + ':' + ReSecond;
		var total_value_zero = ReHour + ReMinute + ReSecond;

		if (total_value_zero == 0) {
			clearInterval(timeing);
			clock.innerHTML = '종료되었습니다.';
		} else if (total_value_zero < 0) {
			clock.innerHTML = '종료되었습니다.';
		} else if (total_value_zero > 0) {
			clock.innerHTML = str;
		}
	}

	timeing = setInterval("count_the_hours()", 1000);
</script>

<script type="text/javascript">
        function insertApplication(){

			var title = document.getElementById("auction_title");
			var buydate = document.getElementById("auction_date");
			var auctionarea = document.getElementById("auction_area");
			var buyprice = document.getElementById("auction_buyprice");
			var auctionprice = document.getElementById("auction_price");
			var explain = document.getElementById("auction_explanation");
			
            if(title.value == ""){
                alert("제목을 입력하세요.");
                title.focus();
                return;
            }
            if(auctionarea.value == ""){
                alert("거래 지역을 입력하세요.");
                title.focus();
                return;
            }
            if(butdate.value == ""){
                alert("구입 시기를 입력하세요.");
                title.focus();
                return;
            }
            if(buyprice.value == ""){
                alert("구매 가격을 입력하세요.");
                title.focus();
                return;
            }
            if(auctionprice.value == ""){
                alert("희망 가격을 입력하세요.");
                title.focus();
                return;
            }
            if(explain.value == ""){
                alert("설명을 입력하세요.");
                explain.focus();
                return;
            }
            
            var app_id;
            var formData;
            $.post("http://210.118.74.159:8100/Badac/insert_application", {
            	id : userId,
            	title : title.value,
            	explanation : explain.value,
            }, function(data){
            		if( data.msg == "Success" ){
            			app_id = data.appId;
            			var fileSelect = document.getElementById("file");
                        var files = fileSelect.files;
                        formData = new FormData();
                        for (var i = 0; i < files.length; i++) {
                       	     var file = files[i];
                             formData.append('file', file, file.name);
                        }
                        formData.append('appId',app_id);
                        if(files.length==0){
                        	alert('업로드를 완료했습니다.');
                            location.href = "http://210.118.74.159:8100/Badac/user_main_page";
                        }else if(files.length!=0){
                        	$.ajax({
                                url: 'http://210.118.74.159:8100/Badac/upload_picture',
                                type: 'POST',
                                data: formData,
                                processData: false,
                                contentType: false,
                                async: false,
                                success: function (data) {
                                    if (data.msg == 'Success') {
                                        alert('업로드를 완료했습니다.');
                                        location.href = "http://210.118.74.159:8100/Badac/user_main_page";
                                    }else{
                                    	alert(data.msg);
                                    }
                                },
                                error: function(data){
                                    alert(data.msg);
                                }
                            });
                        }
                    }
            		else{
            			alert(data.msg);
            		}
            });
            
        }

        function toMainPage(){
            location.href = "http://210.118.74.159:8100/Badac/user_main_page";
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
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">사용자
						정보 <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href=""><img src="http://placehold.it/130x100"
								alt=".." /></a></li>
						<li><a id="name"></a></li>
						<li><a id="email"></a></li>
						<li class="divider"></li>
						<li><a href="http://210.118.74.159:8100/Badac/user_logout">로그아웃</a></li>
						<li><a
							href="http://210.118.74.159:8100/Badac/go_user_update_information">개인정보
								수정</a></li>
						<li><a href="#">견적 요청 내역 보기</a></li>
						<li><a
							href="http://210.118.74.159:8100/Badac/write_application">견적
								제안서 작성</a></li>

					</ul></li>


			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<div class="contentwrap">
		<article class="container">
		<div class="page-header">
			<h1>
				거래 <small>등록</small>
			</h1>
		</div>

		<div class="container">
			<table class="table table-hover" width=700>
				<span id=clock style="position: relative; color: red;"></span>
				<tr>
					<td><b>제목</b></td>
					<td><input id="auction_title" type=text
						class="form-control input-sm" name=dbemail size=50 maxlength=50></td>
				</tr>
				<tr>
					<td><b>거래 지역</b></td>
					<td><input id="auction_area" type=text
						class="form-control input-sm" name=dbemail size=50 maxlength=50></td>
				</tr>
				<tr>
					<td><b>구입 시기</b></td>
					<td><input id="auction_date" type=text
						class="form-control input-sm" name=dbemail size=50 maxlength=50></td>
				</tr>
				<tr>
					<td><b>구입 가격</b></td>
					<td><input id="auction_buyprice" type=text
						class="form-control input-sm" name=dbemail size=50 maxlength=50></td>
				</tr>
				<tr>
					<td><b>희망 가격</b></td>
					<td><input id="auction_price" type=text
						class="form-control input-sm" name=dbemail size=50 maxlength=50></td>
				</tr>
				<tr>
					<td><b>이미지</b></td>
					<td><div class="form-group">
							<input type="file" id="file" multiple="multiple">
							<p class="help-block">제품 사진 첨부</p>
						</div> <br /></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td><textarea id="auction_explanation" name=dbmemo
							class="form-control input-sm" cols=50 rows=10></textarea></td>
				</tr>
			</table>
			<table cellspacing=0 cellpadding=0 border=0 width=500>
				<tr>
					<button type="button" class="btn btn-default"
						onclick="insertApplication()">등록</button>
					<a class="btn btn-default" onclick="toMainPage()">취소</a>
				</tr>
			</table>
		</div>
</body>
</html>