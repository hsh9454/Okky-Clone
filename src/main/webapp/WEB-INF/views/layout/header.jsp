<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<div
	class="d-flex align-items-center justify-content-between w-100 py-1">
	<div class="d-flex align-items-center">
		<a href="${pageContext.request.contextPath}/"
			class="text-primary fw-bolder fs-4 text-decoration-none me-4">OKKY</a>

		<div class="d-none d-lg-flex gap-3 ms-1">
			<a href="#" class="text-dark text-decoration-none fw-bold small">Q&amp;A</a>
			<a href="#" class="text-dark text-decoration-none fw-bold small">지식</a>
			<a href="${pageContext.request.contextPath}/board/list"
				class="text-dark text-decoration-none fw-bold small">커뮤니티</a> <a
				href="#"
				class="text-dark text-decoration-none fw-bold small text-danger">부트캠프</a>
			<a href="#" class="text-dark text-decoration-none fw-bold small">이벤트</a>
			<a href="#" class="text-dark text-decoration-none fw-bold small">칼럼</a>
			<a href="#" class="text-dark text-decoration-none fw-bold small">공지사항</a>
			<a href="#" class="text-dark text-decoration-none fw-bold small">채용정보</a>
		</div>
	</div>

	<div class="d-flex align-items-center gap-2">
		<input type="text"
			class="form-control form-control-sm bg-light border-0"
			placeholder="검색" style="width: 140px;">

		<c:choose>
			<c:when test="${empty sessionScope.user}">
				<a href="${pageContext.request.contextPath}/member/login"
					class="btn btn-sm btn-outline-secondary border-0 fw-bold">로그인</a>
				<a href="${pageContext.request.contextPath}/member/join"
					class="btn btn-sm btn-primary px-3 fw-bold shadow-sm">회원가입</a>
			</c:when>

			<c:otherwise>
    <div class="d-flex align-items-center gap-2">
        <div class="dropdown">
            <button class="btn btn-primary d-flex align-items-center px-3" 
                    type="button" id="writeMenu" data-bs-toggle="dropdown" aria-expanded="false" 
                    style="border-radius: 8px; height: 38px;">
                <i class="bi bi-plus-lg fw-bold"></i>
                <i class="bi bi-chevron-down small ms-1"></i>
            </button>
            <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2 p-2" aria-labelledby="writeMenu" style="min-width: 220px;">
                <li><div class="dropdown-header fw-bold text-dark mb-1">새글 쓰기</div></li>
                <li><hr class="dropdown-divider mx-2"></li>
                <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span style="flex-grow: 1;"><b class="text-dark">Q&A</b>에 글쓰기</span> <i class="bi bi-question-circle text-muted ms-3"></i></a></li>
                <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span style="flex-grow: 1;"><b class="text-dark">지식</b>에 글쓰기</span> <i class="bi bi-newspaper text-muted ms-3"></i></a></li>
                <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span style="flex-grow: 1;"><b class="text-dark">커뮤니티</b>에 글쓰기</span> <i class="bi bi-emoji-smile text-muted ms-3"></i></a></li>
                <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span class="text-muted small" style="flex-grow: 1;">피드백 요청</span> <i class="bi bi-chevron-right small text-muted ms-3"></i></a></li>
                <li><hr class="dropdown-divider mx-2"></li>
                <li><a class="dropdown-item d-flex align-items-center py-2" href="#"><span style="flex-grow: 1;"><b class="text-dark text-danger">이벤트</b>에 글쓰기</span> <i class="bi bi-fire text-danger ms-3"></i></a></li>
            </ul>
        </div>

        <a href="#" class="btn btn-white border text-secondary d-flex align-items-center justify-content-center shadow-sm" 
           style="width: 38px; height: 38px; border-radius: 8px; background-color: #fff;">
            <i class="bi bi-bookmark fs-5"></i>
        </a>

        <a href="#" class="btn btn-white border text-secondary d-flex align-items-center justify-content-center shadow-sm" 
           style="width: 38px; height: 38px; border-radius: 8px; background-color: #fff;">
            <i class="bi bi-bell fs-5"></i>
        </a>

        <div class="dropdown">
            <a href="#" class="d-flex align-items-center text-decoration-none" id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                <c:choose>
                    <c:when test="${not empty sessionScope.user.userImg}">
                        <img src="${pageContext.request.contextPath}/member/display?fileName=${sessionScope.user.userImg}" 
                             class="rounded-3 border shadow-sm" 
                             style="width: 38px; height: 38px; object-fit: cover;">
                    </c:when>
                    <c:otherwise>
                        <i class="bi bi-person-square fs-2 text-secondary"></i>
                    </c:otherwise>
                </c:choose>
            </a>
            <ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2" aria-labelledby="userDropdown" style="min-width: 180px;">
                <li><div class="dropdown-header fw-bold text-dark">${sessionScope.user.nickname}님</div></li>
                <li><hr class="dropdown-divider"></li>
                <li><a class="dropdown-item small py-2" href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
                <li>
                    <form action="${pageContext.request.contextPath}/member/logout" method="post" class="m-0 px-3 py-1">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <button type="submit" class="btn btn-link dropdown-item p-0 small text-danger fw-bold text-decoration-none" style="border:none; background:none;">로그아웃</button>
                    </form>
                </li>
            </ul>
        </div>
    </div>
</c:otherwise>
		</c:choose>
	</div>
</div>