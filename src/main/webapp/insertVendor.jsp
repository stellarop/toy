<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="jquery/jquery-3.6.0.min.js"></script>
<script>
$(function() {
	
})
</script>
<meta charset="UTF-8">
<title>판매처 등록 페이지</title>
</head>
<body>
<div class="container" role="main">
	<h1>판매처 등록</h1>
	<br>
	<div class="form-row">
	
		<div class="form-group col-md-5">
			<label for="">판매처 상호명</label>
			<input type="text" class="form-control"/>
		</div>
		
		<div class="form-group col-md-4">
			<label for="">담당자 번호</label>
			<input type="text" class="form-control"/>
		</div>
		
		<div class="form-group col-md-4">
			<label for="">상품 타입</label>
				<select name="sex" id="sex" class="form-control">
					<option selected>판매하시는 상품을 선택 해주세요.</option>
					<option>의류</option>
					<option>주류</option>
					<option>식품</option>
					<option>화장품</option>
					<option>생필품</option>
					<option>기타</option>
				</select>
		</div>
		
		<div class="form-group col-md-5">
			<label for="">판매처 담당자 주소</label>
			<input type="text" class="form-control"/>
		</div>
		
		<div class="form-group col-md-4">
			<label for="">판매처 담당자 성함</label>
			<input type="text" class="form-control"/>
		</div>
		
		
	</div>
	<button type="button" id="insertVendorBtn" class="btn btn-primary">등록</button>
</div>
</body>
</html>