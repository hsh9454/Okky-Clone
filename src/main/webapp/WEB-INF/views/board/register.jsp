<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 - OKKY Clone</title>

<Link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<Link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

</head>

<body>
<div class="container mt-5">
    <h2>새 글 작성</h2>
    <hr>
    
    <form action="register" method="post">
        <div class="form-group">
            <label>제목</label>
            <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
        </div>

        <div class="form-group">
            <label>작성자</label>
            <input type="text" class="form-control" name="writer" placeholder="이름을 입력하세요">
        </div>

        <div class="form-group">
            <label>내용</label>
            <textarea id="summernote" name="content"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">등록</button>
        <button type="reset" class="btn btn-secondary">다시 쓰기</button>
    </form>
</div>

<script>
$(document).ready(function(){
	$('#summernote').summernote({
		height: 400,
		lang: 'ko-kr',
		placeholder: '내용을 입력해 주세요.'
	});
});
</script>
</body>
</html>