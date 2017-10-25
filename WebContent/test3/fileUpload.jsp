<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- fileUpload.jsp -->
<html>
<head>
	<title>파일업로드</title>
</head>
<body>
	<form name="f" action="fileUpload_ok.jsp" 
		method="post" enctype="multipart/form-data">
		<table border="1" width="500">
			<tr>
				<th>이름</th>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<th>파일명</th>
				<td><input type="file" name="filename"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="업로드">
					<input type="reset" value="취소">	
		</table>
	</form>
</body>
</html>
<%--
	1. cos.jar파일을 설치한다
	2. form태그의 method값은 항상 post로 한다
	3. form태그의 전송방식이 있는데(enctype) multipart/form-data로 한다
	    default : application/x-www-form-urlencoded
	4. input태그의 속성값은 file로 한다
	5. 받는 곳에서는 MultipartRequest 라는 클래스로 받는다
	6. MultipartRequest의 객체생성이 성공하면 업로드 성공, 실패하면 업로드 실패
	    (실패시엔 IOException이 발생한다)
 --%>

























