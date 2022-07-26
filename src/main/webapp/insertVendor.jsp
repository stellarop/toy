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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- alert 꾸미기 -->
<script>
$(function() {
	
	$('#vendor_address').click(function() {
		new daum.Postcode({
	        oncomplete: function(data) {
	        	$('#vendor_address').val(data.address);
	        }
	    }).open();
	})
	
	$('#insertVendorBtn').click(function() {
		
		var vendor_name = $('#vendor_name').val();
		var vendor_number = $('#vendor_number').val();
		var vendor_type = $('#vendor_type').val();
		var vendor_address = $('#vendor_address').val();
		var vendor_username = $('#vendor_username').val();
	
		if(vendor_name == ''){
			alert('상호명을 입력해주세요.');
			$('#vendor_name').focus();
			return false;v
		}
		if(vendor_number == ''){
			alert('담당자 번호를 입력해주세요.');
			$('#vendor_number').focus();
			return false;
		}
		if(vendor_type == '판매하시는 상품을 선택해주세요'){
			alert('상품 타입을 선택해주세요.');
			$('#vendor_type').focus();
			return false;
		}
		if(vendor_address == ''){
			alert('담당자 주소를 입력해주세요.');
			$('#vendor_address').focus();
			return false;
		}
		if(vendor_username == ''){
			alert('담당자 성함을 입력해주세요.');
			$('#vendor_username').focus();
			return false;
		}
		
		var data = { 
			'vendor_name' : vendor_name,
			'vendor_number' : vendor_number,
			'vendor_type' : vendor_type,
			'vendor_address' : vendor_address,
			'vendor_username' : vendor_username
		}
		console.log(data);
		
		$.ajax({
			url : 'insertVendor.do',
			type : 'post',
			dataType : 'json',
			data : data,
			success : function(data) {
				if(confirm('판매처를 등록하시겠습니까?')){
					if(data == 20){
						alert('세션이 만료되었습니다.\n다시 로그인 해주세요.');
						location.href = "login.jsp"
					}else if(data == 0){
						alert('판매처 등록은 계정당 한개만 가능합니다.');
						location.href = "insertVendor.jsp"
					}else if(data == 1){
						alert('판매처 코드 생성이 중복되었습니다.\n다시 시도해주세요.');
						location.href = "insertVendor.jsp"
					}else if(data == 2){
						alert('판매처 등록이 완료되었습니다.');
						location.href = "main.jsp"
					}else if(data == 3){
						alert('판매처 등록에 실패하였습니다.\n관리자에게 문의 해주세요.');
						location.href = "main.jsp"
					}
				}
			},error : function(data){
				alert('알 수없는 오류입니다.\n관리자에게 문의 해주세요.');
				location.href = "main.jsp"
			}
		})
		
	})
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
			<input type="text" class="form-control" name="vendor_name" id="vendor_name"/>
		</div>
		
		<div class="form-group col-md-4">
			<label for="">담당자 번호</label>
			<input type="text" class="form-control" name="vendor_number" id="vendor_number"/>
		</div>
		
		<div class="form-group col-md-4">
			<label for="">상품 타입</label>
				<select class="form-control" name="vendor_type" id="vendor_type">
					<option selected>판매하시는 상품을 선택해주세요.</option>
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
			<input type="text" class="form-control" name="vendor_address" id="vendor_address"/>
		</div>
		
		<div class="form-group col-md-4">
			<label for="">판매처 담당자 성함</label>
			<input type="text" class="form-control" name="vendor_username" id="vendor_username"/>
		</div>
		
		
	</div>
	<button type="button" id="insertVendorBtn" class="btn btn-primary">등록</button>
</div>
</body>
</html>