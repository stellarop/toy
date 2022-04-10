<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
<form action="SignUp.do">
<h1>회원가입</h1>
<h3>회원가입을 하기 위해서 정보를 입력해주세요.</h3>
<input type="text" name="id" id="id" placeholder="아이디를 입력해주세요." />
<input type="password" name="password" id="password" placeholder="패스워드를 입력해주세요." />
<input type="password" id="password2" placeholder="재확인 패스워드를 입력해주세요." />
<input type="text" name="username" id="username" placeholder="이름을 입력해주세요." />
<input type="text" name="email" id="email" placeholder="이메일을 입력해주세요." />
<input type="text" name="sex" id="sex" placeholder="성별을 선택해주세요." />
<input type="text" name="phonenumber" id="phonenumber" placeholder="휴대폰번호를 입력해주세요." />
<input type="text" name="address" id="address" placeholder="주소를 입력해주세요." />
<input type="text" name="address" id="address" placeholder="상세주소를 입력해주세요." />
</form>
</body>
</html>