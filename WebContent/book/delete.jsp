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
		
		//6.전송결과에 따라 목록보기나 등록하기로 분기하기
		if (res>0){%>
		<script type="text/javascript">
			alert("도서삭제성공!!")
			location.href="list.jsp"
		</script> 
<%	}else { %>
		<script type="text/javascript">
			alert("도서삭제실패!!")
			location.href="book.jsp"
		</script>
<%	}%>		













