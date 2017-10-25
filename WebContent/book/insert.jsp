<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
%>
<jsp:useBean id="bdto" class="my.book.BookDTO"/>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="my.book.BookDAO" />
<%
		if (bdto.getBookname()==null || bdto.getBookname().trim().equals("") || 
		bdto.getWriter()==null || bdto.getWriter().trim().equals("") ||
		bdto.getPublisher()==null || bdto.getPublisher().trim().equals("") || 
		bdto.getPrice() == 0){
			response.sendRedirect("book.jsp");
			return;
		}

		int res = bdao.insertBook(bdto);
		String msg = null, url = null;
		if (res>0){
			msg = "도서등록성공!! 도서목록페이지로 이동합니다.";
			url = "list.jsp";
		}else if (res==0) {
			msg = "도서등록실패!! 도서등록페이지로 이동합니다.";
			url = "book.jsp";
		}else {
			msg = "이미 존재하는 도서입니다. 다시 입력해 주세요";
			url = "book.jsp";
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>









