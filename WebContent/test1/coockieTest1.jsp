<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <%
    //1. ��Ű �����ϱ�
    Cookie ck = new Cookie("id", "admin");
    Cookie ck2 = new Cookie("pwd", "1234");
    
    
    //2. ��Ű�ð�����
    ck.setMaxAge(7*24*60*60);
    ck2.setMaxAge(24*60*60);
    
    //3. ��Ű�����ϱ�
    response.addCookie(ck);
    response.addCookie(ck2);
    %>
    