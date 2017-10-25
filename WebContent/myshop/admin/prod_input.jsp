<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.shop.*"%>
<%@ include file="top.jsp"%>

<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>
<%
		ArrayList<CategoryDTO> list = cdao.listCategory();
		if (list==null || list.size()==0){%>
		<script type="text/javascript">
			alert("카테고리를 먼저 등록해 주세요!!")
			location.href="main.jsp"
		</script>	
<%		return;
		}%>
<div align="center">
	<form name="f" action="prod_input_ok.jsp" method="post"
												enctype="multipart/form-data">
												
		<table width="600" class="outline">
			<caption>상품등록카테고리</caption>
			<tr>
				<th width="20%" class="m2">카테고리</th>
				<td align="left">
					<select name="pcategory_fk">
<%				for(CategoryDTO dto : list){ %>					
						<option value="<%=dto.getCode()%>">
						<%=dto.getCname()%>[<%=dto.getCode()%>]
						</option>
<%				}%>
					</select>
			</tr>
			<tr>
				<th class="m2">상품명</th>
				<td><input type="text" name="pname" class="box"></td>
			</tr>
			<tr>
				<th class="m2">상품코드</th>
				<td><input type="text" name="pcode" class="box"></td>
			</tr>
			<tr>
				<th class="m2">제조사</th>
				<td><input type="text" name="pcompany" class="box"></td>
			</tr>
			<tr>
				<th class="m2">상품이미지</th>
				<td><input type="file" name="pimage"></td>
			</tr>
			<tr>
				<th class="m2">상품수량</th>
				<td><input type="text" name="pqty" class="box"></td>
			</tr>
			<tr>
				<th class="m2">상품가격</th>
				<td><input type="text" name="price" class="box"></td>
			</tr>
			<tr>
				<th class="m2">상품스펙</th>
				<td>
					<select name="pspec">
						<option value="normal">::NORMAL::</option>
						<option value="hit">HIT</option>
						<option value="new">NEW</option>
						<option value="best">BEST</option>
					</select>
				</td>
			</tr>
			<tr>
				<th class="m2">상품소개</th>
				<td>
					<textarea name="pcontents" rows="3" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<th class="m2">상품포인트</th>
				<td><input type="text" name="point" class="box"></td>
			</tr>
			<tr>
				<td class="m1" colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="취소">			
				</td>
			</tr>
		</table>
	</form>
</div>
<%@ include file="bottom.jsp"%>









