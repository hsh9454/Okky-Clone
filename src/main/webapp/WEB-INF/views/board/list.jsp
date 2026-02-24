<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.board-wrapper {
	padding: 20px;
	background-color: #fff;
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
}

.list-table tr {
	border-bottom: 1px solid #f1f3f5;
	transition: background 0.1s ease-in-out;
}

.list-table tr:hover {
	background-color: #f8f9fa;
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

.post-meta {
	font-size: 13px;
	color: #868e96;
}

.post-meta .writer {
	color: #495057;
	font-weight: bold;
	margin-right: 8px;
}

/* 글쓰기 버튼 */
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
	<div class="list-header">
		<h2>커뮤니티 게시글</h2>
		<a href="${pageContext.request.contextPath}/board/register"
			class="write-btn">글쓰기</a>
	</div>

	<table class="list-table">
		<tbody>
			<c:forEach items="${list}" var="board">
				<tr>
					<td style="width: 50px; text-align: center; color: #adb5bd;">${board.bno}</td>
					<td
						style="display: flex; justify-content: space-between; align-items: center;">
						<div>
							<a
								href="${pageContext.request.contextPath}/board/get?bno=${board.bno}"
								class="post-title"> <c:out value="${board.title}" />
							</a>

							<div class="post-meta">
								<span
									style="color: #007bff; font-weight: bold; margin-right: 8px;">
									[${board.cat_name}] </span>
								<c:choose>
									<c:when test="${not empty board.user_img}">
										<img
											src="${pageContext.request.contextPath}/member/display?fileName=${board.user_img}"
											alt="프로필"
											style="width: 24px; height: 24px; border-radius: 50%; vertical-align: middle;">
									</c:when>
									<c:otherwise>
										<img
											src="${pageContext.request.contextPath}/resources/img/default-profile.jpg"
											alt="기본프로필"
											style="width: 24px; height: 24px; border-radius: 50%; vertical-align: middle;">
									</c:otherwise>
								</c:choose>
								<span class="writer">${board.writer}</span> <span> <fmt:formatDate
										value="${board.regdate}" pattern="yyyy-MM-dd" />
								</span>
							</div>
						</div>

						<div class="author-profile">
							<c:choose>
								<c:when test="${not empty board.user_img}">
									<img
										src="${pageContext.request.contextPath}/member/display?fileName=${board.user_img}"
										style="width: 32px; height: 32px; border-radius: 50%; object-fit: cover;">
								</c:when>
								<c:otherwise>
									<img
										src="${pageContext.request.contextPath}/resources/img/default-profile.jpg"
										style="width: 32px; height: 32px; border-radius: 50%;">
								</c:otherwise>
							</c:choose>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>