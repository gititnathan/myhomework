<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
<!-- insert.jsp -->
<jsp:useBean id="stdao" class="my.student.StudentDAO" />
<!-- my.student.StudentDAO stdao = new my.student.StudentDAO(); -->
<%
		//1.�Ѿ�� ����Ÿ�� �ޱ�
		request.setCharacterEncoding("EUC-KR");//post��Ŀ��� �ѱ�ó��
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String cname = request.getParameter("cname");
		
		//2.���� ����Ÿ ��ȿ�� �˻��ϱ�
		if (id==null || name==null || cname==null || id.trim().equals("") || 
			name.trim().equals("") || cname.trim().equals("")){%>
			<script type="text/javascript">
				alert("���̵�, �л���, �б޸��� ��� �Է��ϼž� �մϴ�.")
				history.back()
			</script>		
<%		return;
		}
		int res = stdao.insertStudent(id, name, cname);
		//6.���۰���� ���� ��Ϻ��⳪ ����ϱ�� �б��ϱ�
		if (res>0){%>
		<script type="text/javascript">
			alert("�л���ϼ���!!") 
			location.href="list.jsp"
		</script>
<%	}else { %>
		<script type="text/javascript">
			alert("�л���Ͻ���!!")
			location.href="student.jsp"
		</script>
<%	}%>		










