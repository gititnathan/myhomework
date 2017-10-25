<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>

<%@ include file="mall_top.jsp"%>

<%
		request.setCharacterEncoding("EUC-KR");
		String mode = request.getParameter("mode");
		if (mode==null){
			mode = "cart";
		}
%>

<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>
<jsp:setProperty property="pool" name="cadao" value="<%=pool%>"/>


<div align="center">
	<table border="1" width="100%">
		<tr height="40">
			<td colspan="3" align="center" class="m2">
				<b>결제 내역서 보기</b>
			</td>
		</tr>
		<tr>
			<th class="m1">상품명</th>
			<th class="m1">수량</th>
			<th class="m1">금액</th>
		</tr>
<% 	Hashtable<Integer, ProductDTO> ht = cart.listCart();
		if (ht==null || ht.size()==0){%>
		<tr>
			<td colspan="3">장바구니가 비었습니다.</td>
		</tr>
<%	}else {
			Enumeration<Integer> enu = ht.keys();
			String upPath = application.getRealPath("/myshop/images");
			DecimalFormat df = new DecimalFormat("###,###");
			int allPrice = 0, allPoint = 0;
			while(enu.hasMoreElements()){
				ProductDTO dto = ht.get(enu.nextElement());
				allPrice += (dto.getPrice() * dto.getPqty());
				allPoint += (dto.getPoint() * dto.getPqty());
			%>
			<tr>
				<td align="center" width="30%">
					<b><%=dto.getPname()%></b>
				</td>
				<td align="center">
					<form name="f" action="mall_cartEdit.jsp" method="post">
						<%=dto.getPqty()%> 개
						<input type="hidden" name="pnum" value="<%=dto.getPnum()%>">
					</form>		
				</td>
				<td align="right">
					<font color="red">
						<%=df.format(dto.getPrice()*dto.getPqty())%>원<br>
					</font>
				</td>
			</tr>
<%		}%>
			<tr>
				<td colspan="3" class="m1">
					<b>결제하실 총액은 : </b><font color="red"><%=df.format(allPrice)%>원</font><br>
				</td>
				
			</tr>
<%	}%>
	</table>
</div>
<%@ include file="mall_bottom.jsp"%>















