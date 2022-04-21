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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
		
		if($('#username').val()=='' || $('#username') == null || $('#username') == undefined){
			 $('#username').focus();
			 
			 Swal.fire({
               	icon: 'warning',
               	title: '이름을 입력해주세요.',
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
		
		if($('#sex').val()=='' || $('#sex') == null || $('#sex') == undefined){
			 $('#sex').focus();
			 
			 Swal.fire({
             	icon: 'warning',
             	title: '성별을 지정해주세요.',
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
				Swal.fire({
		            title: '회원가입 하시겠습니까?',
		            icon: 'warning',
		            showCancelButton: true,
		            confirmButtonColor: '#3085d6',
		            cancelButtonColor: '#d33',
		            confirmButtonText: '가입',
		            cancelButtonText: '취소'
		        }).then((result) => {
		            if (result.isConfirmed) {
		            	if(data == true){
							/*
							가입 버튼 클릭 시 success 창이 뜨지 않고 바로 login.jsp로 이동하는 현상(주석 처리 하였으나 추후 고쳐야함.)
		                	Swal.fire(
		                    	'회원가입이 완료되었습니다.',
		                    	'로그인 해주세요.',
		                    	'success'
		                	)
		                	*/
		                	$('#SignUp').submit();
		                	window.location.href = "login.jsp";
		            	}else if(data == false){
		            		Swal.fire(
			                    '아이디가 중복 되었습니다.',
			                    '아이디를 다시 입력해주세요.',
			                    'error'
			                )
		            	}
		            }
		        })
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
		<form action="SignUp.do" id="SignUp" method="post">
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
				<label>성별</label>
					<select name="sex" id="sex" class="form-control">
    					<option value="">성별 선택</option>
    					<option value="남자">남자</option>
    					<option value="여자">여자</option>
					</select>
			</div>
			<div class="mb-3">
				<label>휴대폰 번호</label> <input type="text" class="form-control"
					name="phonenumber" id="phonenumber" placeholder="휴대폰 번호를 입력해주세요." />
			</div>
			<div class="mb-3">
				<label>주소</label> <input type="text" class="form-control"
					name="address" id="address" placeholder="주소를 입력해주세요." />
			</div>
			<div class="mb-3">
				<label>상세주소</label> <input type="text" class="form-control"
					name="address2" id="address2" placeholder="상세주소를 입력해주세요." />
			</div>
			
			<button type="button" id="SingUpBtn">가입하기</button>
		</form>
	</div>
</body>
</html>