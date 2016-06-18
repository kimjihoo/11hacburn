<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<%@ page import="java.util.*, java.text.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>거래 등록</title>
<link href="css/button.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
}
.header > h1{
	font-family: "고딕";
}
.btn{
margin-right:5px;
}
</style>
<script>
	Date registdate = new Date();
	SimpleDataFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
	String strdate = simpleDate.format(date);
	Calender cal = Calendar.getInstance();
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
            	buydate : buydate.value,
            	auctionarea : auctionarea.value,
            	buyprice : buyprice.value,
            	auctionprice : auctionprice.value,
            	explanation : explain.value,
            	registdate : registdate.value,
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
		</article>
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
					<a class="btn" onclick="toMainPage()">취소</a>
				</tr>
			</table>
		</div>
</body>
</html>
