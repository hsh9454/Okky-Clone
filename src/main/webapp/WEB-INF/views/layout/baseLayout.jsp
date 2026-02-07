<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>OKKY 클론 코딩</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
   <style>
    body { background-color: #f2f4f7; font-family: 'Apple SD Gothic Neo', sans-serif; }
    .navbar { background-color: #fff; border-bottom: 1px solid #ddd; box-shadow: 0 1px 2px rgba(0,0,0,0.05); }
    .main-container { max-width: 1200px; margin: 0 auto; padding-top: 20px; }
    .content-card { background: #fff; border-radius: 8px; border: 1px solid #ddd; padding: 20px; margin-bottom: 20px; }
   
   .navbar { 
    height: 60px; 
    border-bottom: 1px solid #e5e7eb !important; 
    }
    .navbar-brand { color: #00b0ff !important; }
    </style>
    
</head>

<body>
    <nav class="navbar navbar-expand-lg sticky-top mb-3">
        <div class="container-fluid px-5">
            <tiles:insertAttribute name="header" />
        </div>
    </nav>

<div class="main-container">
    <div class="row justify-content-center">
        <div class="col-md-2 d-none d-xl-block text-end">
            <div class="content-card text-center text-muted border-0 shadow-sm py-4" style="position: sticky; top: 80px;">
                <small class="d-block mb-2 text-secondary">광고 배너 자리</small>
                <div class="bg-light rounded mb-3 mx-auto" style="height: 400px; width: 100%;"></div>
            </div>
        </div>

        <div class="col-md-9 col-lg-7">
            <div class="content-card shadow-sm border-0">
                <tiles:insertAttribute name="body" />
            </div>
        </div>

        <div class="col-md-3 col-xl-2 d-none d-lg-block">
            <div class="content-card text-center text-muted border-0 shadow-sm py-4" style="position: sticky; top: 80px;">
                <small class="d-block mb-2 text-secondary">광고 배너 자리</small>
                <div class="bg-light rounded mb-3" style="height: 400px;"></div>
                <div class="bg-light rounded" style="height: 200px;"></div>
            </div>
        </div>
    </div>
</div>
   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>