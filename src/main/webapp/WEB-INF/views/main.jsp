<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<div class="container mt-4" style="max-width: 1200px; margin: 0 auto;">
	<div class="rounded-3 mb-4 overflow-hidden shadow-sm" style="height: 160px; background: linear-gradient(90deg, #0d6efd, #000);">
        <div class="d-flex flex-column align-items-center justify-content-center h-100 text-white text-center">
            <h3 class="fw-bold mb-1">Find BUIDLer</h3>
            <p class="mb-0 opacity-75">2026 한화투자증권 디지털/글로벌 경력 채용</p>
        </div>
    </div>

	<div class="mb-2 d-flex justify-content-between align-items-end">
		<ul class="nav nav-pills p-1"
			style="background-color: #f1f3f5; border-radius: 12px; display: inline-flex;">
			<li class="nav-item"><a class="nav-link active shadow-sm"
				href="#"
				style="background-color: #fff !important; color: #333 !important; font-weight: 600; border-radius: 10px; font-size: 14px; padding: 6px 16px;">오늘의
					인기글</a></li>
			<li class="nav-item"><a class="nav-link text-muted" href="#"
				style="font-weight: 500; font-size: 14px; padding: 6px 16px;">이번주
					인기글</a></li>
			<li class="nav-item"><a class="nav-link text-muted" href="#"
				style="font-weight: 500; font-size: 14px; padding: 6px 16px;">이달의
					인기글</a></li>
			<li class="nav-item"><a class="nav-link text-muted" href="#"
				style="font-weight: 500; font-size: 14px; padding: 6px 16px;">공지사항</a></li>
		</ul>
		<a href="/board/list" class="text-muted text-decoration-none"
			style="font-size: 0.75rem; padding-bottom: 8px;">더보기 ></a>
	</div>

	<div class="row g-4 mb-5">
		<div class="col-md-6">
			<div class="list-group list-group-flush border-top">
				<c:forEach items="${leftList}" var="board">
					<div
						class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
						<div class="text-truncate" style="max-width: 75%;">
							<a href="/board/get?bno=${board.bno}"
								class="text-decoration-none text-dark fw-bold"
								style="font-size: 0.85rem;">${board.title}</a><span
								class="text-primary small ms-1">(${board.replycnt})</span>
						</div>
						<span class="badge bg-light text-secondary border fw-normal"
							style="font-size: 0.7rem;">${board.writer}</span>
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
								style="font-size: 0.85rem;">${board.title}</a><span
								class="text-primary small ms-1">(${board.replycnt})</span>
						</div>
						<span class="badge bg-light text-secondary border fw-normal"
							style="font-size: 0.7rem;">${board.writer}</span>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>

	<div class="mt-5 mb-5 px-0">
    <div class="d-flex justify-content-between align-items-center mb-3 px-3">
        <h5 class="fw-bold mb-0">테크 지식 / 뉴스</h5>
        <a href="#" class="text-muted text-decoration-none small">더 보기 ></a>
    </div>
    
    <div id="techSlider" class="carousel slide position-relative" data-bs-ride="carousel" data-bs-interval="8000">
        
        <div class="carousel-indicators custom-dot-indicators">
            <button type="button" data-bs-target="#techSlider" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#techSlider" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#techSlider" data-bs-slide-to="2"></button>
            <button type="button" data-bs-target="#techSlider" data-bs-slide-to="3"></button>
            <button type="button" data-bs-target="#techSlider" data-bs-slide-to="4"></button>
            <button type="button" data-bs-target="#techSlider" data-bs-slide-to="5"></button>
            <button type="button" data-bs-target="#techSlider" data-bs-slide-to="6"></button>
            <button type="button" data-bs-target="#techSlider" data-bs-slide-to="7"></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row g-3 mx-0"> 
                    <c:choose>
                        <c:when test="${not empty techList1}">
                            <c:forEach items="${techList1}" var="tech">
                                <div class="col-md-4 px-2">
                                    <div class="card h-100 border-0 shadow-sm overflow-hidden" style="border-radius: 12px;">
                                        <div class="tech-card-img" style="background-image: url('${tech.thumbnail}'); height: 180px; background-size: cover; background-position: center;">
                                            <span class="badge bg-dark opacity-75 m-2 float-end">${tech.tag}</span>
                                        </div>
                                        <div class="card-body">
                                            <h6 class="fw-bold text-truncate">${tech.title}</h6>
                                            <p class="card-text small text-muted text-truncate-2">${tech.summary}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <div class="col-md-4 px-2">
                                <div class="card h-100 border-0 shadow-sm" style="border-radius: 12px; min-height: 280px;">
                                    <div style="height: 180px; background: #f8f9fa; display: flex; flex-direction: column; align-items: center; justify-content: center;">
                                        <i class="bi bi-image text-muted fs-2"></i>
                                        <span class="text-muted mt-2 small">이미지 준비중</span>
                                    </div>
                                    <div class="card-body">
                                        <h6 class="fw-bold">테크 뉴스 제목</h6>
                                        <p class="small text-muted">내용이 표시되는 영역입니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 d-none d-md-block px-2"><div class="bg-light rounded-3" style="height: 280px; opacity: 0.3;"></div></div>
                            <div class="col-md-4 d-none d-md-block px-2"><div class="bg-light rounded-3" style="height: 280px; opacity: 0.3;"></div></div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <button class="carousel-control-prev tech-overlap-btn" type="button" data-bs-target="#techSlider" data-bs-slide="prev">
            <span class="btn-round shadow-sm"><i class="bi bi-chevron-left"></i></span>
        </button>
        <button class="carousel-control-next tech-overlap-btn" type="button" data-bs-target="#techSlider" data-bs-slide="next">
            <span class="btn-round shadow-sm"><i class="bi bi-chevron-right"></i></span>
        </button>
    </div>
