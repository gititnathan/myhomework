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
			<b>[<%=pdto.getPname()%>] ��ǰ����</b>
		</td>
	</tr>
	<tr>
		<td align="center" class="m3">
			<img src="<%=upPath%>/<%=pdto.getPimage()%>"
															width="200" height="200">
		</td>
		<td class="m3">
		<form name="f" method="post">
			��ǰ��ȣ : <%=pdto.getPnum()%><br>
			��ǰ�̸� : <%=pdto.getPname()%><br>
			��ǰ���� : <font color="red"><%=pdto.getPrice()%></font>��<br>
			��ǰ����Ʈ :<font color="red">[<%=pdto.getPoint()%>]</font>point<br>
			��ǰ���� : <input type="text" name="qty" size="3" value="1">��<br>
			<input type="hidden" name="pnum" value="<%=pnum%>">
			<input type="hidden" name="select" value="<%=select%>">
			<a href="javascript:goCart()">��ٱ���</a> | 
			<a href="javascript:goOrder()">��ñ���</a>			
		</form>	
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left">
			<b>��ǰ �� ����</b><br>
			<%=pdto.getPcontents()%>
		</td>
	</tr>
</table>
<%@ include file="mall_bottom.jsp"%>














