<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<jsp:include page='memberNav.jsp' />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>견적 요청서 목록 보기</title>
<style>
body {
	padding-top: 70px;
}
</style>
</head>
<body>
	<div class="container">
		<!-- 테이블 시작 -->
		<table class="table table-hover">
			<caption>견적 요청서 목록</caption>
			<colgroup>
				<col width="15%" />
				<col width="45%" />
				<col width="20%" />
				<col width="20%" />
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>이름</th>
					<th>등록일자</th>
				</tr>
			</thead>
			<tbody .table-hover>
				<tr>
					<td>5</td>
					<td><a href="MemberApplicationReplyPage.jsp">화이팅 바닥!!!</a></td>
					<td>바닥</td>
					<td>2016-04-27</td>
				</tr>
				<tr>
					<td>4</td>
					<td><a href="MemberApplicationReplyPage.jsp">안장 요청합니다!!!</a></td>
					<td>최현우</td>
					<td>2016-04-27</td>
				</tr>
				<tr>
					<td>3</td>
					<td><a href="MemberApplicationReplyPage.jsp">후방 센서 요청합니다!!!</a></td>
					<td>김지후</td>
					<td>2016-04-27</td>
				</tr>
				<tr>
					<td>2</td>
					<td><a href="MemberApplicationReplyPage.jsp">패달 요청합니다!!!</a></td>
					<td>김태균</td>
					<td>2016-04-27</td>
				</tr>
				<tr>
					<td>1</td>
					<td><a href="MemberApplicationReplyPage.jsp">라이트 요청합니다!!!</a></td>
					<td>송주석</td>
					<td>2016-04-27</td>
				</tr>
			</tbody>
		</table>
		<!-- 테이블 종료 -->
	</div>
</body>
</html>