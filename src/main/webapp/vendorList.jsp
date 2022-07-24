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
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css" />
<script>
$(function() {
	
	$('#backBtn').click(function() {
		location.href = "main.jsp"; 
	})

	$('#vendorList').DataTable({
		paging : true,
		searching : true,
		order : [1, "desc"],
		language: {
            emptyTable : "판매처가 존재하지 않습니다..",
            info : "_START_ - _END_ (총 _TOTAL_ 건)",
            infoEmpty :      "0 개 항목 중 0 ~ 0 개 표시",
            infoFiltered : "(전체 _MAX_ 건 중 검색결과)",
            lengthMenu :     "_MENU_",
            loadingRecords : "로드 중",
            processing : "처리 중",
            search : "검색 : ",
            lengthMenu : "_MENU_ 개씩 보기",
            zeroRecords : "일치하는 데이터가 없습니다.",
            paginate : {
                first : "처음",
                last : "마지막",
                next : "다음",
                previous : "이전"
            },
            aria: {
                sortAscending :  ": 오름차순으로 정렬",
                sortDescending : ": 내림차순으로 정렬"
            }
        },
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

	<div class="container" role="main">
	<div class="form-row">
		<h1>판매처 리스트</h1>
		<br><br><br><br>
	<table id="vendorList" style="width: 1100px; text-align: center" class="table table-hover">
	</table>
	<button type="button" id="backBtn" class="btn btn-primary">이전</button>
	</div>
	</div>
</body>
</html>