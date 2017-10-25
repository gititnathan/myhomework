<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<script type="text/javascript">
	function check(){
		if (f.writer.value==""){
			alert("이름을 입력해 주세요!!")
			f.writer.focus()
			return false
		}
		if (f.subject.value==""){
			alert("제목을 입력해 주세요!!")
			f.subject.focus()
			return false
		}
		if (f.content.value==""){
			alert("내용을 입력해 주세요!!")
			f.content.focus()
			return false
		}
		if (f.passwd.value==""){
			alert("비밀번호를 입력해 주세요!!")
			f.passwd.focus()
			return false
		}
		return true
	}
</script>
<%
		int num = 0, re_step = 0, re_level=0;
		if (request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
			re_step = Integer.parseInt(request.getParameter("re_step"));
			re_level = Integer.parseInt(request.getParameter("re_level"));
		}
%>
<div align="center">
	<form name="f" action="writePro.jsp" method="post"
			onsubmit="return check()" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>"/>	
	<input type="hidden" name="re_step" value="<%=re_step%>"/>
	<input type="hidden" name="re_level" value="<%=re_level%>"/>													
	<table border="1" width="500">
		<tr bgcolor="yellow">
			<th colspan="2">글 쓰 기</th>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">이 름</th>
			<td><input type="text" name="writer" class="box"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">제 목</th>
			<td><input type="text" name="subject" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">Email</th>
			<td><input type="text" name="email" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">파일명</th>
			<td><input type="file" name="filename" class="box" size="50"></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">내 용</th>
			<td><textarea name="content" rows="13" cols="50" class="box"></textarea></td>
		</tr>
		<tr>
			<th bgcolor="yellow" width="20%">비밀번호</th>
			<td><input type="password" name="passwd" class="box"></td>
		</tr>
		<tr bgcolor="yellow">
			<td colspan="2" align="center">
				<input type="submit" value="글쓰기">
				<input type="reset" value="다시작성">
				<input type="button" value="목록보기" 
											onclick="window.location='list.jsp'">
			</td>	
		</tr>
	</table>
	</form>
</div>
<%@ include file="../bottom.jsp"%>












