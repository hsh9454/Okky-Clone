<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container mt-4">
    <div class="rounded-3 mb-4 overflow-hidden shadow-sm" style="height: 150px; background: linear-gradient(90deg, #0d6efd, #000);">
        <div class="d-flex flex-column align-items-center justify-content-center h-100 text-white text-center">
            <h3 class="fw-bold mb-1">Find BUIDLer</h3>
            <p class="mb-0 opacity-75">2026 한화투자증권 디지털/글로벌 경력 채용</p>
        </div>
    </div>

    <div class="mb-2 d-flex justify-content-between align-items-end">
        <ul class="nav nav-pills p-1" id="mainBoardTab" style="background-color: #f1f3f5; border-radius: 12px; display: inline-flex;">
            <li class="nav-item">
                <a class="nav-link active shadow-sm" href="#" style="background-color: #fff !important; color: #333 !important; font-weight: 600; border-radius: 10px; font-size: 14px; padding: 6px 16px;">오늘의 인기글</a>
            </li>
            <li class="nav-item"><a class="nav-link text-muted" href="#" style="font-weight: 500; font-size: 14px; padding: 6px 16px;">이번주 인기글</a></li>
            <li class="nav-item"><a class="nav-link text-muted" href="#" style="font-weight: 500; font-size: 14px; padding: 6px 16px;">이달의 인기글</a></li>
            <li class="nav-item"><a class="nav-link text-muted" href="#" style="font-weight: 500; font-size: 14px; padding: 6px 16px;">공지사항</a></li>
        </ul>
        <a href="/board/list" class="text-muted text-decoration-none" style="font-size: 0.75rem; padding-bottom: 8px;">더보기 ></a>
    </div>

    <div class="row g-4 mb-5">
        <div class="col-md-6">
            <div class="list-group list-group-flush border-top">
                <c:forEach items="${leftList}" var="board">
                    <div class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
                        <div class="text-truncate" style="max-width: 75%;">
                            <a href="/board/get?bno=${board.bno}" class="text-decoration-none text-dark fw-bold" style="font-size: 0.85rem;">${board.title}</a>
                            <span class="text-primary small ms-1">(${board.replycnt})</span>
                        </div>
                        <span class="badge bg-light text-secondary border fw-normal" style="font-size: 0.7rem;">${board.writer}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="col-md-6">
            <div class="list-group list-group-flush border-top">
                <c:forEach items="${rightList}" var="board">
                    <div class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
                        <div class="text-truncate" style="max-width: 75%;">
                            <a href="/board/get?bno=${board.bno}" class="text-decoration-none text-dark fw-bold" style="font-size: 0.85rem;">${board.title}</a>
                            <span class="text-primary small ms-1">(${board.replycnt})</span>
                        </div>
                        <span class="badge bg-light text-secondary border fw-normal" style="font-size: 0.7rem;">${board.writer}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>

    <div class="mt-5 mb-5 px-0"> 
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h5 class="fw-bold mb-0">테크 지식 / 뉴스</h5>
        <a href="#" class="text-muted text-decoration-none small">더 보기 ></a>
    </div>

    <div id="techSlider" class="carousel slide position-relative" data-bs-ride="carousel" data-bs-interval="8000">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div class="row g-3 mx-n2"> 
                    <c:choose>
                        <c:when test="${not empty techList1}">
                            <c:forEach items="${techList1}" var="tech">
                                <div class="col-md-4 px-2">
                                    <div class="card h-100 border-0 shadow-sm overflow-hidden" style="border-radius: 12px;">
                                        <div class="tech-card-img" style="background-image: url('${tech.thumbnail}'); height: 180px;">
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
                                    <div class="empty-img-box" style="height: 180px; background: #f8f9fa; display: flex; flex-direction: column; align-items: center; justify-content: center;">
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
    </div>
</div>

<style>
.tech-overlap-btn {
    width: 40px !important;
}
.carousel-control-prev.tech-overlap-btn { left: -20px; }
.carousel-control-next.tech-overlap-btn { right: -20px; }

.btn-round {
    width: 40px;
    height: 40px;
    background-color: white;
    border: 1px solid #dee2e6;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: #333;
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
    padding: 0 !important;
    transition: background-color 0.3s ease;
}

.custom-dot-indicators button.active {
    background-color: #0d6efd !important; 
    opacity: 1 !important;
}
.text-truncate-2 {
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
}
</style>