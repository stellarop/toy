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
<script>
	$(function() {
		$('#boardBtn').click(function() {
			location.href = "board.jsp";
		})
	})
</script>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<body>
<div class="container" role="main">
<form action="">
<h1>견적 게시판 상세</h1>
	<input type="hidden" value="${getBoard.board_seq}" />
	<br/>
	<br/>
<div class="form-row">
	<div class="form-group col-md-3">
		<label for="">게시글 타입</label>
			<input type="text" value="${getBoard.boardtype}" class="form-control" readonly="readonly"/>
	</div>
	<div class="form-group col-md-3">
		<label for="">게시글 작성자</label>
		<input type="text" value="${getBoard.writer}" class="form-control" readonly="readonly"/>
	</div>
	<div class="form-group col-md-3">
	<br>
		<button class="btn btn-primary">수정</button>
		<button class="btn btn-primary">삭제</button>
	</div>
	<div class="form-group col-md-9">
		<label for="">게시글 제목</label>
		<input type="text" value="${getBoard.title}" class="form-control" readonly="readonly"/>
	</div>
	<div class="form-group col-md-9">
		<label for="">게시글 내용</label>
		<textarea class="form-control"  rows="15" readonly="readonly">${getBoard.content }</textarea>
	</div>
</div>
</form>
<button type="button" id="boardBtn" class="btn btn-primary">이전</button>
</div>

</body>
</html>