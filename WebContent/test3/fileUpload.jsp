<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- fileUpload.jsp -->
<html>
<head>
	<title>���Ͼ��ε�</title>
</head>
<body>
	<form name="f" action="fileUpload_ok.jsp" 
		method="post" enctype="multipart/form-data">
		<table border="1" width="500">
			<tr>
				<th>�̸�</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>���ϸ�</th>
				<td><input type="file" name="filename"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="���ε�">
					<input type="reset" value="���">	
		</table>
	</form>
</body>
</html>
<%--
	1. cos.jar������ ��ġ�Ѵ�
	2. form�±��� method���� �׻� post�� �Ѵ�
	3. form�±��� ���۹���� �ִµ�(enctype) multipart/form-data�� �Ѵ�
	    default : application/x-www-form-urlencoded
	4. input�±��� �Ӽ����� file�� �Ѵ�
	5. �޴� �������� MultipartRequest ��� Ŭ������ �޴´�
	6. MultipartRequest�� ��ü������ �����ϸ� ���ε� ����, �����ϸ� ���ε� ����
	    (���нÿ� IOException�� �߻��Ѵ�)
 --%>

























