<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>견적 요청서 보기</title>
<style>
body {
	padding-top: 70px;
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
			},
			function(data) {
				if (data.msg == "Success") {
					document.getElementById("tunning_date").value = data.date;
					document.getElementById("tunning_id").value = data.id;
					document.getElementById("tunning_title").value = data.title;
					document.getElementById("tunning_explanation").value = data.explanation;
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

	<!-- /.container -->
	</nav>
	<div class="contentwrap">
		<article class="container">
		<div class="page-header">
			<h1>
				견적 요청서 <small>보기</small>
			</h1>
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
			<br><br><br>
			
			<table class="table table-hover" width=700
				style="text-align: center;" id="replytable">
				<tr>
					<td style="width:20%;">회사 이름</td>
					<td style="width:70%;">답변 내용</td>
					<td style="width:10%;"></td>
				</tr>
			</table>
			
			<table cellspacing=0 cellpadding=0 border=0 width=500>
				<tr>
					<td>
						<button class="btn btn-default" type="submit"
							onclick="delApplication()">삭제</button>
					</td>
				</tr>
			</table>
		</div>
		</article>
	</div>
</body>
</html>
