<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
	<title>���ϳ��뺸��</title>
</head>
<body>
	<div align="center">
		<h2>���� ���ε� �׽�Ʈ</h2>
		<h3>���۵Ǵ� ����Ÿ�� ���¸� ȭ�鿡 �״�� ����ϱ�</h3>
		<hr color="red">
<%	
		String type= request.getContentType();
		int len = request.getContentLength();
		out.println("ContentType = " + type);
		out.println(", length = " + len +"bytes");%>
		<hr color="blue">
<xmp>
<%	
		ServletInputStream in = request.getInputStream();
		byte data[] = new byte[1024];
		int n = 0;
		while((n=in.read(data)) != -1){
			String str = new String(data, 0, n);
			out.println(str);
		}
		in.close();
%>
</xmp>		
	</div>
</body>
</html>







