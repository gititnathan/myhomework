<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="count" class = "my.scope.Counter" scope = "request"/>
<jsp:setProperty property="count" name="count"/>

<h2>request Scope</h2>
<b>counter�� getCout() ȣ�� : </b>
<jsp:getProperty property="count" name="count"/> <% // ȭ�鿡 �׳� �� �ְڴٰ� �ϴ°��̰� %>
<br>
<jsp:forward page="result.jsp" />