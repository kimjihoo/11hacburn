<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
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
<script>
	

	onload = function on_load(){
		$.get("http://localhost:8100/Badac/member_not_approval_list",
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
			                        $.post("http://localhost:8100/Badac/member_approval",{
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
	}
</script>
<script>
	function approvalCompany(){
		alert("click");
	}
</script>
</head>
<body>
<div style="width:60%; margin:auto; border:1px solid black;">
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
</body>
</html>