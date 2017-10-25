<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.book.*" %>    
<jsp:useBean id="bdao" class="my.book.BookDAO" />
<%
		request.setCharacterEncoding("EUC-KR");
		String search = request.getParameter("search");
		String searchString = request.getParameter("searchString");
		if (search==null || searchString==null || search.trim().equals("") || 
				searchString.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
%>
<html>
<head>
	<title>����ã��</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� ã ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>������</th>
				<th>������</th>
				<th>���ǻ�</th>
				<th>�ǸŰ�</th>
				<th>�԰���</th>
			</tr>
<%	ArrayList<BookDTO> list = bdao.findBook(search, searchString);
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		if (list==null || list.size()==0){%>
			<tr>
				<td colspan="5">ã���ô� ������ �����ϴ�.</td>
			</tr>
<%	}else { 
			for(BookDTO dto : list){%>			
			<tr>
				<td><%=dto.getBookname()%></td>
				<td><%=dto.getWriter()%></td>
				<td><%=dto.getPublisher()%></td>
				<td><%=df.format(dto.getPrice())%></td>
				<td><%=dto.getIndate()%></td>
			</tr>	
<%		}%>
			<tr>
				<td colspan="5">ã���ô� ������ �� <%=list.size()%>�� �ֽ��ϴ�.</td>
			</tr>
<%	}%>			
		</table>

	</div>
</body>
</html>