</div>
		<div class="mt-5 mb-5">
			<div class="d-flex align-items-center mb-4 w-100">
   
        <div class="d-flex align-items-center gap-2 p-2 no-scrollbar shadow-sm w-100" 
             style="background-color: #f8f9fa; border-radius: 12px; overflow-x: auto; border: 1px solid #eee;">
        
        <a href="#" class="filter-tab active">전체</a>
        <a href="#" class="filter-tab">사는얘기</a>
        <a href="#" class="filter-tab">AI</a>
        <a href="#" class="filter-tab">연봉·단가</a>
        <a href="#" class="filter-tab">취준생</a>
        <a href="#" class="filter-tab">스터디</a>
        <a href="#" class="filter-tab">프로젝트</a>
        <a href="#" class="filter-tab">모각코·모각공</a>
        <a href="#" class="filter-tab">멘토링·튜터링</a>
        <a href="#" class="filter-tab">모임·네트워킹</a>
        <a href="#" class="filter-tab">공모전·해커톤</a>
        <a href="#" class="filter-tab">IT 정책토론</a>
        <a href="#" class="filter-tab">피드백</a>
        <a href="#" class="filter-tab">Tech 뉴스</a>
        <a href="#" class="filter-tab">팀</a>
        <a href="#" class="filter-tab">칼럼</a>
        <a href="#" class="filter-tab">리뷰</a>
        <a href="#" class="filter-tab">IT보도자료</a>
        <a href="#" class="filter-tab">기술</a>
        <a href="#" class="filter-tab">커리어</a>
        <a href="#" class="filter-tab">기타</a>
        <a href="#" class="filter-tab">IT 행사</a>
        <a href="#" class="filter-tab">홍보·광고</a>
    </div>
				<button class="btn btn-white border ms-2 shadow-sm"
                        style="padding: 10px 14px; border-radius: 12px; background: #fff; height: 50px;">
                    <i class="bi bi-list-ul text-muted"></i>
                </button>
			</div>	
			
	<div class="post-list-container">
		<c:choose>
			<c:when test="${not empty boardList}">
				<c:forEach items="${boardList}" var="board">
					<div class="post-item p-3 mb-2 border-bottom bg-white"
						style="cursor: pointer;"
						onclick="location.href='${pageContext.request.contextPath}/board/get?bno=${board.bno}'">
						<div class="d-flex align-items-center gap-2 mb-1">
							<span class="text-muted"
								style="font-size: 12px; border: 1px solid #eee; padding: 2px 6px; border-radius: 4px;">커뮤니티</span>
							<span class="text-muted" style="font-size: 12px;">${board.writer}
								· <fmt:formatDate value="${board.regdate}" pattern="yyyy-MM-dd" />
							</span>
						</div>
						<h6 class="fw-bold mb-1" style="font-size: 15px;">${board.title}</h6>
						<p class="text-muted mb-2 text-truncate-2"
							style="font-size: 13px;">${board.content}</p>
						<div class="d-flex gap-3 text-muted" style="font-size: 12px;">
							<span><i class="bi bi-hand-thumbs-up"></i> 0</span> <span><i
								class="bi bi-chat-dots"></i> ${board.replycnt}</span> <span><i
								class="bi bi-eye"></i> 0</span>
						</div>
					</div>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<div class="text-center py-5 border rounded-3 bg-light text-muted">
					등록된 게시물이 없습니다. 첫 글을 남겨보세요!</div>
			</c:otherwise>
		</c:choose>
	</div>
</div>
</div>
<style>
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
    box-shadow: 0 2px 4px rgba(0,0,0,0.1); 
}

.text-truncate-2 {
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	overflow: hidden;
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
    box-shadow: 0 2px 4px rgba(0,0,0,0.1);
}
</style>

<script>
document.addEventListener("DOMContentLoaded", function() {
    const tabs = document.querySelectorAll('.filter-tab');
    
    tabs.forEach(tab => {
        tab.addEventListener('click', function(e) {
            e.preventDefault();            
            tabs.forEach(t => t.classList.remove('active'));           
            this.classList.add('active');            
            this.scrollIntoView({ behavior: 'smooth', inline: 'center', block: 'nearest' });
        });
    });
});
</script>
