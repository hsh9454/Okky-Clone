<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:parseNumber value="${now.time / (1000*60)}" var="nowTime" integerOnly="true" />

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">

<style>
.dropdown-menu {
	border: 1px solid #e5e7eb;
	border-radius: 8px;
	padding: 8px 0;
	min-width: 120px;
	margin-top: 8px !important;
}

.dropdown-item {
	font-size: 14px;
	color: #4b5563;
	padding: 8px 16px;
	transition: all 0.2s;
}

.dropdown-item:hover {
	background-color: #f9fafb;
	color: #111827;
}

.dropdown-item.active {
	background-color: transparent !important;
	color: #00b0ff !important;
	font-weight: 700;
	position: relative;
}

.dropdown-item.active::before {
	content: '●';
	font-size: 8px;
	position: absolute;
	left: 6px;
	top: 50%;
	transform: translateY(-50%);
}

.top-ad-banner {
	width: 100%;
	margin-bottom: 20px;
	border-radius: 12px;
	overflow: hidden;
	background-color: #f3f4f6;
}

.top-ad-banner img {
	width: 100%;
	height: auto;
	max-height: 120px;
	display: block;
	object-fit: cover;
}

.top-banner-area {
	width: 100%;
	margin-bottom: 15px;
	border-radius: 12px;
	overflow: hidden;
	background-color: #1f2937;
	display: flex;
	justify-content: center;
	align-items: center;
}

.top-banner-area img {
	width: 100%;
	max-height: 120px;
	object-fit: cover;
	display: block;
}

.board-wrapper {
	padding: 20px;
	background-color: #fff;
	border-radius: 16px;
	border: 1px solid #e5e7eb;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.community-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 12px 20px;
	border-bottom: 1px solid #f1f3f5;
	background-color: #f9fafb;
}

.sub-menu-tabs {
	display: flex;
	gap: 4px;
}

.tab-item {
	text-decoration: none;
	color: #6b7280;
	font-size: 14px;
	font-weight: 500;
	padding: 8px 14px;
	border-radius: 6px;
	transition: all 0.2s ease;
}

.tab-item.active {
	background-color: #fff !important;
	color: #00b0ff !important;
	font-weight: 700 !important;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
	border: 1px solid rgba(0, 0, 0, 0.05) !important;
}

.tab-item:hover {
	color: #111827;
}

.header-actions {
	display: flex;
	align-items: center;
	gap: 8px;
}

.icon-btn-okky {
	width: 38px;
	height: 38px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #ffffff;
	border: 1px solid #e5e7eb;
	border-radius: 8px;
	color: #6b7280;
	cursor: pointer;
	transition: all 0.2s ease;
}

.icon-action-btn:hover {
	background-color: #f9fafb;
	border-color: #d1d5db;
	color: #111827;
}

.icon-action-btn:hover {
	background-color: #f9fafb;
	border-color: #d1d5db;
	color: #111827;
}

.icon-action-btn i {
	font-size: 18px;
}

.action-icon-btn {
	background: none;
	border: none;
	color: #9ca3af;
	font-size: 20px;
	cursor: pointer;
	display: flex;
	align-items: center;
}

.icon-btn-okky:hover {
	background-color: #f9fafb;
	border-color: #d1d5db;
	color: #111827;
}

.write-btn-okky {
	background-color: #00b0ff;
	color: white !important;
	padding: 9px 18px;
	border-radius: 8px;
	text-decoration: none;
	font-size: 14px;
	font-weight: 700;
	display: flex;
	align-items: center;
	gap: 8px;
	box-shadow: 0 1px 2px rgba(0, 176, 255, 0.3);
}

.write-btn-okky:hover {
	background-color: #0090d4;
}

.board-wrapper {
	padding: 20px;
	background-color: #fff;
	border-radius: 16px;
	border: 1px solid #e5e7eb;
	box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
}

.list-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
	border-bottom: 1px solid #e1e4e6;
	padding-bottom: 10px;
}

.list-table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

.list-table tr:last-child {
	border-bottom: none;
}

.list-table tr {
	border-bottom: 1px solid #f1f3f5;
	transition: background 0.1s ease-in-out;
}

.list-table tr:hover {
	background-color: #f9fafb;
}

.list-table td {
	padding: 12px 10px;
	vertical-align: middle;
}

.post-title {
	font-size: 16px;
	font-weight: 500;
	color: #333;
	text-decoration: none;
	display: block;
	margin-bottom: 5px;
}

.write-btn {
	background-color: #007bff;
	color: white;
	padding: 8px 16px;
	border-radius: 4px;
	text-decoration: none;
	font-size: 14px;
}
</style>

