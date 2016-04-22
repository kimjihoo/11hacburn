<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function userLogout(){
		location.href = "http://localhost:8100/Badac/user_logout";
	}
</script>
</head>
<body>
유저 페이지
<button onclick="userLogout()">로그아웃</button>
</body>
</html>