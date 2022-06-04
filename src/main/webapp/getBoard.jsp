<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
</head>
<body>
	
	<input type="text" value="${getBoard.board_seq}" />
	<label for="">게시글 타입</label>
	<input type="text" value="${getBoard.boardtype}" />
	<label for="">게시글 제목</label>
	<input type="text" value="${getBoard.title}" />
	<label for="">게시글 작성자</label>
	<input type="text" value="${getBoard.writer}" />
	<label for="">게시글 내용</label>
	<input type="text" value="${getBoard.content}" />
</body>
</html>