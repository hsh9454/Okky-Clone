<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
.menu-col h6 a, .menu-col ul li a {
	white-space: nowrap;
}

.menu-col h6 {
	display: flex;
	align-items: center;
	justify-content: flex-start;
}

.menu-col h6 a {
	display: flex;
	align-items: center;
}

.okky-nav-group {
	position: relative;
	justify-content: flex-start !important;
}

.mega-dropdown-panel {
	display: none;
	position: absolute;
	top: 100%;
	left: 0;
	width: 100%;
	min-width: 1000px;
	background: white;
	padding: 20px;
	z-index: 2000;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
	border-top: 1px solid #0d6efd;
	pointer-events: none;
	opacity: 0;
	transition: opacity 0.2s;
}

.mega-dropdown-panel.show {
	display: block !important;
	pointer-events: auto;
	opacity: 1;
}

.nav-link:hover {
	color: #0d6efd !important;
}
</style>

<div class="d-flex align-items-center justify-content-between w-100 py-1 px-4">
	<div class="d-flex align-items-center" style="min-width: 200px;">
		<a href="/myFirstProject/" class="text-primary fw-bolder fs-4 text-decoration-none">OKKY</a>
	</div>

	<div class="d-none d-lg-flex gap-3 okky-nav-group ms-4 nav-item dropdown align-items-center flex-grow-1">
		<a href="/myFirstProject/board/list?group=qna" class="nav-link text-dark fw-bold small">Q&amp;A</a> 
		<a href="/myFirstProject/board/list?group=knowledge" class="nav-link text-dark fw-bold small">지식</a> 
		<a href="/myFirstProject/board/list?group=community" class="nav-link text-dark fw-bold small">커뮤니티</a> 
		<a href="/myFirstProject/board/list?group=event" class="nav-link text-dark fw-bold small">이벤트</a> 
		<a href="/myFirstProject/board/list?group=group" class="nav-link text-danger fw-bold small">부트캠프</a> 
		<a href="/myFirstProject/board/list?group=jobs" class="nav-link text-dark fw-bold small">Jobs</a> 
		<span style="color: #eee; font-size: 12px; margin: 0 5px;">|</span> 
		<a href="/myFirstProject/board/list?group=contact" class="nav-link text-dark fw-bold small">Contact</a>

		<div style="flex-grow: 1;"></div>

		<div class="mega-dropdown-panel shadow border-top">
			<div class="container-fluid d-flex py-4 px-5 justify-content-between text-start">
				<div class="menu-col">
					<h6 class="fw-bold mb-3">
						<a href="/myFirstProject/board/list?group=qna" class="text-decoration-none text-dark">Q&amp;A</a>
					</h6>
					<ul class="list-unstyled small">
						<li>
							<a href="/myFirstProject/board/list?category=11" class="dropdown-item d-flex align-items-center justify-content-between"> <span>기술</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 11 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=12" class="dropdown-item d-flex align-items-center justify-content-between"> <span>커리어</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 12 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=13" class="dropdown-item d-flex align-items-center justify-content-between"> <span>기타</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 13 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
					</ul>
				</div>

				<div class="menu-col">
					<h6 class="fw-bold mb-3">
						<a href="/myFirstProject/board/list?group=knowledge" class="text-decoration-none text-dark">지식</a>
					</h6>
					<ul class="list-unstyled small">
						<li>
							<a href="/myFirstProject/board/list?category=21" class="dropdown-item d-flex align-items-center justify-content-between"> <span>Tech 뉴스</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 21 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=22" class="dropdown-item d-flex align-items-center justify-content-between"> <span>팁</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 22 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=23" class="dropdown-item d-flex align-items-center justify-content-between"> <span>칼럼</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 23 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=24" class="dropdown-item d-flex align-items-center justify-content-between"> <span>리뷰</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 24 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=25" class="dropdown-item d-flex align-items-center justify-content-between"> <span>IT보도자료</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 25 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
					</ul>
				</div>
				<div class="menu-col" style="min-width: 150px;">
					<h6 class="fw-bold mb-3">
						<a href="/myFirstProject/board/list?group=community" class="text-decoration-none text-dark">커뮤니티</a>
					</h6>
					<ul class="list-unstyled small mb-4">
						<li>
							<a href="/myFirstProject/board/list?category=31" class="dropdown-item d-flex align-items-center justify-content-between"> <span>사는얘기</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 31 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=32" class="dropdown-item d-flex align-items-center justify-content-between"> <span>AI</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 32 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=33" class="dropdown-item d-flex align-items-center justify-content-between"> <span>연봉·단가</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 33 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=34" class="dropdown-item d-flex align-items-center justify-content-between"> <span>취준생</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 34 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=35" class="dropdown-item d-flex align-items-center justify-content-between"> <span>IT 정책토론</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 35 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=36" class="dropdown-item d-flex align-items-center justify-content-between"> <span>피드백</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 36 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
					</ul>

					<h6 class="fw-bold mb-3">
						<a href="/myFirstProject/board/list?group=group" class="text-decoration-none text-dark">모임</a>
					</h6>
					<ul class="list-unstyled small">
						<li>
							<a href="/myFirstProject/board/list?category=51" class="dropdown-item d-flex align-items-center justify-content-between"> <span>스터디</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 51 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=52" class="dropdown-item d-flex align-items-center justify-content-between"> <span>프로젝트</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 52 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=53" class="dropdown-item d-flex align-items-center justify-content-between"> <span>모각코·모각공</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 53 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=54" class="dropdown-item d-flex align-items-center justify-content-between"> <span>멘토링·튜터링</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 54 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=55" class="dropdown-item d-flex align-items-center justify-content-between"> <span>모임·네트워킹</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 55 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=56" class="dropdown-item d-flex align-items-center justify-content-between"> <span>공모전·해커톤</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 56 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
					</ul>
				</div>

				<div class="menu-col">
					<h6 class="fw-bold mb-3">
						<a href="/myFirstProject/board/list?group=event" class="text-decoration-none text-dark">이벤트</a>
					</h6>
					<ul class="list-unstyled small">
						<li>
							<a href="/myFirstProject/board/list?category=41" class="dropdown-item d-flex align-items-center justify-content-between"> <span>IT 행사</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 41 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=42" class="dropdown-item d-flex align-items-center justify-content-between"> <span>홍보·광고</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 42 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
					</ul>
				</div>

				<div class="menu-col">
					<h6 class="fw-bold mb-3 text-orange">
						<i class="bi bi-mortarboard-fill me-1"></i> <a href="/myFirstProject/board/list?group=education" class="text-decoration-none text-orange">부트캠프</a>
					</h6>
					<ul class="list-unstyled small">
						<li>
							<a href="/myFirstProject/board/list?category=61" class="dropdown-item d-flex align-items-center justify-content-between"> <span>교육과정</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 61 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
					</ul>
				</div>

				<div class="menu-col">
					<h6 class="fw-bold mb-3 text-purple d-flex align-items-center">
						<i class="bi bi-rocket-takeoff-fill me-1"></i> <a href="/myFirstProject/board/list?group=jobs" class="text-decoration-none text-purple">OKKY JOBS</a> <i class="bi bi-box-arrow-up-right small ms-1"></i>
					</h6>
					<ul class="list-unstyled small">
						<li>
							<a href="/myFirstProject/board/list?category=71" class="dropdown-item d-flex align-items-center justify-content-between"> <span>계약직</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 71 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=72" class="dropdown-item d-flex align-items-center justify-content-between"> <span>정규직</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 72 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=73" class="dropdown-item d-flex align-items-center justify-content-between"> <span>Talent</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 73 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=74" class="dropdown-item d-flex align-items-center justify-content-between"> <span>좋은회사/나쁜회사</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 74 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
					</ul>
				</div>
				<div class="menu-col">
					<h6 class="fw-bold mb-3">
						<a href="/myFirstProject/board/list?group=contact" class="text-decoration-none text-dark">Contact</a>
					</h6>
					<ul class="list-unstyled small">
						<li>
							<a href="/myFirstProject/board/list?category=81" class="dropdown-item d-flex align-items-center justify-content-between"> <span>공지사항</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 81 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=82" class="dropdown-item d-flex align-items-center justify-content-between"> <span>Releases</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 82 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=83" class="dropdown-item d-flex align-items-center justify-content-between"> <span>버그 및 제안</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 83 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=84" class="dropdown-item d-flex align-items-center justify-content-between"> <span>게시판 생성 요청</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 84 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
						<li>
							<a href="/myFirstProject/board/list?category=85" class="dropdown-item d-flex align-items-center justify-content-between"> <span>OKKY 행사</span> <c:forEach items="${headerMenuData}" var="board">
									<c:if test="${board.cat_id == 85 && board.isNew}">
										<span class="badge" style="background-color: #e3f2fd; color: #0d6efd; font-size: 0.6rem; padding: 0.2rem 0.4rem; border-radius: 4px;">신규</span>
									</c:if>
								</c:forEach>
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>

		<div class="d-flex align-items-center gap-2" style="min-width: 200px; justify-content: flex-end;">
			<form action="/myFirstProject/board/list" method="get" class="d-flex align-items-center">
				<input type="text" name="keyword" class="form-control form-control-sm me-2" placeholder="검색" value='<c:out value="${pageMaker.cri.keyword}"/>'> <input type="hidden" name="type" value="TC">
				<input type="hidden" name="amount" value="10">
			</form>

			<c:choose>
				<c:when test="${empty sessionScope.user}">
					<a href="/myFirstProject/member/login" class="btn btn-sm btn-outline-secondary border-0 fw-bold">로그인</a>
					<a href="/myFirstProject/member/join" class="btn btn-sm btn-primary px-3 fw-bold shadow-sm">회원가입</a>
				</c:when>
				<c:otherwise>
					<div class="d-flex align-items-center gap-2">
						<div class="dropdown">
							<button class="btn btn-primary d-flex align-items-center px-3" type="button" id="writeMenu" data-bs-toggle="dropdown" style="border-radius: 8px; height: 38px;">
								<i class="bi bi-plus-lg fw-bold"></i><i class="bi bi-chevron-down small ms-1"></i>
							</button>
							<ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2 p-2" style="min-width: 220px;">
								<li>
									<div class="dropdown-header fw-bold text-dark mb-1">새글 쓰기</div>
								</li>
								<li>
									<hr class="dropdown-divider mx-2">
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center py-2" href="/myFirstProject/board/write?group=qna"> <span style="flex-grow: 1;"><b class="text-dark">Q&amp;A</b>에
											글쓰기</span> <i class="bi bi-question-circle text-muted ms-3"></i>
									</a>
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center py-2" href="/myFirstProject/board/write?group=knowledge"> <span style="flex-grow: 1;"><b class="text-dark">지식</b>에
											글쓰기</span> <i class="bi bi-newspaper text-muted ms-3"></i>
									</a>
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center py-2" href="/myFirstProject/board/write?group=community"> <span style="flex-grow: 1;"><b class="text-dark">커뮤니티</b>에
											글쓰기</span> <i class="bi bi-emoji-smile text-muted ms-3"></i>
									</a>
								</li>
								<li>
									<hr class="dropdown-divider mx-2">
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center py-2" href="/myFirstProject/board/write?group=event"> <span style="flex-grow: 1;"><b
											class="text-dark text-danger">이벤트</b>에 글쓰기</span> <i class="bi bi-fire text-danger ms-3"></i>
									</a>
								</li>
							</ul>
						</div>
						<a href="/myFirstProject/member/activity" class="btn btn-white border text-secondary d-flex align-items-center justify-content-center shadow-sm"
							style="width: 38px; height: 38px; border-radius: 8px; background-color: #fff;"><i class="bi bi-bookmark fs-5"></i></a>  
						<a href="/myFirstProject/member/mypage#activity"
							class="btn btn-white border text-secondary d-flex align-items-center justify-content-center shadow-sm" style="width: 38px; height: 38px; border-radius: 8px; background-color: #fff;"><i
							class="bi bi-bell fs-5"></i></a>

						<div class="dropdown">
							<a href="#" class="d-flex align-items-center text-decoration-none" id="userDropdown" data-bs-toggle="dropdown"> <c:choose>
									<c:when test="${not empty sessionScope.user.userImg}">
										<img src="/myFirstProject/member/display?fileName=${sessionScope.user.userImg}" class="rounded-2 border shadow-sm" style="width: 38px; height: 38px; object-fit: cover;">
									</c:when>
									<c:otherwise>
										<i class="bi bi-person-square fs-2 text-secondary"></i>
									</c:otherwise>
								</c:choose>
							</a>
							<ul class="dropdown-menu dropdown-menu-end shadow border-0 mt-2 p-3" aria-labelledby="userDropdown" style="min-width: 240px; border-radius: 12px;">
								<li>
									<div class="dropdown-header fw-bold text-dark fs-5 p-0 mb-1">${sessionScope.user.nickname}</div>
								</li>
								<li>
									<div class="text-muted small mb-3">내 계정</div>
								</li>

								<li>
									<a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="/myFirstProject/member/mypage"> <span>프로필</span> <i
										class="bi bi-person text-muted"></i></a>
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#"> <span>계정 관리</span> <i class="bi bi-gear text-muted"></i></a>
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="/myFirstProject/member/mypage"> <span>마이페이지</span> <i
										class="bi bi-arrow-repeat text-muted"></i></a>
								</li>

								<li>
									<hr class="dropdown-divider my-3">
								</li>
								<li>
									<div class="text-muted small mb-2">Jobs</div>
								</li>

								<li>
									<a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#"> <span>이력서 관리</span> <i class="bi bi-file-earmark-text text-muted"></i></a>
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#"> <span>구직 내역 관리</span> <i class="bi bi-briefcase text-muted"></i></a>
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#"> <span>관심 포지션</span> <i class="bi bi-bookmark text-muted"></i></a>
								</li>
								<li>
									<a class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0" href="#"> <span>포지션 지원이력</span> <i class="bi bi-card-list text-muted"></i></a>
								</li>

								<li>
									<hr class="dropdown-divider my-3">
								</li>
								<li>
									<form action="/myFirstProject/member/logout" method="post" class="m-0 p-0">
										<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
										<button type="submit" class="dropdown-item d-flex align-items-center justify-content-between py-2 px-0 text-danger fw-bold" style="border: none; background: none; width: 100%;">
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
</div>


<script>
	$(document).ready(function() {
		let timer;
		const $panel = $('.mega-dropdown-panel');
		const $mainNavLinks = $('.okky-nav-group > a.nav-link');
		const fadeOutDelay = 300;

		$mainNavLinks.add($panel).hover(function() {
			clearTimeout(timer);
			$panel.addClass('show');
		}, function() {
			timer = setTimeout(function() {
				$panel.removeClass('show');
			}, fadeOutDelay);
		});
	});
</script>