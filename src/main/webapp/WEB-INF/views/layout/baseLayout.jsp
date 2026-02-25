<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>OKKY 클론</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
<link rel="icon"
	href="data:;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAAdgAAAHYBT9761QAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAAnSURBVDhPY/z//z8DJYCJgUIAn7fB8P///8v///+fBv9RMApGwSgAAK9fEA8S+XmNAAAAAElFTkSuQmCC">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
.body {
	background-color: #f2f4f7;
	font-family: 'Apple SD Gothic Neo', sans-serif;
	margin: 0;
}

.navbar {
	background-color: #fff;
	border-bottom: 1px solid #ddd;
	height: 60px;
}

.okky-main-grid {
	display: flex;
	justify-content: center;
	gap: 20px;
	max-width: 1400px;
	margin: 20px auto;
	padding: 0 15px;
}

.side-banner {
	width: 160px;
	flex-shrink: 0;
}

.center-content {
	flex: 1;
	min-width: 0;
}

.content-card {
	background: #fff;
	border-radius: 8px;
	border: 1px solid #ddd;
	padding: 20px;
}

.banner-sticky {
	position: sticky;
	top: 80px;
}

.okky-nav-group {
	position: static;
	display: flex;
	align-items: center;
}

.okky-nav-group .nav-link {
	padding: 0 10px;
	white-space: nowrap;
}

.mega-dropdown-panel {
	display: none;
	position: absolute;
	top: 60px;
	left: 0;
	width: 100%;
	background: #fff;
	z-index: 1100;
	padding: 2rem calc(( 100vw - 1200px)/2);
}

.okky-nav-group:hover .mega-dropdown-panel {
	display: flex !important;
	justify-content: center;
}

.menu-col {
	flex: 1;
	padding: 0 25px;
	border-right: 1px solid #f1f3f5;
}

.menu-col:last-child {
	border-right: none;
}

.badge-new {
	font-size: 10px;
	background-color: #e7f5ff;
	color: #339af0;
	padding: 1px 4px;
	border-radius: 4px;
	margin-left: 4px;
	vertical-align: middle;
}

.text-orange {
	color: #f76707;
}

.text-purple {
	color: #7048e8;
}

.mega-dropdown-panel .dropdown-item {
	padding: 0.25rem 0;
	color: #666;
	font-size: 0.9rem;
}

.mega-dropdown-panel .dropdown-item:hover {
	color: #007bff;
	background: none;
}

.okky-nav-group:hover .mega-dropdown-panel {
	display: block;
}
</style>
</head>

<body>
	<tiles:importAttribute name="showBanner" ignore="true" />
	<tiles:importAttribute name="body" ignore="true" />

	<nav class="navbar navbar-expand-lg sticky-top mb-3">
		<div class="container" style="max-width: 1400px;">
			<tiles:insertAttribute name="header" />
		</div>
	</nav>

	<div class="okky-main-grid">

		<c:if
			test="${showBanner == 'true' || body == '/WEB-INF/views/main.jsp'}">
			<aside class="side-banner d-none d-xl-block">
				<div class="banner-sticky">
					<div class="text-center" style="height: 600px; overflow: hidden;">
						<c:choose>
							<c:when test="${not empty leftAds}">
								<c:forEach items="${leftAds}" var="ad">
									<a href="${ad.linkUrl}" target="_blank"> <img
										src="${ad.imgUrl}" alt="${ad.title}"
										style="width: 100%; height: 100%; object-fit: contain;">
									</a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="content-card text-center text-muted"
									style="height: 600px;">
									<small>LEFT AD</small>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</aside>
		</c:if>

		<main class="center-content">
			<div class="content-card shadow-sm border-0">
				<tiles:insertAttribute name="body" />
			</div>
		</main>

		<c:if
			test="${showBanner == 'true' || body == '/WEB-INF/views/main.jsp'}">
			<aside class="side-banner d-none d-lg-block">
				<div class="banner-sticky">
					<div class="text-center" style="height: 600px; overflow: hidden;">
						<c:choose>
							<c:when test="${not empty rightAds}">
								<c:forEach items="${rightAds}" var="ad">
									<a href="${ad.linkUrl}" target="_blank"> <img
										src="${ad.imgUrl}" alt="${ad.title}"
										style="width: 100%; height: 100%; object-fit: contain;">
									</a>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<div class="content-card text-center text-muted"
									style="height: 600px;">
									<small>RIGHT AD</small>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</aside>
		</c:if>

	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>