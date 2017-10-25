<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.login.*" %>
<jsp:useBean id="check" class="my.login.LoginCheck" />
<jsp:setProperty property="*" name="check"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="check" value="<%=pool%>"/>

<%
		if (check.getId()==null || check.getId().trim().equals("")){
			response.sendRedirect("login.jsp");
			return;
		}

		String saveId = request.getParameter("saveId");

		int res = check.loginCheck();
		String msg = null, url = "login.jsp";
		switch(res){
		case LoginCheck.OK :
			Cookie ck = new Cookie("saveId", check.getId());
			if (saveId == null) ck.setMaxAge(0);
			else ck.setMaxAge(12*60*60);
			response.addCookie(ck);
			session.setAttribute("mbId", check.getId());
			msg = check.getId()+"��, �ݰ����ϴ�.";
			url = request.getContextPath() +"/index.jsp";
			break;
		case LoginCheck.NOT_ID :
			msg = check.getId()+"�� ���� ���̵� �Դϴ�.";
			break;
		case LoginCheck.NOT_PWD :
			msg = check.getId()+"���� ��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� Ȯ���� �ּ���";
			break;
		case LoginCheck.ERROR :
			msg = "���� ���� �߻�!! �����ڿ��� ���� �ϼ���";
			break;
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>











