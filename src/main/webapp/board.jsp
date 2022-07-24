<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상담 게시판</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<script src="jquery/jquery-3.6.0.min.js"></script>
<script src="dataTable/datatables.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/select/1.3.3/css/select.dataTables.min.css" />
<!-- <script src="dataTable/datatable-editor.js"></script> -->
<script>

var start = { 
	init : function(){
		start.boardTable();
		start.insertBtn();
	},
	insertBtn : function() {
		$('#insertBtn').click(function() {
			location.href = "insertBoard.jsp"; 
		})
	},
	boardTable : function(){
		$('#boardTable').DataTable({
			paging : true,
			searching : true,
			order : [1, "desc"],
			language: {
	            emptyTable : "견적 문의 게시글이 존재하지 않습니다..",
	            info : "_START_ - _END_ (총 _TOTAL_ 건)",
	            infoEmpty : "0 개 항목 중 0 ~ 0 개 표시",
	            infoFiltered : "(전체 _MAX_ 건 중 검색결과)",
	            lengthMenu : "_MENU_",
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
				url : 'boardList.do',
				type : 'post',
				dataType : 'json',
				dataSrc : 'data'
			},
			columns: [
	              { title: "번호" , data: "board_seq"},
	              { title: "제목" , data: "title",
	            	  render : function(data, type, row) {
							return '<a href="getBoard.do?board_seq=' + row.board_seq +'">' + data + '</a>';
							width:"20%"}},
	              { title: "작성자" , data: "writer"},
	              // 칼럼명이 board_type인데 _ 쓰니 에러 발생 왜 에러가 나는지 추후 알아낼 예정
	              { title: "분류" , data: "boardtype"},
	          ],
	          columnDefs: [
	                 { targets: 0     ,className: "dt-head-center"}
	                ,{ targets: 1     ,className: "dt-head-center"}
	                ,{ targets: 2     ,className: "dt-head-center"}
	                ,{ targets: 3     ,className: "dt-head-center"}
	          ]
		});
	}
}

$(function() {
	start.init();
	$('#backBtn').click(function() {
		location.href = "main.jsp";
	})
});
</script>
</head>
<body>
	
	<div class="container" role="main">
	<div class="form-row">
		<h1>견적 게시판</h1>
		<br><br><br><br>
		
	<table id="boardTable" style="width: 1100px; text-align: center" class="table table-hover">
	</table>
	<button type="button" id="insertBtn" class="btn btn-primary">게시글 작성</button>&nbsp;&nbsp;&nbsp;
	<button type="button" id="backBtn" class="btn btn-primary">이전</button>
	</div>
	</div>
</body>
</html>