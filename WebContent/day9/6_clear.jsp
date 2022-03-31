<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키 CHECK 삭제하기
	Cookie[] cookies = request.getCookies();
	Cookie temp=null;
	for(Cookie c: cookies){
		if(c.getName().equals("CHECK")){
			temp=c;
		}
	}
	if(temp!=null){				//초기화 후 또 초기화 오류 방지
	temp.setMaxAge(0);
	response.addCookie(temp);
	}
	//애트리뷰트 값 삭제
	application.removeAttribute("vote");
	response.sendRedirect("1_lunchVote.jsp");


%>