<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session" />

<%
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		
		int res = cart.deleteCart(Integer.parseInt(pnum));
		if(res>0){ %>
			<script type="text/javascript">
			alert("상품을 장바구니에서 삭제하였습니다.")
			location.href="mall_cartList.jsp"
		</script>			
		}else{ %>
			<script type="text/javascript">
			alert("다시 시도 바랍니다.")
			location.href="mall_cartList.jsp"
		</script>
		<%}
%>
