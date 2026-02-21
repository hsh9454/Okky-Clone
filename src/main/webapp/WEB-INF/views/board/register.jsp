<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<Link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<Link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<div class="container mt-5">
	<h2>새 글 작성</h2>
	<hr>

	<form action="${pageContext.request.contextPath}/board/register" method="post">

		<div class="form-group mb-3">
			<label>게시판 선택</label> <select name="cat_id" class="form-select"
				required>
				<option value="">-- 게시판을 선택하세요 --</option>
				<optgroup label="Q&A">
					<option value="11">기술</option>
					<option value="12">커리어</option>
					<option value="13">기타</option>
				</optgroup>
				<optgroup label="커뮤니티">
					<option value="31">사는얘기</option>
				</optgroup>
			</select>
		</div>

		<div class="form-group">
			<label>제목</label> <input type="text" class="form-control"
				name="title" placeholder="제목을 입력하세요">
		</div>

		<div class="form-group">
			<label>작성자</label> <input type="text" class="form-control"
				name="writer" Value="${user.userid}" readonly>
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
	$(document).ready(function() {

		$('#summernote').summernote({
			height : 400,
			lang : 'ko-KR',
			placeholder : '내용을 입력해 주세요.',
			callbacks : {
				onChange : function(contents, $editable) {
					$('#summernote').val(contents);
				}
			}
		});

		$('form').on('submit', function() {
			var content = $('#summernote').val();
			if (content == "" || content == "<p><br></p>") {
				alert("내용을 입력해주세요!");
				return false;
			}
			return true;
		});
	});
</script>
