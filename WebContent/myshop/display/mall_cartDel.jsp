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
			alert("��ǰ�� ��ٱ��Ͽ��� �����Ͽ����ϴ�.")
			location.href="mall_cartList.jsp"
		</script>			
		}else{ %>
			<script type="text/javascript">
			alert("�ٽ� �õ� �ٶ��ϴ�.")
			location.href="mall_cartList.jsp"
		</script>
		<%}
%>
