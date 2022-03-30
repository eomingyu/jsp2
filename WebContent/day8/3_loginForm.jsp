<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<div>
		<form action="4_login.jsp" method="post">
			<input type ="text" name="userid" placeholder="아이디(이메일)을 입력하세요."><br>
			<input type ="password" name="password" placeholder="비밀번호를 입력하세요."><br>
			<button>로그인</button>
			<button type="button" onclick="location.href='5_home.jsp'">HOME</button>
		
		</form>
	</div>
</body>
</html>