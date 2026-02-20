<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OKKY 클론</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background-color: #f2f4f7; font-family: 'Apple SD Gothic Neo', sans-serif; margin: 0; }
        .navbar { background-color: #fff; border-bottom: 1px solid #ddd; height: 60px; }
        .okky-main-grid { display: flex; justify-content: center; gap: 20px; max-width: 1400px; margin: 20px auto; padding: 0 15px; }
        .side-banner { width: 160px; flex-shrink: 0; }
        .center-content { flex: 1; max-width: 800px; }
        .content-card { background: #fff; border-radius: 8px; border: 1px solid #ddd; padding: 20px; }
        .banner-sticky { position: sticky; top: 80px; }
    </style>
</head>

<body>
    <tiles:importAttribute name="showBanner" ignore="true" />
    <tiles:importAttribute name="body" ignore="true" />

    <nav class="navbar navbar-expand-lg sticky-top mb-3">
        <div class="container-fluid px-5">
            <tiles:insertAttribute name="header" />
        </div>
    </nav>

    <div class="okky-main-grid">
        
        <c:if test="${showBanner == 'true' || body == '/WEB-INF/views/main.jsp'}">
            <aside class="side-banner d-none d-xl-block">
                <div class="banner-sticky">
                    <div class="content-card text-center text-muted" style="height: 600px; border: 1px dashed #ddd;">
                        <small>LEFT AD</small>
                    </div>
                </div>
            </aside>
        </c:if>

        <main class="center-content">
            <div class="content-card shadow-sm border-0">
                <tiles:insertAttribute name="body" />
            </div>
        </main>

        <c:if test="${showBanner == 'true' || body == '/WEB-INF/views/main.jsp'}">
            <aside class="side-banner d-none d-lg-block">
                <div class="banner-sticky">
                    <div class="content-card text-center text-muted" style="height: 600px; border: 1px dashed #ddd;">
                        <small>RIGHT AD</small>
                    </div>
                </div>
            </aside>
        </c:if>

    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>