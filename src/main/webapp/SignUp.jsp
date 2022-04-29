<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- 부트스트랩 4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<!-- alert 꾸미기 -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<!-- jquery -->
<script src="jquery/jquery-3.6.0.min.js"></script>
<!-- 카카오 주소 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(function() {
	$('#SingUpBtn').click(function() {
		
		if($('#id').val()=='' || $('#id') == null || $('#id') == undefined){
			 $('#id').focus();
			 
			 Swal.fire({
                 icon: 'warning',
                 title: '아이디를 입력 해주세요.',
             });
			 return false;
		}
		
		if($('#email').val()=='' || $('#email') == null || $('#email') == undefined){
			 $('#email').focus();
			 
			 Swal.fire({
             	icon: 'warning',
             	title: '이메일을 입력해주세요.',
        	 });
			 return false;
		}
		
		if($('#email2').val()=='email' || $('#email2') == null || $('#email2') == undefined){
			 $('#email2').focus();
			 
			 Swal.fire({
            	icon: 'warning',
            	title: '이메일을 선택해주세요.',
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
		
		if($('#password2').val()=='' || $('#password2') == null || $('#password2') == undefined){
			 $('#password2').focus();
			 
			 Swal.fire({
                icon: 'warning',
                title: '재확인 패스워드를 입력 해주세요.',
            });
			 return false;
		}
		
		if($('#phonenumber').val()=='' || $('#phonenumber') == null || $('#phonenumber') == undefined){
			 $('#phonenumber').focus();
			 
		   Swal.fire({
           	icon: 'warning',
           	title: '휴대폰번호를 입력해주세요.',
       	 });
			 return false;
		}
		
		if($('#username').val()=='' || $('#username') == null || $('#username') == undefined){
			 $('#username').focus();
			 
			 Swal.fire({
               	icon: 'warning',
               	title: '이름을 입력해주세요.',
           	 });
			 return false;
		}
		
		if($('#sex').val()=='성별' || $('#sex') == null || $('#sex') == undefined){
			 $('#sex').focus();
			 
			 Swal.fire({
             	icon: 'warning',
             	title: '성별을 지정해주세요.',
         	 });
			 return false;
		}
		
		if($('#address').val()=='' || $('#address') == null || $('#address') == undefined){
			 $('#address').focus();
			 
			 Swal.fire({
            	icon: 'warning',
            	title: '주소를 입력해주세요.',
       		 });
			 return false;
		}
		
		if($('#address2').val()=='' || $('#address2') == null || $('#address2') == undefined){
			 $('#address2').focus();
			 
			 Swal.fire({
          		icon: 'warning',
          		title: '상세 주소를 입력해주세요.',
      		 });
			 return false;
		}
		
		
		$.ajax({
			url : 'SignUp.do',
			type : 'post',
			datatype : 'json',
			data : $('#SignUp').serializeArray(),
			success : function(data){
				if(confirm('회원가입 하시겠습니까?')) {
					if(data == true){
						alert('회원가입이 완료되었습니다.');
						$('#SignUp').submit();
						location.href = "main.jsp";
					}else if(data == false){
						alert('중복된 아이디 입니다.\n아이디를 다시 입력해주세요.');
					}
				}
			}
		})
		
		
		
		
		
		
})
	
	
	$('#address').click(function() {
		new daum.Postcode({
	        oncomplete: function(data) {
	        	console.log(data);
	        	$('#address').val(data.address);
				$('#address2').focus();
	        }
	    }).open();
	})
	
	
})	
function idCheck() {
	
	if($('#id').val()=='' || $('#id') == null || $('#id') == undefined){
		 $('#id').focus();
		 
		 Swal.fire({
            icon: 'warning',
            title: '아이디를 입력 해주세요.',
        });
		 return false;
	}
	
	$.ajax({
		url : 'idCheck.do',
		type : 'post',
		datatype : 'json',
		data : {'id' : $('#id').val()},
		success : function(data) {
			if (data == 1) {
				Swal.fire({
	                 icon: 'error',
	                 title: '이미 사용중인 아이디 입니다.',
	                 text: '다른 아이디를 입력해주세요.',
	             });
			}else {
				Swal.fire({
	                 icon: 'success',
	                 title: '사용 가능한 아이디 입니다!',
	             });
			}
		}
	})
}
</script>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div class="container" role="main">
		<form action="SignUp.do" id="SignUp">
			<h1>회원가입</h1>
			<br />
			<br />

			<div class="form-row">
				<div class="form-group col-md-3">
					<label for="id">아이디</label> <input type="text" class="form-control"
						id="id" name="id" placeholder="아이디를 입력해주세요.">
				</div>
				<div class="form-group col-md-3">
					<br />
					<button type="button" class="btn btn-primary" onclick="idCheck();">아이디
						확인</button>
				</div>
				<div class="form-group col-md-3">
					<label for="email">이메일</label> <input type="email"
						class="form-control" id="email" name="email"
						placeholder="이메일을 입력해주세요.">
				</div>
				<div class="form-group col-md-3">
					<label for="inputState"> ＊ </label> <select name="email"
						id="email2" class="form-control">
						<option selected>email</option>
						<option>@naver.com</option>
						<option>@gmail.com</option>
					</select>
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="password">패스워드</label> <input type="password"
						class="form-control" id="password" name="password"
						placeholder="패스워드를 입력해주세요">
				</div>
				<div class="form-group col-md-6">
					<label for="password2">패스워드 확인</label> <input type="password"
						class="form-control" id="password2"
						placeholder="패스워드 재확인을 입력해주세요.">
				</div>
			</div>
			<div class="form-row">
				<div class="form-group col-md-6">
					<label for="phonenumber">번호</label> <input type="text"
						class="form-control" id="phonenumber" name="phonenumber"
						placeholder="번호를 입력해주세요.">
				</div>
				<div class="form-group col-md-4">
					<label for="name">성함</label> <input type="text"
						class="form-control" id="username" name="username"
						placeholder="성함을 입력해주세요.">
				</div>
				<div class="form-group col-md-2">
					<label for="sex">성별</label> <select name="sex" id="sex"
						class="form-control">
						<option selected>성별</option>
						<option>남자</option>
						<option>여자</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="address">주소</label> <input type="text"
					class="form-control" id="address" name="address"
					placeholder="주소를 입력해주세요.">
			</div>
			<div class="form-group">
				<label for="address2">상세주소</label> <input type="text"
					class="form-control" id="address2" name="address2"
					placeholder="상세 주소를 입력해주세요.">
			</div>

		</form>
		<button type="button" id="SingUpBtn" class="btn btn-primary">회원가입</button>
</body>
</html>