<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>활동 내역</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-container {
            text-align: center;
            margin-top: -75px; 
        }
        .profile-circle {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            border: 5px solid white;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .activity-box {
            background-color: white;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            margin-top: 30px;
        }
        .graph-wrapper {
            display: flex;
            justify-content: center;
            padding: 20px 0;
            overflow-x: auto;
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/views/layout/header.jsp" />

    <div class="container">
        <div class="profile-container">
            <img src="${sessionScope.loginMember.profileImg != null ? sessionScope.loginMember.profileImg : '/resources/img/default_profile.png'}" 
                 class="profile-circle" alt="프로필 사진">
            <h2 class="mt-3 font-weight-bold">${sessionScope.loginMember.nickname}</h2>
            <p class="text-muted">아직 소개를 작성하지 않았습니다.</p>
        </div>
        
        <div class="activity-box">
            <h4>활동 내역</h4>
            <hr>
            <div class="graph-wrapper">
                <p>깃허브 스타일 잔디 그래프 구역</p>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/views/layout/footer.jsp" />
</body>
</html>