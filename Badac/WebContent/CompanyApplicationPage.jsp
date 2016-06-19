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

			int tunningid = -1;

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
		$.get("http://210.118.74.159:8100/Badac/get_application_info_2",
			{
				tunningId : tunningId,
				companyId : companyId
			},
			function(data) {
				if (data.msg == "Success") {
					document.getElementById("tunning_date").value = data.date;
					document.getElementById("tunning_id").value = data.id;
					document.getElementById("tunning_name").value = data.name;
					document.getElementById("tunning_title").value = data.title;
					document.getElementById("tunning_explanation").value = data.explanation;
					document.getElementById("tunning_reply").value = data.reply;
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
                        	span_c.style.width="150px";
                        	span_c.style.height="150px";
                        	var gall_img = document.createElement('img');
                        	gall_img.src=data.pictureList[g].path;
                        	gall_img.style.borderRadius="6px";
                        	gall_img.style.width="150px";
                        	gall_img.style.height="150px";
                        	span_c.appendChild(gall_img);
                        	img_c.appendChild(span_c);
                        }
                    }
                });
		
	}
</script>
<script>
function deleteReply() {
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
							<strong>견적 요청서 수정</strong>| Registration Form
						</h1>
						등록된 나의 견적 요청서를 수정해주세요.
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
									<label for="form-title">제목</label> <input type=text
										id="tunning_title" class="form-control input-sm" name=dbemail
										size=50 maxlength=50>
								</div>
								<div class="form-group">
									<label for="file">자전거 이미지 업로드</label>
									<form id="form1" runat="server">
										<input type='file' id="file" multiple="multiple" class="btn" />
										<span> <img id="blah1" src="images/no_image.gif"
											alt="your image" width="100" height="100" /></span>
										<span><p id="te_p"></p></span>
									</form>
								</div>
								<div class="form-gruop">
									<label>내용</label> <input class="form-control input-sm" type="text"
										id="tunning_explanation" readonly> <br>
								</div>

								<div class="button-group">
									<center>
										<button type="submit" class="btn">재등록</button>
										<a class="btn-link-1" href="UserMyApplicationPage.jsp"
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
	<div class="container">
		<table class="table table-hover" width=700
				style="text-align: center;">
				<tr>
					<td style="width: 35%;"><b>날짜</b></td>
					<td><input class="form-control" type="text" id="tunning_date"
						readonly></td>
				</tr>
				<tr>
					<td style="width: 35%;"><b>코드</b></td>
					<td><input class="form-control" type="text" id="tunning_id"
						readonly></td>
				</tr>
				<tr>
					<td style="width: 35%;"><b>이름</b></td>
					<td><input class="form-control" type="text" id="tunning_name"
						readonly></td>
			</tr>
				<tr>
					<td style="width: 35%;"><b>제목</b></td>
					<td><input class="form-control" type="text" id="tunning_title"
						readonly></td>
				</tr>
				<tr>
					<td style="width: 35%;"><b>이미지</b></td>
					<td><div class="form-group">
							<div class="vCeneter" id="img_c">
								
							</div>
						</div>
						<p class="help-block">첨부된 자전거 사진</p> <br /></td>
				</tr>
				<tr>
					<td style="width: 35%;"><b>내용</b></td>
					<td width=350><input class="form-control" type="text"
						id="tunning_explanation" readonly></td>
				</tr>
			</table>
		<br> <br> <br>

		<table class="table table-hover" width=700 style="text-align: center;">
			<tr>
				<td style="width: 35%;"><b>답변</b></td>
				<td><textarea class="form-control" id="tunning_reply" rows="10" readonly></textarea></td>
			</tr>
		</table>
		<span style="float: right"><button class="btn"
				type="submit" onclick="deleteReply()">삭제</button> <a class="btn"
			href="http://210.118.74.159:8100/Badac/member_main_page" role="button">목록</a></span>
	</div>	
</body>
</html>