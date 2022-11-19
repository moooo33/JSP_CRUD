<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.myapp.dao.MemberDAO, java.util.*"%>
<%@ page import="com.myapp.member.MemberVO"%>
<%@ page import="com.myapp.file.FileUpload"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
</head>

<body>
    <h1>Detail Page</h1>
    <%
        MemberDAO boardDAO = new MemberDAO();
        List<MemberVO> list = boardDAO.getList();
        request.setAttribute("list",list);
    %>
    <table id="detail">
        <c:forEach items="${list}" var="u">
        <tr><td>Category</td><td>${u.getCategory()}</td></tr>
        <tr><td>Title</td><td>${u.getTitle()}</td></tr>
        <tr><td>Writer</td><td>${u.getWriter()}</td></tr>
        <tr><td>Content</td><td>${u.getContent()}</td></tr>
        <tr><td>Photo</td><td>${u.getPhoto()}</td></tr>
        <tr><td>RegDate</td><td>${u.getRegdate()}</td></tr>
    </table>
    <button type="button" onclick="history.back()">Back</button>
    <button type="button" onclick="location.href='editform.jsp?id=17'">Edit</button>

    <br/><a href="addform.jsp">Add New Post</a>
</body>
</html>