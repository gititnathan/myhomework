<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.book.*"%>
<jsp:useBean id="bdao" class="my.book.BookDAO" />
<!-- list.jsp -->
<html>
<head>
	<title>�������</title>
</head>
<body>
	<div align="center">
		<hr color="green" width="300">
		<h2>�� �� �� �� �� ��</h2>
		<hr color="green" width="300">
		<table border="1" width="500">
			<tr>
				<th>������</th>
				<th>������</th>
				<th>���ǻ�</th>
				<th>�ǸŰ�</th>
				<th>�԰���</th>
			</tr>
<%	ArrayList<BookDTO> list = bdao.listBook(); 
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");
		if (list==null || list.size()==0){%>
			<tr>
				<td colspan="5">��ϵ� ������ �����ϴ�.</td>
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
<%		}
		}%>			
		</table>

	</div>
</body>
</html>










