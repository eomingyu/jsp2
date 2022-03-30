<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 내장객체</title>
</head>
<body>
	<ul>
		<li>스크립트릿 안에서만 사용하는 JSP 객체</li>
		<li>별도로 선언하지않고 사용할 수 있다.</li>
		<li>
			<ul>
				<li>request : HttpServletRequest, 브라우저에 전달하는 요청정보를 저장</li>
				<li>response : HttpServletResponse, 요청에 대한 응답을 저장</li>
				<li>out : JspWriter, JSP 페이지 출력 스트림 객체</li>
				<li>pageContext : PageContext , 요청을 처리하는 JSP 페이지 정보를 저장</li>
				<li>page : Object , 일반 자바객체(요청처리 웹서블릿 객체가 아닙니다.)</li>
				<li>config : ServletConfig, 웹애플리케이션 정보 저장</li>
				<li>session : HttpSession, 웹서버와 브라우저사이의 연결정보를 저장</li>
				<li>application : ServletContext, 웹애플리케이션의 context 정보를 저장</li>
				<!-- Object 타입 애트리뷰트 저장 활용한 객체 : request, session, application
					${ }로 애트리뷰트를 가져올 때 찾는 순서도 위의 순서입니다.
					단, 위에 있는 객체들을 ${ }에서 사용한다면 스크립트릿으로 사용할 때와 다릅니다.(추후 예제에서)
				 -->
			</ul>
		</li>
	</ul>
</body>
</html>