<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- top.jsp -->
<html>
<head>
	<title>Ȩ������</title>
	<link rel="stylesheet" type="text/css" href="style.css">
	<script type="text/javascript">
		function joinMember(){
			window.open("<%=request.getContextPath()%>/member/memberSsn.jsp", "check", 
					"width=600, height=400");
		}
	</script>
</head>
<%
		boolean isLogin = false;
		String mbId = (String)session.getAttribute("mbId");
		if (mbId != null) {
			isLogin = true;
		}
%>
<body>
	<table border="1" align="center" width="800" height="600">
		<tr height="10%">
			<td align="center" colspan="2">
				<a href="<%=request.getContextPath()%>/index.jsp">MAIN</a> | 
<%		if (isLogin){ %>
				<a href="<%=request.getContextPath()%>/login/logout.jsp">�α׾ƿ�</a> |
<%		}else { %>				
				<a href="<%=request.getContextPath()%>/login/login.jsp">�α���</a> |
<%		} %>				 
				<a href="javascript:joinMember()">ȸ������</a> | 
				<a href="<%=request.getContextPath()%>/member/memberAll.jsp">ȸ������</a> |
				<a href="<%=request.getContextPath()%>/member/memberAll.jsp?mode=find">ȸ��ã��</a> |
				<a href="<%=request.getContextPath()%>/board/list.jsp">�Խ���</a> |
				<a href="<%=request.getContextPath()%>/company.jsp">ȸ��Ұ�</a>
			</td>
		</tr>
		<tr>
			<td width="20%" valign="top">tree/view</td>
			<td width="80%">
			
			
			
			
			
			
			
			