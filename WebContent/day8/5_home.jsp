<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
</head>
<body>
	<h3>여기는 HOME입니다.</h3>
	<hr>
	<div>
		로그인 했을까요? : ${user!=null}
	</div>
	<div>
	<c:if test="${user==null}">
		<button type="button" onclick="location.href='3_loginForm.jsp'">
		로그인
		</button>
	</c:if>
	<c:if test="${user!=null}">		<!-- 로그인 완료되었을 때 화면에 표시 -->
		<h5>${user.name}님 환영합니다.</h5>
		<button type="button" onclick="location.href='6_logout.jsp'">
		로그아웃
		</button>
	</c:if>
	</div>
	<script type="text/javascript">
		if('${param.logout}'=='y')
			alert('로그아웃 되었습니다.')
	</script>
</body>
</html>