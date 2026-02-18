<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<div class="container">
	<h2>마이페이지</h2>
	<hr>

	<div class="row">
		<div class="col-md-4">
    <div class="profile-img-card"
        style="width: 200px; height: 200px; border: 1px solid #ddd; margin-bottom: 10px; display: flex; align-items: center; justify-content: center; overflow: hidden;">        
        <c:if test="${not empty user.userImg}">
            <img src="${pageContext.request.contextPath}/member/display?fileName=${user.userImg}" 
                 style="width: 100%; height: 100%; object-fit: cover;">
        </c:if>
        <c:if test="${empty user.userImg}">
            <p style="color: #999; margin: 0;">이미지 없음</p>
        </c:if>
    </div>
    <form action="${pageContext.request.contextPath}/member/modifyImg"
        method="post" enctype="multipart/form-data">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
        <input type="hidden" name="userid" value="${user.userid}"> 
        <input type="file" name="uploadFile" class="form-control">
        <button type="submit" class="btn btn-primary mt-2">이미지 변경</button>
    </form>
</div>

		<div class="col-md-8">
			<h4>내 정보</h4>
			<p>아이디: ${user.userid}</p>

			<p>닉네임: ${user.nickname}</p>

			<p>포인트: ${user.userPoint}</p>
			<p>가입일: ${user.regdate}</p>
		</div>
	</div>
</div>