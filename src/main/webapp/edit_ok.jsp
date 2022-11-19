<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.myapp.dao.MemberDAO"%>
<%@page import="com.myapp.member.MemberVO"%>
<%@page import="com.myapp.file.FileUpload"%>
<%@ page import="java.io.File" %>

<%
    request.setCharacterEncoding("utf-8");
    MemberDAO memberDAO = new MemberDAO();
    FileUpload upload = new FileUpload();
    String cont = request.getParameter("content");
    out.println(cont);
    MemberVO u = upload.uploadPhoto(request);

    int i = memberDAO.updateMember(u);
    response.sendRedirect("list.jsp");
%>