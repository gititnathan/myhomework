<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="java.util.*, my.board.*"%>
<%@ include file="../top.jsp"%>
<link rel="stylesheet" type="text/css" href="../style.css">
<jsp:useBean id="bdao" class="my.board.BoardDataBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="bdao" value="<%=pool%>"/>

<div align="center">
	<b>�� �� ��</b>
	<table border="0" width="600">
		<tr bgcolor="yellow">
			<td align="right"><a href="writeForm.jsp">�۾���</a></td>
		</tr>
	</table>
	<table border="1" width="600">
		<tr bgcolor="green">
			<th>��ȣ</th>
			<th width="30%">����</th>
			<th>�ۼ���</th>
			<th>�ۼ���</th>
			<th>��ȸ</th>
			<th>IP</th>
			<th>����</th>
		</tr>
<% 	int pageSize = 5;
		String pageNum = request.getParameter("pageNum");
		if (pageNum==null){
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage-1) * pageSize + 1;
		int endRow = startRow + pageSize - 1;
		int count = bdao.getCount(); 
		if (endRow>count) endRow = count;
		int num = count - pageSize*(currentPage-1);

		ArrayList<BoardDBBean> list = bdao.listBoard(startRow, endRow);
		if (list==null || list.size()==0){%>
		<tr>
			<td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td>
		</tr>
<%	}else { 
			for(BoardDBBean dto : list){%>
		<tr>
			<td><%=num--%></td>
			<td>
<%	if (dto.getRe_level()>0){ %>		
			<img src="../img/level.gif" width="<%=dto.getRe_level()*10%>">
			<img src="../img/re.gif">
<%	} %>			
				<a href="content.jsp?num=<%=dto.getNum()%>">
					<%=dto.getSubject()%>
				</a>
			</td>
			<td><%=dto.getWriter()%></td>
			<td><%=dto.getReg_date()%></td>
			<td><%=dto.getReadcount()%></td>
			<td><%=dto.getIp()%></td>
			<td>
<%		if (dto.getFilesize()>0){ %>
				<img src="../img/folder.gif">
<%		}else { %>
				<img src="../img/level.gif">
<%		} %>			
			</td>			
		</tr>					
<%		}
		}%>
	</table>
<%
		if (count > 0){
			int pageCount = //(count + pageSize - 1) / pageSize;
									count/pageSize + (count%pageSize==0 ? 0 : 1);
			int pageBlock = 3;
			int startPage = (currentPage-1) / pageBlock * pageBlock + 1;
			int endPage = startPage + pageBlock - 1;
			if (endPage > pageCount) endPage = pageCount;
			if (startPage>pageBlock) {%>
				<a href="list.jsp?pageNum=<%=startPage-pageBlock%>">[����]</a>
<%		}
			for (int i=startPage; i<=endPage; ++i){%>
				<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>			
<%		}
			if (endPage<pageCount){%>
				<a href="list.jsp?pageNum=<%=startPage+pageBlock%>">[����]</a>			
<%		}
		}
%>	
</div>
<%@ include file="../bottom.jsp"%>