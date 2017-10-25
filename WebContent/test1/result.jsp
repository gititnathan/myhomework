<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="count" class="my.scope.Counter" scope="session" />
<h2>result.jsp 페이지입니다.</h2>
<b>request : counter 의 getCount():</b>
<jsp:getProperty property="count" name= "count" />
<br>
<a href="testScope.jsp">처음으로</a>