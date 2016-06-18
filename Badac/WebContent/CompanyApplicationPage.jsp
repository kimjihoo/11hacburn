<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='memberNav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>견적 요청서 답변</title>
<link href="css/button.css" rel="stylesheet">
<style>
body {
	padding-top: 70px;
}
</style>
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
</head>
<body>
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