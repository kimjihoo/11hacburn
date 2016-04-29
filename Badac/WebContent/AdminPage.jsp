<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script   src="https://code.jquery.com/jquery-2.2.3.js"   integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="   crossorigin="anonymous"></script>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
          integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
          integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous">
    <!-- Latest compiled and minified JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
            integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
            crossorigin="anonymous"></script>
    <style type="text/css">
    	html { height:100%; overflow:scroll; }
    	body { height:100%;}
	</style>
<script>
	onload = function on_load(){
		$.get("http://210.118.74.159:8100/Badac/member_not_approval_list",
			function(data){
				if(data.msg=="Success"){
					var na_memberData = {};
					var tempData = data.na_memberList;
					var table_c = document.getElementById('na_memberListTable');
					var tr;
					var td;
					var button;
					
					for(var i = 0; i<tempData.length; i++){
						na_memberData[tempData[i].id] = {
							"company_id": tempData[i].id,
							"company_ownername": tempData[i].ownername,
							"company_name": tempData[i].name,
							"company_telephone": tempData[i].telephone
						}
						tr = document.createElement('tr');
						for(var j = 0; j<5; j++){
							td = document.createElement('td');
							switch(j){
							case 0:
								td.appendChild(document.createTextNode(na_memberData[tempData[i].id].company_id));
								break;
							case 1:
								td.appendChild(document.createTextNode(na_memberData[tempData[i].id].company_ownername));
								break;
							case 2:
								td.appendChild(document.createTextNode(na_memberData[tempData[i].id].company_name));
								break;
							case 3:
								td.appendChild(document.createTextNode(na_memberData[tempData[i].id].company_telephone));
								break;
							case 4:
								button = document.createElement('input');
								button.id = na_memberData[tempData[i].id].company_id;
								button.type="button";
								button.value="승인";
								button.onclick = function () {
									var tempBtn_id = $(this).attr('id');
			                        $.post("http://210.118.74.159:8100/Badac/member_approval",{
			                        	company_id : $(this).attr('id'),
			                        },function(data){
			                        	if(data.msg=="Success"){
			                        		alert("승인 되었습니다.");
			                        		$('#'+tempBtn_id).attr("disabled","disabled");
			                        		document.getElementById(tempBtn_id).style.opacity="0.5";
			                        	}else{
			                        		alert(data.msg);
			                        	}
			                        });
			                    };
								td.appendChild(button);
								break;
								default:
									break;
							}
							tr.appendChild(td);
						}
						table_c.appendChild(tr);
					}
				}else{
					alert(data.msg);
				}
		});
		
		$.get("http://210.118.74.159:8100/Badac/return_user_cnt",
			function(data){
				if(data.msg=="Success"){
					document.getElementById("normalUserCnt").appendChild(document.createTextNode(data.userCnt));
				}else{
					alert(data.msg);
				}
			
		});
		
		$.get("http://210.118.74.159:8100/Badac/return_member_cnt",
				function(data){
					if(data.msg=="Success"){
						document.getElementById("memberUserCnt").appendChild(document.createTextNode(data.memberCnt));
					}else{
						alert(data.msg);
					}
				
			});
	}
</script>
</head>
<body>
<div style="width:100%; height:100%;">
	<div style="width:100%; height:40px; border-bottom:1px solid rgb(231,231,231);">
		<table style="width:100%; height:40px;">
			<tr style="width:100%;">
				<td style="width:30%; padding-left:20px; color:gray;">BADAC Admin</td>
				<td style="width:40%;"></td>
				<td style="width:30%;"></td>
			</tr>
		</table>
	</div>
	<table style="width:100%; height:100%;">
		<tr style="width:100%; height:100%;">
			<td style="width:15%; padding-left:20px; padding-top:10px; border-right:1px solid rgb(231,231,231);" valign="top"></td>
			<td style="width:85%; padding-top:30px; padding-left:40px;" valign="top">
				<div style="width:200px; margin-bottom:30px; height:120px; background-color:rgb(51,122,183); border-radius:7px; display:inline-block;">
					<div style="display:table; width:100%; height:100%; text-align:center;">
						<div id="normalUserCnt" style="display:table-cell; vertical-align:middle; font-size:40px; color:white;">일반 : </div>
					</div>
				</div>
				<div style="width:200px; margin-bottom:30px; height:120px; background-color:rgb(92,184,92); margin-left:20px; border-radius:7px; display:inline-block;">
					<div style="display:table; width:100%; height:100%; text-align:center;">
						<div id="memberUserCnt" style="display:table-cell; vertical-align:middle; font-size:40px; color:white;">가맹 : </div>
					</div>
				</div>
				<p style="color:gray; padding-left:10px; ">미승인 업체 목록</p>
				<div style="width:80%; margin-top:5px; border:1px solid #E7E7E7;">
					<table id="na_memberListTable" style="width:100%; text-align:center;">
						<tr style="width:100%;">
							<td style="width:15%; padding-top:10px; padding-bottom:10px;">코드</td>
							<td style="width:15%; padding-top:10px; padding-bottom:10px;">대표자 명</td>
							<td style="width:30%; padding-top:10px; padding-bottom:10px;">가게 이름</td>
							<td style="width:30%; padding-top:10px; padding-bottom:10px;">전화번호</td>
							<td style="width:10%; padding-top:10px; padding-bottom:10px;">승인 여부</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
	</table>
</div>
</body>
</html>