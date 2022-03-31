<%@page import="java.time.ZoneId"%>
<%@page import="java.time.ZonedDateTime"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//쿠키 : 웹브라우저에 저장되는 작은 크기의 데이터(2KB, 4KB 이내)
	//	개발자도구에서 확인 Application 탭  - Cookies 항목 접속 url 각각 확인할  수 있습니다.
	// 	세션ID 값도 쿠키 항목입니다. Cookie 객체를 생성해서 저장합니다.
	
	//쿠키 생성
	Cookie cookie = new Cookie("test","JAVA자바(=):");	//쿠키의 name(알파벳과 숫자),value 타입 String
	//쿠키데이터 유효시간, 경로설정 가능. 기본값은? 유효시간은  session, 경로는 현재위치 /jsp2/day9
	
	//웹브라우저에 저장
	response.addCookie(cookie);
	
	//쿠키 읽어오기
	Cookie[] cookies = request.getCookies();
	for(Cookie c : cookies){
		System.out.println(c.getName() + ":" + c.getValue());
	}
	Cookie cookie2 = new Cookie("test1","TIMECHECK");
	cookie2.setMaxAge(3*60);
	response.addCookie(cookie2);
	out.print(ZonedDateTime.now(ZoneId.of("UTC")));	//유효시간 확인을 위해 표준시간 출력
	
	out.print("<br>");
	//특정한 이름의 쿠키값 가져오기
	for(Cookie c : cookies){
		if(c.getName().equals("test1"))
			out.print(c.getName() + ":" + c.getValue());
	}
	
%>