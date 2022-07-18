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
<script src="dataTable/datatables.min.js"></script>
<script>

$(function() {
	
})

function mapSearch(add) {
	
	var address = add;
	
	if(address == '' || address == undefined || address == null){
		alert('판매처 주소를 찾을 수 없습니다.')
	}else{
		window.open('https://map.naver.com/v5/search/' + address);
	}
	
}

function deleteVendor(seq) {
	
	var vendor_seq = seq;
	
	if(vendor_seq == '' || vendor_seq == undefined || vendor_seq == null){
		alert('판매처 등록 번호가 없어 판매처 삭제를 할 수 없습니다.');
	}else{
		$.ajax({
			url : 'deleteVendor.do',
			type : 'post',
			dataType : 'json',
			data : {'vendor_seq' : vendor_seq},
			success : function(data) {
				if(confirm('등록된 판매처 정보를 삭제 하시겠습니까?')){
					if(data == true){
						alert('판매처 삭제가 완료되었습니다.');
						location.href = "vendorList.jsp";
					}else{
						alert('판매처 삭제 처리에 실패하였습니다.\n다시 시도해주세요.');
					}
				}
			},error : function(data) {
				alert('오류가 발생하였습니다.\n다시 시도해주세요.');
			}
		})
	}
}

function selectVendor() {

	if(localStorage.getItem('vendor_seq')){
		
		var vendor_seq = localStorage.getItem('vendor_seq');
		console.log(vendor_seq);
		
		if(vendor_seq == '' || vendor_seq == undefined || vendor_seq == null){
			alert('판매처 등록 번호가 없어 상세 조회를 할 수 없습니다.');
			location.href = "vendorList.jsp";
		}else{
			$.ajax({
				url : 'selectVendor.do?vendor_seq=' + vendor_seq,
				type : 'post',
				dataType : 'json',
				success : function(data) {
					selectVendor = '';
					console.log(data);
					
					selectVendor += '<div class="container" role="main">';
					selectVendor += '<h1>판매처 상세 조회</h1>';
					selectVendor += '<div class="form-row">';
					
					selectVendor += '<div class="form-group col-md-3">';
					selectVendor += '<label for="">판매처 이름</label>';
					selectVendor += '<input type="text" class="form-control" id="vendor_name" value= ' + data.selectVendor.vendor_name + ' readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-3">';
					selectVendor += '<label for="">판매처 등록코드</label>';
					selectVendor += '<input type="text" class="form-control" id="vendor_name" value= ' + data.selectVendor.vendor_code + ' readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-3">';
					selectVendor += '<label for="">판매처 등록일</label>';
					selectVendor += '<input type="text" class="form-control" id="vendor_name" value= ' + data.selectVendor.regData + ' readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-3">';
					selectVendor += '<label for="">담당자 번호</label>';
					selectVendor += '<input type="text" class="form-control" id="vendor_name" value= ' + data.selectVendor.vendor_number + ' readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-3">';
					selectVendor += '<label for="">담당자 성함</label>';
					selectVendor += '<input type="text" class="form-control" id="vendor_name" value= ' + data.selectVendor.vendor_username + ' readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-3">';
					selectVendor += '<label for="">판매 물품종류</label>';
					selectVendor += '<input type="text" class="form-control" id="vendor_name" value= ' + data.selectVendor.vendor_type + ' readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-3">';
					selectVendor += '<label for="">판매처 주소</label>';
					selectVendor += '<input type="text" class="form-control" id="vendor_name" value= ' + data.selectVendor.vendor_address + ' readonly="readonly"/>';
					selectVendor += '</div>';
					
					// button 영역	
					selectVendor += '</div>'; 
					selectVendor += '<button type="button" id="updateVendor" class="btn btn-primary">수정</button>&nbsp;&nbsp;&nbsp;';
					selectVendor += '<button type="button" id="deleteVendor" class="btn btn-danger" onclick="deleteVendor(' + data.selectVendor.vendor_seq + ');">삭제</button>';
					// 스크립트에서 함수에 문자열 매개변수를 넘길 시 \', '\ 를 붙혀줘야 함
					selectVendor += '<button type="button" onclick="mapSearch(\'' + data.selectVendor.vendor_address + '\');">버튼내용 </button>';
					selectVendor += '</div>'; 
					
				
				$('#selectVendor').html(selectVendor);
				}
			})
		}
		
		
		
		
		
	}
}	
selectVendor();
</script>
<meta charset="UTF-8">
<title>판매처 상세 조회</title>
</head>
<body>
	<div id="selectVendor">
	</div>
	
</body>
</html>