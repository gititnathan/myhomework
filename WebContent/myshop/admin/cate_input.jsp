<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope ="application" />
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>


<%@ include file="top.jsp"%>

	<body onload="f.name.focus()">
		<form name="f" method="POST" action="cate_input_ok.jsp" align = "center">
			<table border = "1" width="550" align="center" class="outline">
  				<tr>
					<td colspan="2" align=center class="m2">ī�װ� ���</td>
 				</tr>
				<tr>
				<th>ī�װ� �ڵ�</th>
				<td><input type="text" name="code" class="box"></td>
			</tr>
			<tr>
				<th>ī�װ� �̸�</th>
				<td><input type="text" name="cname" class="box" >  
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="���">
					<input type="reset" value="���">
				</td>
			</tr>
  			</table>
		</form>
	</body>
<%@ include file="bottom.jsp"%>