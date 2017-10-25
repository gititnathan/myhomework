<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>회원 페이지</h1>
<% 
	String id = (String)session.getAttribute("id"); //getAttribute는 object형을 가져온다
	if(id == null){%>
		<script type = "text/javascript">
		alert("로그인을 해야만 볼 수 있어요")
		location.href="sessionTest1.jsp"
		</script>
	<%}
%>

<h3>회원들만 볼 수 있는 페이지입니다.</h3>
<h3>회원이 아니면 볼 수 없어야 합니다</h3>

<a href="sessionTest3.jsp">로그아웃</a>