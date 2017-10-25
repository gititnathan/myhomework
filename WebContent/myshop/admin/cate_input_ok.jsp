<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!--  member_edit_ok를 가져옴 -->

<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="cdto" class="my.shop.CategoryDTO" />
<jsp:useBean id="cdao" class="my.shop.CategoryBean" />
<jsp:setProperty property="*" name="cdto"/>
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" />
<jsp:setProperty property="pool" name="cdao" value="<%=pool%>"/>
<%
		if (cdto.getCode()==null || cdto.getCode().trim().equals("")){
			response.sendRedirect("main.jsp");
			return;
		}

		int res = cdao.insertCategory(cdto);
		String msg = null, url = null;
		if (res>0){
			msg = "카테고리 등록 성공!! 카테고리보기페이지로 이동합니다.";
			url = "cate_list.jsp";
		} else {
			msg = "카테고리 등록 실패!! 카테고리등록페이지로 이동합니다.";
			url = "cate_input.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>




    