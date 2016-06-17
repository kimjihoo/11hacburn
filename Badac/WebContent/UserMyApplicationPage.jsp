<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='nav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나의 견적 요청서 목록</title>
 
<script>
	onload = function on_load(){
		$.get("http://210.118.74.159:8100/Badac/my_application_list",{
			userId:userId,
		},
			function(data){
				if(data.msg=="Success"){
					var applicationData = {};
					var tempData = data.applicationList;
					var table_c = document.getElementById('my_applicationListTable');
					var tr;
					var td;
					var title_var;
					
					for(var i = 0; i<tempData.length; i++){
						applicationData[tempData[i].id] = {
							"tunning_id": tempData[i].id,
							"tunning_title": tempData[i].title,
							"tunning_date": tempData[i].date
						}
						tr = document.createElement('tr');
						for(var j = 0; j<3; j++){
							td = document.createElement('td');
							switch(j){
							case 0:
								td.appendChild(document.createTextNode(applicationData[tempData[i].id].tunning_id));
								break;
							case 1:
								title_var = document.createElement('p');
								title_var.style.cursor="pointer";
								title_var.id = applicationData[tempData[i].id].tunning_id;
								title_var.appendChild(document.createTextNode(applicationData[tempData[i].id].tunning_title));
								title_var.onclick = function () {
									var tempP_id = $(this).attr('id');
									document.cookie = "tunningID="+tempP_id+";";
									location.href="http://210.118.74.159:8100/Badac/show_application"
			                    };
								td.appendChild(title_var);
								break;
							case 2:
								var tunningDate = applicationData[tempData[i].id].tunning_date;
								td.appendChild(document.createTextNode(tunningDate));
								break;
								default:
									break;
							}
							tr.appendChild(td);
						}
						table_c.appendChild(tr);
					}
				}else{
				}
		});
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
							<strong>견적 요청서 목록</strong>| Estimate List
						</h1> 등록된 나의 견적 요청서 목록입니다.
                    </div>
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 form-box">
                            <div class="form-top">
                                <div class="form-top-left">
                                    <h3>Estimate List</h3>
                                </div>
                            </div>
                            <div class="form-bottom">
                                <div class="form-group">
                                    <!-- 테이블 시작 -->
                                    <table class="table table-hover" style="width:100%; text-align:center;">
                                        <thead>
                                            <tr>
                                                <td style="width:15%;">번호</td>
                                                <td style="width:45%;">제목</td>
                                                <td style="width:20%;">등록일자</td>
                                            </tr>
                                        </thead>
                                        <tbody id="my_applicationListTable" style="width:100%; text-align:center;">

                                        </tbody>
                                    </table>
                                    <!-- 테이블 종료 -->

                                </div>


                                <div class="button-group">

                                    <a class="btn-link-1" href="http://210.118.74.159:8100/Badac/write_application" role="button">등록</a>

                                </div>

                                <div class="footer">
                                    <center>
                                        <hr> Copyright &copy; Badoc Corporation 2016
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
