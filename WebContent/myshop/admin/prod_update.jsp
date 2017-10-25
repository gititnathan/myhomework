<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.shop.*"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>
<%
		String pnum = request.getParameter("pnum");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		
		ProductDTO dto = pdao.getProduct(Integer.parseInt(pnum));
		String upPath = config.getServletContext().getRealPath("/myshop/images");
		String spec[] = new String[]{"normal", "hit", "new", "best"};
%>
<%@ include file="top.jsp" %>
<div align="center">
	<form name="f" action="prod_update_ok.jsp" method="post"
												enctype="multipart/form-data">
		<input type="hidden" name="pnum" value="<%=pnum%>">											
		<table width="600" class="outline">
			<caption>상품수정</caption>
			<tr>
				<th width="20%" class="m2">카테고리</th>
				<td align="left"><input type="text" name="pcategory_fk" value="<%=dto.getPcategory_fk()%>" disabled></td>
			</tr>
			<tr>
				<th class="m2">상품번호</th>
				<td><%=dto.getPnum()%></td>
			</tr>
			<tr>
				<th class="m2">상품명</th>
				<td><input type="text" name="pname" class="box" value="<%=dto.getPname()%>"></td>
			</tr>
			<tr>
				<th class="m2">제조사</th>
				<td><input type="text" name="pcompany" class="box" value="<%=dto.getPcompany()%>"></td>
			</tr>
			<tr>
				<th class="m2">상품이미지</th>
				<td>
					<img src="<%=upPath%>/<%=dto.getPimage()%>" width="60" height="60">
					<input type="file" name="pimage">
					<input type="hidden" name="pimage2" value="<%=dto.getPimage()%>">
				</td>
			</tr>
			<tr>
				<th class="m2">상품수량</th>
				<td><input type="text" name="pqty" class="box" value="<%=dto.getPqty()%>"></td>
			</tr>
			<tr>
				<th class="m2">상품가격</th>
				<td><input type="text" name="price" class="box" value="<%=dto.getPrice()%>"></td>
			</tr>
			<tr>
				<th class="m2">상품스펙</th>
				<td>
					<select name="pspec">
<%				for(int i=0; i<spec.length; ++i){ 
						if (dto.getPspec().equals(spec[i])){%>
						<option value="<%=spec[i]%>" selected><%=spec[i]%></option>
<%					}else {%>
						<option value="<%=spec[i]%>"><%=spec[i]%></option>												
<%					}
					} %>						
					</select>
				</td>
			</tr>
			<tr>
				<th class="m2">상품소개</th>
				<td>
					<textarea name="pcontents" rows="3" cols="50"><%=dto.getPcontents()%></textarea>
				</td>
			</tr>
			<tr>
				<th class="m2">상품포인트</th>
				<td><input type="text" name="point" class="box" value="<%=dto.getPoint()%>"></td>
			</tr>
			<tr>
				<td class="m1" colspan="2">
					<input type="submit" value="상품수정">
					<input type="reset" value="취소">			
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="bottom.jsp"%>











