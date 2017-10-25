<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
	<head>
<title>세션테스트</title>
	</head>
	<body>
<b> 로그인 </b>
		<form name = "f" action = "result.jsp" method="post">
 아이디 : <input type ="text" name = "id"> <br>
 비밀번호 : <input type = "password" name ="pwd"><br>
 <input type= "submit" value="로그인">
 <input type= "reset" value="취소">
		</form>
	</body>
</html>