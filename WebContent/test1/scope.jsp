<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="count" class = "my.scope.Counter" scope = "request"/>
<jsp:setProperty property="count" name="count"/>

<h2>request Scope</h2>
<b>counter의 getCout() 호출 : </b>
<jsp:getProperty property="count" name="count"/> <% // 화면에 그냥 찍어만 주겠다고 하는것이고 %>
<br>
<jsp:forward page="result.jsp" />