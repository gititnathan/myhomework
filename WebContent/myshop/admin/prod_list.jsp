<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@ include file="top.jsp"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var isDel = confirm("정말로 삭제하시겠습니까?")
		if (isDel){
			location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage
		}
	}
</script>
<div align="center">
	<table border = "1" class="outline" width="100%">
		<caption>상품목록</caption>
		<tr>
			<th class="m2">번호</th>
			<th class="m2">상품코드</th>
			<th class="m2">상품명</th>
			<th class="m2">이미지</th>
			<th class="m2">가격</th>
			<th class="m2">제조사</th>
			<th class="m2">수량</th>
			<th class="m2">수정|삭제</th>
		</tr>
<%
		ArrayList<ProductDTO> list = pdao.listProduct();  
		if (list==null || list.size()==0){%>
		<tr>
			<td colspan="8">등록된 상품이 없습니다.</td>
		</tr>
<%	}else { 
			String upPath = config.getServletContext().getRealPath("/myshop/images");
			for(ProductDTO dto : list){%>
		<tr>
			<td align="right"><%=dto.getPnum()%></td>
			<td align="center"><%=dto.getPcategory_fk()%></td>
			<td align="center"><%=dto.getPname()%></td>
			<td align="center">
			<a href="prod_view.jsp?pnum=<%=dto.getPnum()%>">
				<img src="<%=upPath%>/<%=dto.getPimage()%>" 
														width="40" height="40">
			</a>														
			</td>
			<td align="right"><%=dto.getPrice()%></td>
			<td align="center"><%=dto.getPcompany()%></td>
			<td align="right"><%=dto.getPqty()%></td>
			<td>
				<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">수정</a> | 
				<a href="javascript:checkDel('<%=dto.getPnum()%>', '<%=dto.getPimage()%>')">삭제</a>
			</td>
		</tr>	
<%		}
		}	%>				
	</table>
</div>
<%@ include file="bottom.jsp"%>








