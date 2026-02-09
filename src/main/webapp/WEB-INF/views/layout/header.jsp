<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="d-flex align-items-center justify-content-between w-100 py-1">
    <div class="d-flex align-items-center">
        <a href="${pageContext.request.contextPath}/" class="text-primary fw-bolder fs-4 text-decoration-none me-4">OKKY</a>
        
        <div class="d-none d-lg-flex gap-3 ms-1">
            <a href="#" class="text-dark text-decoration-none fw-bold small">Q&amp;A</a>
            <a href="#" class="text-dark text-decoration-none fw-bold small">지식</a>
            <a href="#" class="text-dark text-decoration-none fw-bold small">커뮤니티</a>
            <a href="#" class="text-dark text-decoration-none fw-bold small text-danger">부트캠프</a>
            <a href="#" class="text-dark text-decoration-none fw-bold small">이벤트</a>          
            <a href="#" class="text-dark text-decoration-none fw-bold small">칼럼</a>
            <a href="#" class="text-dark text-decoration-none fw-bold small">공지사항</a>
            <a href="#" class="text-dark text-decoration-none fw-bold small">채용정보</a>
        </div>
    </div>

    <div class="d-flex align-items-center gap-2">
        <input type="text" class="form-control form-control-sm bg-light border-0" placeholder="검색" style="width: 140px;">
        
        <a href="${pageContext.request.contextPath}/member/login" class="btn btn-sm btn-outline-secondary border-0 fw-bold">로그인</a>
        
        <a href="${pageContext.request.contextPath}/member/join" class="btn btn-sm btn-primary px-3 fw-bold shadow-sm">회원가입</a>
    </div>
</div>