<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="mall_top.jsp" %>
<jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="pool" name="prolist" value="<%=pool%>"/>
<h3>Welcome to My Mall</h3>
<%
		java.text.DecimalFormat df = new java.text.DecimalFormat("###,###");


		Vector<ProductDTO> plist = prolist.selectBySpec("hit");
		if (plist==null || plist.size()==0){
			out.println("<b>HIT상품이 없습니다.</b><br>");
		}else {%>
			<hr color="green" width="300">
			<font size="3">HIT</font>
			<hr color="green" width="300">
			<table border="0" width="100%" align="center">
				<tr>
<%			int count = 0;
				for(ProductDTO dto : plist){
					count++;
					String pimage = dto.getPimage();
					String pnum = String.valueOf(dto.getPnum());
					String pname = dto.getPname();
					int price = dto.getPrice();
					int point = dto.getPoint();
					String upPath = application.getRealPath("/myshop/images");%>
					<td align="center">
					<a href="mall_prodView.jsp?pnum=<%=dto.getPnum()%>&select=hit">
						<img src="<%=upPath%>/<%=pimage%>" 
														width="80" height="60">
					</a><br>
						<%=pname%><br>
						<font color="red"><%=df.format(price)%></font>원<br>
						<font color="blue">[<%=point%>]</font>point														
					</td>	
<%				if (count%3==0){ %>
					</tr><tr>
<%				} %>					
<%			} %>	
				</tr>							
			</table>
<%	} %>
<%
Vector<ProductDTO> plist2 = prolist.selectBySpec("new");
if (plist2==null || plist2.size()==0){
	out.println("<b>NEW상품이 없습니다.</b><br>");
}else {%>
	<hr color="green" width="300">
	<font size="3">NEW</font>
	<hr color="green" width="300">
	<table border="0" width="100%" align="center">
		<tr>
<%			int count = 0;
		for(ProductDTO dto : plist2){
			count++;
			String pimage = dto.getPimage();
			String pnum = String.valueOf(dto.getPnum());
			String pname = dto.getPname();
			int price = dto.getPrice();
			int point = dto.getPoint();
			String upPath = application.getRealPath("/myshop/images");%>
			<td align="center">
				<a href="mall_prodView.jsp?pnum=<%=dto.getPnum()%>&select=new">
						<img src="<%=upPath%>/<%=pimage%>" 
														width="80" height="60">
					</a><br>
				<%=pname%><br>
				<font color="red"><%=df.format(price)%></font>원<br>
				<font color="blue">[<%=point%>]</font>point														
			</td>	
<%				if (count%3==0){ %>
			</tr>
			
			<tr>
<%				} %>					
<%			} %>	
		</tr>							
	</table>
<%	} %>
<%
Vector<ProductDTO> plist3 = prolist.selectBySpec("best");
if (plist3==null || plist3.size()==0){
	out.println("<b>BEST상품이 없습니다.</b><br>");
}else {%>
	<hr color="green" width="300">
	<font size="3">BEST</font>
	<hr color="green" width="300">
	<table border="0" width="100%" align="center">
		<tr>
<%			int count = 0;
		for(ProductDTO dto : plist3){
			count++;
			String pimage = dto.getPimage();
			String pnum = String.valueOf(dto.getPnum());
			String pname = dto.getPname();
			int price = dto.getPrice();
			int point = dto.getPoint();
			String upPath = application.getRealPath("/myshop/images");%>
			<td align="center">
				<a href="mall_prodView.jsp?pnum=<%=dto.getPnum()%>&select=best">
						<img src="<%=upPath%>/<%=pimage%>" 
														width="80" height="60">
					</a><br>
				<%=pname%><br>
				<font color="red"><%=df.format(price)%></font>원<br>
				<font color="blue">[<%=point%>]</font>point														
			</td>	
<%				if (count%3==0){ %>
			</tr><tr>
<%				} %>					
<%			} %>	
		</tr>							
	</table>
<%	} %>
<%@ include file="mall_bottom.jsp" %>





