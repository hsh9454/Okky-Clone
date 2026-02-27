<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 - ${group}</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>

<style>
    .note-editor.note-frame { border: 1px solid #ced4da; }
    .note-editor .note-toolbar { background-color: #fff; border-bottom: 1px solid #ced4da; }
    .note-editor .note-editing-area .note-editable { border-bottom: 1px dashed #ccc; min-height: 300px; }
    
    .title-input { font-size: 1.5rem; font-weight: bold; padding: 15px; }
    
    .tags-container { border: 1px solid #ced4da; padding: 10px; margin-top: -1px; border-radius: 0 0 4px 4px; border-top: none; }
</style>

</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">기술 궁금증 해결하기</h2>
    <p class="text-muted">잔심남님 지식공유 플랫폼 OKKY에서 최고의 개발자들과 함께 궁금증을 해결하세요.</p>
    
    <form action="${pageContext.request.contextPath}/board/register" method="post">
        <input type="hidden" name="group" value="${group}">
        
        <div class="mb-3">
            <label class="form-label font-weight-bold">카테고리</label>
            <select id="categorySelect" name="cat_id" class="form-select" required>
                <option value="">카테고리를 선택해 주세요.</option>
                </select>
                <input type="text" class="form-control" name="title" placeholder="제목을 입력하세요" required>
        </div>

        <div class="mb-0">
            <textarea id="summernote" name="content" required></textarea>
        </div>

        <div class="tags-container mb-3">
            <input type="text" name="tags" class="form-control" placeholder="태그를 콤마로 구분하여 입력해주세요.">
        </div>

        <div class="d-flex justify-content-between mt-4">
            <button type="button" class="btn btn-outline-secondary" onclick="history.back()">취소</button>
            <div>
                <button type="button" class="btn btn-outline-dark me-2">임시저장</button>
                <button type="submit" class="btn btn-dark">등록</button>
            </div>
        </div>
    </form>
</div>

    <script>
    $(document).ready(function() {
    	
    	$('#summernote').summernote({
            height : 300,
            lang : 'ko-KR',
            placeholder : '내용을 입력해주세요.',
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'italic', 'underline', 'clear']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['codeview', 'help']]
            ],
            callbacks : {
                onChange : function(contents, $editable) {
                    $('#summernote').val(contents);
                }
            }
        });
    	
        var currentGroup = "${group}"; 
        if(currentGroup) {
            loadCategories(currentGroup);
        }

        function loadCategories(group) {
            if (group) {
                $.getJSON("${pageContext.request.contextPath}/board/getCategoryList", { group: group }, function(data) {
                    $('#categorySelect').empty();
                    $('#categorySelect').append('<option value="">카테고리를 선택하세요</option>');
                    
                    $.each(data, function(index, item) {                       
                        $('#categorySelect').append('<option value="' + item.id + '">' + item.name + '</option>');
                    });
                });
            } else {
                $('#categorySelect').empty();
                $('#categorySelect').append('<option value="">카테고리를 선택하세요</option>');
            }
        }
    });
    </script>
</body>
</html>