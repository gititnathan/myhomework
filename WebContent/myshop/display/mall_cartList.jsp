<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.text.*"%>
<%@ include file="mall_top.jsp"%>
<jsp:useBean id="cart" class="my.shop.mall.CartBean" scope="session"/>

<div align="center">

	<table border="1" width="100%">
		<tr height="40">
			<td colspan="6" align="center" class="m2">
				<b>장바구니 보기</b>
			</td>
		</tr>
		<tr>
			<th class="m1">번호</th>
			<th class="m1">상품명</th>
			<th class="m1">수량</th>
			<th class="m1">단가</th>
			<th class="m1">금액</th>
			<th class="m1">삭제</th>
		</tr>
<% 	Hashtable<Integer, ProductDTO> ht = cart.listCart();
		if (ht==null || ht.size()==0){%>
		<tr>
			<td colspan="6">장바구니가 비었습니다.</td>
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
				<td align="center"><%=dto.getPnum()%></td>
				<td align="center" width="30%">
					<img src="<%=upPath%>/<%=dto.getPimage()%>" width="40" height="40">
					<br><b><%=dto.getPname()%></b>
				</td>
				<td align="center">
					<form name="f" action="mall_cartEdit.jsp" method="post">
						<input type="text" name="qty" value="<%=dto.getPqty()%>" size="2">개
						<input type="hidden" name="pnum" value="<%=dto.getPnum()%>">
						<br><input type="submit" value="수정">
					</form>		
				</td>
				<td align="right">
					<b>
						<%=df.format(dto.getPrice())%>원<br>
						[<%=dto.getPoint()%>] point
					</b>	
				</td>
				<td align="right">
					<font color="red">
						<%=df.format(dto.getPrice()*dto.getPqty())%>원<br>
						[<%=dto.getPoint()*dto.getPqty()%>]point
					</font>
				</td>
				<td align="center">
					<a href="mall_cartDel.jsp?pnum=<%=dto.getPnum()%>">삭제</a>
				</td>
			</tr>
<%		}%>
			<tr>
				<td colspan="4" class="m1">
					<form name="f2" action="mall_order.jsp" method="post">
						<b>장바구니 총액: </b><font color="red"><%=df.format(allPrice)%>원</font><br>
						<font color="green">총 적립 포인트 : [<%=allPoint%>]point</font>
						<input type = "hidden" name="allPrice" value="<%=allPrice%>">
					</form>	
				</td>
				<td colspan="2" class="m1">
						<a href="mall_order.jsp"> [주문하기] </a>
						<a href="javascript:goMall()"> [계속쇼핑] </a>
				</td>
			</tr>
<%	}%>
	</table>
</div>
<%@ include file="mall_bottom.jsp"%>















