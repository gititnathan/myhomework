<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<h1>ȸ�� ������</h1>
<% 
	String id = (String)session.getAttribute("id"); //getAttribute�� object���� �����´�
	if(id == null){%>
		<script type = "text/javascript">
		alert("�α����� �ؾ߸� �� �� �־��")
		location.href="sessionTest1.jsp"
		</script>
	<%}
%>

<h3>ȸ���鸸 �� �� �ִ� �������Դϴ�.</h3>
<h3>ȸ���� �ƴϸ� �� �� ����� �մϴ�</h3>

<a href="sessionTest3.jsp">�α׾ƿ�</a>