<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>
<%
	String pnum = request.getParameter("pnum");
	String qty = request.getParameter("qty");
	if(pnum == null || pnum.trim().equals("")){
		response.sendRedirect("mall.jsp");
		return;
	}
	
	int res = cart.updateCart(Integer.parseInt(pnum), Integer.parseInt(qty));
%>

		<script type="text/javascript">
			location.href="mall_cartList.jsp"
		</script>	