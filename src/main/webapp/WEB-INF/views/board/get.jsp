<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="container mt-4"> <h2>게시글 상세보기</h2>
    <hr>

    <div class="form-group">
        <label><b>번호</b></label> 
        <input class="form-control" name="bno" value="${board.bno}" readonly="readonly">
    </div>

    <div class="form-group">
        <label><b>제목</b></label> 
        <input class="form-control" name="title" value="${board.title}" readonly="readonly">
    </div>

    <div class="form-group">
        <label><b>내용</b></label> 
        <div class="form-control" style="min-height: 200px; height: auto;">
            ${board.content}
        </div>
    </div>

    <div class="form-group">
        <label><b>작성자</b></label> 
        <input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
    </div>
    
    <div class="form-group">
        <label><b>조회수</b></label> 
        <input class="form-control" value="${board.viewcnt}" readonly="readonly">
    </div>

    <div class="mt-3">
        <button class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/'">목록으로</button>
        <button class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/board/modify?bno=${board.bno}'">수정하기</button>
    </div>
</div>