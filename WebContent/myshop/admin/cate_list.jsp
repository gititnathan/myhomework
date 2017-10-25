<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import = "java.util.*, my.shop.*" %>

<!-- memberAll.jsp -->
<%@ include file="top.jsp"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String mode = request.getParameter("mode");
		if (mode==null){
			mode = "all";
		}
%>
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope ="application" />
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>
	<div align="center">
		<h3> ī�װ� ���</h3>
		<hr color="green" width="600">
		<table border= "1" width="100%" class="outline">
			<tr>
				<th class="m3">��ȣ</th>
				<th class="m3">ī�װ�</th>
				<th class="m3">ī�װ���</th>
			
				<th class="m3">����</th>
			</tr>
<%		ArrayList<CategoryDTO> list = null;
			if (mode.equals("all")) list = cdao.listCategory();
			if (list==null || list.size()==0){%>
			<tr>
				<td colspan="4">��ϵ� ī�װ��� �����ϴ�.</td>
			</tr>
<%		}else {
				for(CategoryDTO dto : list){%>						
			<tr>
				<td><%=dto.getCnum()%></td>
				<td><%=dto.getCode()%></td>
				<td><%=dto.getCname()%></td>
				<td>
				<a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">����</a></td> 
				<!--  ���⼭ ?cnum�̶�� �ϴ� ���� �ű⼭ � �༮�� ���� ��ü������ Ȯ���ϴ� ��. -->
			</tr>	
<%			} %>
<%		} %>
		</table>
	</div>
<%@ include file="bottom.jsp"%>
    