<%@page import="hrd.dao.MemberDao"%>
<%@page import="hrd.vo.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- 함수 fn은 태그가 아닌 el과 함께 사용합니다. -->
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
				<form action="memberSearch.jsp">
					<select name="column" id="column">
						<option value="name">이름</option>
						<option value="address">주소</option>
						<option value="grade">고객등급</option>
						<option value="city">거주지역</option>
					</select>
					<!-- 아래 find는 2개 중에 하나만 화면에 표시  -->
					<span id="content">
						<input name="find" placeholder="검색할 내용 입력" value="${find}">
					</span>
					<span id="grade">
						<select name="find" id="grades">
						<!-- 사용자 선택하는 텍스트와 db테이블에 저장된 값이 다릅니다. -->
							<option value="A">VIP</option>
							<option value="B">일반</option>
							<option value="C">직원</option>
						</select>
					</span>
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
<c:forEach var="member" items="${list}" varStatus="status">
				<tr>
					<td><a id="custno" href="5_updateForm.jsp?num=${member.custNo}">${member.custNo}</a></td>
					<td>${member.custName}</td>
					<td>${member.phone}</td>
					<td>${member.address}</td>
					<td>${member.joinDate}</td>
					<td>${member.grade=='A'?'VIP':(member.grade=='B'?'일반':'직원')}
					<!-- 조건연산형식 : 조건? 참 실행:거짓 실행   중첩 가능--> 
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
<!-- list의 데이터가 없을 때 list애트리뷰트가 null X,size()가 0(jstl의 함수) -->
<c:if test="${fn:length(list)==0 }">
				<tr>
					<td colspan="7">조회 결과가 없습니다.</td>
				</tr>
</c:if>
			</table>
		</section>
	    <footer>
	        HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea
	    </footer>
    </div>
   <script type="text/javascript">
   		//조회 후에 select 남아있게 하기
		const sel = document.querySelectorAll("#column>option");	/* > 자식요소  */
				//console.log(sel);
				//let status=1;		//forEach에서 상태 체크할 때 사용할 변수
		sel.forEach(function(item){
			if(item.value=='${column}'){
				item.selected='selected';
				//column 애트리뷰트 값과 일치하는 option 항목일 때입니다.
			}
		});
		document.querySelectorAll("#grades>option").forEach(function(item){
			if(item.value=='${find}'){
				item.selected='selected';
			}
		});
		//화면 표시 변경하기
 		const grade = document.getElementById('grade');		//span grade
		const content = document.getElementById('content');
		if('${column}'=='grade'){
			grade.style.display='inline-block';
			content.style.display='none';
		}else{
			content.style.display='inline-block';
			grade.style.display='none';
		}
 		//검색 컬럼 선택 변경될 때
		document.getElementById('column').addEventListener("change",changeView);
		
		function changeView(){
			const col = document.forms[0].column.value;
			if(col=='grade'){
				grade.style.display='inline-block';
				content.style.display='none';
			}else{
				content.style.display='inline-block';
				grade.style.display='none';
				//form 요소 가져오기
				document.forms[0].elements[1].value="";
			}
		}
		
		//grade.style.display='none';		//안보이게 하는 방법
   </script> 
    	
</body>
</html>