<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.net.URLDecoder"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script   src="https://code.jquery.com/jquery-2.2.3.js"   integrity="sha256-laXWtGydpwqJ8JA+X9x2miwmaiKhn8tVmOVEigRNtP4="   crossorigin="anonymous"></script>
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
            <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- 다음 주소 api -->
<style>
body{
	padding-top:70px;
}
#button-page{
	padding-top:10px;
}
</style>
<script>    
    ////////////////////////////////////////////////////////
    <% // 쿠키값 가져오기
    Cookie[] cookies = request.getCookies() ;
     
    int companyid = 0;
    String companyownername=null;
    String companyemail=null; 
    String companyname=null;
    String companyregion_1=null;
    String companyregion_2=null;
    String companyregion_3=null;
    String companytelephone=null;
    String companyphone=null;
    
    
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
		document.getElementById("ownername").innerHTML = companyOwnerName;
		document.getElementById("email").innerHTML = companyEmail;
		document.getElementById("name").innerHTML = companyName;
	}
	
	function memberLogout(){
		location.href = "http://210.118.74.159:8100/Badac/member_logout";
	}
	
	
</script>


</head>
<body>
	
	<div class="contentwrap">
		<article class="container">
    <div class="page-header">
	  <h1>업체페이지 수정  <small>수정하기</small></h1>
    </div>
    <form class="form-horizontal">
    <div class="form-group">
    <label for="companyname" class="col-sm-2 control-label">업체명</label>
    <div class="col-sm-6">
    <p class="form-control" id="companyname"><%out.print(companyname); %></p>
    </div>
    </div>
     
    <div class="form-group">
    <label for="ownername" class="col-sm-2 control-label">대표자명</label>
    <div class="col-sm-6"> 	
    <p class="form-control" id="ownername"><%out.print(companyownername);%></p>
    </div>
    </div> 
  
    <div class="form-group">
    <label for="inputSite" class="col-sm-2 control-label">사이트</label>
    <div class="col-sm-6">
    <input type="text" class="form-control" id="inputSite" placeholder="사이트">
    </div>
    </div>

    <div class="form-group">
    <label for="inputNumber" class="col-sm-2 control-label">전화번호</label>
    <div class="col-sm-4">
    <input type="text" class="form-control" id="inputNumber" placeholder="전화번호">
      <p class="help-block">- 없이 적어주세요.</p>
    </div>
    </div>
    
	<div class="form-group">
    			<label for="inputAddress" class="col-sm-2 control-label">주소</label>
    			<div class="col-sm-4 form-inline">
    				<input type="text" class="form-control input-sm" id="company_region_1" placeholder="우편번호">
					<input type="button" class="btn btn-primary btn-sm" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
    			</div>
    			<div>
					<p id="helpBlock" class="help-block">우편번호 찾기 버튼을 눌러 우편번호를 검색하세요.</p>
    			</div>
    			</div>
    			
    			<div class="form-group" >
    			<label for="inputAddress" class="col-sm-2"> </label>
    			<div class="col-sm-4">
					<p><input type="text" class="form-control input-sm" id="company_address" placeholder="주소"></p>
					<p><input type="text" class="form-control input-sm" id="company_address2" placeholder="상세주소"></p>
    			</div>
    			</div>

	<div class="form-group">
		<label for="file">이미지 업로드</label>
		<input type="file" id="file1">
	</div>
	
	<div class="form-group">
		<label for="file">이미지 업로드</label>
		<input type="file" id="file2"multiple="multiple">
		<p class="help-block">4장까지 가능</p>
	</div>

	 

    <div class="form-group" id="button-page">
	    <label class="col-sm-2 control-label"></label>
  		  <div class="col-sm-4">
      		<button class="btn btn-default" onclick="updateCompany()">수정</button>
      		<a class="btn btn-default" onclick="" href="#">취소</a>
   		 </div>
    </div>



    </div>
     
    </form>
  </article>
</div>
	
	
<script> 
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('company_region_1').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('company_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('company_address2').focus();
            }
        }).open();
    }
</script>	
	
	
</body>
</html>