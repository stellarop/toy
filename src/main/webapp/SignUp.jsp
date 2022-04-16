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

<script src="jquery/jquery-3.6.0.min.js"></script>
<script>
$(function() {
	$('#SingUpBtn').click(function() {
		
		if($('#id').val('') || $('#id') == null || $('#id') == undefined){
			alert('아이디를 입력해주세요.');
		}
	
		
		
	})
})

function idCheck() {
	$.ajax({
		url : 'idCheck.do',
		type : 'post',
		datatype : 'json',
		data : {'id' : $('#id').val()},
		success : function(data) {
			if (data == 1) {
				alert('중복된 아이디 입니다.');
			}else {
				alert('사용 가능한 아이디 입니다.')
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
		<form action="SignUp.do" id="#" method="post">
			<h1>회원가입</h1>
			<h3>회원가입을 하기 위해서 정보를 입력해주세요.</h3>

			<div class="mb-3">
				<label>아이디</label> <input type="text" class="form-control" name="id"
					id="id" placeholder="아이디를 입력해주세요." />
					<button type="button" onclick="idCheck();">아이디 중복 확인</button>
			</div>
			<div class="mb-3">
				<label>패스워드</label> <input type="password" class="form-control"
					name="password" id="password" placeholder="패스워드를 입력해주세요." />
			</div>
			<div class="mb-3">
				<label>재확인 패스워드</label> <input type="password" class="form-control"
					id="password2" placeholder="재확인 패스워드를 입력해주세요." />
			</div>
			<div class="mb-3">
				<label>이름</label> <input type="text" class="form-control"
					name="username" id="username" placeholder="이름을 입력해주세요." />
			</div>
			<div class="mb-3">
				<label>이메일</label> <input type="email" class="form-control"
					name="email" id="email" placeholder="이메일을 입력해주세요." />
			</div>
			<div class="mb-3">
				<label>성별</label> <input type="text" class="form-control" name="sex"
					id="sex" placeholder="성별을 선택해주세요." />
			</div>
			<div class="mb-3">
				<label>개인번호</label> <input type="text" class="form-control"
					name="phonenumber" id="phonenumber" placeholder="개인번호를 입력해주세요." />
			</div>
			<div class="mb-3">
				<label>주소</label> <input type="text" class="form-control"
					name="address" id="address" placeholder="주소를 입력해주세요." />
			</div>
			<div class="mb-3">
				<label>상세주소</label> <input type="text" class="form-control"
					name="address" id="address" placeholder="상세주소를 입력해주세요." />
			</div>
			
			<button type="button" id="SingUpBtn">가입하기</button>
		</form>
	</div>
</body>
</html>