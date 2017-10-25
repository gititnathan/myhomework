<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- insert.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<!-- my.student.StudentDAO stdao = new my.student.StudentDAO(); -->
<%
		//1.넘어온 데이타를 받기
		request.setCharacterEncoding("EUC-KR");//post방식에서 한글처리
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cname = request.getParameter("cname");
		
		//2.받은 데이타 유효성 검사하기
		if (id==null || name==null || cname==null || id.trim().equals("") || 
			name.trim().equals("") || cname.trim().equals("")){%>
			<script type="text/javascript">
				alert("아이디, 학생명, 학급명을 모두 입력하셔야 합니다.")
				history.back()
			</script>		
<%		return;
		}
		int res = stdao.insertStudent(id, name, cname);
		//6.전송결과에 따라 목록보기나 등록하기로 분기하기
		if (res>0){%>
		<script type="text/javascript">
			alert("학생등록성공!!") 
			location.href="list.jsp"
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("학생등록실패!!")
			location.href="student.jsp"
		</script>
<%	}%>		










