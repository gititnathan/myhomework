<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>
<%
		ArrayList<CategoryDTO> list = cdao.listCategory();
		if (list==null || list.size()==0){%>
		<script type="text/javascript">
			alert("쇼핑몰 준비중 입니다")
			location.href="<%=request.getContextPath()%>/index.jsp"
		</script>
<%		return;
		} %>		    
<html>
<head>
	<title>쇼핑몰홈</title>
	<link rel="stylesheet" type="text/css" href="../../style.css">
	<script type="text/javascript">
		function cgProdList(code, cname){
			document.cgList.code.value=code
			document.cgList.cname.value=cname
			document.cgList.submit()
		}
	</script>
</head>
<body>
	<div align="center">
		<table border="1" width="800" height="600">
			<tr height="10%">
				<td colspan="2" align="center">
					HOME |
					관리자홈 |
					쇼핑몰홈 |
					장바구니 |
					회사소개 
				</td>
			</tr>
			<tr>
				<td width="20%" valign="top">
					tree/view
					<table border="1" width="100%">
<%					for(CategoryDTO dto : list){ %>
						<tr>
							<td>
								<a href="javascript:cgProdList('<%=dto.getCode()%>', '<%=dto.getCname()%>')">
								<%=dto.getCname()%>[<%=dto.getCode()%>]
								</a>
							</td>
						</tr>
<%					} %>						
					</table>
					<form name="cgList" method="post" action="mall_cgProdList.jsp">
						<input type="hidden" name="code">
						<input type="hidden" name="cname">
					</form>
				</td>
				<td align="center">
				
				
				
				
				
				
				
				
				
				
				