<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  member_edit_ok�� ������ -->

<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="cdto" class="my.shop.CategoryDTO" />
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" />
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>
<%
		if (cdto.getCode()==null || cdto.getCode().trim().equals("")){
			response.sendRedirect("main.jsp");
			return;
		}

		int res = cdao.insertCategory(cdto);
		String msg = null, url = null;
		if (res>0){
			msg = "ī�װ� ��� ����!! ī�װ������������� �̵��մϴ�.";
			url = "cate_list.jsp";
		} else {
			msg = "ī�װ� ��� ����!! ī�װ������������ �̵��մϴ�.";
			url = "cate_input.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>




    