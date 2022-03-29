<%@page import="hrd.dao.MemberDao"%>
<%@page import="hrd.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록 조회</title>
<link rel="stylesheet" href="0_hrdkorea.css">
</head>
<body>
	<div class="wrap_container">
	    <header>
	        <h3 class="header-item">쇼핑몰 회원관리 ver 1.0</h3>
	    </header>
	    <nav>
            <ul class="container">
                <li><a href="">회원등록</a></li>
                <li><a href="">회원목록조회/수정</a></li>
                <li><a href="">회원매출조회</a></li>
                <li><a href="">홈으로</a></li>
            </ul>
	    </nav>
	    <section>

			<h3 style="text-align: center;">회원 목록 조회/수정</h3>
			<div>
				<form action="4_memberList.jsp">
					<select name="column">
						<option value="a">이름</option>
						<option value="b">주소</option>
						<option value="c">고객등급</option>
						<option value="d">거주지역</option>
					</select>
					<input name="search" placeholder="검색할 이름 입력">
					<button>검색</button>
					<button type="button" onclick="location.href='memberList.jsp'">전체보기</button>
				</form>
			</div>

		
			<table style="width:70%;margin:auto; text-align: center;">
				<tr>
					<th>회원번호</th>
					<th>이름</th>
					<th>연락처</th>
					<th>주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>거주지역</th>
				</tr>
			<c:choose>
				<c:when test="${list.size()!=0}">
				<c:forEach var="member" items="${list}" varStatus="status">
				<tr>
					<td><a id="custno" href="5_updateForm.jsp?num=${member.custNo}">${member.custNo}</a></td>
					<td>${member.custName}</td>
					<td>${member.phone}</td>
					<td>${member.address}</td>
					<td>${member.joinDate}</td>
					<td>
					<c:if test="${member.grade=='A'}">
						<c:out value="VIP"/>
					</c:if>
					<c:if test="${member.grade=='B'}">
						<c:out value="일반"/>
					</c:if>
					<c:if test="${member.grade=='C'}">
						<c:out value="직원"/>
					</c:if>
					</td>
					<td>${member.city}</td>
				</tr>
				</c:forEach>
				</c:when>
				
				<c:otherwise>
				<tr>
					<td colspan="7">조회 결과가 없습니다.</td>
				</tr>
				</c:otherwise>
			</c:choose>
			</table>
		</section>
	    <footer>
	        HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
	    </footer>
    </div>	
</body>
</html>