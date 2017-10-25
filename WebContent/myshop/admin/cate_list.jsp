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
		<h3> 카테고리 목록</h3>
		<hr color="green" width="600">
		<table border= "1" width="100%" class="outline">
			<tr>
				<th class="m3">번호</th>
				<th class="m3">카테고리</th>
				<th class="m3">카테고리명</th>
			
				<th class="m3">삭제</th>
			</tr>
<%		ArrayList<CategoryDTO> list = null;
			if (mode.equals("all")) list = cdao.listCategory();
			if (list==null || list.size()==0){%>
			<tr>
				<td colspan="4">등록된 카테고리가 없습니다.</td>
			</tr>
<%		}else {
				for(CategoryDTO dto : list){%>						
			<tr>
				<td><%=dto.getCnum()%></td>
				<td><%=dto.getCode()%></td>
				<td><%=dto.getCname()%></td>
				<td>
				<a href="cate_delete.jsp?cnum=<%=dto.getCnum()%>">삭제</a></td> 
				<!--  여기서 ?cnum이라고 하는 것은 거기서 어떤 녀석의 값을 구체적으로 확인하는 것. -->
			</tr>	
<%			} %>
<%		} %>
		</table>
	</div>
<%@ include file="bottom.jsp"%>
    