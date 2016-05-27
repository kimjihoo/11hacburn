<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인 페이지</title>

<script type="text/javascript"
	src="https://apis.daum.net/maps/maps3.js?apikey=3a654d3947433483eca1b853767e0d03&libraries=services"></script>


<style>
body {
	padding-top: 70px;
}
</style>
</head>
<script>
onload = function on_load(){
	var len = 0;
	
	$.get("http://210.118.74.159:8100/Badac/show_my_bookmark",{
		user_id : userId,
	}, function(data){
		if(data.msg=="Success"){
			var tempData = data.bookmarkList;
			var memberData = {};
			
			for(var i = 0; i<tempData.length; i++){
				$.ajax({
					url : 'http://210.118.74.159:8100/Badac/get_member_info',
					type : 'GET',
					data : {id : tempData[i].companyId},
					async : false,
					success : function(data) {
						if (data.msg == 'Success') {
							memberData[tempData[i].companyId] = {
									"company_name": data.companyName,
									"company_address": data.companyRegion_2 + " " + data.companyRegion_3,
									"company_telephone" : data.companyTelephone,
									"company_lng" : data.companyLat,
									"company_lat" : data.companyLng
							}
						} else {
							alert(data.msg);
						}
					},
					error : function(data) {
						alert(data.msg);
					}
				});
			}
			for(var i = 0; i<tempData.length; i++){
				$('#region_member_list').append('<tr><td rowspan="3"  ><img src="http://placehold.it/140x140"/></td><td id="'+tempData[i].companyId+'">'+ memberData[tempData[i].companyId].company_name +'</td></tr>');
				document.getElementById(""+tempData[i].companyId+"").onclick = function(){
					var tempComId = $(this).attr('id');
					document.cookie = "companyID="+tempComId;
					location.href = "http://210.118.74.159:8100/Badac/show_member";
				};
				$('#region_member_list').append("<tr><td>"+ memberData[tempData[i].companyId].company_address +"</td></tr>");
				$('#region_member_list').append("<tr><td>"+ memberData[tempData[i].companyId].company_telephone +"</td></tr>");
			}
			
			
		}
		else{
			alert(data.msg);
		}
	});
}
</script>
<body>

	<div class="container">

		<div class="col-lg-12 col-sm-12"">
			<table class="table table-hover" id="region_member_list">

			</table>
		</div>
	</div>

</body>
</html>