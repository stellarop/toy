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
	

	$('#vendorList').DataTable({
		order : [ [1, "desc"] ],
		ajax : {
			url : 'vendorList.do',
			type : 'post',
			dataType : 'json',
			dataSrc : 'data'
		},
		columns : [
			{ title : '판매처 번호', data : 'vendor_seq'},
			{ title : '판매처 이름', data : 'vendor_name',
				render : function(data, type, row) {
					return '<a href="#" onclick="selectVendor(' + row.vendor_seq + ')">' + data + '</a>';
				}	
			},
			{ title : '상품타입', data : 'vendor_type'},
			{ title : '판매처 담당자 성함', data : 'vendor_username'},
		],
		columnDefs: [
             { targets: 0  ,className: "dt-head-center"}
            ,{ targets: 1  ,className: "dt-head-center"}
            ,{ targets: 2  ,className: "dt-head-center"}
            ,{ targets: 3  ,className: "dt-head-center"}
      ]
	});
	
	
	
	$('#test').click(function() {
		alert(1)
	})
	
	
	
});
function selectVendor(seq) {
	
	if(seq == '' || seq == undefined || seq == null){
		alert('판매처 등록 번호가 없어 상세 조회를 할 수 없습니다.');
		location.href = "vendorList.jsp";
	}else{
		var vendor_seq = seq;
		
		localStorage.setItem('vendor_seq',vendor_seq);
		location.href = "selectVendor.jsp"
	}
	
	
}
</script>
<meta charset="UTF-8">
<title>판매처 리스트</title>
</head>
<body>
<button id="test" type="button">test</button>
	<table id="vendorList">
	</table>
</body>
</html>