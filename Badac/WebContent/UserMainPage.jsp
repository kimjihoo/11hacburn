<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
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
	onload = function on_load(){
		var temp1 = document.getElementById("userIdDiv");
	    var temp2 = document.getElementById('userNameDiv');
	    var temp3 = document.getElementById('userEmailDiv');
	    
	    temp1.appendChild(document.createTextNode(userId));
	    temp2.appendChild(document.createTextNode(userName));
	    temp3.appendChild(document.createTextNode(userEmail));
	}
	
	function userLogout(){
		location.href = "http://localhost:8100/Badac/user_logout";
	}
	function writeApplication(){
		location.href = "http://localhost:8100/Badac/write_application";
	}
</script>
</head>
<body>
유저 페이지
<button onclick="userLogout()">로그아웃</button>
<button onclick="writeApplication()">제안서 작성</button>
<div id="userIdDiv"></div>
<div id="userNameDiv"></div>
<div id="userEmailDiv"></div>
</body>
</html>