<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.myapp.dao.MemberDAO"%>
<%@ page import="com.myapp.member.MemberVO"%>
<%@ page import="com.myapp.file.FileUpload"%>
<%@ page import="java.io.File" %>
<%
    String sequence = request.getParameter("seq");
    if (sequence != "") {
        int seq = Integer.parseInt(sequence);
        MemberVO u = new MemberVO();
        MemberDAO memberDAO = new MemberDAO();
        String filename = memberDAO.getPhotoFilename(seq);
        if (filename != null) FileUpload.deleteFile(request, filename);
        u.setSeq(seq);
        memberDAO.deleteMember(u);
    }
    response.sendRedirect("list.jsp");
%>