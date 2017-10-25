<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board.*"%>
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>

<%
		String num = request.getParameter("num");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		BoardDBBean dto = bdao.getBoard(Integer.parseInt(num), "content"); 
%>
<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<%
		if (!isLogin){%>
		<script type="text/javascript">
			alert("�α����� ���� �� �ּ���!!")
			location.href="<%=request.getContextPath()%>/login/login.jsp"
		</script>	
<%		return;
		}
%>
<div align="center">
	<b>�۳��� ����</b>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="15%">�۹�ȣ</th>
			<td align="center" width="35%"><%=dto.getNum()%></td>
			<th bgcolor="yellow" width="15%">��ȸ��</th>
			<td align="center" width="35%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">�ۼ���</th>
			<td align="center" width="35%"><%=dto.getWriter()%></td>
			<th bgcolor="yellow" width="15%">�ۼ���</th>
			<td align="center" width="35%"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">������</th>
			<td align="center" colspan="3"><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">�۳���</th>
			<td colspan="3"><%=dto.getContent()%></td>
		</tr>
<%	if (dto.getFilesize()>0){ %>
		<tr>
			<th bgcolor="yellow" width="15%">���ϸ�</th>
			<td colspan="3"><%=dto.getFilename()%></td>
		</tr>
<%	} %>		
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="�ޱ۾���"
					onclick="window.location='writeForm.jsp?num=<%=dto.getNum()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'">
				<input type="button" value="�ۼ���"
					onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="�ۻ���"
					onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="�۸��" 
					onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp" %>



















