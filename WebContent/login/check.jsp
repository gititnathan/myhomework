<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="mbdao" class="my.member.MemberDAO" /> 
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application" /> 
<jsp:setProperty property="pool" name="mbdao" value="<%=pool%>" />  
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String id = request.getParameter("id");
		
		if (name==null || name.trim().equals("")){
			response.sendRedirect("login.jsp");
		 	return;
		} 
		String dbMsg = null;
		if (id==null || id.trim().equals("")){
			dbMsg = mbdao.searchId(name, ssn1, ssn2);
			if (dbMsg==null) dbMsg="아이디가 존재하지 않습니다.";
		}else {
			dbMsg = mbdao.searchPw(name, ssn1, ssn2, id);
			if (dbMsg==null) dbMsg="해당정보가 일치하지 않습니다.";
		}
%>
<script type="text/javascript">
	alert("<%=dbMsg%>")
	self.close()
</script>







