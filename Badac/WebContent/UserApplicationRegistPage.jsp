<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>견적 요청서 등록</title> 
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
	function insertApplication() {

		var title = document.getElementById("tunning_title");
		var explain = document.getElementById("tunning_explanation");

		if (title.value == "") {
			alert("제목을 입력하세요.");
			title.focus();
			return;
		}
		if (explain.value == "") {
			alert("설명을 입력하세요.");
			explain.focus();
			return;
		}

		var app_id;
		var formData;
		$
				.post(
						"http://210.118.74.159:8100/Badac/insert_application",
						{
							id : userId,
							title : title.value,
							explanation : explain.value,
						},
						function(data) {
							if (data.msg == "Success") {
								app_id = data.appId;
								var fileSelect = document
										.getElementById("file");
								var files = fileSelect.files;
								formData = new FormData();
								for (var i = 0; i < files.length; i++) {
									var file = files[i];
									formData.append('file', file, file.name);
								}
								formData.append('appId', app_id);
								if (files.length == 0) {
									alert('업로드를 완료했습니다.');
									location.href = "http://210.118.74.159:8100/Badac/user_main_page";
								} else if (files.length != 0) {
									$
											.ajax({
												url : 'http://210.118.74.159:8100/Badac/upload_picture',
												type : 'POST',
												data : formData,
												processData : false,
												contentType : false,
												async : false,
												success : function(data) {
													if (data.msg == 'Success') {
														alert('업로드를 완료했습니다.');
														location.href = "http://210.118.74.159:8100/Badac/user_main_page";
													} else {
														alert(data.msg);
													}
												},
												error : function(data) {
													alert(data.msg);
												}
											});
								}
							} else {
								alert(data.msg);
							}
						});

	}

	function toMainPage() {
		location.href = "http://210.118.74.159:8100/Badac/user_main_page";
	}
</script>

<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">

<style>
body {
	padding-top: 70px;
	background-image: url('img/applicationbg.png');
}
.button-group{
margin: 1px;
}
.footer{
padding: 5px;

} 
</style>
</head>
<body>
	<div class="top-content contentwrap">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>견적 요청서</strong>| Registration Form
						</h1> 
						자전거 가맹업체에게 요청할 견적서를 작성해주세요.
					</div>
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3>Registration Form</h3>
								</div>
							</div>
							<div class="form-bottom">
								<div class="form-group">
									<label for="form-title">제목</label> <input id="tunning_title"
										type=text class="form-control input-sm" name=dbemail size=50
										maxlength=50>
								</div>
								<div class="form-group">
									<label for="file">이미지 업로드</label>
									<form id="form1" runat="server">

										<input type='file' id="file" multiple="multiple" class="btn"/> <span><img
											id="blah1" src="images/no_image.gif" alt="your image"
											width="100" height="100" /></span> <span><p id="te_p"></p></span>
									</form>
								</div>
								<div class="form-gruop">
									<label>내용</label>
									<textarea id="tunning_explanation" name=dbmemo
										class="form-control input-sm textarea" cols=60 rows=10></textarea>
									<br>
								</div>
								<div class="button-group">
									<center>
										<span style="float: right">
											<button type="button" class="btn"
												onclick="insertApplication()">등록</button> <a
											class="btn-link-1" onclick="toMainPage()">취소</a>
										</span>
									</center>
								</div>
								<br><br>
								<div class="footer">
									<center>
										<hr>
										Copyright &copy; Badoc Corporation 2016
									</center>
								</div>
							</div>							
						</div>
					</div>
				</div>
			</div>
		</div>			
	</div>

	<!-- Javascript -->
	<script src="js/jquery-1.11.1.min.js"></script> 
	<script src="js/jquery.backstretch.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>
