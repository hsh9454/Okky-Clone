<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 - OKKY</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body { background-color: #fff; }
        .join-container { max-width: 450px; margin-top: 50px; margin-bottom: 50px; }
        .btn-sns { height: 45px; border: 1px solid #dee2e6; background: #fff; display: flex; align-items: center; justify-content: center; font-size: 20px; }
        .form-label { font-size: 0.85rem; color: #333; font-weight: bold; }
        .form-label .text-danger { margin-left: 3px; }
        .form-control { height: 45px; font-size: 0.9rem; }
        .tag-btn { border-radius: 20px; padding: 5px 15px; font-size: 0.8rem; margin: 3px; border: 1px solid #eee; background: #f8f9fa; color: #666; cursor: pointer; }
        .tag-btn:hover { background: #e9ecef; }
        .btn-join { background-color: #8FD4FF; border: none; height: 50px; font-weight: bold; color: white; }
        .divider { display: flex; align-items: center; color: #adb5bd; font-size: 0.75rem; margin: 25px 0; }
        .divider::before, .divider::after { content: ""; flex: 1; height: 1px; background: #eee; }
        .divider span { margin: 0 10px; }
    </style>
</head>
<body>

<div class="container d-flex justify-content-center">
    <div class="join-container w-100">
        <div class="text-center mb-4">
            <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M20 0L40 20L20 40L0 20L20 0Z" fill="#0090F9"/>
                <path d="M12 20L20 12L28 20L20 28L12 20Z" fill="white"/>
            </svg>
            <h3 class="fw-bold mt-3 text-dark">OKKY에 오신것을 환영합니다.</h3>
            <p class="text-muted small">OKKY는 소프트웨어 개발자를 위한 지식공유 플랫폼입니다.</p>
        </div>

        <div class="mb-4">
            <p class="small fw-bold mb-2">SNS 회원가입</p>
            <div class="row g-2 mb-2">
                <div class="col-4"><a href="#" class="btn btn-sns w-100 text-dark"><i class="bi bi-github"></i></a></div>
                <div class="col-4"><a href="#" class="btn btn-sns w-100 text-dark"><i class="bi bi-google"></i></a></div>
                <div class="col-4"><a href="#" class="btn btn-sns w-100 text-dark"><i class="bi bi-facebook"></i></a></div>
            </div>
            <div class="row g-2">
                <div class="col-4"><a href="#" class="btn btn-sns w-100 fw-bold text-dark">N</a></div>
                <div class="col-8"><a href="#" class="btn btn-sns w-100 text-warning"><i class="bi bi-chat-fill"></i></a></div>
            </div>
        </div>

        <div class="divider"><span>회원가입에 필요한 기본정보를 입력해주세요.</span></div>

        <form action="${pageContext.request.contextPath}/member/join" method="post">
            <div class="mb-3">
                <label class="form-label">아이디 <span class="text-danger">*</span></label>
                <input type="text" name="userid" class="form-control" placeholder="4~15자 이내로 입력해주세요">
            </div>
            <div class="mb-3">
                <label class="form-label">비밀번호 <span class="text-danger">*</span></label>
                <input type="password" name="userpw" class="form-control" placeholder="최소 6자 이상(알파벳, 숫자 필수)">
            </div>
            <div class="mb-3">
                <label class="form-label">이메일 <span class="text-danger">*</span></label>
                <input type="email" name="useremail" class="form-control" placeholder="munchkin@okky.kr">
            </div>
            <div class="mb-3">
                <label class="form-label">실명 <span class="text-danger">*</span></label>
                <input type="text" name="username" class="form-control" placeholder="홍길동">
            </div>
            <div class="mb-4">
                <label class="form-label">닉네임 <span class="text-danger">*</span></label>
                <input type="text" name="nickname" class="form-control" placeholder="별명은 알파벳, 한글, 숫자를 20자 이하로 입력해주세요.">
            </div>

            <div class="mb-4">
                <label class="form-label">관심태그 <span class="text-danger small">* 1개~10개 선택</span></label>
                <div class="d-flex flex-wrap border rounded p-3 bg-white" style="max-height: 150px; overflow-y: auto;">
                    <span class="tag-btn">백엔드</span><span class="tag-btn">프론트엔드</span><span class="tag-btn">모바일</span>
                    <span class="tag-btn">데이터</span><span class="tag-btn">데브옵스</span><span class="tag-btn">기획</span>
                    <span class="tag-btn">디자인</span><span class="tag-btn">취업</span><span class="tag-btn">커리어</span>
                    </div>
            </div>

            <div class="d-flex justify-content-between align-items-center mb-4">
                <span class="small fw-bold">이메일 수신동의</span>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" role="switch" checked>
                </div>
            </div>

            <div class="mb-4 border-top pt-3">
                <p class="small fw-bold mb-2">약관동의</p>
                <div class="form-check mb-2">
                    <input class="form-check-input" type="checkbox" id="allCheck">
                    <label class="form-check-label small" for="allCheck">전체동의 <span class="text-muted font-weight-normal">전체동의를 선택하시면 아래의 모든 약관에 동의하게 됩니다.</span></label>
                </div>
                <div class="form-check mb-1">
                    <input class="form-check-input" type="checkbox">
                    <label class="form-check-label small text-muted">통합 서비스 이용약관 <a href="#" class="text-decoration-none">보기</a></label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox">
                    <label class="form-check-label small text-muted">개인정보 처리방침 <a href="#" class="text-decoration-none">보기</a></label>
                </div>
            </div>

            <button type="submit" class="btn btn-primary btn-join w-100 mb-3">회원가입</button>
            
            <div class="small text-center">
                <span class="text-muted">이미 회원이신가요?</span>
                <a href="${pageContext.request.contextPath}/member/login" class="text-decoration-none text-primary fw-bold">로그인</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>