<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>계정 관리 - OKKY</title>
    
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        #page-root-wrapper {
            display: block !important; 
            width: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            background-color: #f9fafb !important; 
            min-height: 100vh;
        }

        .top-header-section {
            display: block !important;
            width: 100% !important;
            background: #fff;
            position: relative;
            z-index: 3000; 
            border-bottom: 1px solid #e5e7eb;
            float: none !important; 
        }

        .main-body-section {
            display: flex !important;
            width: 100% !important;
            justify-content: center !important;
            padding: 40px 0 !important;
            clear: both !important; 
        }

        .mypage-card {
            display: flex;
            width: 1200px;
            background: #fff;
            border: 1px solid #e5e7eb;
            border-radius: 8px; 
            min-height: 700px;
            overflow: visible !important;
            box-shadow: 0 1px 2px rgba(0,0,0,0.05); 
        }

        .mypage-sidebar { width: 260px; background-color: #f9fafb; border-right: 1px solid #e5e7eb; padding: 32px 0; flex-shrink: 0; }
        .mypage-body { flex: 1; padding: 48px 64px; } 
        
        .nav-group-title { font-size: 11px; font-weight: 800; color: #9ca3af; padding: 0 25px; margin-bottom: 16px; text-transform: uppercase; letter-spacing: 0.5px; }
        .nav-menu-item { display: flex; align-items: center; padding: 12px 25px; color: #4b5563; text-decoration: none; font-size: 14px; gap: 12px; font-weight: 500; }
        .nav-menu-item:hover { background-color: #f3f4f6; color: #111827; }
        
        .nav-menu-item.active { 
            background-color: #f3f4f6; 
            color: #111827; 
            font-weight: 700; 
            border-right: 3px solid #111827; 
        }

        .section-title { font-size: 18px; font-weight: 700; margin-bottom: 24px; color: #111827; }
        .info-row { padding-bottom: 40px; margin-bottom: 40px; border-bottom: 1px solid #f3f4f6; }
        
        .okky-input-readonly { 
            width: 100%; 
            max-width: 400px; 
            padding: 12px 14px; 
            border: 1px solid #d1d5db; 
            border-radius: 6px; 
            background-color: #f9fafb; 
            color: #6b7280; 
            font-size: 14px;
        }

        .btn-red { background-color: #eb2027; color: #fff; border: none; padding: 10px 20px; border-radius: 6px; font-weight: 700; cursor: pointer; font-size: 14px; }
        
        .social-item { display: flex; justify-content: space-between; align-items: center; padding: 14px 0; max-width: 500px; border-bottom: 1px solid #f9fafb; }
        .social-info { display: flex; align-items: center; gap: 12px; font-size: 15px; font-weight: 500; }
        .btn-outline-gray { border: 1px solid #d1d5db; background: #fff; color: #4b5563; padding: 8px 16px; border-radius: 6px; font-size: 13px; font-weight: 600; }
        
        .info-alert-box {
            display: flex;
            gap: 12px;
            background-color: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 16px;
            margin-top: 16px;
            line-height: 1.5;
        }
    </style>
</head>
<body>
    <div id="page-root-wrapper">
        <header class="top-header-section">
            <jsp:include page="../layout/header.jsp" />
        </header>

        <div class="main-body-section">
            <div class="mypage-card">
                <aside class="mypage-sidebar">
                    <div class="nav-group-title">내 계정</div>
                    <a href="${pageContext.request.contextPath}/member/mypage" class="nav-menu-item">
                        <i class="bi bi-person"></i> 프로필
                    </a>
                    <a href="${pageContext.request.contextPath}/member/account" class="nav-menu-item active">
                        <i class="bi bi-gear"></i> 계정 관리
                    </a>
                    
                    <div class="nav-group-title mt-4">Jobs</div>
                    <a href="#" class="nav-menu-item"><i class="bi bi-file-earmark-text"></i> 이력서 관리</a>
                    <a href="#" class="nav-menu-item"><i class="bi bi-briefcase"></i> 구직 내역 관리</a>
                    <a href="#" class="nav-menu-item"><i class="bi bi-bookmark"></i> 관심 포지션</a>
                </aside>

                <main class="mypage-body">
                    <div class="info-row">
                        <div class="d-flex justify-content-between align-items-center">
                            <h2 class="section-title mb-0">비밀번호</h2>
                            <button type="button" class="btn-red"><i class="bi bi-lock-fill"></i> 비밀번호 변경</button>
                        </div>
                        <p class="text-muted small mt-2">안전한 계정 사용을 위해 비밀번호를 주기적으로 변경해주세요.</p>
                    </div>

                    <div class="info-row">
                        <h2 class="section-title">이메일 정보</h2>
                        <div class="d-flex gap-2 mb-1">
                            <input type="text" class="okky-input-readonly" 
                                   value="<sec:authentication property='principal.username'/>" readonly>
                            <button type="button" class="btn btn-outline-secondary px-3" style="font-size:14px;" disabled>이메일 인증</button>
                        </div>
                        <div class="info-alert-box">
                            <i class="bi bi-info-circle-fill text-primary" style="font-size: 16px;"></i>
                            <div class="small text-muted">
                                이메일 변경은 변경할 이메일로 인증 요청 메일이 발송되며 해당 이메일을 통해 인증을 완료한 후 최종적으로 변경됩니다.
                            </div>
                        </div>
                    </div>

                    <div class="info-row">
                        <h2 class="section-title">소셜계정 연동</h2>
                        <p class="text-muted small mb-4">사용하시는 소셜 로그인 계정들과 계정을 연동하고 손쉽게 로그인하세요.</p>
                        
                        <div class="social-list">
                            <div class="social-item">
                                <div class="social-info"><i class="bi bi-github fs-5"></i> 깃허브 연동하기</div>
                                <button class="btn-outline-gray">연동하기</button>
                            </div>
                            <div class="social-item">
                                <div class="social-info"><i class="bi bi-google fs-5 text-danger"></i> 구글 연동하기</div>
                                <button class="btn-outline-gray">연동하기</button>
                            </div>
                            <div class="social-item">
                                <div class="social-info"><i class="bi bi-chat-fill fs-5 text-warning"></i> 카카오 연동하기</div>
                                <button class="btn-outline-gray">연동하기</button>
                            </div>
                        </div>
                    </div>

                    <div class="info-row" style="border:none;">
                        <h2 class="section-title">계정삭제</h2>
                        <div class="p-4 border rounded-3 bg-light mb-3 small text-muted" style="line-height: 1.8;">
                            회원 탈퇴(아이디 삭제) 시 귀하의 개인 정보는 <strong>개인정보 처리방침</strong>에 따라 60일간 보관되며, 이후에는 완전히 삭제되어 복구할 수 없게 됩니다. 작성한 게시물은 삭제되지 않으며 익명 처리 후 소유권이 귀속됩니다.
                        </div>
                        <div class="d-flex justify-content-between align-items-center">
                            <label class="small text-muted" style="cursor:pointer;">
                                <input type="checkbox" class="form-check-input me-2"> 정책에 동의합니다.
                            </label>
                            <button type="button" class="btn btn-danger btn-sm px-4 py-2 fw-bold" style="background-color: #fa5252; border:none; border-radius: 6px;">회원탈퇴</button>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="passwordModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow">
            <div class="modal-header border-bottom-0 pt-4 px-4">
                <h5 class="modal-title fw-bold">비밀번호 변경</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body px-4">
                <p class="text-muted small mb-4">안전한 계정 사용을 위해 현재 비밀번호를 확인한 후 새 비밀번호를 입력해주세요.</p>
                <div class="mb-3">
                    <label class="form-label small fw-bold">현재 비밀번호</label>
                    <input type="password" id="currentPwd" class="form-control py-2" placeholder="현재 비밀번호를 입력하세요">
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-bold">새 비밀번호</label>
                    <input type="password" id="newPwd" class="form-control py-2" placeholder="8자 이상 입력하세요">
                </div>
                <div class="mb-4">
                    <label class="form-label small fw-bold">새 비밀번호 확인</label>
                    <input type="password" id="confirmPwd" class="form-control py-2" placeholder="다시 한번 입력하세요">
                </div>
            </div>
            <div class="modal-footer border-top-0 pb-4 px-4">
                <button type="button" class="btn btn-light fw-bold px-4" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-danger fw-bold px-4" onclick="updatePassword()">변경하기</button>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
    $('.btn-red').on('click', function() {
        $('#passwordModal').modal('show');
    });

    const $deleteAgree = $('.form-check-input'); 
    const $deleteBtn = $('.btn-danger.btn-sm'); 

    $deleteBtn.prop('disabled', true).css('opacity', '0.5').css('cursor', 'not-allowed');

    $deleteAgree.on('change', function() {
        if ($(this).is(':checked')) {
            $deleteBtn.prop('disabled', false).css('opacity', '1').css('cursor', 'pointer');
        } else {
            $deleteBtn.prop('disabled', true).css('opacity', '0.5').css('cursor', 'not-allowed');
        }
    });

    $deleteBtn.on('click', function() {
        if (confirm("정말로 탈퇴하시겠습니까? 탈퇴 후 60일간 재가입이 불가능할 수 있습니다.")) {
            location.href = "${pageContext.request.contextPath}/member/leave";
        }
    });
});

function updatePassword() {
    const currentPassword = $('#currentPwd').val();
    const newPassword = $('#newPwd').val();
    const confirmPwd = $('#confirmPwd').val();

    if (!currentPassword || !newPassword || !confirmPwd) {
        alert("모든 필드를 입력해주세요.");
        return;
    }

    if (newPassword !== confirmPwd) {
        alert("새 비밀번호가 일치하지 않습니다.");
        return;
    }

    const data = {
        currentPw: currentPassword, 
        newPw: newPassword         
    };

    $.ajax({
        type: "POST",
        url: "${pageContext.request.contextPath}/member/modifyPw", 
        data: data,
        success: function(response) {
            if(response === "success") {
                alert("비밀번호가 성공적으로 변경되었습니다.");
                $('#passwordModal').modal('hide');
                $('#currentPwd, #newPwd, #confirmPwd').val('');
            } else {
                alert("현재 비밀번호가 일치하지 않습니다.");
            }
        },
        error: function(xhr) {
            alert("비밀번호 변경에 실패했습니다. 다시 시도해주세요.");
        }
    });
}
</script>
</body>
</html>