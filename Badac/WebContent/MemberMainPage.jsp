<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function memberLogout(){
		location.href = "http://localhost:8100/Badac/member_logout";
	}
</script>
</head>
<body>
회사 페이지
<button onclick="memberLogout()">로그아웃</button>
</body>
</html>