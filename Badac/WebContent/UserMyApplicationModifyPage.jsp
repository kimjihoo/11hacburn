<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나의 견적 요청서 수정</title>
<style>
body {
	padding-top: 70px;
}
</style>
<script type="text/javascript">
        $(function() {
            $("#file").on('change', function(){
                readURL(this);
            });
        });

        function readURL(input) {
            if (input.files && input.files[0]) {
            var reader = new FileReader();
			reader.onload = function (e) {
                   $('#blah1').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
            document.getElementById("te_p").innerHTML=" 외 "+(input.files.length-1)+"장";
			}
        }


    </script>
<script type="text/javascript">
        function modifyApplication(){

			var title = document.getElementById("tunning_title");
			var explain = document.getElementById("tunning_explanation");
			
            if(title.value == ""){
                alert("제목을 입력하세요.");
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
				견적 요청서 <small>수정</small>
			</h1>
		</div>

		<div class="container">
			<table class="table table-hover" width=700>

				<tr>
					<td><b>제목</b></td>
					<td><input type=text class="form-control input-sm"
						name=dbemail size=50 maxlength=50></td>
				</tr>
				<tr>
					<td><b>이미지</b></td>
					<td><div class="form-group">
							<label for="exampleInputFile">이미지 업로드</label>
							<form id="form1" runat="server">
        						<input type='file' id="file" multiple="multiple" />
        						<span><img id="blah1" src="#" alt="your image" width="150" height="150" /></span>
        						<span><p id="te_p"></p></span>
        						<p class="help-block">자전거 사진 첨부</p>
						</div> <br /></td>
				</tr>
				<tr>
					<td><b>내용</b></td>
					<td><textarea name=dbmemo class="form-control input-sm"
							cols=50 rows=10></textarea></td>
				</tr>
			</table>

			<table cellspacing=0 cellpadding=0 border=0 width=500>
				<tr>
					<td><button class="btn btn-default" type="submit">재등록</button>
						<a class="btn btn-default" href="UserMyApplicationPage.jsp"
						role="button">목록</a></td>
				</tr>
			</table>
		</div>
		</article>
	</div>
</body>
</html>
