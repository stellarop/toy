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
	$('#insertBtn').click(function() {
		
		
		var board_type = $('#board_type').val();
		var title = $('#title').val();
		var content = $('#content').val();
		
		$.ajax({
			url : 'insertBoard.do',
			type : 'post',
			dataType : 'json',
			data : {'boardtype' : board_type,
					'title' : title,
					'content' : content
			},
			success : function(data) {
				if(data == true){
					alert('문의주신 내역이 정상적으로 등록되었습니다.\n회원가입 하신 번호로 빠른 시일내에 연락 드리겠습니다.');
					location.href = "board.jsp";
				}else if(data == false){
					alert('문의 내역이 시스템 오류로 등록되지 않았습니다.\n관리자에게 문의 바랍니다.');
				}
			},error : function(data) {
				alert('알 수 없는 오류 입니다.\n관리자에게 문의 바랍니다.');
			}
		})
	})		
})
</script>
<meta charset="UTF-8">
<title>게시글 작성</title>
</head>
<body>
	
<div class="container" role="main">
<h1>견적 & 상담 문의</h1>

	<div class="form-row">
	
	<div class="form-group col-md-3">
	
		<label>문의 타입</label>
			<select class="form-control" id="board_type" name="board_type">
				<option selected >타입을 선택 해주세요.</option>
				<option>물류 견적 문의</option>
				<option>믈류 상담 문의</option>
				<option>간편 견적 문의</option>
			</select>
	</div>
	<div class="form-group col-md-5">
		<label>제목</label>
			<input type="text" id="title" name="title" class="form-control" placeholder="제목을 입력해주세요."/>
	</div>
	
	<div class="form-group col-md-8">
		<label>문의 내용</label>
			<textarea class="form-control" id="content" name="content" rows="15" placeholder="문의 내용을 입력해주세요. 내용이 자세할수록 좋습니다."></textarea>
	</div>
	
	</div>
	</form>
	<button type="button" id="insertBtn" class="btn btn-primary">제출</button>
	
</div>
</body>
</html>