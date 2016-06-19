<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='memberNav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>견적 요청서 답변</title>
<!-- CSS -->
<link href="css/button.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">
<script>    
    ////////////////////////////////////////////////////////
    <%// 쿠키값 가져오기
			Cookie[] cookies = request.getCookies();

			int tunningid = 0;

			if (cookies != null) {

				for (int i = 0; i < cookies.length; i++) {
					Cookie c = cookies[i];

					if (c.getName().equals("tunningID")) {
						tunningid = Integer.parseInt(c.getValue());
					}
				}
			}%>
    
    var tunningId = '<%=tunningid%>';

	///////////////////////////////////////////////////////////////////
</script>
<script>
	onload = function on_load() {
		$
				.get(
						"http://210.118.74.159:8100/Badac/get_application_info_2",
						{
							tunningId : tunningId,
							companyId : companyId,
						},
						function(data) {
							if (data.msg == "Success") {
								document.getElementById("tunning_date").value = data.date;
								document.getElementById("tunning_id").value = data.id;
								document.getElementById("tunning_name").value = data.name;
								document.getElementById("tunning_title").value = data.title;
								document.getElementById("tunning_explanation").value = data.explanation;
							} else {
								alert(data.msg);
							}
						});
		var img_c = document.getElementById("img_c");
    	$.get("http://210.118.74.159:8100/Badac/company_get_picture_list",{appId:tunningId,},
                function (data) {
                    if (data.msg == 'Success') {
                        for (var g = 0; g < data.pictureList.length; g++) {
                        	var span_c = document.createElement('span');
                        	span_c.style.width="220px";
                        	span_c.style.height="180px";
                        	var gall_img = document.createElement('img');
                        	gall_img.src=data.pictureList[g].path;
                        	gall_img.style.borderRadius="6px";
                        	gall_img.style.paddingLeft="50px";
                        	gall_img.style.paddingTop="20px";
                        	gall_img.style.paddingBottom="20px";
                        	gall_img.style.width="220px";
                        	gall_img.style.height="180px";
                        	span_c.appendChild(gall_img);
                        	img_c.appendChild(span_c);
                        }
                    }
                });
	}
</script>
<script>
function answerReply() {
	var tunning_reply = document.getElementById("tunning_reply");
	
	if (tunning_reply.value == "") {
		alert("답변을 입력하세요.");
		title.focus();
		return;
	}
	
	$
			.post(
					"http://210.118.74.159:8100/Badac/application_reply_regist",
					{
						tunningId : tunningId,
						tunningCompanyId : companyId,
						reply : tunning_reply.value,
					},
					function(data) {
						if (data.msg == "Success") {
							location.href="http://210.118.74.159:8100/Badac/login_page";
						} else {
							alert(data.msg);
						}
					});
}
</script>
<style>
body {
	padding-top: 70px;
	background-image: url('img/applicationbg.png'); 
}

.button-group {
	margin: 1px;
}

.footer {
	padding: 5px;
}
</style>
</head>
<body>
	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>견적 요청서 답변</strong>| Application Reply
						</h1>
						등록된 견적 요청서에 답변해주세요.
					</div>
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3 form-box">
							<div class="form-top">
								<div class="form-top-left">
									<h3>Application Reply</h3>
								</div>
							</div>
							<div class="form-bottom">
								<div class="form-group">
									<label for="form-title">제목</label> <input type=text
										id="tunning_title" class="form-control input-sm" name=dbemail
										size=50 maxlength=50 readonly>
								</div>
								<div class="form-group">
									<label for="file">이미지</label>
									<div class="one" id="img_c"></div>									
								</div>
								<div class="form-gruop">
									<label>내용</label> <input class="form-control input-sm" type="text"
										id="tunning_explanation" readonly> <br>
								</div>
								<div class="form-gruop">
									<label>답변</label>
									<textarea name="comment" class="form-control input-sm"
										id="tunning_reply" rows="10" style="height: 200px;"></textarea>
									<br>
								</div>

								<div class="button-group">
									<center>
										<button type="submit" class="btn" onclick="answerReply()">등록</button>
										<a class="btn-link-1"
											href="http://210.118.74.159:8100/Badac/member_main_page"
											role="button">목록</a>
									</center>
								</div>

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
</body>
</html>