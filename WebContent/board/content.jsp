<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="my.board.*"%>
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>

<%
		String num = request.getParameter("num");
		if (num==null || num.trim().equals("")){
			response.sendRedirect("list.jsp");
			return;
		}
		
		BoardDBBean dto = bdao.getBoard(Integer.parseInt(num), "content"); 
%>
<%@ include file="../top.jsp" %>
<link rel="stylesheet" type="text/css" href="../style.css">
<%
		if (!isLogin){%>
		<script type="text/javascript">
			alert("로그인을 먼저 해 주세요!!")
			location.href="<%=request.getContextPath()%>/login/login.jsp"
		</script>	
<%		return;
		}
%>
<div align="center">
	<b>글내용 보기</b>
	<table border="1" width="500">
		<tr>
			<th bgcolor="yellow" width="15%">글번호</th>
			<td align="center" width="35%"><%=dto.getNum()%></td>
			<th bgcolor="yellow" width="15%">조회수</th>
			<td align="center" width="35%"><%=dto.getReadcount()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">작성자</th>
			<td align="center" width="35%"><%=dto.getWriter()%></td>
			<th bgcolor="yellow" width="15%">작성일</th>
			<td align="center" width="35%"><%=dto.getReg_date()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">글제목</th>
			<td align="center" colspan="3"><%=dto.getSubject()%></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="15%">글내용</th>
			<td colspan="3"><%=dto.getContent()%></td>
		</tr>
<%	if (dto.getFilesize()>0){ %>
		<tr>
			<th bgcolor="yellow" width="15%">파일명</th>
			<td colspan="3"><%=dto.getFilename()%></td>
		</tr>
<%	} %>		
		<tr bgcolor="yellow">
			<td colspan="4" align="right">
				<input type="button" value="달글쓰기"
					onclick="window.location='writeForm.jsp?num=<%=dto.getNum()%>&re_step=<%=dto.getRe_step()%>&re_level=<%=dto.getRe_level()%>'">
				<input type="button" value="글수정"
					onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="글삭제"
					onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'">
				<input type="button" value="글목록" 
					onclick="window.location='list.jsp'">
			</td>
		</tr>
	</table>
</div>
<%@ include file="../bottom.jsp" %>



















