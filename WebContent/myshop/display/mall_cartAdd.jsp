<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:useBean id="prolist" class="my.shop.mall.ProductList" scope="session" />
<jsp:setProperty property="plist" name="cart" value="<%=prolist%>"/> 
<%
    	String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		String qty = request.getParameter("qty");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		if (Integer.parseInt(qty) < 1){
			response.sendRedirect("mall.jsp");
			return;
		}
		
		boolean isAdd = 
				cart.addCart(Integer.parseInt(pnum), Integer.parseInt(qty), select);
		if (isAdd){%>
		<script type="text/javascript">
			location.href="mall_cartList.jsp"
		</script>	
<%	}else {%>
		<script type="text/javascript">
			alert("죄송합니다. 관리자에게 문의해 주세요!!")
			location.href="mall.jsp"
		</script>	
<%	} %>
















