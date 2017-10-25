<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
	<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="stdao" class="my.student.StudentDAO" /> 
<!-- delete.jsp -->

<%
	//1.넘어온 데이타를 받기
	request.setCharacterEncoding("EUC-KR"); //한글로 받아주는 거 입력해야됨!
	String id = request.getParameter("id"); 

	if (id == null || id.trim().equals("")) {
		response.sendRedirect("student.jsp");
		return;
			}
	int res =stdao.deleteStudent(id);
	
	//6.전송결과에 따라 목록보기나 등록하기로 분기하기
	
	if(res>0) {%>
	<script type ="text/javascript">
	alert("학생삭제성공!!")
	location.href="list.jsp"
	
	</script>
	<% }else {%>
	<script type ="text/javascript">
	alert("학생삭제실패")
	location.href="student.jsp"
	</script>
	<% }

	%>
