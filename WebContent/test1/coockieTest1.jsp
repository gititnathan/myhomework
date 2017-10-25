<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <%
    //1. 쿠키 생성하기
    Cookie ck = new Cookie("id", "admin");
    Cookie ck2 = new Cookie("pwd", "1234");
    
    
    //2. 쿠키시간설정
    ck.setMaxAge(7*24*60*60);
    ck2.setMaxAge(24*60*60);
    
    //3. 쿠키전송하기
    response.addCookie(ck);
    response.addCookie(ck2);
    %>
    