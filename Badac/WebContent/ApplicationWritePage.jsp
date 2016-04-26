<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script   src="https://code.jquery.com/jquery-2.2.3.js"   integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="   crossorigin="anonymous"></script>cript>
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
    ////////////////////////////////////////////////////////
    <% // 쿠키값 가져오기
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
                alert("제목을 입력하세요.");
                title.focus();
                return;
            }
            if(explain.value == ""){
                alert("설명을 입력하세요.");
                explain.focus();
                return;
            }
            $.post("http://localhost:8100/Badac/insert_application", {
            	id : userId,
            	title : title.value,
            	explanation : explain.value,
            }, function(data){
            		if( data.msg == "Success" ){
            			alert("등록이 완료되었습니다.");
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
	제목 : <input name="tunning_title" id="tunning_title" type="text" placeholder="Enter Title"><br />
	설명 : <textarea id="tunning_explanation" placeholder="Insert Explain"></textarea><br />
	<div>
		<button onclick="toMainPage()">취소</button>
        <button onclick="insertApplication()">등록</button>
    </div>
</body>
</html>