<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- prefix : 접두어 (단어 앞에 들어가는 문자)-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL(JSP Standard Tag Library)연습</title>
</head>
<body>
<h4>자바 변수처럼 값을 저장하기</h4>
<c:set var="age" value="10"/>
age : ${age} <br> <!-- 일반적으로 el 출력은 c:out 태그로 합니다. -->
<c:out value="age : ${age}"/>
<hr>

<!-- c:if 조건은 test 속성에 el로 작성합니다. -->
<c:if test="${age<20}">
	<div style="color:green;">청소년입니다.</div>
</c:if>
<hr>

<h4>if~else 형식 : else에 해당하는 태그가 없습니다.</h4>
<c:set var="age" value="24"/>
<c:choose>
	<c:when test="${age<20}">
		<div style="color:green;">청소년입니다.</div>
	</c:when>
	<c:otherwise>
		<div style="color:blue;">성인입니다.</div>
	</c:otherwise>
</c:choose>

<hr>
<!-- 스크립트릿에서 for문을 작성하는 것 대신 사용 -->
<c:forEach var="i" begin="1" end="10" varStatus="status" step="2">
	<c:out value="${i }"/><br>				<!-- for 시작 값은 1, 마지막 값은 10, 변수명은 var로 지정-->
	<c:out value="(${status.index })"/><br>	
	<!-- 몇 번째 값인지를 나타내는 index 출력, varStatus는 for 동작의 상태를 참조할 변수명-->
</c:forEach>

<hr>
<!-- status.count는 현재 순서를 1부터 나타내는 값 -->
<c:set var="names" value="사나,나나,나연,다현"/>
<ul>
<c:forTokens items="${names}" delims="," var="member">
<!-- items의 문자열을 ,로 구분해서 순서대로 member 변수에 참조시킵니다. -->
	<li><c:out value="${member }"></c:out></li>
</c:forTokens>
</ul>

<hr>
<h4>파라미터 값을 el로 가져오기 : 파라미터 객체 param</h4>
<hr>
cnt 파라미터 : ${param.cnt}<br>
name 파라미터 : ${param.name}<br>
</body>
</html>