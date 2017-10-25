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
		
		BoardDBBean dto = bdao.getBoard(Integer.parseInt(num), "update"); 
%>
<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("�̸��� �Է��� �ּ���!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("������ �Է��� �ּ���!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("������ �Է��� �ּ���!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("��й�ȣ�� �Է��� �ּ���!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<div align="center">
	<form name="f" action="updatePro.jsp" method="post"
														onsubmit="return check()">
	<h3>�ۼ���</h3>
	<input type="hidden" name="num" value="<%=num%>"/>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td><input type="text" name="writer" class="box" value="<%=dto.getWriter()%>"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td><input type="text" name="subject" class="box" size="50" value="<%=dto.getSubject()%>"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">Email</th>
			<td><input type="text" name="email" class="box" size="50" value="<%=dto.getEmail()%>"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">�� ��</th>
			<td><textarea name="content" rows="13" cols="50" class="box"><%=dto.getContent()%></textarea></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">��й�ȣ</th>
			<td><input type="password" name="passwd" class="box"></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="�ۼ���">
				<input type="reset" value="�ٽ��ۼ�">
				<input type="button" value="��Ϻ���" 
											onclick="window.location='list.jsp'">
			</td>	
		</tr>
	</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>