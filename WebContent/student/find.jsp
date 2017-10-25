<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.student.*" %>     
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		if (name==null || name.trim().equals("")){
			response.sendRedirect("student.jsp");
			return;
		}
%>
<html>
<head>
	<title>학생찾기</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>학 생 찾 기</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>아이디</th>
				<th>학생명</th>
				<th>학급명</th>
			</tr>
<%	ArrayList<StudentDTO> list = stdao.findStudent(name); 
		if (list==null || list.size()==0){%>
			<tr>
				<td colspan="3">찾으시는 학생이 없습니다.</td>
			</tr>
<%	}else { 
			for(StudentDTO dto : list){%>			
			<tr>
				<td><%=dto.getId()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getCname()%></td>
			</tr>	
<%		}%>
			<tr>
				<td colspan="3">찾으시는 학생은 총 <%=list.size()%>명 있습니다.</td>
			</tr>		
<%	}%>		
		</table>			
	</div>
</body>
</html>





