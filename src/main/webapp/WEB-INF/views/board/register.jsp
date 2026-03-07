<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 글 작성</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>

</head>
<body>
	<div class="container mt-5">
		<h2>새 글 작성</h2>
		<hr>

		<form action="${pageContext.request.contextPath}/board/register" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<div class="form-group mb-3">
				<label>게시판 선택</label> <select name="cat_id" class="form-control" required>
					<option value="">-- 게시판을 선택하세요 --</option>
					<optgroup label="Q&A">
						<option value="11">기술</option>
						<option value="12">커리어</option>
						<option value="13">기타</option>
					</optgroup>
					<optgroup label="지식">
						<option value="21">Tech 뉴스</option>
						<option value="22">팁</option>
						<option value="23">칼럼</option>
						<option value="24">리뷰</option>
						<option value="25">IT보도자료</option>
					</optgroup>

					<optgroup label="커뮤니티">
						<option value="31">사는얘기</option>
						<option value="32">AI</option>
						<option value="33">연봉·단가</option>
						<option value="34">취준생</option>
						<option value="35">IT 정책토론</option>
						<option value="36">피드백</option>
					</optgroup>

					<optgroup label="이벤트">
						<option value="41">IT 행사</option>
						<option value="42">홍보·광고</option>
					</optgroup>

					<optgroup label="모임">
						<option value="51">스터디</option>
						<option value="52">프로젝트</option>
						<option value="53">모각코·모각공</option>
					</optgroup>

					<optgroup label="기타">
						<option value="61">교육과정</option>
						<option value="62">공지사항</option>
					</optgroup>
				</select>
			</div>

			<div class="form-group">
				<label>제목</label> <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" required>
			</div>

			<div class="form-group">
				<label>작성자</label> <input type="text" class="form-control" name="writer" value="${user.userid}" readonly>
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
</body>
</html>