<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입</h2>
    <form action="/member/join" method="post">
        <div>
            <label>이메일(아이디):</label>
            <input type="text" name="userid" required>
        </div>
        <div>
            <label>비밀번호:</label>
            <input type="password" name="userpw" required>
        </div>
        <div>
            <label>닉네임:</label>
            <input type="text" name="nickname" required>
        </div>
        <button type="submit">가입하기</button>
    </form>
</body>
</html>