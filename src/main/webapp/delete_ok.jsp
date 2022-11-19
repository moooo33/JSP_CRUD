<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.myapp.dao.MemberDAO"%>
<%@ page import="com.myapp.member.MemberVO"%>
<%@ page import="com.myapp.file.FileUpload"%>
<%@ page import="java.io.File" %>
<%
    String sid = request.getParameter("id");
    if (sid != "") {
        int id = Integer.parseInt(sid);
        MemberVO u = new MemberVO();
        MemberDAO memberDAO = new MemberDAO();
        String filename = memberDAO.getPhotoFilename(id);
        if (filename != null) FileUpload.deleteFile(request, filename);
        u.setSeq(id);
        memberDAO.deleteMember(u);
    }
    response.sendRedirect("list.jsp");
%>