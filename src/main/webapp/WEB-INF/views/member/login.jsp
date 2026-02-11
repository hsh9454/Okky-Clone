<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 - OKKY</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { background-color: #fff; }
        .login-container { max-width: 400px; margin-top: 80px; }
        .btn-sns { height: 45px; border: 1px solid #dee2e6; background: #fff; display: flex; align-items: center; justify-content: center; font-size: 20px; }
        .form-label { font-size: 0.85rem; color: #666; font-weight: bold; }
        .btn-login { background-color: #0090F9; border: none; height: 50px; font-weight: bold; }
        .divider { display: flex; align-items: center; color: #adb5bd; font-size: 0.75rem; margin: 30px 0; }
        .divider::before, .divider::after { content: ""; flex: 1; height: 1px; background: #eee; }
        .divider span { margin: 0 10px; }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="login-container text-center w-100">
        <div class="mb-4">
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M20 0L40 20L20 40L0 20L20 0Z" fill="#0090F9"/>
                <path d="M12 20L20 12L28 20L20 28L12 20Z" fill="white"/>
            </svg>
            <h3 class="fw-bold mt-3">OKKY에 오신것을 환영합니다.</h3>
            <p class="text-muted small">OKKY는 소프트웨어 개발자를 위한 지식공유 플랫폼입니다.</p>
        </div>

        <div class="mb-4">
            <p class="text-start small fw-bold mb-2">SNS 로그인</p>
            <div class="row g-2 mb-2">
                <div class="col-4"><a href="#" class="btn btn-sns w-100"><i class="bi bi-github"></i></a></div>
                <div class="col-4"><a href="#" class="btn btn-sns w-100"><i class="bi bi-google"></i></a></div>
                <div class="col-4"><a href="#" class="btn btn-sns w-100"><i class="bi bi-facebook"></i></a></div>
            </div>
            <div class="row g-2">
                <div class="col-6"><a href="#" class="btn btn-sns w-100 fw-bolder text-dark">N</a></div>
                <div class="col-6"><a href="#" class="btn btn-sns w-100 text-warning"><i class="bi bi-chat-fill"></i></a></div>
            </div>
        </div>

        <div class="divider"><span>OKKY 아이디로 로그인</span></div>

        <form action="${pageContext.request.contextPath}/member/login" method="post" class="text-start">
            <div class="mb-3">
                <label class="form-label">아이디</label>
                <input type="text" name="userid" class="form-control" placeholder="">
            </div>
            <div class="mb-2">
                <label class="form-label">비밀번호</label>
                <div class="input-group">
                    <input type="password" name="userpw" class="form-control border-end-0" placeholder="">
                    <span class="input-group-text bg-white border-start-0 text-muted"><i class="bi bi-eye"></i></span>
                </div>
            </div>
            
            <div class="text-end mb-4">
                <a href="#" class="text-decoration-none small text-primary">계정찾기</a>
            </div>

            <button type="submit" class="btn btn-primary btn-login w-100 mb-3">로그인</button>
            
            <div class="small text-center">
                <span class="text-muted">아직 회원이 아니신가요?</span>
                <a href="${pageContext.request.contextPath}/member/join" class="text-decoration-none text-primary fw-bold">회원가입</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>