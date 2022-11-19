<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="com.myapp.dao.MemberDAO, com.myapp.member.MemberVO"%>
<%@ page import="com.myapp.file.FileUpload"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Form</title>
</head>
<body>

<%
    MemberDAO memberDAO = new MemberDAO();
    String sequence=request.getParameter("seq");
    MemberVO u = memberDAO.getOne(Integer.parseInt(sequence));
%>

<h1>Edit Form</h1>
<form action="edit_ok.jsp" method="post">
    <input type="hidden" name="seq" value="<%=u.getSeq() %>"/>
    <table>
        <tr><td>Category:</td><td><input type="text" name="category" value="<%= u.getCategory()%>"/></td></tr>
        <tr><td>Title:</td><td><input type="text" name="title" value="<%= u.getTitle()%>"/></td></tr>
        <tr><td>Writer:</td><td><input type="text" name="writer" value="<%= u.getWriter()%>" /></td></tr>
        <tr><td>Content:</td><td><textarea cols="50" rows="5" name="content"><%= u.getContent()%></textarea></td></tr>
        <tr><td>Photo:</td><td><input type="file" name="photo"><%= u.getPhoto()%></td></tr>
        <tr><td colspan="2"><input type="submit" value="Edit Post"/>
            <input type="button" value="Cancel" onclick="history.back()"/></td></tr>
    </table>
</form>

</body>
</html>