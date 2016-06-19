<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>견적 요청서 보기</title>
<!-- CSS -->
<link href="css/button.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/style.css">
<style>
body {
	padding-top: 70px;
	font-family: "Open Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
    -webkit-background-size: cover;
    -moz-background-size: cover;
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.3) 0%,rgba(0,0,0,0.3) 100%), url('img/showappbg.jpg');
    background-size: cover;
    -o-background-size: cover;
}
.button-group {
	margin: 1px;
}

.footer {
	padding: 5px;
}
</style>
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
		$.get("http://210.118.74.159:8100/Badac/get_application_info",
			{
				tunningId : tunningId,
				companyId : companyId,
			},
			function(data) {
				if (data.msg == "Success") {
					document.getElementById("tunning_title").value = data.title;
					document.getElementById("tunning_explanation").value = data.explanation;
					document.getElementById("tunning_reply").value = data.reply;
				} else {
					alert(data.msg);
				}
			});
		$.get("http://210.118.74.159:8100/Badac/my_reply_list",{
			id : tunningId
		},function(data){
			if(data.msg=="Success"){
				var tempData = data.replyList;
				var replyList = {};
				for(var i=0; i<tempData.length; i++){
					replyList[tempData[i].companyId] = {
							"company_id": tempData[i].companyId,
							"company_name": tempData[i].companyName,
							"reply":tempData[i].reply,
							}
				}
				var replytable = document.getElementById("replytable");
				var tr;
				var td;
				var btn;
				for(var i=0; i<tempData.length; i++){
					tr = document.createElement('tr');
					td = document.createElement('td');
					td.appendChild(document.createTextNode(replyList[tempData[i].companyId].company_name));
					tr.appendChild(td);
					td = document.createElement('td');
					td.appendChild(document.createTextNode(replyList[tempData[i].companyId].reply));
					tr.appendChild(td);
					td = document.createElement('td');
					btn = document.createElement('input');
					btn.id = replyList[tempData[i].companyId].company_id;
					btn.type="button";
					btn.value="채택";
					btn.onclick = function () {
						var tempBtn_id = $(this).attr('id');
                        $.post("http://210.118.74.159:8100/Badac/select_answer",{
                        	tunning_id : tunningId,
                        	company_id : $(this).attr('id'),
                        },function(data){
                        	if(data.msg=="Success"){
                        		alert("채택 되었습니다.");
                        		$('#'+tempBtn_id).attr("disabled","disabled");
                        		document.getElementById(tempBtn_id).style.opacity="0.5";
                        	}else{
                        	}
                        });
                    };
					td.appendChild(btn);
					tr.appendChild(td);
					replytable.appendChild(tr);
				}
			}else{
			}
		});
		
		var img_c = document.getElementById("img_c");
    	$.get("http://210.118.74.159:8100/Badac/get_picture_list",{appId:tunningId,},
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

	function delApplication() {
		$.post("http://210.118.74.159:8100/Badac/delete_application",
			{
				tunningId : tunningId,
			},
			function(data) {
				if (data.msg == "Success") {
					alert("제안서를 삭제했습니다.");
					location.href = "http://210.118.74.159:8100/Badac/go_my_application_page";
				} else {
					alert(data.msg);
				}
			});
	}
</script>
</head>
<body>
	<div class="top-content">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<h1>
							<strong>견적 요청서 보기</strong>| Application View
						</h1>
						등록한 견적 요청서에 입니다.
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-left">
								<h3>Application View</h3>
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
								<label>내용</label> <input class="form-control input-sm"
									type="text" id="tunning_explanation" readonly> <br>
							</div>
							<div class="form-gruop">
									<label>답변</label>
									<textarea name="comment" class="form-control input-sm"
										id="tunning_reply" rows="10" style="height: 200px;" readonly></textarea>
									<br>
								</div>
							<div class="button-group">
								<center>
									<span style="float: right">
										<button class="btn" type="submit" onclick="delApplication()">삭제</button>
									</span>
								</center>
							</div>
							<br>
							<br>
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
</body>
</html>
