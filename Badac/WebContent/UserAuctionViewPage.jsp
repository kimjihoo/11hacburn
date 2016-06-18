<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<import java.util.*>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래 보기</title>
<link href="css/button.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
}
.btn{
margin-right:5px;
}
</style>
<script>
long time = System.currentTimeMills();
System.out.println(time.toString());

Date today = new Date();
</script>
<script>
	function count_the_hours() {
		var today = new Date();

		//시작일이 내일이라 치면
		var startDay = new Date(2016, 4 // 0 부터 시작 따라서 0 = 1월
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
					<button type="button" class="btn"
						onclick="insertApplication()">등록</button>  
					<a role="button" class="btn" onclick="toMainPage()">취소</a>
				</tr>
			</table>
		</div>
</body>
</html>
