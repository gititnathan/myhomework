<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>

<%
		String cnum = request.getParameter("cnum");
		if (cnum==null || cnum.trim().equals("")){
			response.sendRedirect("main.jsp");
			return;
		}
		
		int res = cdao.deleteCategory(Integer.parseInt(cnum));
		if (res>0){%>
		<script type="text/javascript">
			alert("ī�װ����� ����!! ī�װ� ����������� �̵��մϴ�.")
			location.href="cate_list.jsp"
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("ī�װ����� ����!! ī�װ� ����������� �̵��մϴ�.")
			location.href="cate_list.jsp"
		</script>
<%	} %>







