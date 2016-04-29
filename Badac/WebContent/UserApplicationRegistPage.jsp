<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ��û�� ���</title>

<style>
body {
	padding-top: 70px;
}
</style>
<script src="https://code.jquery.com/jquery-2.2.3.js"
	integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="
	crossorigin="anonymous"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
	integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7"
	crossorigin="anonymous">
<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css"
	integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"
	integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS"
	crossorigin="anonymous"></script>
	<script>    
    ////////////////////////////////////////////////////////
    <% // ��Ű�� ��������
    Cookie[] cookies = request.getCookies() ;
    
    int userid = 0;
    String username=null;
    String useremail=null;
    
    if(cookies != null){
         
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
             
            if( c.getName().equals("user_id") ){
            	userid = Integer.parseInt(c.getValue());
            }
            if( c.getName().equals("user_name") ){
            	username = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if( c.getName().equals("user_email") ){
            	useremail = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    } 
    %>
 
    var userId = '<%= userid %>';
    var userName = '<%= username %>';
    var userEmail = '<%= useremail %>';

	///////////////////////////////////////////////////////////////////
	</script>
    <script type="text/javascript">
        function insertApplication(){

			var title = document.getElementById("tunning_title");
			var explain = document.getElementById("tunning_explanation");
			
            if(title.value == ""){
                alert("������ �Է��ϼ���.");
                title.focus();
                return;
            }
            if(explain.value == ""){
                alert("������ �Է��ϼ���.");
                explain.focus();
                return;
            }
            $.post("http://localhost:8100/Badac/insert_application", {
            	id : userId,
            	title : title.value,
            	explanation : explain.value,
            }, function(data){
            		if( data.msg == "Success" ){
            			alert("����� �Ϸ�Ǿ����ϴ�.");
            			location.href = "http://localhost:8100/Badac/user_main_page";
            		}
            		else{
            			alert(data.msg);
            		}
            });
        }

        function toMainPage(){
            location.href = "http://localhost:8100/Badac/user_main_page";
        }
    </script>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top " role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#">BADOC</a>
		</div>
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">About</a></li>
				<li><a href="#">Services</a></li>
				<li><a href="#">Contact</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">�����
						���� <span class="caret"></span>
				</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href=""><img src="http://placehold.it/130x100"
								alt=".." /></a></li>
						<li><a id="name"></a></li>
						<li><a id="email"></a></li>
						<li class="divider"></li>
						<li><a href="http://localhost:8100/Badac/user_logout">�α׾ƿ�</a></li>
						<li><a
							href="http://localhost:8100/Badac/go_user_update_information">��������
								����</a></li>
						<li><a href="#">���� ��û ���� ����</a></li>
						<li><a href="http://localhost:8100/Badac/write_application">����
								���ȼ� �ۼ�</a></li>

					</ul></li>


			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<div class="container">
		<table class="table table-hover" width=700>

			<tr>
				<td><b>����</b></td>
				<td><input type=text class="form-control input-sm" name=dbemail
					size=50 maxlength=50></td>
			</tr>
			<tr>
				<td><b>�̹���</b></td>
				<td><div class="form-group">
						<label for="exampleInputFile">�̹��� ���ε�</label> <input type="file"
							id="exampleInputFile">
						<p class="help-block">������ ���� ÷��</p>
					</div> <br /></td>
			</tr>
			<tr>
				<td><b>����</b></td>
				<td><textarea name=dbmemo class="form-control input-sm" cols=50
						rows=10></textarea></td>
			</tr>
		</table>

		<table cellspacing=0 cellpadding=0 border=0 width=500>
			<tr>
				<button type="button" class="btn btn-default"
					OnClick="insertApplication()">���</button>
				<a class="btn btn-default" href="UserMyApplicationPage.jsp"
					role="button">���</a>
			</tr>
		</table>
	</div>
</body>
</html>