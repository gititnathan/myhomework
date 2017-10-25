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
			msg = "로그인 되었습니다. 회원페이지로 이동합니다..";
			url = "sessionTest2.jsp";
		}else{
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요.";
			url = "sessionTest1.jsp";
		}
	}else{
		msg = "아이디가 틀렸습니다. 다시 입력해 주세요";
		url = "sessionTest1.jsp";
	}
%>

<script type="text/javascript">
	alert("<%=msg %>")
	location.href="<%=url %>"
</script>

