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
<!-- alert 꾸미기 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script>
$(function(){
	
	$('#login').click(function() {
		
		if($('#id').val()=='' || $('#id') == null || $('#id') == undefined){
			 $('#id').focus();
			 
			 Swal.fire({
	            icon: 'warning',
	            title: '아이디를 입력 해주세요.',
	        });
			 return false;
		}
		
		if($('#password').val()=='' || $('#password') == null || $('#password') == undefined){
			 $('#password').focus();
			 
			 Swal.fire({
	           icon: 'warning',
	           title: '패스워드를 입력 해주세요.',
	       });
			 return false;
		}
		
		$.ajax({
			url : 'login.do',
			type : 'post',
			datatype : 'json',
			data : {'id' : $('#id').val(),
				'password' : $('#password').val()},
			success : function(data){	
				if(data == 1){
					alert('로그인 성공');
	                location.href = "main.jsp";
				}else if(data == null){
					alert('알 수 없는 경로 입니다.');
				}	
			},error : function(data) {
				alert('로그인 실패');
				// 로그인 실패시 에러 메시지 출력 해야 해야함(추후 반영 예정)
				location.href = "login.jsp";
				
			} 
		})
	})

	
	
    
    
});



function kakaologin() {
	$.ajax({
		url : 'getKakaoLoginUrl.do',
		type : 'get',
		async : false,
		dataType : 'text',
		success : function(data) {
			console.log(data);
			location.href = data;
		}
	})
}

</script>
<style>
	body{
    background-color:#5286F3;
    font-size:14px;
    color:#black;
}
.simple-login-container{
    width:300px;
    max-width:100%;
    margin:50px auto;
}
.simple-login-container h2{
    text-align:center;
    font-size:20px;
}

.simple-login-container .btn-login{
    background-color:#FF5964;
    color:#fff;
}

</style>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body style="background-color:#fff">
<div class="container" role="main">
<form action="login.do" method="post">
<center>

<div class="simple-login-container">

<h1>로그인</h1>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="text" name="id" id="id" class="form-control" placeholder="ID" value="${user.id }">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
            <input type="password" name="password" id="password" placeholder="PASSWORD" class="form-control" value="${user.password }">
        </div>
    </div>
    <div class="row">
        <div class="col-md-12 form-group">
           	<button type="submit" id="login" class="btn btn-block btn-login" >로그인</button>
        </div>
    </div>
    
   <button type="button" id="kakaoLogin" class="btn btn-block btn-login" onclick="kakaologin();">카카오 로그인</button>
	
	<br />
    <div class="row">
        <div class="col-md-12">
           	<a href="SignUp.jsp">회원가입하기 </a>
        </div>
    </div>
</div>
</center>
</form>
</div>







</body>
</html>