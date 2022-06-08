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
<!-- <script src="dataTable/datatable-editor.js"></script> -->
<script>

var start = { 
	init : function(){
		start.boardTable();
		start.insertBtn();
	},
	insertBtn : function() {
		$('#insertBtn').click(function() {
			location.href = "insertboard.jsp"; 
		})
	},
	boardTable : function(){
		$('#boardTable').DataTable({
			order : [ [1, "desc"] ],
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
});
</script>
</head>
<body>
	<button type="button" id="insertBtn">게시글 작성</button>
	<table id="boardTable" style="width: 1500px; text-align: center">
	</table>
</body>
</html>