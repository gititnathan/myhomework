<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<jsp:useBean id="bdao" class="my.book.BookDAO" />

<%
		String bookname = request.getParameter("bookname");
		if (bookname==null || bookname.trim().equals("")){
			response.sendRedirect("book.jsp");
			return;
		}
		 
		int res = bdao.deleteBook(bookname);
		
		//6.���۰���� ���� ��Ϻ��⳪ ����ϱ�� �б��ϱ�
		if (res>0){%>
		<script type="text/javascript">
			alert("������������!!")
			location.href="list.jsp"
		</script> 
<%	}else { %>
		<script type="text/javascript">
			alert("������������!!")
			location.href="book.jsp"
		</script>
<%	}%>		













