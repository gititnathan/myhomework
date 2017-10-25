<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@ include file="top.jsp"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<script type="text/javascript">
	function checkDel(pnum, pimage){
		var isDel = confirm("������ �����Ͻðڽ��ϱ�?")
		if (isDel){
			location.href="prod_delete.jsp?pnum="+pnum+"&pimage="+pimage
		}
	}
</script>
<div align="center">
	<table border = "1" class="outline" width="100%">
		<caption>��ǰ���</caption>
		<tr>
			<th class="m2">��ȣ</th>
			<th class="m2">��ǰ�ڵ�</th>
			<th class="m2">��ǰ��</th>
			<th class="m2">�̹���</th>
			<th class="m2">����</th>
			<th class="m2">������</th>
			<th class="m2">����</th>
			<th class="m2">����|����</th>
		</tr>
<%
		ArrayList<ProductDTO> list = pdao.listProduct();  
		if (list==null || list.size()==0){%>
		<tr>
			<td colspan="8">��ϵ� ��ǰ�� �����ϴ�.</td>
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
				<a href="prod_update.jsp?pnum=<%=dto.getPnum()%>">����</a> | 
				<a href="javascript:checkDel('<%=dto.getPnum()%>', '<%=dto.getPimage()%>')">����</a>
			</td>
		</tr>	
<%		}
		}	%>				
	</table>
</div>
<%@ include file="bottom.jsp"%>








