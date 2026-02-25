<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
#viewModeBtn {
	position: relative;
}

#viewModeBtn::after {
	content: attr(data-tooltip);
	position: absolute;
	bottom: 125%;
	right: 0;
	white-space: nowrap;
	background-color: #1a1a1b;
	color: #ffffff;
	padding: 6px 12px;
	border-radius: 6px;
	font-size: 12px;
	font-weight: 500;
	z-index: 100;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
	pointer-events: none;
}

#viewModeBtn::before {
	content: "";
	position: absolute;
	bottom: 110%;
	right: 15px;
	border-width: 6px;
	border-style: solid;
	border-color: #1a1a1b transparent transparent transparent;
	z-index: 100;
}

#boardContainer.list-mode .post-item {
	display: flex !important;
	align-items: center !important;
	justify-content: space-between !important;
	padding: 12px 20px !important;
	gap: 15px !important;
}

#boardContainer.list-mode .post-item:hover {
	background-color: #f8f9fa !important;
	transition: background-color 0.2s ease;
}

.post-right-info-area {
	display: none !important;
}

#boardContainer.list-mode .post-right-info-area {
	display: flex !important;
	align-items: center !important;
	gap: 15px !important;
}

#boardContainer.list-mode .card-only-elements {
	display: none !important;
}

#boardContainer.list-mode .main-title-text {
	margin-bottom: 0 !important;
	font-size: 14px !important;
}

#boardContainer.list-mode .post-item h6 {
	font-weight: 700 !important;
	color: #333;
	font-size: 15px;
}

#boardContainer.list-mode .card-only-elements {
	display: none !important;
}

.badge-n {
	display: inline-flex !important;
	align-items: center;
	justify-content: center;
	width: 18px !important;
	height: 18px !important;
	background-color: #f8d7da !important;
	color: #dc3545 !important;
	font-size: 10px !important;
	font-weight: bold !important;
	border-radius: 50% !important;
	margin: 0 4px !important;
	vertical-align: middle !important;
	line-height: 1 !important;
}

.text-truncate-2 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.custom-dot-indicators {
	bottom: -45px !important;
}

.custom-dot-indicators button {
	width: 8px !important;
	height: 8px !important;
	border-radius: 50% !important;
	background-color: #dee2e6 !important;
	border: none !important;
	margin: 0 4px !important;
	opacity: 1 !important;
	transition: background-color 0.3s ease;
}

.custom-dot-indicators button.active {
	background-color: #0d6efd !important;
}

.tech-overlap-btn {
	width: 45px !important;
	opacity: 1 !important;
}

.carousel-control-prev.tech-overlap-btn {
	left: -22px;
}

.carousel-control-next.tech-overlap-btn {
	right: -22px;
}

.btn-round {
	width: 40px;
	height: 40px;
	background: white;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	border: 1px solid #eee;
	color: #333;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.no-scrollbar::-webkit-scrollbar {
	display: none;
}

.no-scrollbar {
	-ms-overflow-style: none;
	scrollbar-width: none;
}

.filter-bar-container {
	display: flex;
	align-items: center;
	gap: 10px;
	background-color: #f8f9fa;
	border-radius: 12px;
	padding: 10px 15px;
	border: 1px solid #eee;
}

.filter-tab {
	text-decoration: none;
	color: #666;
	font-size: 14px;
	white-space: nowrap;
	padding: 8px 16px;
	border-radius: 8px;
	transition: all 0.2s ease;
}

