<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>

<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/myshop/images");
		int len = 10*1024*1024;
		try{
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");//생성자에 4개의 매개변수 입력!!
		}//이때 발생하는 예외는??
		catch(IOException e){
			out.println("파일업로드 실패!!");
			e.printStackTrace();//오류체크해보기...
		}
		
		
		
		//mr객체를 DAO에 넘겨서 수정 처리하기
		int res = pdao.updateProduct(mr);
		if (res>0){%>
		<script type="text/javascript">
			alert("상품 수정 성공!! 상품목록페이지로 이동합니다.")
			location.href="prod_list.jsp"
		</script>
<%	}else { %>		
		<script type="text/javascript">
			alert("상품 수정 실패!! 상품수정페이지로 이동합니다.")
			location.href="prod_update.jsp?pnum="+<%=mr.getParameter("pnum")%>
		</script>
<%	} %>












