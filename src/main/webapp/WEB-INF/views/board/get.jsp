<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<h2>게시글 상세보기</h2>
<div class="form-group">
    <label>번호</label> <input name="bno" value="${board.bno}" readonly="readonly">
</div>
<div class="form-group">
    <label>제목</label> <input name="title" value="${board.title}" readonly="readonly">
</div>
<div class="form-group">
    <label>내용</label> 
    <div style="border: 1px solid #ccc; padding: 10px; min-height: 100px;">
        ${board.content}
    </div>
</div>
<div class="form-group">
    <label>작성자</label> <input name="writer" value="${board.writer}" readonly="readonly">
</div>

<button onclick="location.href='/myFirstProject/board/list'">목록으로</button>