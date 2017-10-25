<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>

<%
		MultipartRequest mr = null;
		String upPath = 
				config.getServletContext().getRealPath("/myshop/images");
		int len = 10*1024*1024;
		try{
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");
		}catch(IOException e){%>
		<script type="text/javascript">
			alert("파일 전송 실패!! 관리자에게 문의하세요")
			location.href="prod_input.jsp"
		</script>	
<%		e.printStackTrace();		
			return;
		}
		
		int res = pdao.insertProduct(mr); 
		if (res>0){%>
		<script type="text/javascript">
			alert("상품 등록 성공!! 상품목록페이지로 이동합니다.")
			location.href="prod_list.jsp"
		</script>
<%	}else { %>		
		<script type="text/javascript">
			alert("상품 등록 실패!! 상품등록페이지로 이동합니다.")
			location.href="prod_input.jsp"
		</script>
<%	} %>
		
		
		
		
		
		
		
		
		