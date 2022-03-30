<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그아웃 : 현재 session 객체(세션ID)를 무효화
	session.invalidate();

	response.sendRedirect("5_home.jsp?logout=y");


%>