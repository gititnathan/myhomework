<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	if(id==null || pwd == null || id.trim().equals("") || pwd.trim().equals("")){
		response.sendRedirect("sessionTest1.jsp");
		return;
	}
	
	String msg = null, url = null;
	if(id.equals("admin")){
		if(pwd.equals("1234")){
			msg = "�α��� �Ǿ����ϴ�. ȸ���������� �̵��մϴ�..";
			url = "sessionTest2.jsp";
		}else{
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���.";
			url = "sessionTest1.jsp";
		}
	}else{
		msg = "���̵� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���";
		url = "sessionTest1.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>")
	location.href="<%=url %>"
</script>

