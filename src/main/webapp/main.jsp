<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="jquery/jquery-3.6.0.min.js"></script>
<script>
$(function() {
	var kakaoInfo = "${kakaoInfo}";

    if(kakaoInfo != null){
        var data = JSON.parse(kakaoInfo);
		console.log(data);
		
		if(data['accessToken'] == '' || data['accessToken'] == null || data['accessToken'] == undefined){
			alert('카카오 로그인은 정상적으로 되었으나\n유저 정보가 조회되지 않습니다.');
			location.href = "login.jsp";
		}
        alert("카카오 로그인 성공 \n accessToken : " + data['accessToken']);
        alert(
        "user : \n" + "email : "
        + data['email']  
        + "\n nickname : " 
        + data['nickname']);
    }else{
    	alert('카카오 로그인 실패');
    	location.href = "login.jsp";
    }
}) 
</script>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h1>메인 페이지</h1>
</body>
</html>