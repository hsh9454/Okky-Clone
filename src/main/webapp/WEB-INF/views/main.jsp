<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container mt-4">
    <div class="rounded-3 mb-4 overflow-hidden shadow-sm" style="height: 150px; background: linear-gradient(90deg, #0d6efd, #000);">
        <div class="d-flex flex-column align-items-center justify-content-center h-100 text-white text-center">
            <h3 class="fw-bold mb-1">Find BUIDLer</h3>
            <p class="mb-0 opacity-75">2026 한화투자증권 디지털/글로벌 경력 채용</p>
        </div>
    </div>

    <div class="mb-3 d-flex justify-content-between align-items-center">
        <h6 class="fw-bold m-0 text-dark">오늘의 인기글</h6>
        <small class="text-muted" style="cursor:pointer; font-size: 0.75rem;">더보기 ></small>
    </div>

    <div class="row g-3 mb-5">
        <c:forEach items="${boardList}" var="board">
            <div class="col-md-6">
                <div class="list-group list-group-flush border-top">
                    <div class="list-group-item d-flex justify-content-between align-items-center py-2 px-0 bg-transparent border-bottom">
                        <div class="text-truncate" style="max-width: 80%;">
                            <span class="fw-medium" style="font-size: 0.85rem;">${board.title}</span>
                            <span class="text-primary small ms-1">(0)</span>
                            <span class="badge bg-danger ms-1" style="font-size: 0.6rem;">N</span>
                        </div>
                        <span class="badge bg-light text-secondary border fw-normal" style="font-size: 0.7rem;">${board.writer}</span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>