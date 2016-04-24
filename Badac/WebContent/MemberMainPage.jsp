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
    
    int companyid = 0;
    String companyownername=null;
    String companyname=null;
    String companyemail=null;
    
    if(cookies != null){
         
        for(int i=0; i < cookies.length; i++){
            Cookie c = cookies[i] ;
             
            if( c.getName().equals("company_id") ){
            	companyid = Integer.parseInt(c.getValue());
            }
            if(c.getName().equals("company_ownername")){
            	companyownername = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if( c.getName().equals("company_name") ){
            	companyname = URLDecoder.decode(c.getValue(), "UTF-8");
            }
            if( c.getName().equals("company_email") ){
            	companyemail = URLDecoder.decode(c.getValue(), "UTF-8");
            }
        }
    } 
    %>
 
    var companyId = '<%= companyid %>';
    var companyOwnerName = '<%= companyownername%>';
    var companyName = '<%= companyname %>';
    var companyEmail = '<%= companyemail %>';
    
	///////////////////////////////////////////////////////////////////
</script>
<script type="text/javascript">
	onload = function on_load(){
		var temp1 = document.getElementById("companyIdDiv");
		var temp2 = document.getElementById("companyOwnerNameDiv");
	    var temp3 = document.getElementById('companyNameDiv');
	    var temp4 = document.getElementById('companyEmailDiv');
	    
	    temp1.appendChild(document.createTextNode(companyId));
	    temp2.appendChild(document.createTextNode(companyOwnerName));
	    temp3.appendChild(document.createTextNode(companyName));
	    temp4.appendChild(document.createTextNode(companyEmail));
	}
	
	function memberLogout(){
		location.href = "http://localhost:8100/Badac/member_logout";
	}
</script>
</head>
<body>
회사 페이지
<button onclick="memberLogout()">로그아웃</button>
<div id="companyIdDiv"></div>
<div id="companyOwnerNameDiv"></div>
<div id="companyNameDiv"></div>
<div id="companyEmailDiv"></div>
</body>
</html>