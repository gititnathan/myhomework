<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<%
		String pnum = request.getParameter("pnum");
		String select = request.getParameter("select");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("mall.jsp");
			return;
		}
		
		ProductDTO pdto = prolist.getProduct(Integer.parseInt(pnum), select); 
		String upPath = application.getRealPath("/myshop/images");
%>
<%@ include file="mall_top.jsp"%>
<script type="text/javascript">
	function goCart(){
		document.f.action = "<%=request.getContextPath()%>/myshop/display/mall_cartAdd.jsp"
		document.f.submit()
	}
	function goOrder(){
		document.f.action = "<%=request.getContextPath()%>/myshop/display/mall_order.jsp"
		document.f.submit()
	}
</script>
<table class="outline" width="100%">
	<tr>
		<td colspan="2" align="center" class="m1">
			<b>[<%=pdto.getPname()%>] 상품정보</b>
		</td>
	</tr>
	<tr>
		<td align="center" class="m3">
			<img src="<%=upPath%>/<%=pdto.getPimage()%>"
															width="200" height="200">
		</td>
		<td class="m3">
		<form name="f" method="post">
			상품번호 : <%=pdto.getPnum()%><br>
			상품이름 : <%=pdto.getPname()%><br>
			상품가격 : <font color="red"><%=pdto.getPrice()%></font>원<br>
			상품포인트 :<font color="red">[<%=pdto.getPoint()%>]</font>point<br>
			상품갯수 : <input type="text" name="qty" size="3" value="1">개<br>
			<input type="hidden" name="pnum" value="<%=pnum%>">
			<input type="hidden" name="select" value="<%=select%>">
			<a href="javascript:goCart()">장바구니</a> | 
			<a href="javascript:goOrder()">즉시구매</a>			
		</form>	
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left">
			<b>상품 상세 설명</b><br>
			<%=pdto.getPcontents()%>
		</td>
	</tr>
</table>
<%@ include file="mall_bottom.jsp"%>














