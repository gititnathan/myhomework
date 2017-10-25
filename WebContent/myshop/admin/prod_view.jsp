<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<%
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		ProductDTO dto = pdao.getProduct(Integer.parseInt(pnum));
		String upPath = application.getRealPath("/myshop/images");
%>    
<%@ include file="top.jsp"%>
<div align="center">
	<table border ="1" class="outline" width="100%">
		<caption>상품상세보기</caption>
		<hr color="green" width="300">
		<h2>HIT</h2>
		<hr color="green" width="300">
		<tr>
		<td width="85%" colspan="3" align="center">
				<img src="<%=upPath%>/<%=dto.getPimage()%>" 
														width="100" height="100">
		</td>
		<td width="35%"><%=dto.getPname()%></td>
		<td width="35%"><%=dto.getPrice()%></td>
		<td width="35%"><%=dto.getPoint()%></td>
			
		<tr>
			<td colspan="4" align="center">
				<input type="button" value="돌아가기" 
								onclick="window.location='prod_list.jsp'">
			</td>			
		</tr>
	</table>
</div>
<%@ include file="bottom.jsp"%>







