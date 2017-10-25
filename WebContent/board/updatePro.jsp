<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%	request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="bdto" class="my.board.BoardDBBean" />
<jsp:setProperty property="*" name="bdto" />
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>

<%
		if (bdto.getWriter() == null || bdto.getWriter().trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		int res = bdao.updateBoard(bdto); 
		String msg = null, url = null;
		if (res>0){
			msg = "게시글 삭제 성공!! 글목록페이지로 이동합니다.";
			url = "list.jsp";
		}else if (res<0){
			msg = "비밀번호가 틀렸습니다. 다시 입력해 주세요!!";
			url = "deleteForm.jsp?num="+bdto.getNum();
		}else {
			msg = "게시글 삭제 실패!! 글내용보기페이지로 이동합니다.";
			url = "content.jsp?num="+bdto.getNum();
		}
%>
<script type="text/javascript">
	alert("<%=msg%>")
	location.href="<%=url%>"
</script>





