<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.io.*"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>

<%
		request.setCharacterEncoding("EUC-KR");
		String pnum = request.getParameter("pnum");
		String pimage = request.getParameter("pimage");
		if (pnum==null || pnum.trim().equals("")){
			response.sendRedirect("prod_list.jsp");
			return;
		}
		
		int res = pdao.deleteProduct(Integer.parseInt(pnum));
		String msg = null, url = "prod_list.jsp";
		if (res>0){
			File file = new File
					(application.getRealPath("/myshop/images"), pimage);
			if (file.exists()){
				file.delete();
				msg = "상품삭제 성공!! 상품목록으로 이동합니다.";
			}else {
				msg = "상품삭제 성공(이미지는 삭제는 실패)!!"
											+" 상품목록으로 이동합니다.";
			}
		}else {
			msg = "상품삭제 실패!! 상품목록으로 이동합니다.";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>












