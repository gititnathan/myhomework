<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bdto" class="my.book.BookDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="my.book.BookDAO" />
<%
		if (bdto.getBookname()==null || bdto.getBookname().trim().equals("") || 
		bdto.getWriter()==null || bdto.getWriter().trim().equals("") ||
		bdto.getPublisher()==null || bdto.getPublisher().trim().equals("") || 
		bdto.getPrice() == 0){
			response.sendRedirect("book.jsp");
			return;
		}

		int res = bdao.insertBook(bdto);
		String msg = null, url = null;
		if (res>0){
			msg = "������ϼ���!! ��������������� �̵��մϴ�.";
			url = "list.jsp";
		}else if (res==0) {
			msg = "������Ͻ���!! ��������������� �̵��մϴ�.";
			url = "book.jsp";
		}else {
			msg = "�̹� �����ϴ� �����Դϴ�. �ٽ� �Է��� �ּ���";
			url = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>









