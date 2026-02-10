<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container mt-4"> 
    <h2>게시글 수정하기</h2> 
    <hr>

    <form action="${pageContext.request.contextPath}/board/modify" method="post">
        
        <input type="hidden" name="bno" value="${board.bno}">

        <div class="form-group mb-3">
            <label><b>번호</b></label> 
            <input class="form-control" value="${board.bno}" readonly="readonly">
        </div>

        <div class="form-group mb-3">
            <label><b>제목</b></label> 
            <input class="form-control" name="title" value="${board.title}">
        </div>

        <div class="form-group mb-3">
            <label><b>내용</b></label> 
            <textarea class="form-control" name="content" rows="10">${board.content}</textarea>
        </div>

        <div class="form-group mb-3">
            <label><b>작성자</b></label> 
            <input class="form-control" name="writer" value="${board.writer}" readonly="readonly">
        </div>

        <div class="mt-4">
            <button type="button" class="btn btn-primary" onclick="handleBtn('modify')">수정 완료</button>
            <button type="button" class="btn btn-danger" onclick="handleBtn('remove')">삭제</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/board/get?bno=${board.bno}'">취소</button>
        </div>
        
    </form> 

<script>
function handleBtn(type) {

    var formObj = document.querySelector("form");
   
    if(type === 'remove') {
        alert("삭제를 시도합니다!");
        formObj.action = "${pageContext.request.contextPath}/board/remove";
    } else if(type === 'modify') {
        alert("수정을 시도합니다!");
        formObj.action = "${pageContext.request.contextPath}/board/modify";
    }  
    formObj.submit();
}
</script>
    
</div>