.filter-tab.active {
	background-color: #fff !important;
	color: #0d6efd !important;
	font-weight: bold;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.more-view-link {
	color: #666 !important;
	font-size: 15px;
	font-weight: 500;
	text-decoration: none;
	transition: all 0.2s;
}

.more-view-link:hover {
	text-decoration: underline !important;
	color: #333 !important;
}

.btn-light.text-muted {
	background-color: #f8f9fa;
	font-size: 13px;
	border-radius: 6px;
}

.btn-light.text-muted:hover {
	background-color: #e9ecef;
}
</style>

<div class="container-fluid mt-4">
	<div class="rounded-3 mb-4 overflow-hidden shadow-sm"
		style="height: 160px; background: linear-gradient(90deg, #0d6efd, #000);">
		<div
			class="d-flex flex-column align-items-center justify-content-center h-100 text-white text-center">
			<h3 class="fw-bold mb-1">Find BUIDLer</h3>
			<p class="mb-0 opacity-75">2026 한화투자증권 디지털/글로벌 경력 채용</p>
		</div>
	</div>

	<ul class="nav nav-pills p-1"
		style="background-color: #f1f3f5; border-radius: 12px; display: inline-flex;">
		<li class="nav-item"><a
			class="nav-link ${currentType == 'daily' || currentType == null ? 'active shadow-sm' : 'text-muted'}"
			href="javascript:void(0);" onclick="loadData('daily', this)"
			style="${currentType == 'daily' || currentType == null ? 'background-color: #fff !important; color: #333 !important; font-weight: 600;' : 'font-weight: 500;'} border-radius: 10px; font-size: 14px; padding: 6px 16px;">
				오늘의 인기글 </a></li>
		<li class="nav-item"><a
			class="nav-link ${currentType == 'weekly' ? 'active shadow-sm' : 'text-muted'}"
			href="javascript:void(0);" onclick="loadData('weekly', this)"
			style="${currentType == 'weekly' ? 'background-color: #fff !important; color: #333 !important; font-weight: 600;' : 'font-weight: 500;'} border-radius: 10px; font-size: 14px; padding: 6px 16px;">
				이번주 인기글 </a></li>
		<li class="nav-item"><a
			class="nav-link ${currentType == 'monthly' ? 'active shadow-sm' : 'text-muted'}"
			href="javascript:void(0);" onclick="loadData('monthly', this)"
			style="${currentType == 'monthly' ? 'background-color: #fff !important; color: #333 !important; font-weight: 600;' : 'font-weight: 500;'} border-radius: 10px; font-size: 14px; padding: 6px 16px;">
				이달의 인기글 </a></li>
		<li class="nav-item"><a
			class="nav-link ${currentType == 'notice' ? 'active shadow-sm' : 'text-muted'}"
			href="javascript:void(0);" onclick="loadData('notice', this)"
			style="${currentType == 'notice' ? 'background-color: #fff !important; color: #333 !important; font-weight: 600;' : 'font-weight: 500;'} border-radius: 10px; font-size: 14px; padding: 6px 16px;">
				공지사항 </a></li>
	</ul>
	<div id="popular-list-area" class="row g-4 mb-5">
		<div class="col-md-6">
			<div class="list-group list-group-flush border-top">
				<c:forEach items="${leftList}" var="board">
					<div
						class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
						<div class="text-truncate" style="max-width: 75%;">
							<a href="/board/get?bno=${board.bno}"
								class="text-decoration-none text-dark fw-bold"
								style="font-size: 0.85rem;"> ${board.title} </a>
							<c:if test="${board.isNew}">
								<span class="badge-n" style="margin-left: 5px;">N</span>
							</c:if>
							<span class="text-primary small ms-1">(${board.replycnt})</span>
						</div>
						<span class="badge bg-light text-secondary border fw-normal"
							style="font-size: 0.7rem;">${board.cat_name}</span>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="col-md-6">
			<div class="list-group list-group-flush border-top">
				<c:forEach items="${rightList}" var="board">
					<div
						class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
						<div class="text-truncate" style="max-width: 75%;">
							<a href="/board/get?bno=${board.bno}"
								class="text-decoration-none text-dark fw-bold"
								style="font-size: 0.85rem;"> ${board.title} </a>
							<c:if test="${board.isNew}">
								<span class="badge-n">N</span>
							</c:if>
							<span class="text-primary small ms-1">(${board.replycnt})</span>
						</div>
						<span class="badge bg-light text-secondary border fw-normal"
							style="font-size: 0.7rem;"> ${board.cat_name} </span>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="mt-5 mb-5 px-0">
		<div
			class="d-flex justify-content-between align-items-center mb-3 px-3">
			<h5 class="fw-bold mb-0">테크 지식 / 뉴스</h5>
			<a href="#" class="text-muted text-decoration-none small">더 보기 ></a>
		</div>

		<div id="techSlider" class="carousel slide position-relative"
			data-bs-ride="carousel" data-bs-interval="8000">

			<div class="carousel-indicators custom-dot-indicators">
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="2"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="3"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="4"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="5"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="6"></button>
				<button type="button" data-bs-target="#techSlider"
					data-bs-slide-to="7"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<div class="row g-3 mx-0">
						<c:choose>
							<c:when test="${not empty techList1}">

								<c:forEach items="${techList1}" var="tech">
									<div class="col-md-4 px-2">
										<div class="card h-100 border-0 shadow-sm overflow-hidden"
											style="border-radius: 12px; cursor: pointer;"
											onclick="location.href='/board/get?bno=${tech.bno}'">

											<div
												class="tech-card-img d-flex align-items-center justify-content-center"
												style="height: 140px; background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);">
												<span class="fw-bold text-muted"
													style="font-size: 24px; opacity: 0.5;">${tech.cat_name}</span>
												<span
													class="badge bg-dark opacity-75 m-2 position-absolute top-0 end-0">Tech</span>
											</div>

											<div class="card-body">
												<h6 class="fw-bold mb-2"
													style="font-size: 17px; color: #333;">
													${tech.title}

													<c:if test="${tech.replycnt > 0}">
														<span
															style="color: #0d6efd; font-size: 15px; margin-left: 3px;">(${tech.replycnt})</span>
													</c:if>
													<c:if test="${tech.isNew}">
														<span class="badge-n" style="margin-left: 5px;">N</span>
													</c:if>
												</h6>

												<p class="card-text small text-muted text-truncate-2">
													${tech.content.replaceAll("<[^>]*>", "")}</p>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="col-md-4 px-2">
									<div class="card h-100 border-0 shadow-sm"
										style="border-radius: 12px; min-height: 280px;">
										<div
											style="height: 180px; background: #f8f9fa; display: flex; flex-direction: column; align-items: center; justify-content: center;">
											<i class="bi bi-image text-muted fs-2"></i> <span
												class="text-muted mt-2 small">이미지 준비중</span>
										</div>
										<div class="card-body">
											<h6 class="fw-bold">테크 뉴스 제목</h6>
											<p class="small text-muted">내용이 표시되는 영역입니다.</p>
										</div>
									</div>
								</div>
								<div class="col-md-4 d-none d-md-block px-2">
									<div class="bg-light rounded-3"
										style="height: 280px; opacity: 0.3;"></div>
								</div>
								<div class="col-md-4 d-none d-md-block px-2">
									<div class="bg-light rounded-3"
										style="height: 280px; opacity: 0.3;"></div>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<button class="carousel-control-prev tech-overlap-btn" type="button"
				data-bs-target="#techSlider" data-bs-slide="prev">
				<span class="btn-round shadow-sm"><i
					class="bi bi-chevron-left"></i></span>
			</button>
			<button class="carousel-control-next tech-overlap-btn" type="button"
				data-bs-target="#techSlider" data-bs-slide="next">
				<span class="btn-round shadow-sm"><i
					class="bi bi-chevron-right"></i></span>
			</button>
		</div>
	</div>
	<div class="mt-5 mb-5">
		<div class="d-flex align-items-center mb-4 w-100">

			<div
				class="d-flex align-items-center gap-2 p-2 no-scrollbar shadow-sm w-100"
				style="background-color: #f8f9fa; border-radius: 12px; overflow-x: auto; border: 1px solid #eee;">

				<a href="#" class="filter-tab active"
					onclick="loadCategoryData('전체'); return false;">전체</a> <a href="#"
					class="filter-tab"
					onclick="loadCategoryData('사는얘기'); return false;">사는얘기</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('AI'); return false;">AI</a> <a href="#"
					class="filter-tab"
					onclick="loadCategoryData('연봉·단가'); return false;">연봉·단가</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('취준생'); return false;">취준생</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('스터디'); return false;">스터디</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('프로젝트'); return false;">프로젝트</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('모각코·모각공'); return false;">모각코·모각공</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('멘토링·튜터링'); return false;">멘토링·튜터링</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('모임·네트워킹'); return false;">모임·네트워킹</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('공모전·해커톤'); return false;">공모전·해커톤</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('IT 정책토론'); return false;">IT 정책토론</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('피드백'); return false;">피드백</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('Tech 뉴스'); return false;">Tech 뉴스</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('팀'); return false;">팀</a> <a href="#"
					class="filter-tab" onclick="loadCategoryData('칼럼'); return false;">칼럼</a>
				<a href="#" class="filter-tab"
					onclick="loadCategoryData('리뷰'); return false;">리뷰</a> <a href="#"
					class="filter-tab"
					onclick="loadCategoryData('IT보도자료'); return false;">IT보도자료</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('기술'); return false;">기술</a> <a href="#"
					class="filter-tab" onclick="loadCategoryData('커리어'); return false;">커리어</a>
				<a href="#" class="filter-tab"
					onclick="loadCategoryData('기타'); return false;">기타</a> <a href="#"
					class="filter-tab"
					onclick="loadCategoryData('IT 행사'); return false;">IT 행사</a> <a
					href="#" class="filter-tab"
					onclick="loadCategoryData('홍보·광고'); return false;">홍보·광고</a>
			</div>
			<button id="viewModeBtn" class="btn btn-white border ms-2 shadow-sm"
				style="padding: 10px 14px; border-radius: 12px; background: #fff; height: 50px; position: relative;"
				onclick="toggleViewMode()" data-tooltip="리스트형 보기로 전환합니다.">
				<i id="viewModeIcon" class="bi bi-list-ul text-muted"></i>
			</button>
		</div>

		<div id="boardContainer"
			class="post-list-container board-list-area card-mode">
			<c:choose>
				<c:when test="${not empty boardList}">
					<c:forEach items="${boardList}" var="board" end="19">
						<div class="post-item p-4 mb-3 border-bottom bg-white"
							onclick="location.href='${pageContext.request.contextPath}/board/get?bno=${board.bno}'"
							style="cursor: pointer; border-radius: 12px; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05); border: 1px solid #f1f3f5 !important; margin-bottom: 15px !important;">

							<div
								class="card-only-elements d-flex align-items-center gap-2 mb-2">
								<div
									style="display: inline-flex; align-items: center; border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; background-color: #fcfcfc;">
									<span style="color: #aaa; font-size: 11px;">커뮤니티</span> <span
										style="color: #eee; margin: 0 4px;">|</span> <span
										style="color: #666; font-size: 11px; font-weight: 600;">${board.cat_name}</span>
								</div>
								<span class="text-muted" style="font-size: 12px;">
									${board.writer} · <span class="date-display"
									data-regdate="${board.regdate.time}"></span>
								</span>
							</div>

							<div
								class="d-flex justify-content-between align-items-center w-100">
								<h6 class="fw-bold mb-2" style="font-size: 17px; color: #333;">
									${board.title}

									<c:if test="${board.replycnt > 0}">
										<span
											style="color: #0d6efd; font-size: 15px; margin-left: 3px;">(${board.replycnt})</span>
									</c:if>
									<c:if test="${board.isNew}">
										<span class="badge-n" style="margin-left: 5px;">N</span>
									</c:if>
								</h6>
								<div class="post-right-info-area"></div>
							</div>

							<div class="card-only-elements">
								<p class="text-muted mb-3 text-truncate-2"
									style="font-size: 14px !important; line-height: 1.6 !important; color: #666 !important;">
									${board.content.replaceAll("<[^>]*>", "")}</p>
								<div class="d-flex align-items-center gap-2">
									<div
										style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;">
										<i class="bi bi-hand-thumbs-up"></i> ${board.likecnt}
									</div>
									<div
										style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;">
										<i class="bi bi-hand-thumbs-down"></i> ${board.dislikecnt}
									</div>
									<div
										style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;">
										<i class="bi bi-share"></i> 공유
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>
<script>
    let currentSelectedCategory = '전체';
	
	function timeForToday(value) {
	    if (!value) return '';
	    const today = new Date();
	    const timeValue = new Date(value);

	    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
	    if (betweenTime < 1) return '방금전';
	    if (betweenTime < 60) {
	        return betweenTime + '분 전';
	    }

	    const betweenTimeHour = Math.floor(betweenTime / 60);
	    if (betweenTimeHour < 24) {
	        return '약 ' + betweenTimeHour + '시간 전';
	    }

	    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
	    if (betweenTimeDay < 365) {
	        return betweenTimeDay + '일 전';
	    }

	    return Math.floor(betweenTimeDay / 365) + '년 전';
	}
	
	function loadCategoryData(category) {
	    var container = document.getElementById('boardContainer');
	    if (!container) return;
	    
	    var isListMode = container.classList.contains('list-mode');
	    var cleanCategory = category.trim();
	    
	    var slugMap = {
	        "전체": "all", "사는얘기": "life", "AI": "ai", "연봉·단가": "salary",
	        "취준생": "jobs", "스터디": "study", "프로젝트": "project",
	        "모각코·모각공": "coding-study", "멘토링·튜터링": "mentoring",
	        "모임·네트워킹": "networking", "공모전·해커톤": "contest",
	        "IT 정책토론": "policy", "피드백": "feedback", "Tech 뉴스": "tech-news",
	        "팀": "team", "칼럼": "column", "리뷰": "review", "IT보도자료": "press",
	        "기술": "tech", "커리어": "career", "기타": "etc", "IT 행사": "event", "홍보·광고": "promo"
	    };

	    fetch('/board/main/categoryData?category=' + encodeURIComponent(cleanCategory))
	        .then(function(res) { return res.json(); })
	        .then(function(data) {
	            var html = "";
	            if(!data || data.length === 0) {
	                html = '<div class="text-center py-5 border rounded-3 bg-light text-muted">해당 카테고리에 게시물이 없습니다.</div>';
	            } else {
	                var displayData = (cleanCategory === '전체') ? data.slice(0, 20) : data;

	                displayData.forEach(function(board) {
	    var postDate = new Date(board.regdate);
	    var now = new Date();
	    var diff = (now - postDate) / (1000 * 60 * 60);
	    if (diff < 24) { board.isNew = true; }
	    
	    var dateDisplay = timeForToday(board.regdate);
	    var contentClean = board.content ? board.content.replace(/<[^>]*>?/gm, '') : '';
	    var profileImg = (board.profilePath && board.profilePath.trim() !== "") 
	                    ? board.profilePath : '/resources/img/default-profile.png';
	    var boardSlug = slugMap[board.cat_name] ? slugMap[board.cat_name] : (slugMap[cleanCategory] ? slugMap[cleanCategory] : "all");

	    if (isListMode) {
	        html += '<div class="post-item p-2 px-3 border-bottom bg-white" onclick="location.href=\'/board/get?bno=' + board.bno + '\'" style="cursor: pointer; display: flex; justify-content: space-between; align-items: center;">';
	        html += '  <div style="flex: 1; min-width: 0; display: flex; align-items: center; gap: 8px;">';
	        html += '    <h6 class="mb-0 fw-bold" style="font-size: 15px; color: #333; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">' + board.title + '</h6>';
	        if (board.replycnt > 0) html += ' <span style="color: #0d6efd; font-size: 13px;">(' + board.replycnt + ')</span>';
	        if (board.isNew) html += ' <span class="badge-n">N</span>';
	        html += '  </div>';
	        html += '  <div style="display: flex; align-items: center; gap: 15px; flex-shrink: 0;">';
	        html += '    <div onclick="event.stopPropagation(); location.href=\'/board/list?category=' + boardSlug + '\';" style="border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 600; background: #fcfcfc; cursor: pointer;">' + (board.cat_name || cleanCategory) + '</div>';	 
	        html += '    <div style="width: 70px; text-align: right; font-size: 13px; color: #888;">' + dateDisplay + '</div>';	        
	        var profileSrc = board.user_img ? '/member/display?fileName=' + board.user_img : '/resources/img/default_profile.jpg';
	        html += '    <img src="' + profileSrc + '" style="width: 22px; height: 22px; border-radius: 50%; object-fit: cover;">';
	        
	        html += '  </div>';
	        html += '</div>';
	    } else {
	        html += '<div class="post-item p-4 mb-3 border-bottom bg-white" onclick="location.href=\'/board/get?bno=' + board.bno + '\'" style="cursor: pointer; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); border: 1px solid #f1f3f5 !important;">';
	        html += '  <div class="d-flex align-items-center gap-2 mb-2">';
	        html += '    <div onclick="event.stopPropagation(); location.href=\'/board/list?category=' + boardSlug + '\';" style="display: inline-flex; align-items: center; border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; background-color: #fcfcfc; cursor: pointer;">';
	        html += '      <span style="color: #aaa; font-size: 11px;">커뮤니티</span><span style="color: #eee; margin: 0 4px;">|</span>';
	        html += '      <span style="color: #666; font-size: 11px; font-weight: 600;">' + (board.cat_name || cleanCategory) + '</span>';
	        html += '    </div>';
	        html += '    <span class="text-muted" style="font-size: 12px;">' + board.writer + ' · ' + dateDisplay + '</span>';
	        html += '  </div>';
	        html += '  <h6 class="fw-bold mb-2" style="font-size: 17px; color: #333;">' + board.title;
	        if (board.replycnt > 0) html += ' <span style="color: #0d6efd; font-size: 15px; margin-left: 3px;">(' + board.replycnt + ')</span>';
	        if (board.isNew) html += ' <span class="badge-n">N</span>';
	        html += '  </h6>';
	        html += '  <p class="text-muted mb-3 text-truncate-2" style="font-size: 14px; line-height: 1.6; color: #666 !important;">' + contentClean + '</p>';
	        html += '  <div class="d-flex align-items-center gap-2">';
	        html += '    <div style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;"><i class="bi bi-hand-thumbs-up"></i> ' + (board.likecnt || 0) + '</div>';
	        html += '    <div style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;"><i class="bi bi-hand-thumbs-down"></i> ' + (board.dislikecnt || 0) + '</div>';
	        html += '    <div style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;"><i class="bi bi-share"></i> 공유</div>';
	        html += '  </div>';
	        html += '</div>';
	    }
	});
	                if (cleanCategory !== "전체") {
	                    var finalSlug = slugMap[cleanCategory] || "all";
	                    html += '<div class="text-center py-4" style="border-top: 1px solid #f1f3f5; margin-top: 10px;">';
	                    html += '  <a href="/board/list?category=' + finalSlug + '" class="more-view-link">더 보기</a>';
	                    html += '</div>';
	                }
	            }
	            container.innerHTML = html;
	        })
	        .catch(function(err) { console.error("Error:", err); });
	}
	
function loadData(type, element) {
    const allLinks = element.closest('.nav').querySelectorAll('.nav-link');
    allLinks.forEach(link => {
        link.classList.remove('active', 'shadow-sm');
        link.classList.add('text-muted');
        link.style.cssText = "font-weight: 500; border-radius: 10px; font-size: 14px; padding: 6px 16px; background-color: transparent !important;";
    });
    element.classList.add('active', 'shadow-sm');
    element.classList.remove('text-muted');
    element.style.cssText = "background-color: #fff !important; color: #333 !important; font-weight: 600; border-radius: 10px; font-size: 14px; padding: 6px 16px;";
        fetch('/main/data?type=' + type)
        .then(res => res.json())
        .then(data => {
            console.log(type + " 로드 데이터:", data); 
            
            const container = document.getElementById('popular-list-area');
            if (!container) return;

            if (!data || data.length === 0) {
                container.innerHTML = '<div class="col-12 text-center py-5 text-muted">등록된 게시물이 없습니다.</div>';
                return;
            }

            let leftHtml = '<div class="col-md-6"><div class="list-group list-group-flush border-top">';
            let rightHtml = '<div class="col-md-6"><div class="list-group list-group-flush border-top">';
            
            data.forEach((board, index) => {
                const bno = board.bno || 0;
                const title = board.title || '제목 없음';
                const catName = board.cat_name || '기술';
                const now = new Date().getTime();
                const regDate = board.regdate;
                const isNewArticle = board.isNew === true || (now - regDate < (1000 * 60 * 60 * 24));
                
                const nBadge = isNewArticle ? '<span class="badge-n" style="color: #ff5e11; font-weight: bold; font-size: 0.75rem; margin-left: 3px;">N</span>' : '';

                const itemHtml = 
    '<div class="list-group-item py-2 px-1 bg-transparent border-bottom" style="border-bottom: 1px solid #f1f3f5 !important;">' +
    '    <div class="d-flex justify-content-between align-items: center;">' +
    '        <div class="text-truncate" style="flex: 1; margin-right: 10px;">' +
    '            <a href="/board/get?bno=' + bno + '" class="text-decoration-none text-dark fw-bold" style="font-size: 14px; letter-spacing: -0.5px;">' +
    '                ' + title + '' +
    '            </a>' +
    '            ' + nBadge + ' ' +
    '            <span class="text-primary small" style="font-size: 12px; margin-left: 2px;">(' + (board.replycnt || 0) + ')</span>' +
    '        </div>' +
    '        <div class="d-flex align-items-center gap-2" style="flex-shrink: 0;">' +
    '            <div style="border: 1px solid #eee; padding: 1px 6px; border-radius: 4px; background-color: #fcfcfc; font-size: 10px; color: #666; font-weight: 600;">' +
    '                ' + catName + '' +
    '            </div>' +
    '            <span class="text-muted" style="font-size: 11px; min-width: 65px; text-align: right;">' +
    '                ' + new Date(regDate).toLocaleDateString().slice(2) + '' +
    '            </span>' +
    '        </div>' +
    '    </div>' +
    '</div>';
                
                if (index < data.length / 2) {
                    leftHtml += itemHtml;
                } else {
                    rightHtml += itemHtml;
                }
            });

            leftHtml += '</div></div>';
            rightHtml += '</div></div>';

            container.innerHTML = leftHtml + rightHtml;
        })
        .catch(err => console.error("데이터 로드 실패:", err));
}

document.addEventListener("DOMContentLoaded", function() {
    const initialTab = document.querySelector('.nav-link.active') || document.querySelector('.filter-tab.active');
    if (initialTab) {
        loadData('daily', initialTab); 
    }
    const tabs = document.querySelectorAll('.filter-tab');
    tabs.forEach(tab => {
        tab.addEventListener('click', function() {
            tabs.forEach(t => t.classList.remove('active'));           
            this.classList.add('active');            
            this.scrollIntoView({ behavior: 'smooth', inline: 'center', block: 'nearest' });
        });
    });
    document.querySelectorAll('.date-display').forEach(el => {
        const regdate = el.getAttribute('data-regdate');
        if (regdate) {
            el.innerText = timeForToday(parseInt(regdate));
        }
    });
});

function toggleViewMode() {
    const container = document.getElementById('boardContainer');
    const btn = document.getElementById('viewModeBtn');
    const icon = document.getElementById('viewModeIcon');
    if (container.classList.contains('card-mode')) {
        container.classList.remove('card-mode');
        container.classList.add('list-mode');
        icon.classList.replace('bi-list-ul', 'bi-grid');        
        btn.setAttribute('data-tooltip', '카드형 보기로 전환합니다.');
    } else {
        container.classList.remove('list-mode');
        container.classList.add('card-mode');
        icon.classList.replace('bi-grid', 'bi-list-ul');         
        btn.setAttribute('data-tooltip', '리스트형 보기로 전환합니다.');
    }    
    loadCategoryData(currentSelectedCategory);
}
</script>