<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<div class="d-flex align-items-center justify-content-between w-100 py-1 px-4">
    <div class="d-flex align-items-center" style="min-width: 200px;"> 
        <a href="${pageContext.request.contextPath}/"
            class="text-primary fw-bolder fs-4 text-decoration-none">OKKY</a>
    </div>

    <div class="d-none d-lg-flex gap-4 okky-nav-group mx-auto"> 
        <a href="#" class="nav-link text-dark fw-bold small">Q&A</a>
        <a href="#" class="nav-link text-dark fw-bold small">지식</a>
        <a href="${pageContext.request.contextPath}/board/list" class="nav-link text-dark fw-bold small">커뮤니티</a>
        <a href="#" class="nav-link text-dark fw-bold small">이벤트</a>
        <a href="#" class="nav-link text-danger fw-bold small">부트캠프</a>
        <a href="#" class="nav-link text-dark fw-bold small">Jobs</a>
        <a href="#" class="nav-link text-dark fw-bold small">Contact</a>

        <div class="mega-dropdown-panel shadow border-top">
            <div class="container-fluid d-flex py-4 px-5 justify-content-between text-start">
                <div class="menu-col">
                    <h6 class="fw-bold mb-3">Q&A</h6>
                    <ul class="list-unstyled small">
                        <li><a href="/board/list?category=tech" class="dropdown-item">기술</a></li>
                        <li><a href="/board/list?category=career" class="dropdown-item">커리어</a></li>
                        <li><a href="/board/list?category=etc" class="dropdown-item">기타</a></li>
                    </ul>
                </div>
                <div class="menu-col">
                    <h6 class="fw-bold mb-3">지식</h6>
                    <ul class="list-unstyled small">
                        <li><a href="#" class="dropdown-item">Tech 뉴스</a></li>
                        <li><a href="#" class="dropdown-item">팁</a></li>
                        <li><a href="#" class="dropdown-item">칼럼</a></li>
                        <li><a href="#" class="dropdown-item">리뷰</a></li>
                        <li><a href="#" class="dropdown-item">IT보도자료</a></li>
                    </ul>
                </div>
                <div class="menu-col" style="min-width: 150px;">
                    <h6 class="fw-bold mb-3">커뮤니티</h6>
                    <ul class="list-unstyled small mb-4">
                        <li><a href="#" class="dropdown-item">사는얘기</a></li>
                        <li><a href="#" class="dropdown-item">AI</a></li>
                        <li><a href="#" class="dropdown-item">연봉·단가</a></li>
                        <li><a href="#" class="dropdown-item">취준생</a></li>
                        <li><a href="#" class="dropdown-item">IT 정책토론</a></li>
                        <li><a href="#" class="dropdown-item">피드백</a></li>
                    </ul>
                    <h6 class="fw-bold mb-3">모임</h6>
                    <ul class="list-unstyled small">
                        <li><a href="#" class="dropdown-item">스터디</a></li>
                        <li><a href="#" class="dropdown-item">프로젝트</a></li>
                        <li><a href="#" class="dropdown-item">모각코·모각공</a></li>
                    </ul>
                </div>
                <div class="menu-col">
                    <h6 class="fw-bold mb-3">이벤트</h6>
                    <ul class="list-unstyled small">
                        <li><a href="#" class="dropdown-item">IT 행사</a></li>
                        <li><a href="#" class="dropdown-item">홍보·광고</a></li>
                    </ul>
                </div>
                <div class="menu-col">
                    <h6 class="fw-bold mb-3 text-orange"><i class="bi bi-mortarboard-fill me-1"></i>부트캠프</h6>
                    <ul class="list-unstyled small">
                        <li><a href="#" class="dropdown-item">교육과정</a></li>
                    </ul>
                </div>
                <div class="menu-col">
                    <h6 class="fw-bold mb-3 text-purple">OKKY JOBS <i class="bi bi-box-arrow-up-right small"></i></h6>
                    <ul class="list-unstyled small">
                        <li><a href="#" class="dropdown-item">계약직</a></li>
                        <li><a href="#" class="dropdown-item">정규직</a></li>
                        <li><a href="#" class="dropdown-item">Talent</a></li>
                        <li><a href="#" class="dropdown-item">좋은회사/나쁜회사</a></li>
                    </ul>
                </div>
                <div class="menu-col">
                    <h6 class="fw-bold mb-3">Contact</h6>
                    <ul class="list-unstyled small">
                        <li><a href="#" class="dropdown-item">Releases</a></li>
                        <li><a href="#" class="dropdown-item">버그 및 제안</a></li>
                        <li><a href="#" class="dropdown-item">게시판 생성 요청</a></li>
                        <li><a href="#" class="dropdown-item">공지사항</a></li>
                        <li><a href="#" class="dropdown-item">OKKY 행사</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center gap-2" style="min-width: 200px; justify-content: flex-end;">
        <input type="text" class="form-control form-control-sm bg-light border-0" 
               placeholder="검색" style="width: 140px;">

        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <a href="${pageContext.request.contextPath}/member/login" class="btn btn-sm btn-outline-secondary border-0 fw-bold">로그인</a>
                <a href="${pageContext.request.contextPath}/member/join" class="btn btn-sm btn-primary px-3 fw-bold shadow-sm">회원가입</a>
            </c:when>
            <c:otherwise>
                <div class="d-flex align-items-center gap-2">
                    <div class="dropdown">
                        <button class="btn btn-primary d-flex align-items-center px-3" type="button" id="writeMenu" data-bs-toggle="dropdown" style="border-radius: 8px; height: 38px;">
                            <i class="bi bi-plus-lg fw-bold"></i><i class="bi bi-chevron-down small ms-1"></i>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2 p-2" style="min-width: 220px;">
                            <li><div class="dropdown-header fw-bold text-dark mb-1">새글 쓰기</div></li>
                            <li><hr class="dropdown-divider mx-2"></li>
                            <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span style="flex-grow: 1;"><b class="text-dark">Q&A</b>에 글쓰기</span> <i class="bi bi-question-circle text-muted ms-3"></i></a></li>
                            <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span style="flex-grow: 1;"><b class="text-dark">지식</b>에 글쓰기</span> <i class="bi bi-newspaper text-muted ms-3"></i></a></li>
                            <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span style="flex-grow: 1;"><b class="text-dark">커뮤니티</b>에 글쓰기</span> <i class="bi bi-emoji-smile text-muted ms-3"></i></a></li>
                            <li><hr class="dropdown-divider mx-2"></li>
                            <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span style="flex-grow: 1;"><b class="text-dark text-danger">이벤트</b>에 글쓰기</span> <i class="bi bi-fire text-danger ms-3"></i></a></li>
                        </ul>
                    </div>
                    <a href="#" class="btn btn-white border text-secondary d-flex align-items-center justify-content-center shadow-sm" style="width: 38px; height: 38px; border-radius: 8px; background-color: #fff;"><i class="bi bi-bookmark fs-5"></i></a>
                    <a href="#" class="btn btn-white border text-secondary d-flex align-items-center justify-content-center shadow-sm" style="width: 38px; height: 38px; border-radius: 8px; background-color: #fff;"><i class="bi bi-bell fs-5"></i></a>
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center text-decoration-none" id="userDropdown" data-bs-toggle="dropdown">
                            <c:choose>
                                <c:when test="${not empty sessionScope.user.userImg}">
                                    <img src="${pageContext.request.contextPath}/member/display?fileName=${sessionScope.user.userImg}" class="rounded-2 border shadow-sm" style="width: 38px; height: 38px; object-fit: cover;">
                                </c:when>
                                <c:otherwise><i class="bi bi-person-square fs-2 text-secondary"></i></c:otherwise>
                            </c:choose>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2 p-3" aria-labelledby="userDropdown" style="min-width: 240px; border-radius: 12px;">
                <li><div class="dropdown-header fw-bold text-dark fs-5 p-0 mb-1">${sessionScope.user.nickname}</div></li>
                <li><div class="text-muted small mb-3">내 계정</div></li>
                
                <li><a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="${pageContext.request.contextPath}/member/mypage">
                    <span>프로필</span> <i class="bi bi-person text-muted"></i></a></li>
                <li><a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#">
                    <span>계정 관리</span> <i class="bi bi-gear text-muted"></i></a></li>
                <li><a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="${pageContext.request.contextPath}/member/mypage">
                    <span>마이페이지</span> <i class="bi bi-arrow-repeat text-muted"></i></a></li>
                
                <li><hr class="dropdown-divider my-3"></li>
                <li><div class="text-muted small mb-2">Jobs</div></li>
                
                <li><a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#">
                    <span>이력서 관리</span> <i class="bi bi-file-earmark-text text-muted"></i></a></li>
                <li><a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#">
                    <span>구직 내역 관리</span> <i class="bi bi-briefcase text-muted"></i></a></li>
                <li><a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#">
                    <span>관심 포지션</span> <i class="bi bi-bookmark text-muted"></i></a></li>
                <li><a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#">
                    <span>포지션 지원이력</span> <i class="bi bi-card-list text-muted"></i></a></li>
                
                <li><hr class="dropdown-divider my-3"></li>
                <li>
                    <form action="${pageContext.request.contextPath}/member/logout" method="post" class="m-0 p-0">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0 text-danger fw-bold" style="border:none; background:none; width:100%;">
                            <span>로그아웃</span> <i class="bi bi-box-arrow-right"></i>
                        </button>
                    </form>
                </li>
            </ul>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</div>