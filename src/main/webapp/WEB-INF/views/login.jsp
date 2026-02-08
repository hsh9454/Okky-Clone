<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center align-items-center py-5">
    <div class="col-md-8 col-lg-6">
        <div class="text-center mb-4">
            <h3 class="fw-bold text-primary">OKKY</h3>
            <p class="text-muted">개발자 커뮤니티 OKKY에 오신 것을 환영합니다.</p>
        </div>
        <form action="${pageContext.request.contextPath}/login" method="post" class="p-4 border rounded shadow-sm bg-white">
            <div class="mb-3">
                <label class="form-label small fw-bold">아이디</label>
                <input type="text" name="id" class="form-control" placeholder="아이디를 입력하세요">
            </div>
            <div class="mb-3">
                <label class="form-label small fw-bold">비밀번호</label>
                <input type="password" name="pw" class="form-control" placeholder="비밀번호를 입력하세요">
            </div>
            <button type="submit" class="btn btn-primary w-100 fw-bold py-2 mb-3">로그인</button>
            <div class="d-flex justify-content-between small text-muted">
                <span>계정이 없으신가요? <a href="#" class="text-decoration-none">회원가입</a></span>
                <a href="#" class="text-decoration-none">아이디/비밀번호 찾기</a>
            </div>
        </form>
    </div>
</div>