<div class="board-wrapper">
	<div class="top-ad-banner">
		<a href="https://okky.kr/articles/1510255" target="_blank"> <img src="https://img.okky.kr/banner/1710313838423.png" alt="광고 이미지"
			onerror="this.src='https://placehold.jp/24/1f2937/ffffff/1000x120.png?text=OKKY+AD+BANNER'">
		</a>
	</div>

	<div class="community-header">
		<div class="sub-menu-tabs">
			<c:if test="${not empty currentGroup}">
				<a href="${pageContext.request.contextPath}/board/list?group=${currentGroup}" class="tab-item ${empty param.category ? 'active' : ''}">전체</a>
			</c:if>

			<c:forEach items="${subCategories}" var="sub">
				<a href="${pageContext.request.contextPath}/board/list?group=${currentGroup}&category=${sub.id}" class="tab-item ${param.category == sub.id ? 'active' : ''}"> ${sub.name} </a>
			</c:forEach>
		</div>
		<div class="header-actions">
			<div class="dropdown">
				<button type="button" class="icon-btn-okky" id="sortDropdown" data-bs-toggle="dropdown" aria-expanded="false" title="정렬 방식">
					<i class="bi bi-filter-left"></i>
				</button>
				<ul class="dropdown-menu dropdown-menu-end shadow-sm" aria-labelledby="sortDropdown">
					<li>
						<a class="dropdown-item ${param.sort == 'newest' || empty param.sort ? 'active' : ''}" href="?group=${currentGroup}&category=${param.category}&sort=newest">최신순</a>
					</li>
					<li>
						<a class="dropdown-item ${param.sort == 'recommended' ? 'active' : ''}" href="?group=${currentGroup}&category=${param.category}&sort=recommended">추천순</a>
					</li>
					<li>
						<a class="dropdown-item ${param.sort == 'comments' ? 'active' : ''}" href="?group=${currentGroup}&category=${param.category}&sort=comments">댓글순</a>
					</li>
					<li>
						<a class="dropdown-item ${param.sort == 'views' ? 'active' : ''}" href="?group=${currentGroup}&category=${param.category}&sort=views">조회순</a>
					</li>
				</ul>
			</div>

			<button type="button" class="icon-btn-okky" title="게시판 설정">
				<i class="bi bi-gear"></i>
			</button>

			<a href="${pageContext.request.contextPath}/board/register?group=${currentGroup}&category=${param.category}" class="write-btn-okky"> <i class="bi bi-pencil-fill"></i> 작성하기
			</a>
		</div>
	</div>

	<table class="list-table">
		<tbody>
			<c:forEach items="${list}" var="board">
				<c:set var="nowMs" value="${now.time}" />
				<c:set var="regMs" value="${board.regdate.time}" />
				<c:set var="diffMin" value="${(nowMs - regMs) / (1000 * 60)}" />
				<fmt:parseNumber value="${diffMin}" integerOnly="true" var="minOnly" />

				<tr style="border-bottom: 1px solid #f2f2f2;">
					<td style="width: 50px; text-align: center; color: #adb5bd; font-size: 13px;">${board.bno}</td>
					<td style="padding: 15px 10px;">
						<div style="display: flex; align-items: center; margin-bottom: 8px;">
							<a href="${pageContext.request.contextPath}/board/list?category=${board.cat_id}" style="text-decoration: none;"> <span
								style="border: 1px solid #e1e1e1; border-radius: 4px; padding: 1px 6px; font-size: 11px; color: #888; background: #fff; margin-right: 10px; cursor: pointer;"> <c:out
										value="${board.cat_name}" />
							</span>
							</a> <span style="font-size: 13px; font-weight: 500; color: #555; margin-right: 6px;">${board.writer}</span> <span style="font-size: 12px; color: #999;"> · <c:choose>
									<c:when test="${minOnly < 1}">방금 전</c:when>
									<c:when test="${minOnly < 60}">${minOnly}분 전</c:when>
									<c:when test="${minOnly < 1440}">
										<fmt:parseNumber value="${minOnly / 60}" integerOnly="true" var="hourOnly" />
                                        약 ${hourOnly}시간 전
                                    </c:when>
									<c:otherwise>
										<fmt:parseNumber value="${minOnly / 1440}" integerOnly="true" var="dayOnly" />
                                        ${dayOnly}일 전
                                    </c:otherwise>
								</c:choose>
							</span>
						</div>

						<div style="display: flex; align-items: center;">
							<div style="margin-right: 8px;">
								<c:choose>
									<c:when test="${not empty board.user_img}">
										<img src="${pageContext.request.contextPath}/member/display?fileName=${board.user_img}" onerror="this.src='${pageContext.request.contextPath}/resources/img/default_profile.jpg'"
											style="width: 24px; height: 24px; border-radius: 50%; object-fit: cover;">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/resources/img/default_profile.jpg" style="width: 24px; height: 24px; border-radius: 50%; object-fit: cover;">
									</c:otherwise>
								</c:choose>
							</div>
							<a href="${pageContext.request.contextPath}/board/get?bno=${board.bno}" style="text-decoration: none; color: #222; font-size: 15px; font-weight: 600;"> ${board.title} </a>
							<c:if test="${board.isNew()}">
								<span
									style="display: inline-block; background: #fce4ec; color: #f06292; font-size: 9px; width: 15px; height: 15px; line-height: 15px; text-align: center; border-radius: 50%; margin-left: 6px; font-weight: bold;">N</span>
							</c:if>
						</div>
					</td>
					<td style="width: 120px; text-align: right; padding-right: 20px;">
						<div style="display: flex; justify-content: flex-end; align-items: center; gap: 10px; color: #999; font-size: 13px;">
							<span><i class="far fa-eye"></i> ${board.viewcnt}</span> <span><i class="far fa-thumbs-up"></i> ${board.likecnt}</span>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
