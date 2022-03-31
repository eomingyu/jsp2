<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String,Integer> vote = (Map<String,Integer>)application.getAttribute("vote");
	
	if(vote==null)
		response.sendRedirect("1_lunchVote.jsp?vote=n");
	else{
	out.print("쌀국수: ");
	out.print(vote.get("쌀국수"));
	out.print("<br>");
	
	out.print("짬뽕: ");
	out.print(vote.get("짬뽕"));
	out.print("<br>");
	
	out.print("삼겹살: ");
	out.print(vote.get("삼겹살"));
	out.print("<br>");
	
	out.print("오늘의백반: ");
	out.print(vote.get("오늘의백반"));
	out.print("<br>");
	
	out.print("치킨샐러드: ");
	out.print(vote.get("치킨샐러드"));
	out.print("<br>");
	
	//위의 출력문을 for문으로
	//- Map은 순서가 없는 자료구조로 인덱스가 없습니다.
	//- Map.Entry는 key와 value 한 쌍의 항목을 참조하는 타입
	out.print("<hr>");
	int total=0;
	for(Map.Entry<String,Integer> t: vote.entrySet()){
		out.print(t.getKey()+": ");
		out.print(t.getValue());
		out.print("<br>");
		total+=t.getValue();
	}
	out.print("총 투표수 : "+total);
	}
//컬렉션(Collection, 자료구조) : List,Map,Set


%>