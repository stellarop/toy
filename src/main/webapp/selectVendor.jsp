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
	selectVendor();
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
					if(confirm('판매처 삭제 시 등록하신 상품도 같이 삭제됩니다.\n정말 삭제하시겠습니까?')){
						if(data == true){
							alert('판매처 삭제가 완료되었습니다.');
							location.href = "vendorList.jsp";
						}else{
							alert('판매처 삭제 처리에 실패하였습니다.\n다시 시도해주세요.');
						}
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
			var vendor_code;
			
			$.ajax({
				url : 'selectVendor.do?vendor_seq=' + vendor_seq,
				type : 'get',
				dataType : 'json',
				async : false,
				success : function(data) {
					selectVendor = '';
					
					console.log(data);
					
					vendor_code = data.selectVendor.vendor_code;
					
					selectVendor += '<div class="container" role="main">';
					selectVendor += '<h1>판매처 상세 조회</h1>';
					selectVendor += '<div class="form-row">';
					
					selectVendor += '<div class="form-group col-md-4">';
					selectVendor += '<label for="">판매처 이름</label>';
					selectVendor += '<input type="text" class="form-control" value= "' + data.selectVendor.vendor_name + '" readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-4">';
					selectVendor += '<label for="">판매처 등록코드</label>';
					selectVendor += '<input type="text" class="form-control" value= "' + data.selectVendor.vendor_code + '" readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-4">';
					selectVendor += '<label for="">판매처 등록일</label>';
					selectVendor += '<input type="text" class="form-control" value= "' + data.selectVendor.regData + '" readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-4">';
					selectVendor += '<label for="">담당자 번호</label>';
					selectVendor += '<input type="text" class="form-control" value= "' + data.selectVendor.vendor_number + '" readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-4">';
					selectVendor += '<label for="">담당자 성함</label>';
					selectVendor += '<input type="text" class="form-control" value= "' + data.selectVendor.vendor_username + '" readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-4">';
					selectVendor += '<label for="">판매 물품종류</label>';
					selectVendor += '<input type="text" class="form-control" value= "' + data.selectVendor.vendor_type + '" readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-4">';
					selectVendor += '<label for="">판매처 주소</label>';
					selectVendor += '<input type="text" class="form-control" value= "' + data.selectVendor.vendor_address + '" readonly="readonly"/>';
					selectVendor += '</div>';
					
					selectVendor += '<div class="form-group col-md-3">';
					selectVendor += '<br>';
					selectVendor += '<button type="button" class="btn btn-success" onclick="mapSearch(\'' + data.selectVendor.vendor_address + '\');">View Map</button>';
					selectVendor += '</div>';
					// button 영역	
					selectVendor += '</div>'; 
					selectVendor += '<button type="button" id="updateVendor" class="btn btn-primary">수정</button>&nbsp;&nbsp;&nbsp;';
					selectVendor += '<button type="button" id="deleteVendor" class="btn btn-danger" onclick="deleteVendor(' + data.selectVendor.vendor_seq + ');">삭제</button>&nbsp;&nbsp;&nbsp';

					// 스크립트에서 함수에 문자열 매개변수를 넘길 시 \', '\ 를 붙혀줘야 함
					
					selectVendor += '</div>'; 
					
				
				$('#selectVendor').html(selectVendor);
				}
			})
		}
		productList(vendor_code);	
	}
}	
// 판매처 상품 리스트
function productList(vc) {
	
	var vendor_code = vc;
	
	if(vendor_code == '' || vendor_code == undefined || vendor_code == null){
		alert('상품 리스트를 불러올 수 없습니다.');
		location.href = "vendorList.jsp";
	}else{
		$('#vendorProductList').DataTable({
			order : [ [1, "desc"] ],
			ajax : {
				url : 'vendorProductList.do',
				type : 'get',
				dataType : 'json',
				data : {'vendor_code' : vendor_code}
			},
			columns : [
				{title : "판매처 코드", data : "vendor_code"},
				{title : "판매처 이름", data : "vendor_name"},
				{title : "상품 코드", data : "product_code"},
				{title : "상품 이름", data : "vendor_name"},
				{title : "상품 타입", data : "product_type"},
				{title : "상품 가격", data : "product_price"},
				{title : "상품 포장", data : "product_process"},
				{title : "상품 용량", data : "product_weight"},
				{title : "상품 개수", data : "product_quantity"},
				{title : "상품 등록일", data : "regData"},
				
			],
			columnDefs : [
				{ targets: 0     ,className: "dt-head-center"}
				,{ targets: 1     ,className: "dt-head-center"}
				,{ targets: 2     ,className: "dt-head-center"}
				,{ targets: 3     ,className: "dt-head-center"}
				,{ targets: 4     ,className: "dt-head-center"}
				,{ targets: 5     ,className: "dt-head-center"}
				,{ targets: 6     ,className: "dt-head-center"}
				,{ targets: 7     ,className: "dt-head-center"}
				,{ targets: 8     ,className: "dt-head-center"}
				,{ targets: 9     ,className: "dt-head-center"}
			]
			
		});
	}

}
</script>
<meta charset="UTF-8">
<title>판매처 상세 조회</title>
</head>
<body>
	<div id="selectVendor">
	</div>
	<table id="vendorProductList" class="center">
	</table>
</body>
</html>