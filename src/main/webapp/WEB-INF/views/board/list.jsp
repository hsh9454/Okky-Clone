<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h2>게시글 목록</h2>
<table border="1">
    <thead>
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach items="${list}" var="board">
            <tr>
                <td>{board.bno}</td>
                <td>
                    <a href="/myFiestProject/member/get?bno+${board.bno}">${board.title}</a>
                </td>
                <td>${board.writer}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>                  

<br>
<a href="/myFirstProject/member/register">글쓰기</a>