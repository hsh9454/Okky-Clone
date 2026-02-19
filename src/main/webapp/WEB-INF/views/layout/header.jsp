<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
				<div class="dropdown">
					<a href="#"
						class="d-flex align-items-center text-dark text-decoration-none dropdown-toggle small fw-bold"
						id="userDropdown" data-bs-toggle="dropdown" aria-expanded="false">

						<c:if test="${not empty sessionScope.user.userImg}">
							<img
								src="${pageContext.request.contextPath}/member/display?fileName=${sessionScope.user.userImg}"
								class="rounded-circle me-2"
								style="width: 28px; height: 28px; object-fit: cover;">
						</c:if> ${sessionScope.user.nickname}님
					</a>

					<ul class="dropdown-menu dropdown-menu-end shadow-sm border"
						aria-labelledby="userDropdown">
						<li><a class="dropdown-item small"
							href="${pageContext.request.contextPath}/member/mypage">프로필</a></li>
						<li><a class="dropdown-item small"
							href="${pageContext.request.contextPath}/member/mypage">마이페이지</a></li>
						<li><hr class="dropdown-divider"></li>
						<li>
							<form action="${pageContext.request.contextPath}/member/logout"
								method="post" class="px-3 py-1 m-0">
								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit"
									class="btn btn-sm btn-link text-danger text-decoration-none p-0 small fw-bold">로그아웃</button>
							</form>
						</li>
					</ul>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>