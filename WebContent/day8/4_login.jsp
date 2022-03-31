<%@page import="test.vo.User"%>
<%@page import="hrd.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String email = request.getParameter("userid");
	String password = request.getParameter("password");

	MemberDao dao = MemberDao.getInstance();
	User user = dao.login(email, password);
	
	if(user==null){			//userid 또는 password가 옳지 않을 때
		response.sendRedirect("5_home.jsp?login=n");
	}else{
	//session 객체에 사용자 정보를 저장
		session.setAttribute("user", user);
		response.sendRedirect("5_home.jsp?login=y");
	}
%>