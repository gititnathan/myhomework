<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>

<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/board/files");
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		}catch(IOException e){%>
			<script type="text/javascript">
				alert("���� ���ε� ����!! �۸���������� �̵��մϴ�.")
				location.href="list.jsp"
			</script>
<%		return;
		}

		String ip = request.getRemoteAddr();
		int res = bdao.insertBoard(mr, ip); 
		if (res>0){%>
		<script type="text/javascript">
			alert("�Խñ۵�ϼ���!! �۸���������� �̵��մϴ�") 
			location.href="list.jsp"
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("�Խñ۵�Ͻ���!! �۵���������� �̵��մϴ�")
			location.href="writeForm.jsp"
		</script>
<%	}%>		










