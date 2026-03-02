<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
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
				<tr style="border-bottom: 1px solid #f2f2f2;">
					<td
						style="width: 50px; text-align: center; color: #adb5bd; font-size: 13px;">${board.bno}</td>
					<td style="padding: 15px 10px;">
						<div
							style="display: flex; align-items: center; margin-bottom: 8px;">
							<a
								href="${pageContext.request.contextPath}/board/list?category=${board.cat_id}"
								style="text-decoration: none;"> <span
								style="border: 1px solid #e1e1e1; border-radius: 4px; padding: 1px 6px; font-size: 11px; color: #888; background: #fff; margin-right: 10px; cursor: pointer;">
									<c:out value="${board.cat_name}" />
							</span>
							</a> <span
								style="font-size: 13px; font-weight: 500; color: #555; margin-right: 6px;">${board.writer}</span>
							<span style="font-size: 12px; color: #999;"> ·
								${board.timeGap}</span>
						</div>

						<div style="display: flex; align-items: center;">
							<div style="margin-right: 8px;">
								<img
									src="${pageContext.request.contextPath}/member/display?fileName=${board.user_img}"
									onerror="this.src='${pageContext.request.contextPath}/resources/img/default_profile.jpg'"
									style="width: 24px; height: 24px; border-radius: 50%; object-fit: cover;">
							</div>
							<a href="${pageContext.request.contextPath}/board/get?bno=${board.bno}"
								style="text-decoration: none; color: #222; font-size: 15px; font-weight: 600;">
								${board.title} </a>
							<c:if test="${board.isNew()}">
								<span
									style="display: inline-block; background: #fce4ec; color: #f06292; font-size: 9px; width: 15px; height: 15px; line-height: 15px; text-align: center; border-radius: 50%; margin-left: 6px; font-weight: bold;">N</span>
							</c:if>
						</div>
					</td>
					<td style="width: 120px; text-align: right; padding-right: 20px;">
						<div
							style="display: flex; justify-content: flex-end; align-items: center; gap: 10px; color: #999; font-size: 13px;">
							<span><i class="far fa-eye"></i> ${board.viewcnt}</span> <span><i
								class="far fa-thumbs-up"></i> ${board.likecnt}</span>
						</div>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>