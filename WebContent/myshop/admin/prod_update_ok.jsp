<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="com.oreilly.servlet.*, java.io.*"%>
<jsp:useBean id="pdao" class="my.shop.ProductBean" />
<jsp:useBean id="pool" class="my.db.ConnectionPoolBean" scope="application"/>
<jsp:setProperty property="pool" name="pdao" value="<%=pool%>"/>

<%
		MultipartRequest mr = null;
		String upPath = config.getServletContext().getRealPath("/myshop/images");
		int len = 10*1024*1024;
		try{
			mr = new MultipartRequest(request, upPath, len, "EUC-KR");//�����ڿ� 4���� �Ű����� �Է�!!
		}//�̶� �߻��ϴ� ���ܴ�??
		catch(IOException e){
			out.println("���Ͼ��ε� ����!!");
			e.printStackTrace();//����üũ�غ���...
		}
		
		
		
		//mr��ü�� DAO�� �Ѱܼ� ���� ó���ϱ�
		int res = pdao.updateProduct(mr);
		if (res>0){%>
		<script type="text/javascript">
			alert("��ǰ ���� ����!! ��ǰ����������� �̵��մϴ�.")
			location.href="prod_list.jsp"
		</script>
<%	}else { %>		
		<script type="text/javascript">
			alert("��ǰ ���� ����!! ��ǰ������������ �̵��մϴ�.")
			location.href="prod_update.jsp?pnum="+<%=mr.getParameter("pnum")%>
		</script>
<%	} %>












