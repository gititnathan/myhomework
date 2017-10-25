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
			msg = check.getId()+"님, 반갑습니다.";
			url = request.getContextPath() +"/index.jsp";
			break;
		case LoginCheck.NOT_ID :
			msg = check.getId()+"는 없는 아이디 입니다.";
			break;
		case LoginCheck.NOT_PWD :
			msg = check.getId()+"님의 비밀번호가 틀렸습니다. 다시 확인해 주세요";
			break;
		case LoginCheck.ERROR :
			msg = "서버 오류 발생!! 관리자에게 연락 하세요";
			break;
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>











