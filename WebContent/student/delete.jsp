<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
	<%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="stdao" class="my.student.StudentDAO" /> 
<!-- delete.jsp -->

<%
	//1.�Ѿ�� ����Ÿ�� �ޱ�
	request.setCharacterEncoding("EUC-KR"); //�ѱ۷� �޾��ִ� �� �Է��ؾߵ�!
	String id = request.getParameter("id"); 

	if (id == null || id.trim().equals("")) {
		response.sendRedirect("student.jsp");
		return;
			}
	int res =stdao.deleteStudent(id);
	
	//6.���۰���� ���� ��Ϻ��⳪ ����ϱ�� �б��ϱ�
	
	if(res>0) {%>
	<script type ="text/javascript">
	alert("�л���������!!")
	location.href="list.jsp"
	
	</script>
	<% }else {%>
	<script type ="text/javascript">
	alert("�л���������")
	location.href="student.jsp"
	</script>
	<% }

	%>
