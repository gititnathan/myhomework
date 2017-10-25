<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<%@ include file="mall_top.jsp"%>
<jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session"/>
<jsp:setProperty property="pool" name="prolist" value="<%=pool%>"/>
<h3>Welcome to My Mall</h3>
<%
		request.setCharacterEncoding("EUC-KR");
		String code = request.getParameter("code");
		String cname = request.getParameter("cname");
		DecimalFormat df = new DecimalFormat("###,###");
		Vector<ProductDTO> plist = prolist.selectByCategory(code);
		if (plist==null || plist.size()==0){
			out.println("<b>"+cname+"상품이 없습니다.</b><br>");
		}else {%>
			<hr color="green" width="300">
			<font size="3"><%=cname%></font>
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
					<a href="mall_prodView.jsp?pnum=<%=dto.getPnum()%>&select=<%=code%>">
						<img src="<%=upPath%>/<%=pimage%>" 
														width="80" height="60">
					</a><br>
														
						<%=pname%><br>
						<font color="red"><%=df.format(price)%></font>원<br>-
						<font color="blue">[<%=point%>]</font>point														
					</td>	
<%				if (count%3==0){ %>
					</tr><tr>
<%				} %>					
<%			} %>	
				</tr>							
			</table>
<%	} %>
<%@ include file="mall_bottom.jsp"%>