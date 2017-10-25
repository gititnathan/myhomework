<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>

<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/board/files");
		try{
			mr = new MultipartRequest(request, upPath, 10*1024*1024, "EUC-KR");
		}catch(IOException e){%>
			<script type="text/javascript">
				alert("파일 업로드 실패!! 글목록페이지로 이동합니다.")
				location.href="list.jsp"
			</script>
<%		return;
		}

		String ip = request.getRemoteAddr();
		int res = bdao.insertBoard(mr, ip); 
		if (res>0){%>
		<script type="text/javascript">
			alert("게시글등록성공!! 글목록페이지로 이동합니다") 
			location.href="list.jsp"
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("게시글등록실패!! 글등록페이지로 이동합니다")
			location.href="writeForm.jsp"
		</script>
<%	}%>		










