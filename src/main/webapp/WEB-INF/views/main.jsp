<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.text-truncate-2 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
}

.text-truncate-1 {
	display: block;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.more-link:hover {
	text-decoration: underline !important;
	color: #000 !important;
}

.bg-grad-1 {
	background: linear-gradient(to bottom, #2c3e50, #000000);
}

.bg-grad-2 {
	background: linear-gradient(to bottom, #e0eafc, #cfdef3);
}

.bg-grad-3 {
	background: linear-gradient(to bottom, #4b6cb7, #182848);
}

.profile-img-overlap {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: 2px solid white;
}

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
			<a
				href="${pageContext.request.contextPath}/board/list?group=knowledge"
				class="text-muted text-decoration-none small more-link">더 보기 ></a>
		</div>

		<div id="techSlider" class="carousel slide position-relative"
			data-bs-ride="carousel" data-bs-interval="8000">

			<div class="carousel-indicators custom-dot-indicators">
				<c:set var="totalItems" value="${fn:length(techList)}" />
				<c:forEach var="i" begin="0" end="${(totalItems - 1) / 3}">
					<button type="button" data-bs-target="#techSlider"
						data-bs-slide-to="${i}" class="${i == 0 ? 'active' : ''}"
						aria-current="${i == 0 ? 'true' : 'false'}"></button>
				</c:forEach>
			</div>

			<c:choose>
				<c:when test="${not empty techList && fn:length(techList) > 0}">
					<div class="carousel-inner">
						<c:forEach var="i" begin="0" end="${fn:length(techList) - 1}"
							step="3">
							<div class="carousel-item ${i == 0 ? 'active' : ''}">
								<div class="row g-3 mx-0">
									<c:forEach var="tech" items="${techList}" begin="${i}"
										end="${i + 2}" varStatus="status">
										<div class="col-md-4 px-2">
											<div class="card h-100 border-0 shadow-sm overflow-hidden"
												style="border-radius: 15px; cursor: pointer;"
												onclick="location.href='${pageContext.request.contextPath}/board/get?bno=${tech.bno}'">
												<div
													class="position-relative d-flex align-items-center bg-grad-${(status.index % 3) + 1}"
													style="height: 120px; padding-left: 20px;">
													<span class="badge bg-light text-dark position-absolute"
														style="top: 15px; right: 15px; opacity: 0.9;">${tech.cat_name}</span>
													<div class="d-flex align-items-center gap-2">
														<div
															class="rounded-circle overflow-hidden border shadow-sm"
															style="width: 32px; height: 32px; background-color: #eee;">
															<img
																src="${(not empty tech.user_img) ? tech.user_img : pageContext.request.contextPath.concat('/resources/img/default_profile.jpg')}"
																style="width: 100%; height: 100%; object-fit: cover;"
																onerror="this.src='${pageContext.request.contextPath}/resources/img/default_profile.jpg';">
														</div>

														<div
															class="bg-white bg-opacity-90 rounded-pill px-3 py-1 shadow-sm border">
															<span
																style="font-size: 14px; color: #333; font-weight: 500;">${tech.writer}</span>
														</div>

														<c:if test="${tech.likecnt > 0}">
															<div
																class="bg-white bg-opacity-90 rounded-pill px-2 py-1 shadow-sm border d-flex align-items-center">
																<i class="bi bi-hand-thumbs-up-fill text-primary"
																	style="font-size: 12px;"></i> <span class="ms-1"
																	style="font-size: 12px; font-weight: bold; color: #333;">${tech.likecnt}</span>
															</div>
														</c:if>
													</div>
												</div>
												<div class="card-body p-4">
													<h6 class="fw-bold mb-2 text-truncate-2"
														style="font-size: 17px; line-height: 1.4; min-height: 48px;">${tech.title}</h6>
													<p class="small text-muted text-truncate-1 mb-0">${tech.content.replaceAll("<[^>]*>", "")}</p>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:forEach>
					</div>

					<button class="carousel-control-prev tech-overlap-btn"
						type="button" data-bs-target="#techSlider" data-bs-slide="prev">
						<span class="btn-round shadow-sm"><i
							class="bi bi-chevron-left"></i></span>
					</button>
					<button class="carousel-control-next tech-overlap-btn"
						type="button" data-bs-target="#techSlider" data-bs-slide="next">
						<span class="btn-round shadow-sm"><i
							class="bi bi-chevron-right"></i></span>
					</button>
				</c:when>

				<c:otherwise>
					<div class="py-5 text-center text-muted border rounded-3 bg-light">
						등록된 게시물이 없습니다.</div>
				</c:otherwise>
			</c:choose>
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
				class="filter-tab" onclick="loadCategoryData('사는얘기'); return false;">사는얘기</a>
			<a href="#" class="filter-tab"
				onclick="loadCategoryData('AI'); return false;">AI</a> <a href="#"
				class="filter-tab"
				onclick="loadCategoryData('연봉·단가'); return false;">연봉·단가</a> <a
				href="#" class="filter-tab"
				onclick="loadCategoryData('취준생'); return false;">취준생</a> <a href="#"
				class="filter-tab" onclick="loadCategoryData('스터디'); return false;">스터디</a>
			<a href="#" class="filter-tab"
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
				onclick="loadCategoryData('피드백'); return false;">피드백</a> <a href="#"
				class="filter-tab"
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

						<div onclick="event.stopPropagation(); goCategory('${board.cat_name}');"
     style="display: inline-flex; align-items: center; border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; background-color: #fcfcfc; cursor: pointer;">
    
    <%-- 부모 카테고리 (상위 카테고리) --%>
    <span style="color: #aaa; font-size: 11px;"> 
        <c:choose>
            <%-- 부모 이름이 없거나, 자식 이름과 똑같다면 '커뮤니티' 혹은 기본값 표시 --%>
            <c:when test="${empty board.group_name || board.group_name eq board.cat_name}">
                커뮤니티
            </c:when>
            <c:otherwise>
                ${board.group_name} <%-- 여기가 진짜 '상위' 카테고리가 나오는 곳 --%>
            </c:otherwise>
        </c:choose>
    </span> 
    
    <span style="color: #eee; margin: 0 4px;">|</span> 
    
    <%-- 자식 카테고리 (현재 카테고리) --%>
    <span style="color: #666; font-size: 11px; font-weight: 600;">${board.cat_name}</span>
</div>

						<div
							class="d-flex justify-content-between align-items-center w-100">
							<h6 class="fw-bold mb-0"
								style="font-size: 17px; color: #333; flex: 1; min-width: 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
								${board.title}
								<c:if test="${board.replycnt > 0}">
									<span
										style="color: #0d6efd; font-size: 15px; margin-left: 3px;">(${board.replycnt})</span>
								</c:if>
								<c:if test="${board.isNew}">
									<span class="badge-n" style="margin-left: 5px;">N</span>
								</c:if>
							</h6>

							<div class="post-right-info-area"
								style="display: flex; align-items: center; gap: 12px; flex-shrink: 0;">
								<div
									style="border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 600; background: #fcfcfc; color: #666;">
									${board.cat_name}</div>
								<div
									style="width: 75px; text-align: right; font-size: 13px; color: #888;">
									<span class="date-display" data-regdate="${board.regdate.time}"></span>
								</div>
								<div class="rounded-circle border overflow-hidden"
									style="width: 24px; height: 24px;">
									<img
										src="${(not empty board.user_img) ? '/member/display?fileName='.concat(board.user_img) : '/resources/img/default_profile.jpg'}"
										style="width: 100%; height: 100%; object-fit: cover;"
										onerror="this.src='/resources/img/default_profile.jpg'">
								</div>
							</div>
						</div>

						<div class="card-only-elements mt-3">
							<p class="text-muted mb-3 text-truncate-2"
								style="font-size: 14px; line-height: 1.6;">
								${board.content.replaceAll("<[^>]*>", "")}</p>
						</div>
					</div>
				</c:forEach>
			</c:when>
		</c:choose>
	</div>
</div>

<script>
var currentSelectedCategory = '전체';

function timeForToday(value) {
    if (!value) return '';
    var today = new Date();
    var timeValue = new Date(value);
    var betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
    if (betweenTime < 1) return '방금전';
    if (betweenTime < 60) return betweenTime + '분';
    var betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) return '약 ' + betweenTimeHour + '시간';
    var betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    if (betweenTimeDay < 365) return betweenTimeDay + '일';
    return Math.floor(betweenTimeDay / 365) + '년';
}

function loadData(type, element) {
	var tabs = document.querySelectorAll('.nav-pills .nav-link');
    tabs.forEach(function(tab) {
        tab.classList.remove('active', 'shadow-sm');
        tab.classList.add('text-muted');
        tab.style.backgroundColor = 'transparent';
        tab.style.color = '#6c757d'; 
        tab.style.fontWeight = '500';
    });
    
    element.classList.add('active', 'shadow-sm');
    element.classList.remove('text-muted');
    element.style.backgroundColor = '#fff';
    element.style.color = '#333'; 
    element.style.fontWeight = '600';

    fetch('/main/data?type=' + type) 
    .then(function(res) { return res.json(); })
    .then(function(data) {
        var listArea = document.getElementById('popular-list-area');
        if (!listArea || !data) return;
        
        var half = Math.ceil(data.length / 2);
        var leftList = data.slice(0, half);
        var rightList = data.slice(half);

        var leftHtml = '<div class="col-md-6"><div class="list-group list-group-flush border-top">';
        var rightHtml = '<div class="col-md-6"><div class="list-group list-group-flush border-top">';

        var renderItem = function(board) {
            var isNew = board.isNew; 
            var item = '<div class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">';
            item += '<div class="text-truncate" style="max-width: 75%;">';
            item += '<a href="/board/get?bno=' + board.bno + '" class="text-decoration-none text-dark fw-bold" style="font-size: 0.85rem;">' + board.title + '</a>';            
            if(isNew) item += '<span class="badge-n" style="margin-left: 5px;">N</span>';         
            if (board.replycnt > 0) {
                item += '<span class="text-primary small ms-1">(' + board.replycnt + ')</span>';
            }
            
            item += '</div>';
            item += '<span class="badge bg-light text-secondary border fw-normal" style="font-size: 0.7rem;">' + (board.cat_name || '기타') + '</span></div>';
            return item;
        };

        leftList.forEach(function(b) { leftHtml += renderItem(b); });
        rightList.forEach(function(b) { rightHtml += renderItem(b); });

        listArea.innerHTML = leftHtml + '</div></div>' + rightHtml + '</div></div>';
    })
        .catch(function(err) { console.error("Error:", err); });
}

function loadCategoryData(category) {
    var container = document.getElementById('boardContainer');
    if (!container) return;
    var isListMode = container.classList.contains('list-mode');
    
    fetch('/board/main/categoryData?category=' + encodeURIComponent(category))
        .then(function(res) { return res.json(); })
        .then(function(data) {
            var html = "";
            if(!data || data.length === 0) {
                html = '<div class="text-center py-5 border rounded-3 bg-light text-muted w-100">게시물이 없습니다.</div>';
            } else {
                data.forEach(function(board) {
                    var dateText = timeForToday(board.regdate);
                    var isNew = (new Date() - new Date(board.regdate)) / (1000 * 60 * 60) < 24;
                    var contentClean = board.content ? board.content.replace(/<[^>]*>?/gm, '') : '';
                    var replyTag = board.replycnt > 0 ? '<span style="color: #0d6efd; font-size: 13px;">(' + board.replycnt + ')</span>' : '';
                    var newTag = isNew ? '<span class="badge-n">N</span>' : '';

                    var parentName = (board.group_name && board.group_name !== board.cat_name) ? board.group_name : '커뮤니티';
                    var boardSlug = (typeof categoryConfig !== 'undefined' && categoryConfig[board.cat_name]) ? categoryConfig[board.cat_name].slug : "all";

                    if (isListMode) {
                        html += '<div class="post-item p-2 px-3 border-bottom bg-white" onclick="location.href=\'/board/get?bno=' + board.bno + '\'" style="cursor: pointer; display: flex; justify-content: space-between; align-items: center;">' +
                                '<div style="flex: 1; min-width: 0; display: flex; align-items: center; gap: 8px;">' +
                                '<h6 class="mb-0 fw-bold" style="font-size: 15px; color: #333; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">' + board.title + '</h6>' +
                                replyTag + newTag + '</div>' +
                                '<div style="display: flex; align-items: center; gap: 12px; flex-shrink: 0;">' +
                                '<div style="border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 600; background: #fcfcfc; color: #666;">' + board.cat_name + '</div>' +
                                '<div style="width: 75px; text-align: right; font-size: 13px; color: #888;">' + dateText + '</div></div></div>';
                    } else {
                        html += '<div class="post-item p-4 mb-3 border-bottom bg-white" onclick="location.href=\'/board/get?bno=' + board.bno + '\'" style="cursor: pointer; border-radius: 12px; border: 1px solid #f1f3f5 !important; box-shadow: 0 2px 8px rgba(0,0,0,0.05);">' +
                                '<div class="d-flex align-items-center gap-2 mb-2">' +
                                '<div onclick="event.stopPropagation(); location.href=\'/board/list?category=' + boardSlug + '\';" style="display: inline-flex; align-items: center; border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; background-color: #fcfcfc; cursor: pointer;">' +
                                '<span style="color: #aaa; font-size: 11px;">' + parentName + '</span>' +
                                '<span style="color: #eee; margin: 0 4px;">|</span>' +
                                '<span style="color: #666; font-size: 11px; font-weight: 600;">' + board.cat_name + '</span>' +
                                '</div>' +
                                '<span class="text-muted" style="font-size: 12px;">' + board.writer + ' · ' + dateText + '</span>' +
                                '</div>' +
                                '<h6 class="fw-bold mb-2" style="font-size: 17px; color: #333;">' + board.title + replyTag + (isNew ? ' <span class="badge-n">N</span>' : '') + '</h6>' +
                                '<p class="text-muted mb-3 text-truncate-2" style="font-size: 14px; line-height: 1.6; color: #666 !important;">' + contentClean + '</p>' +
                                '<div class="d-flex align-items-center gap-2">' +
                                '<div style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;"><i class="bi bi-hand-thumbs-up"></i> ' + (board.likecnt || 0) + '</div>' +
                                '<div style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff; cursor: pointer;"><i class="bi bi-hand-thumbs-down"></i> ' + (board.dislikecnt || 0) + '</div>' +
                                '<div style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;"><i class="bi bi-share"></i> 공유</div>' +
                                '</div>' +
                                '</div>';
                    }
                });
            }
            container.innerHTML = html;
        })
        .catch(function(err) { console.error("Error:", err); });
}

document.addEventListener("DOMContentLoaded", function() {
    var firstTab = document.querySelector('.nav-pills .nav-link');
    if (firstTab) loadData('daily', firstTab);

    var categoryTabs = document.querySelectorAll('.filter-tab');
    categoryTabs.forEach(function(tab) {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            categoryTabs.forEach(function(t) { t.classList.remove('active'); });
            this.classList.add('active');
            currentSelectedCategory = this.innerText.trim();
            loadCategoryData(currentSelectedCategory);
        });
    });
});
        
        
	function loadCategoryData(category) {
	    var container = document.getElementById('boardContainer');
	    if (!container) return;
	    
	    var isListMode = container.classList.contains('list-mode');
	    var cleanCategory = category.trim();
	    
	    var categoryConfig = {
	        "Q&A": { id: "10", slug: "qna" },
	        "기술": { id: "11", slug: "tech" },
	        "커리어": { id: "12", slug: "career" },
	        "기타": { id: "13", slug: "etc" },
	        "지식": { id: "20", slug: "knowledge" },
	        "Tech 뉴스": { id: "21", slug: "news" },
	        "팁": { id: "22", slug: "tips" },
	        "칼럼": { id: "23", slug: "column" },
	        "리뷰": { id: "24", slug: "review" },
	        "IT보도자료": { id: "25", slug: "press" },
	        "커뮤니티": { id: "30", slug: "community" },
	        "사는얘기": { id: "31", slug: "life" },
	        "AI": { id: "32", slug: "ai" },
	        "연봉·단가": { id: "33", slug: "salary" },
	        "취준생": { id: "34", slug: "jobs" },
	        "IT 정책토론": { id: "35", slug: "policy" },
	        "피드백": { id: "36", slug: "feedback" },
	        "이벤트": { id: "40", slug: "event" },
	        "IT 행사": { id: "41", slug: "it-event" },
	        "홍보·광고": { id: "42", slug: "promo" },
	        "모임": { id: "50", slug: "meetup" },
	        "스터디": { id: "51", slug: "study" },
	        "프로젝트": { id: "52", slug: "project" },
	        "모각코·모각공": { id: "53", slug: "coding-study" },
	        "멘토링·튜터링": { id: "54", slug: "mentoring" }, 
	        "모임·네트워킹": { id: "55", slug: "networking" },
	        "공모전·해커톤": { id: "56", slug: "contest" },
	        "부트캠프": { id: "60", slug: "bootcamp" },
	        "교육과정": { id: "61", slug: "course" },
	        "JOBS": { id: "70", slug: "jobs-board" },
	        "계약직": { id: "71", slug: "contract" },
	        "정규직": { id: "72", slug: "full-time" },
	        "Talent": { id: "73", slug: "talent" },
	        "좋은회사/나쁜회사": { id: "74", slug: "company-review" },
	        "CONTACT": { id: "80", slug: "contact" },
	        "공지사항": { id: "81", slug: "notice" },
	        "Releases": { id: "82", slug: "releases" },
	        "버그 및 제안": { id: "83", slug: "bug-report" },
	        "게시판 생성 요청": { id: "84", slug: "request" },
	        "OKKY 행사": { id: "85", slug: "okky-event" },
	        "전체": { id: "all", slug: "all" }
	    };

	fetch('${pageContext.request.contextPath}/board/main/categoryData?category=' + encodeURIComponent(cleanCategory))
	        .then(function(res) { return res.json(); })
	        .then(function(data) {
	            var html = "";
	            if(!data || data.length === 0) {
	                html = '<div class="text-center py-5 border rounded-3 bg-light text-muted w-100">해당 카테고리에 게시물이 없습니다.</div>';
	            } else {
	                var displayData = (cleanCategory === '전체') ? data.slice(0, 20) : data;

	                displayData.forEach(function(board) {
	                    var postDate = new Date(board.regdate);
	                    var now = new Date();
	                    var diff = (now - postDate) / (1000 * 60 * 60);
	                    board.isNew = (diff < 24);
	                    
	                    var dateDisplay = timeForToday(board.regdate);
	                    var contentClean = board.content ? board.content.replace(/<[^>]*>?/gm, '') : '';
	                    
	                    var boardSlug = (categoryConfig[board.cat_name] ? categoryConfig[board.cat_name].slug : "all");
	                    var displayGroup = (board.group_name && board.group_name !== board.cat_name) ? board.group_name : '커뮤니티';

	                    if (isListMode) {
	                        html += '<div class="post-item p-2 px-3 border-bottom bg-white" onclick="location.href=\'/board/get?bno=' + board.bno + '\'" style="cursor: pointer; display: flex; justify-content: space-between; align-items: center; gap: 10px;">';
	                        html += '  <div style="flex: 1; min-width: 0; display: flex; align-items: center; gap: 8px;">';
	                        html += '    <h6 class="mb-0 fw-bold" style="font-size: 15px; color: #333; overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">' + board.title + '</h6>';
	                        if (board.replycnt > 0) html += ' <span style="color: #0d6efd; font-size: 13px;">(' + board.replycnt + ')</span>';
	                        if (board.isNew) html += ' <span class="badge-n">N</span>';
	                        html += '  </div>';
	                        html += '  <div style="display: flex; align-items: center; gap: 12px; flex-shrink: 0;">';
	                        html += '    <div style="border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; font-size: 11px; font-weight: 600; background: #fcfcfc; color: #666;">' + (board.cat_name || '전체') + '</div>'; 
	                        html += '    <div style="width: 75px; text-align: right; font-size: 13px; color: #888;">' + dateDisplay + '</div>';              
	                        var profileSrc = board.user_img ? '/member/display?fileName=' + board.user_img : '/resources/img/default_profile.jpg';
	                        html += '    <img src="' + profileSrc + '" style="width: 24px; height: 24px; border-radius: 50%; object-fit: cover; border: 1px solid #eee;" onerror="this.src=\'/resources/img/default_profile.jpg\'">';
	                        html += '  </div>';
	                        html += '</div>';
	                    } else {
	                        html += '<div class="post-item p-4 mb-3 border-bottom bg-white" onclick="location.href=\'/board/get?bno=' + board.bno + '\'" style="cursor: pointer; border-radius: 12px; box-shadow: 0 2px 8px rgba(0,0,0,0.05); border: 1px solid #f1f3f5 !important;">';
	                        html += '  <div class="d-flex align-items-center gap-2 mb-2">';
	                        html += '    <div onclick="event.stopPropagation(); location.href=\'/board/list?category=' + boardSlug + '\';" style="display: inline-flex; align-items: center; border: 1px solid #eee; padding: 2px 8px; border-radius: 4px; background-color: #fcfcfc; cursor: pointer;">';
	                        html += '      <span style="color: #aaa; font-size: 11px;">' + (displayGroup || '커뮤니티') + '</span>'; 
	                        html += '      <span style="color: #eee; margin: 0 4px;">|</span>';
	                        html += '      <span style="color: #666; font-size: 11px; font-weight: 600;">' + board.cat_name + '</span>';
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
	                        html += '    <div style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff; cursor: pointer;"><i class="bi bi-hand-thumbs-down"></i> ' + (board.dislikecnt || 0) + '</div>';
	                        html += '    <div style="border: 1px solid #f1f3f5; padding: 5px 14px; border-radius: 20px; font-size: 13px; color: #868e96; background: #fff;"><i class="bi bi-share"></i> 공유</div>';
	                        html += '  </div>';
	                        html += '</div>';
	                    }
	                });

	                if (cleanCategory !== "전체") {
	                    var finalSlug = (categoryConfig[cleanCategory] ? categoryConfig[cleanCategory].slug : "all");
	                    html += '<div class="text-center py-4" style="border-top: 1px solid #f1f3f5; margin-top: 10px;">';
	                    html += '  <a href="/board/list?category=' + finalSlug + '" class="more-view-link">더 보기</a>';
	                    html += '</div>';
	                }
	            }
	            container.innerHTML = html;
	        })
	        .catch(function(err) { console.error("Error:", err); });
	}

document.addEventListener("DOMContentLoaded", function() {
	const initialTab = document.querySelector('.nav-pills .nav-link.active');
    if (initialTab && typeof loadData === 'function') {
        loadData('daily', initialTab); 
    }
    var myCarousel = document.querySelector('#techSlider');
    if (myCarousel) {
        new bootstrap.Carousel(myCarousel, {
            interval: 8000,
            wrap: true,
            pause: 'hover'
        });
    }
    const categoryTabs = document.querySelectorAll('.filter-tab');

    categoryTabs.forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();
            
            console.log("카테고리 클릭됨:", this.innerText.trim());

            categoryTabs.forEach(t => t.classList.remove('active'));
            this.classList.add('active');
            
            currentSelectedCategory = this.innerText.trim();
            
            if (typeof loadCategoryData === 'function') {
                loadCategoryData(currentSelectedCategory);
            }
            
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


function goCategory(catName) {
    var categoryConfig = {
        "Q&A": "qna",
        "기술": "tech",
        "커리어": "career",
        "기타": "etc",
        "지식": "knowledge",
        "Tech 뉴스": "news",
        "팁": "tips",
        "칼럼": "column",
        "리뷰": "review",
        "IT보도자료": "press",
        "커뮤니티": "community",
        "사는얘기": "life",
        "AI": "ai",
        "연봉·단가": "salary",
        "취준생": "jobs",
        "IT 정책토론": "policy",
        "피드백": "feedback",
        "이벤트": "event",
        "IT 행사": "it-event",
        "홍보·광고": "promo",
        "모임": "meetup",
        "스터디": "study",
        "프로젝트": "project",
        "모각코·모각공": "coding-study",
        "멘토링·튜터링": "mentoring",
        "모임·네트워킹": "networking",
        "공모전·해커톤": "contest",
        "부트캠프": "bootcamp",
        "교육과정": "course",
        "JOBS": "jobs-board",
        "계약직": "contract",
        "정규직": "full-time",
        "Talent": "talent",
        "좋은회사/나쁜회사": "company-review",
        "CONTACT": "contact",
        "공지사항": "notice",
        "Releases": "releases",
        "버그 및 제안": "bug-report",
        "게시판 생성 요청": "request",
        "OKKY 행사": "okky-event",
        "전체": "all"
    };

    var slug = categoryConfig[catName.trim()] || "all";

    location.href = '${pageContext.request.contextPath}/board/list?category=' + slug;
}
</script>