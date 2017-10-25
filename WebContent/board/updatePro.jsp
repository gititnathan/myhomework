<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bdto" class="my.board.BoardDBBean" />
<jsp:setProperty property="*" name="bdto" />
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>

<%
		if (bdto.getWriter() == null || bdto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		int res = bdao.updateBoard(bdto); 
		String msg = null, url = null;
		if (res>0){
			msg = "�Խñ� ���� ����!! �۸���������� �̵��մϴ�.";
			url = "list.jsp";
		}else if (res<0){
			msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�. �ٽ� �Է��� �ּ���!!";
			url = "deleteForm.jsp?num="+bdto.getNum();
		}else {
			msg = "�Խñ� ���� ����!! �۳��뺸���������� �̵��մϴ�.";
			url = "content.jsp?num="+bdto.getNum();
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>





