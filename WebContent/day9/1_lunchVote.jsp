<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//투표 실행은 여기서부터
	//처리내용 예시
	//투표하려면 로그인 해야한다. 또는 로그인 없이 투표할 수 있다.
	
	
	String vote_yn = request.getParameter("vote");
	if(vote_yn!=null && vote_yn.equals("n"))
		request.setAttribute("message","투표참여자가 아직 없습니다. 투표 후 결과를 보세요.!");
	if(vote_yn!=null && vote_yn.equals("c"))
		request.setAttribute("message","다음 투표는 최근 투표 3분 후에 할 수 있습니다.!");
	pageContext.forward("2_voteForm.jsp");
%>