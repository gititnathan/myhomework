<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="count" class="my.scope.Counter" scope="session" />
<h2>result.jsp �������Դϴ�.</h2>
<b>request : counter �� getCount():</b>
<jsp:getProperty property="count" name= "count" />
<br>
<a href="testScope.jsp">ó������</a>